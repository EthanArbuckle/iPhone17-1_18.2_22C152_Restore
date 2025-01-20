@interface LSInstallProgressService
@end

@implementation LSInstallProgressService

void __41___LSInstallProgressService_addObserver___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18530F680]();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v3 = *(unsigned char **)(a1 + 32);
    if (v3[96]) {
      [v3 dispatchJournalledNotificationsToObserver:*(void *)(a1 + 40)];
    }
  }
  v4 = [*(id *)(a1 + 40) connection];
  v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_219];
  [v5 applicationInstallsArePrioritized:*(void *)(a1 + 48) arePaused:*(void *)(a1 + 56)];
}

uint64_t __41___LSInstallProgressService_addObserver___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 8) containsObject:a1[5]] ^ 1;
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);

  return [v3 addObject:v2];
}

void __43___LSInstallProgressService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_LSInstallProgressService);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
}

void __43___LSInstallProgressService_beginListening__block_invoke()
{
  id v4 = +[_LSInstallProgressService sharedInstance];
  [v4 performJournalRecovery];
  [v4 loadProportions];
  id v0 = objc_alloc(MEMORY[0x1E4F29290]);
  v1 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:5];
  uint64_t v2 = [v0 initWithMachServiceName:v1];
  v3 = (void *)beginListening_listener_0;
  beginListening_listener_0 = v2;

  [(id)beginListening_listener_0 setDelegate:v4];
  [(id)beginListening_listener_0 resume];
}

uint64_t __33___LSInstallProgressService_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restoreInactiveInstalls];
}

void __33___LSInstallProgressService_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_suspend(WeakRetained[13]);
  [(dispatch_object_t *)WeakRetained saveProportions];
}

void __59___LSInstallProgressService__LSFindPlaceholderApplications__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 168) == 2 && (*(unsigned char *)(a3 + 174) & 4) != 0 && (*(_DWORD *)(a3 + 332) - 7) >= 3)
  {
    uint64_t v4 = _CSStringCopyCFString();
    if (v4)
    {
      id v6 = (id)v4;
      v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4 placeholder:1];
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _LSFindPlaceholderApplications];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_216(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _LSProgressLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_216_cold_1();
    }
  }
}

void __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = _LSProgressLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: Connection invalidated or interupted %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 removeObserver:*(void *)(a1 + 32)];
}

void __41___LSInstallProgressService_addObserver___block_invoke_3()
{
  id v0 = _LSProgressLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_182959000, v0, OS_LOG_TYPE_DEFAULT, "Failed to send catchup callback after adding observer", v1, 2u);
  }
}

uint64_t __44___LSInstallProgressService_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 32) placeholder:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x18530F680]();
  objc_setAssociatedObject(v3, &_block_invoke_publishingStringKey, *(id *)(a1 + 32), (void *)0x301);
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"userInfo.installState" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"fractionCompleted" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"cancellable" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"pausable" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"prioritizable" options:3 context:*(void *)(a1 + 32)];
  id v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 16) progressForBundleID:*(void *)(a1 + 48)];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v3 installState];
    if (v7 != 5) {
      [v6 setInstallState:v7];
    }
    objc_msgSend(v6, "setPausable:", objc_msgSend(v3, "isPausable", v7));
    objc_msgSend(v6, "setCancellable:", objc_msgSend(v3, "isCancellable"));
    objc_msgSend(v6, "setPrioritizable:", objc_msgSend(v3, "isPrioritizable"));
  }
  else
  {
    v8 = _LSProgressLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1();
    }
  }
  objc_sync_exit(v5);

  objc_initWeak(&location, v3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_268;
  v13[3] = &unk_1E5231A88;
  id v14 = *(id *)(a1 + 32);
  objc_copyWeak(&v17, &location);
  v9 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v9;
  v10 = (void *)[v13 copy];
  v11 = (void *)MEMORY[0x18530F950]();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_268(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSProgressLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "unsubscribing from %@ as it was unpublished", (uint8_t *)&v10, 0xCu);
  }

  id v4 = (void *)MEMORY[0x18530F680]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained removeObserver:*(void *)(a1 + 40) forKeyPath:@"userInfo.installState"];

  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  [v6 removeObserver:*(void *)(a1 + 40) forKeyPath:@"fractionCompleted"];

  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  [v7 removeObserver:*(void *)(a1 + 40) forKeyPath:@"cancellable"];

  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  [v8 removeObserver:*(void *)(a1 + 40) forKeyPath:@"pausable"];

  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  [v9 removeObserver:*(void *)(a1 + 40) forKeyPath:@"prioritizable"];

  [*(id *)(*(void *)(a1 + 40) + 16) removeSubscriberForPublishingKey:*(void *)(a1 + 32) andBundleID:*(void *)(a1 + 48)];
}

