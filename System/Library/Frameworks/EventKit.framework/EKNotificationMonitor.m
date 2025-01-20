@interface EKNotificationMonitor
@end

@implementation EKNotificationMonitor

void __35___EKNotificationMonitor_logHandle__block_invoke()
{
  v0 = ekSubSystem;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  id v4 = objc_claimAutoreleasedReturnValue();
  os_log_t v2 = os_log_create(v0, (const char *)[v4 UTF8String]);
  v3 = (void *)logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v2;
}

void __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 > 5)
  {
    *a4 = 1;
  }
  else
  {
    id v4 = [a2 notification];
    v5 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "Faulted in notification: %@.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_61(uint64_t a1)
{
  os_log_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Posting notification count changed notification.", v4, 2u);
  }

  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"EKNotificationCountChangedNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_68(uint64_t a1)
{
  os_log_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Initial check. Sending notification.", v4, 2u);
  }

  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"EKNotificationsLoadedNotification" object:*(void *)(a1 + 32) userInfo:0];
}

uint64_t __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_2(uint64_t a1, void *a2)
{
  os_log_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v3 = [a2 objectID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_53(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 112));
  objc_storeStrong((id *)(a1[4] + 112), *(id *)(*(void *)(a1[6] + 8) + 40));
  os_log_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1[4] + 112);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Set notification references to %@.", (uint8_t *)&v4, 0xCu);
  }
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = [*(id *)(a1 + 32) _eventStore];
  if (![v2 isDataProtected])
  {
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x2020000000;
    char v110 = 0;
    *(void *)buf = 0;
    v102 = buf;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__13;
    v105 = __Block_byref_object_dispose__13;
    id v106 = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 128);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_50;
    block[3] = &unk_1E5B970C8;
    block[4] = v4;
    block[5] = &v107;
    block[6] = buf;
    dispatch_sync(v5, block);
    if (!*((unsigned char *)v108 + 24))
    {
LABEL_88:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v107, 8);
      goto LABEL_89;
    }
    uint64_t v6 = *(unsigned __int8 **)(a1 + 32);
    int v63 = v6[92];
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__13;
    v98 = __Block_byref_object_dispose__13;
    id v99 = 0;
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__13;
    v92 = __Block_byref_object_dispose__13;
    id v93 = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2020000000;
    uint64_t v87 = 0;
    uint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    if ([v6 isMonitoringOnlyNotificationCount])
    {
      v7 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Notification monitor wants to reload notification count. Will fetch notification count from the event store as a result", v117, 2u);
      }

      id v8 = [*(id *)(a1 + 32) _eventStore];
      uint64_t v9 = [v8 eventNotificationCountExcludingUncheckedCalendars:*(unsigned __int8 *)(*(void *)(a1 + 32) + 101) expanded:*(unsigned __int8 *)(*(void *)(a1 + 32) + 100)];
      v81[3] = v9;
      v10 = [*(id *)(a1 + 32) notificationQueue];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_51;
      v79[3] = &unk_1E5B981A0;
      v79[4] = *(void *)(a1 + 32);
      v79[5] = &v84;
      v79[6] = &v80;
      dispatch_sync(v10, v79);
    }
    else
    {
      v11 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Notification monitor wants to reload notifications. Will fetch notification references from the event store as a result.", v117, 2u);
      }

      v12 = *(unsigned __int8 **)(a1 + 32);
      int v13 = v12[93];
      if (v12[93]) {
        v14 = &v78;
      }
      else {
        v14 = 0;
      }
      if (v12[93]) {
        id v78 = 0;
      }
      uint64_t v15 = [v12 _fetchEventNotificationReferencesFromEventStore:v2 earliestExpiringNotification:v14];
      if (v13) {
        id v8 = v78;
      }
      else {
        id v8 = 0;
      }
      v16 = (void *)v89[5];
      v89[5] = v15;

      v17 = *(unsigned char **)(a1 + 32);
      if (v17[93]) {
        [v17 _updateTimerFireDate:v8];
      }
      uint64_t v18 = [(id)v89[5] count];
      v81[3] = v18;
      v19 = [*(id *)(a1 + 32) notificationQueue];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_53;
      v77[3] = &unk_1E5B981A0;
      v77[4] = *(void *)(a1 + 32);
      v77[5] = &v94;
      v77[6] = &v88;
      dispatch_sync(v19, v77);

      uint64_t v20 = [(id)v95[5] count];
      v85[3] = v20;
    }

    v21 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [NSNumber numberWithUnsignedInteger:v81[3]];
      v23 = [NSNumber numberWithUnsignedInteger:v85[3]];
      *(_DWORD *)v117 = 138543618;
      v118 = v22;
      __int16 v119 = 2114;
      v120 = v23;
      _os_log_impl(&dword_1A4E47000, v21, OS_LOG_TYPE_DEFAULT, "Current notification count: %{public}@. Last event notification count: %{public}@.", v117, 0x16u);
    }
    v24 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = @"NO";
      if (v63) {
        v25 = @"YES";
      }
      *(_DWORD *)v117 = 138543362;
      v118 = v25;
      _os_log_impl(&dword_1A4E47000, v24, OS_LOG_TYPE_DEFAULT, "Is initial check: %{public}@.", v117, 0xCu);
    }

    if (v81[3] != v85[3])
    {
      v26 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [NSNumber numberWithUnsignedInteger:v81[3]];
        *(_DWORD *)v117 = 138543362;
        v118 = v27;
        _os_log_impl(&dword_1A4E47000, v26, OS_LOG_TYPE_DEFAULT, "Count changed to %{public}@ events, Notifying.", v117, 0xCu);
      }
      if (+[EKFeatureSet areApplicationBadgesSupported])
      {
        v28 = [*(id *)(a1 + 32) effectiveCallbackQueue];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_61;
        v76[3] = &unk_1E5B96E08;
        v76[4] = *(void *)(a1 + 32);
        dispatch_async(v28, v76);
      }
      else
      {
        v29 = [(id)objc_opt_class() logHandle];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v117 = 0;
          _os_log_impl(&dword_1A4E47000, v29, OS_LOG_TYPE_DEFAULT, "Application badges are not supported on this platform. Will not notify.", v117, 2u);
        }
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 92) = 0;
    char v30 = [*(id *)(a1 + 32) isMonitoringOnlyNotificationCount];
    int v31 = v63;
    if (v63) {
      char v32 = 1;
    }
    else {
      char v32 = v30;
    }
    if (v32)
    {
LABEL_85:
      if (v31)
      {
        v62 = [*(id *)(a1 + 32) effectiveCallbackQueue];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_68;
        v64[3] = &unk_1E5B96E08;
        v64[4] = *(void *)(a1 + 32);
        dispatch_async(v62, v64);
      }
      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
      goto LABEL_88;
    }
    v33 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A4E47000, v33, OS_LOG_TYPE_INFO, "Checking for notification change notification.", v117, 2u);
    }

    if (v85[3] == v81[3])
    {
      uint64_t v34 = 1;
    }
    else
    {
      v35 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = [NSNumber numberWithUnsignedInteger:v81[3]];
        *(_DWORD *)v117 = 138543362;
        v118 = v36;
        _os_log_impl(&dword_1A4E47000, v35, OS_LOG_TYPE_INFO, "Count changed to %{public}@ events. Setting notification to EKNotificationChangeTypeUnknown", v117, 0xCu);
      }
      uint64_t v34 = 0;
      if (!*((void *)v102 + 5)) {
        goto LABEL_77;
      }
    }
    v37 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A4E47000, v37, OS_LOG_TYPE_INFO, "Changes detected. Checking changes in notifications.", v117, 2u);
    }

    id v38 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v39 = (void *)[v38 initWithCapacity:v85[3]];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v40 = (id)v95[5];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v72 objects:v116 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v73 != v42) {
            objc_enumerationMutation(v40);
          }
          v44 = [*(id *)(*((void *)&v72 + 1) + 8 * i) objectID];
          [v39 addObject:v44];
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v72 objects:v116 count:16];
      }
      while (v41);
    }

    if (*((void *)v102 + 5))
    {
      id v45 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v46 = (void *)[v45 initWithCapacity:v81[3]];
    }
    else
    {
      v46 = 0;
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v47 = (id)v89[5];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v115 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v69 != v49) {
            objc_enumerationMutation(v47);
          }
          v51 = [*(id *)(*((void *)&v68 + 1) + 8 * j) objectID];
          [v46 addObject:v51];
          if (![v39 containsObject:v51]) {
            uint64_t v34 = 0;
          }
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v115 count:16];
      }
      while (v48);
    }

    if (*((void *)v102 + 5))
    {
      v52 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v102 + 5), "count"));
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v53;
        _os_log_impl(&dword_1A4E47000, v52, OS_LOG_TYPE_INFO, "Updating changeIDs. Current size at %{public}@", v117, 0xCu);
      }
      [*(id *)(a1 + 32) _addRemovedOrAddedObjectIDsTo:*((void *)v102 + 5) oldNotifications:v39 newNotifications:v46];
      v114[0] = *((void *)v102 + 5);
      v113[0] = @"EKNotificationChangedNotificationsKey";
      v113[1] = @"EKNotificationChangedChangeTypeKey";
      v54 = [NSNumber numberWithUnsignedInteger:v34];
      v114[1] = v54;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];

      v56 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v102 + 5), "count"));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v57;
        _os_log_impl(&dword_1A4E47000, v56, OS_LOG_TYPE_INFO, "Updated changeIDs. Current size at %{public}@", v117, 0xCu);
      }
      if (v55) {
        goto LABEL_78;
      }
    }
    else
    {
    }
LABEL_77:
    v111 = @"EKNotificationChangedChangeTypeKey";
    v58 = [NSNumber numberWithUnsignedInteger:v34];
    v112 = v58;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];

LABEL_78:
    v59 = (void *)*((void *)v102 + 5);
    if (v59 && ![v59 count])
    {
      v61 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A4E47000, v61, OS_LOG_TYPE_DEFAULT, "ChangIDs is empty. Skipping notification changed notification.", v117, 2u);
      }
    }
    else
    {
      v60 = [*(id *)(a1 + 32) effectiveCallbackQueue];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_64;
      v65[3] = &unk_1E5B96EA8;
      v65[4] = *(void *)(a1 + 32);
      v67 = buf;
      id v66 = v55;
      dispatch_async(v60, v65);
    }
    int v31 = v63;
    goto LABEL_85;
  }
  uint64_t v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Data protection is on. Unable to check for updates.", buf, 2u);
  }

  [*(id *)(a1 + 32) _killTimer];
LABEL_89:
}

void __48___EKNotificationMonitor_notificationReferences__block_invoke(uint64_t a1)
{
}

uint64_t __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_84(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)_blacklistedNotifications copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __61___EKNotificationMonitor__notificationCountChangedExternally__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 40) || (++*(_DWORD *)(v1 + 88), *(unsigned char *)(*(void *)(result + 32) + 48))) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_50(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 40))
  {
    *(_DWORD *)(v2 + 88) = 0;
LABEL_7:
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    goto LABEL_11;
  }
  int v3 = *(_DWORD *)(v2 + 88);
  uint64_t v4 = [(id)objc_opt_class() logHandle];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 >= 1)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEFAULT, "Sync running, but we've been explicitly told to ignore that and refresh anyway.", buf, 2u);
    }

    --*(_DWORD *)(a1[4] + 88);
    goto LABEL_7;
  }
  if (v5)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEFAULT, "Sync running. Waiting for it to finish before checking for updates.", v10, 2u);
  }

  *(unsigned char *)(a1[4] + 48) = 1;