void __62___LSInstallProgressService_installationFailedForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 32) placeholder:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __86___LSInstallProgressService_detachAndSendNotification_forApplicationExtensionRecords___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        addPluginDataToNotificationDict(v2, *(void **)(*((void *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }

  id v8 = _LSInstallLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    v18 = v2;
    _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "posting %@ with %@", buf, 0x16u);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, *(CFNotificationName *)(a1 + 40), 0, (CFDictionaryRef)v2, 2uLL);
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke(uint64_t a1)
{
  v1 = [[LSProgressNotificationTimer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v2 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
  sendNotification_forAppProxies_Plugins_completion__sProgressTimer = (uint64_t)v1;
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 96)
    && *(void *)(v2 + 88)
    && +[_LSInstallNotificationJournaller shouldJournalNotificationType:*(unsigned int *)(a1 + 80)])
  {
    id v3 = [[_LSStartupJournalledInstallNotification alloc] initWithNotification:*(unsigned int *)(v1 + 80) appProxies:*(void *)(v1 + 40) plugins:*(unsigned __int8 *)(v1 + 84)];
    [*(id *)(*(void *)(v1 + 32) + 88) addObject:v3];
  }
  v98 = (const char *)[*(id *)(v1 + 32) observerSelectorForNotification:*(unsigned int *)(v1 + 80)];
  uint64_t v4 = (id *)(v1 + 48);
  id v99 = *(id *)(v1 + 48);
  uint64_t v5 = 0;
  char v6 = 0;
  CFDictionaryRef v7 = 0;
  uint64_t v8 = 0;
  CFStringRef v9 = 0;
  switch(*(_DWORD *)(v1 + 80))
  {
    case 0:
      int v10 = _LSProgressLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2();
      }
      goto LABEL_60;
    case 1:
      v29 = _LSProgressLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v30 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v30;
        _os_log_impl(&dword_182959000, v29, OS_LOG_TYPE_DEFAULT, "Sending applicationInstallsDidStart: for %@", buf, 0xCu);
      }

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v31 = *v4;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v109 objects:v133 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v110 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            if ([v36 installType] != 7
              && [v36 installType] != 8
              && [v36 installType] != 9)
            {
              v37 = [*(id *)(v1 + 32) parentProgressForApplication:v36 andPhase:3 isActive:1];
              [v37 setInstallState:5];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v109 objects:v133 count:16];
        }
        while (v33);
      }

      uint64_t v38 = *(void *)(v1 + 56);
      v131[0] = @"bundleIDs";
      v131[1] = @"isPlaceholder";
      v132[0] = v38;
      v132[1] = MEMORY[0x1E4F1CC38];
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v17 = v132;
      v18 = v131;
      goto LABEL_36;
    case 2:
      long long v11 = _LSProgressLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v12 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v12;
        _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "Sending applicationInstallsDidUpdateIcon: for %@", buf, 0xCu);
      }

      long long v13 = *(void **)(v1 + 32);
      long long v14 = [*(id *)(v1 + 48) objectAtIndex:0];
      [v13 _placeholderIconUpdatedForApp:v14];

      uint64_t v15 = *(void *)(v1 + 56);
      v129[0] = @"bundleIDs";
      v129[1] = @"isPlaceholder";
      v130[0] = v15;
      v130[1] = MEMORY[0x1E4F1CC38];
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v17 = v130;
      v18 = v129;
LABEL_36:
      CFDictionaryRef v7 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
      char v6 = 0;
      uint64_t v5 = 0;
      uint64_t v8 = 1;
      CFStringRef v9 = @"com.apple.LaunchServices.applicationRegistered";
      goto LABEL_62;
    case 3:
      v39 = _LSProgressLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1();
      }

      v40 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
      v41 = [*(id *)(*(void *)(v1 + 32) + 8) allObjects];
      [v40 notifyObservers:v41 withApplications:*(void *)(v1 + 48)];

      goto LABEL_61;
    case 4:
      v19 = _LSProgressLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      CFStringRef v42 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v42;
      v21 = "Sending applicationsWillInstall: for %@";
      goto LABEL_42;
    case 5:
      v19 = _LSProgressLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      CFStringRef v20 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v20;
      v21 = "Sending applicationsWillUninstall: for %@";
LABEL_42:
      _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
LABEL_43:

      CFDictionaryRef v7 = 0;
      uint64_t v8 = 0;
      CFStringRef v9 = 0;
      char v6 = 1;
      uint64_t v5 = @"com.apple.LaunchServices.pluginswillberemoved";
      goto LABEL_62;
    case 7:
      v43 = _LSProgressLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v44 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v44;
        _os_log_impl(&dword_182959000, v43, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      uint64_t v45 = *(void *)(v1 + 56);
      v127[0] = @"bundleIDs";
      v127[1] = @"isPlaceholder";
      v128[0] = v45;
      v128[1] = MEMORY[0x1E4F1CC28];
      CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
      CFStringRef v9 = @"com.apple.LaunchServices.applicationRegistered";
      char v6 = 1;
      uint64_t v8 = 1;
      uint64_t v5 = @"com.apple.LaunchServices.pluginsregistered";
      goto LABEL_62;
    case 8:
      v46 = _LSProgressLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v47 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v47;
        _os_log_impl(&dword_182959000, v46, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      uint64_t v48 = *(void *)(v1 + 56);
      v123[0] = @"bundleIDs";
      v123[1] = @"isPlaceholder";
      v124[0] = v48;
      v124[1] = MEMORY[0x1E4F1CC28];
      CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:2];
      CFStringRef v9 = @"com.apple.LaunchServices.applicationUnregistered";
      char v6 = 1;
      uint64_t v8 = 1;
      uint64_t v5 = @"com.apple.LaunchServices.pluginsunregistered";
      goto LABEL_62;
    case 9:
      v49 = _LSProgressLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v50 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v50;
        _os_log_impl(&dword_182959000, v49, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      [*(id *)(v1 + 32) _placeholdersUninstalled:*(void *)(v1 + 48)];
      uint64_t v51 = *(void *)(v1 + 56);
      v121[0] = @"bundleIDs";
      v121[1] = @"isPlaceholder";
      v122[0] = v51;
      v122[1] = MEMORY[0x1E4F1CC38];
      v52 = (void *)MEMORY[0x1E4F1C9E8];
      v53 = v122;
      v54 = v121;
      goto LABEL_56;
    case 0xA:
      v55 = _LSProgressLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v56 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v56;
        _os_log_impl(&dword_182959000, v55, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      [*(id *)(v1 + 32) _placeholdersUninstalled:*(void *)(v1 + 48)];
      uint64_t v57 = *(void *)(v1 + 56);
      v119[0] = @"bundleIDs";
      v119[1] = @"isPlaceholder";
      v120[0] = v57;
      v120[1] = MEMORY[0x1E4F1CC38];
      v52 = (void *)MEMORY[0x1E4F1C9E8];
      v53 = v120;
      v54 = v119;
LABEL_56:
      CFDictionaryRef v7 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:2];
      char v6 = 0;
      uint64_t v5 = 0;
      uint64_t v8 = 1;
      CFStringRef v9 = @"com.apple.LaunchServices.applicationUnregistered";
      goto LABEL_62;
    case 0xB:
      int v10 = _LSProgressLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      CFStringRef v22 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v22;
      v23 = "Sending applicationsDidFailToInstall: for %@";
      break;
    case 0xC:
      int v10 = _LSProgressLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      CFStringRef v24 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v24;
      v23 = "Sending applicationsDidFailToUninstall: for %@";
      break;
    case 0xD:
      v25 = _LSProgressLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v26 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v26;
        _os_log_impl(&dword_182959000, v25, OS_LOG_TYPE_DEFAULT, "Sending applicationIconDidChange: for %@", buf, 0xCu);
      }

      uint64_t v125 = *MEMORY[0x1E4F1CFF8];
      v27 = [*(id *)(v1 + 56) objectAtIndex:0];
      v126 = v27;
      uint64_t v8 = 1;
      CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];

      char v6 = 0;
      uint64_t v5 = 0;
      CFStringRef v9 = @"com.apple.LaunchServices.applicationIconChanged";
      goto LABEL_62;
    case 0xE:
      int v10 = _LSProgressLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      CFStringRef v28 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v28;
      v23 = "Sending applicationsDidChangePersonas: for %@";
      break;
    case 0xF:
      int v10 = _LSProgressLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      CFStringRef v58 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v58;
      v23 = "Sending applicationInstallsDidChange: due to postprocessing ready for %@";
      break;
    default:
      goto LABEL_62;
  }
  _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