LABEL_11:
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v6 = a1[4];
    if (*(unsigned char *)(v6 + 97))
    {
      if (*(unsigned char *)(v6 + 72))
      {
        objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(v6 + 80));
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v8 = a1[4];
        uint64_t v9 = *(void **)(v8 + 80);
        *(void *)(v8 + 80) = v7;
      }
      else
      {
        [*(id *)(v6 + 80) removeAllObjects];
        *(unsigned char *)(a1[4] + 72) = 1;
      }
    }
  }
}

uint64_t __54___EKNotificationMonitor_blacklistedNotificationQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_blacklistedNotifications;
  _blacklistedNotifications = v0;

  blacklistedNotificationQueue__blacklistedNotificationQueue = (uint64_t)dispatch_queue_create("blacklistedNotificationQueue", 0);

  return MEMORY[0x1F41817F8]();
}

EKEventStore *__71___EKNotificationMonitor__initWithOptions_eventStore_eventStoreGetter___block_invoke()
{
  uint64_t v0 = objc_alloc_init(EKEventStore);

  return v0;
}

void __31___EKNotificationMonitor_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _eventStoreChanged];
}

uint64_t __30___EKNotificationMonitor_stop__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30___EKNotificationMonitor_stop__block_invoke_2;
  block[3] = &unk_1E5B96E08;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);

  return [*(id *)(a1 + 32) _killTimer];
}

uint64_t __30___EKNotificationMonitor_stop__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _killSyncTimer:0];
}

uint64_t __43___EKNotificationMonitor_notificationCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104);
  return result;
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_51(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 104);
  *(void *)(a1[4] + 104) = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1[4] + 104)];
    int v4 = 138543362;
    BOOL v5 = v3;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Set notification count to %{public}@.", (uint8_t *)&v4, 0xCu);
  }
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_64(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v3)
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v4 = @"nil";
    }
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Posting notification changed notification because changeIDs count is %{public}@", (uint8_t *)&v6, 0xCu);
    if (v3) {
  }
    }
  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"EKNotificationsChangedNotification" object:a1[4] userInfo:a1[5]];
}

uint64_t __61___EKNotificationMonitor_addBlacklistedNotificationObjectID___block_invoke(uint64_t a1)
{
  return [(id)_blacklistedNotifications addObject:*(void *)(a1 + 32)];
}

uint64_t __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_blacklistedNotifications copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "rowID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

uint64_t __39___EKNotificationMonitor__syncDidStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSyncTimer];
}

uint64_t __38___EKNotificationMonitor__syncDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 48)) {
      id v3 = @"pending";
    }
    else {
      id v3 = @"no pending";
    }
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Sync done, %@ changes.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t result = [*(id *)(a1 + 32) _killSyncTimer:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 48))
  {
    *(unsigned char *)(v5 + 48) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, char a6)
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 128);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke_2;
  v15[3] = &unk_1E5B970F0;
  v15[4] = v11;
  id v16 = v10;
  char v18 = a6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(v12, v15);
}

void __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72) && !*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 48))
    {
      id v3 = *(void **)(v2 + 80);
      +[EKObjectID EKObjectIDsFromData:](EKObjectID, "EKObjectIDsFromData:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v3 addObjectsFromArray:v5];
    }
    else
    {
      *(unsigned char *)(v2 + 72) = 0;
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
      [v4 removeAllObjects];
    }
  }
}

@end