LABEL_60:

LABEL_61:
  char v6 = 0;
  uint64_t v5 = 0;
  CFDictionaryRef v7 = 0;
  uint64_t v8 = 0;
  CFStringRef v9 = 0;
LABEL_62:
  CFStringRef cf1 = v5;
  if (v98)
  {
    uint64_t v90 = v8;
    CFStringRef v91 = v9;
    char v92 = v6;
    CFDictionaryRef v93 = v7;
    uint64_t v95 = v1;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v59 = *(id *)(*(void *)(v1 + 32) + 8);
    uint64_t v60 = [v59 countByEnumeratingWithState:&v105 objects:v118 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v106;
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v106 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          v65 = (void *)MEMORY[0x18530F680]();
          v66 = [v64 connection];
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_319;
          v104[3] = &unk_1E522C740;
          v104[4] = v64;
          v67 = [v66 remoteObjectProxyWithErrorHandler:v104];

          objc_msgSend(v67, v98, v99);
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v105 objects:v118 count:16];
      }
      while (v61);
    }

    CFDictionaryRef v7 = v93;
    uint64_t v1 = v95;
    char v6 = v92;
    CFStringRef v9 = v91;
  }
  if (v7) {
    int v68 = v8;
  }
  else {
    int v68 = 0;
  }
  if (v68 == 1)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotificationWithOptions(DistributedCenter, v9, 0, v7, 1uLL);
    v70 = _LSProgressLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v115 = v9;
      __int16 v116 = 2112;
      CFDictionaryRef v117 = v7;
      _os_log_impl(&dword_182959000, v70, OS_LOG_TYPE_DEFAULT, "Sent distributed notification %@ with payload %@", buf, 0x16u);
    }
  }
  char v71 = v6 ^ 1;
  if (!*(unsigned char *)(v1 + 84)) {
    char v71 = 1;
  }
  if ((v71 & 1) == 0)
  {
    v72 = *(void **)(v1 + 64);
    if (v72)
    {
      if ([v72 count])
      {
        CFDictionaryRef v94 = v7;
        v73 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(v1 + 64), "count"));
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        uint64_t v96 = v1;
        id v74 = *(id *)(v1 + 64);
        uint64_t v75 = [v74 countByEnumeratingWithState:&v100 objects:v113 count:16];
        if (!v75) {
          goto LABEL_97;
        }
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v101;
        while (1)
        {
          for (uint64_t k = 0; k != v76; ++k)
          {
            if (*(void *)v101 != v77) {
              objc_enumerationMutation(v74);
            }
            id v79 = *(id *)(*((void *)&v100 + 1) + 8 * k);
            if (!CFEqual(cf1, @"com.apple.LaunchServices.pluginsregistered")
              || ([v79 bundleIdentifier],
                  v80 = objc_claimAutoreleasedReturnValue(),
                  BOOL v81 = _LSIsNewsWidgetBundleIdentifier(v80),
                  v80,
                  !v81))
            {

LABEL_94:
              v85 = objc_msgSend(v79, "correspondingApplicationExtensionRecord", v90, v91);
              addPluginDataToNotificationDict(v73, v85);
              goto LABEL_95;
            }
            v82 = +[LSApplicationRestrictionsManager sharedInstance]();
            v83 = [v79 bundleIdentifier];
            BOOL v84 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((BOOL)v82, v83);

            if (!v84) {
              goto LABEL_94;
            }
            v85 = _LSProgressLog();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
            {
              v86 = [v79 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              CFStringRef v115 = v86;
              _os_log_impl(&dword_182959000, v85, OS_LOG_TYPE_DEFAULT, "notification for restricted plugin %@ not being sent", buf, 0xCu);
            }
LABEL_95:
          }
          uint64_t v76 = [v74 countByEnumeratingWithState:&v100 objects:v113 count:16];
          if (!v76)
          {
LABEL_97:

            v87 = CFNotificationCenterGetDistributedCenter();
            CFNotificationCenterPostNotificationWithOptions(v87, cf1, 0, (CFDictionaryRef)v73, 2uLL);
            v88 = _LSProgressLog();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v115 = cf1;
              __int16 v116 = 2112;
              CFDictionaryRef v117 = (const __CFDictionary *)v73;
              _os_log_impl(&dword_182959000, v88, OS_LOG_TYPE_DEFAULT, "Sent plugin notification %@ with payload %@", buf, 0x16u);
            }

            CFDictionaryRef v7 = v94;
            uint64_t v1 = v96;
            break;
          }
        }
      }
    }
  }
  uint64_t v89 = *(void *)(v1 + 72);
  if (v89) {
    uint64_t v89 = (*(uint64_t (**)(void))(v89 + 16))();
  }
  MEMORY[0x185310460](v89);
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_319(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LSProgressLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1();
  }
}

void __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 96))
  {
    id v3 = *(void **)(v2 + 88);
    if (v3)
    {
      uint64_t v4 = +[_LSStartupJournalledDatabaseRebuiltNotification sharedNotification];
      [v3 addObject:v4];

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(v2 + 8);
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
        objc_msgSend(*(id *)(a1 + 32), "sendDatabaseRebuiltNotificationToObserver:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 48)) {
          +[LSApplicationProxy applicationProxyForIdentifier:v7 placeholder:1];
        }
        else {
        uint64_t v8 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v7, (void)v10);
        }
        if (v8)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
          if (*(unsigned char *)(a1 + 49)) {
            id v9 = (id)[v8 plugInKitPlugins];
          }
          objc_msgSend(v8, "detach", (void)v10);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __44___LSInstallProgressService_loadProportions__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v20;
    *(void *)&long long v3 = 138412290;
    long long v16 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, v16);
        id v9 = objc_opt_class();
        long long v10 = objc_opt_class();
        if (_LSIsDictionaryWithKeysAndValuesOfClass(v8, v9, v10))
        {
          long long v11 = [LSApplicationRecord alloc];
          id v18 = 0;
          id v12 = [(LSApplicationRecord *)v11 initForInstallMachineryWithBundleIdentifier:v7 placeholder:1 error:&v18];
          long long v13 = v18;
          long long v14 = _LSProgressLog();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v15)
            {
              *(_DWORD *)buf = v16;
              uint64_t v24 = v7;
              _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "Found placeholder for %@, loading progress proportions", buf, 0xCu);
            }

            long long v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
            [*(id *)(*(void *)(a1 + 40) + 120) setObject:v14 forKeyedSubscript:v7];
          }
          else if (v15)
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v7;
            _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "No placeholder for %@, not loading progress proportions", buf, 0xCu);
          }
        }
        else
        {
          long long v13 = _LSProgressLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v7;
            _os_log_error_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "Invalid progress proportion entry for %@!", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v4);
  }
}

void __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [LSApplicationRecord alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  id v4 = [(LSApplicationRecord *)v2 initForInstallMachineryWithBundleIdentifier:v3 placeholder:1 error:&v7];
  id v5 = v7;
  id v6 = v7;
  if (!v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
}

void __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"usingNetwork";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
  v5[0] = v1;
  CFDictionaryRef v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, @"com.lsinstallprogress.networkusagechanged", 0, v2, 1u);
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1[4] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    id v5 = *(NSObject **)(*(void *)(a1[5] + 8) + 40);
    if (v5)
    {
      dispatch_source_cancel(v5);
      uint64_t v6 = *(void *)(a1[5] + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
    }
    uint64_t v9 = a1[6];
    uint64_t v8 = (uint64_t)(a1 + 6);
    if ([*(id *)(*(void *)(v9 + 8) + 40) count])
    {
      long long v10 = _LSInstallLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1(v8, v10);
      }
    }
    uint64_t v11 = *(void *)(*(void *)v8 + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_334(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v8 = [v7 pid];
        uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        long long v10 = [NSNumber numberWithInt:v8];
        [v9 addObject:v10];

        dispatch_group_enter(v2);
        uint64_t v11 = [v7 connection];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2;
        v14[3] = &unk_1E5231BA0;
        uint64_t v12 = *(void *)(a1 + 48);
        v14[4] = *(void *)(a1 + 32);
        uint64_t v16 = v12;
        int v17 = v8;
        BOOL v15 = v2;
        [v11 addBarrierBlock:v14];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  dispatch_group_notify(v2, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72), *(dispatch_block_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3;
  v3[3] = &unk_1E5231B78;
  v3[4] = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 56);
  dispatch_sync(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v1 removeObject:v2];
}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = [v3 domain];
  if ([v4 isEqual:*MEMORY[0x1E4F28798]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 2)
    {
      uint64_t v6 = _LSInstallLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "install journal directory does not exist.", v9, 2u);
      }
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v6 = _LSInstallLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1();
  }
  uint64_t v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __51___LSInstallProgressService_performJournalRecovery__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadJournalledNotificationsFromDisk];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  uint64_t result = [*(id *)(a1 + 32) dispatchJournalledNotificationsToConnectedClients];
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  return result;
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 10000000000);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_3;
  block[3] = &unk_1E522C268;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "jettisoning notification journal", v7, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = 0;
}

void __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_216_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "failure restoring install progress for %@: %@");
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Parent progress for %@ is invalid, cannot add children to it", v2, v3, v4, v5, v6);
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_4_3(&dword_182959000, v0, v1, "Sending applicationInstallsDidChange: for %@", v2);
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Skipping notifications for %@", v2, v3, v4, v5, v6);
}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Error %@ connecting to observer %@ for database rebuilt notification");
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) allObjects];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Clients tardy on draining notifications: %@", v4, 0xCu);
}

void __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "error enumerating saved journals: %@", v2, v3, v4, v5, v6);
}

@end