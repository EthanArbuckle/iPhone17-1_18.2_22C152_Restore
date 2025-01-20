@interface KSTextReplacementServer
@end

@implementation KSTextReplacementServer

void __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v10, (void)v16))[v4 addObject:v10]; {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v12 = v11;
  v13 = KSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v15 = [NSNumber numberWithDouble:-v12];
    *(_DWORD *)buf = 136315650;
    v21 = "-[_KSTextReplacementServer queryTextReplacementsWithCallback:]_block_invoke_2";
    __int16 v22 = 2112;
    v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_22B2BC000, v13, OS_LOG_TYPE_INFO, "%s  time spent reading %@ entries is %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textReplacementManager];

  if (v2)
  {
    id v3 = [MEMORY[0x263EFF910] date];
    v4 = [*(id *)(a1 + 32) textReplacementManager];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke_2;
    v7[3] = &unk_264890808;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    [v4 queryTextReplacementsWithCallback:v7];
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __49___KSTextReplacementServer_textReplacementServer__block_invoke()
{
  v0 = objc_alloc_init(_KSTextReplacementServer);
  v1 = (void *)textReplacementServer_sharedInstance;
  textReplacementServer_sharedInstance = (uint64_t)v0;
}

uint64_t __58___KSTextReplacementServer_initWithDatabaseDirectoryPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) registerForPushNotifications];
  CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    id v3 = DarwinNotifyCenter;
    v4 = *(const void **)(a1 + 32);
    getBYSetupAssistantExitedDarwinNotification();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v3, v4, (CFNotificationCallback)bySetupAssistantExited, v5, 0, CFNotificationSuspensionBehaviorDrop);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 scheduleSyncTask];
}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke(uint64_t a1)
{
  v2 = [_KSSystemTask alloc];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_2;
  v5[3] = &unk_2648918A8;
  v5[4] = *(void *)(a1 + 32);
  id v3 = [(_KSSystemTask *)v2 initWithName:@"com.apple.KeyboardServices.TextReplacementCKSyncTask" isPeriodic:1 period:86400 handler:v5];
  [(_KSSystemTask *)v3 setMaxRunTime:60.0];
  v4 = +[_KSTaskScheduler sharedInstance];
  [v4 registerTask:v3];
}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_3;
  v7[3] = &unk_264890A70;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_4;
  v2[3] = &unk_264891880;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 requestSync:4 withCompletionBlock:v2];
}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[_KSTextReplacementServer scheduleSyncTask]_block_invoke_4";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  completed periodic sync task", buf, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_43;
  v5[3] = &unk_264890A70;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_43(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textReplacementManager];
  [v2 recordSyncStatus];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __54___KSTextReplacementServer_setTextReplacementManager___block_invoke(uint64_t a1)
{
}

void __35___KSTextReplacementServer_cleanup__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) textReplacementManager];
  [v2 minimumUptimeRemaining];
  double v4 = v3;

  if (v4 <= 0.0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    [v10 _performCleanup];
  }
  else
  {
    id v5 = KSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [NSNumber numberWithDouble:v4];
      *(_DWORD *)buf = 136315394;
      v13 = "-[_KSTextReplacementServer cleanup]_block_invoke";
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  not cleanin up, waiting remaining minimum uptime: %@", buf, 0x16u);
    }
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35___KSTextReplacementServer_cleanup__block_invoke_49;
    block[3] = &unk_2648906A8;
    block[4] = v8;
    dispatch_after(v7, v9, block);
  }
}

uint64_t __35___KSTextReplacementServer_cleanup__block_invoke_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCleanup];
}

uint64_t __36___KSTextReplacementServer_shutdown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCleanup];
}

void __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230F44DF0]();
  double v3 = [[ArraySlicer alloc] initWithArray:*(void *)(a1 + 32) sliceSize:100];
  double v4 = [[ArraySlicer alloc] initWithArray:*(void *)(a1 + 40) sliceSize:100];
  id v5 = [MEMORY[0x263EFF980] array];
  v57 = [MEMORY[0x263EFF980] array];
  v56 = [MEMORY[0x263EFF9A0] dictionary];
  v60 = v3;
  uint64_t v6 = [(ArraySlicer *)v3 nextSlice];
  v59 = v4;
  uint64_t v7 = [(ArraySlicer *)v4 nextSlice];
  if (v6 | v7)
  {
    uint64_t v8 = v7;
    v55 = v2;
    uint64_t v58 = a1;
    while (1)
    {
      v62 = [MEMORY[0x263EFF980] array];
      uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v10 = (id)v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v72 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            uint64_t v16 = [v15 cloudID];
            [v9 setObject:v15 forKeyedSubscript:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v71 objects:v82 count:16];
        }
        while (v12);
      }
      v61 = v10;

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      obuint64_t j = (id)v6;
      uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v68;
        v64 = v9;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v68 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            __int16 v22 = [v21 priorValue];
            int v23 = [v22 isEquivalentTo:v21];

            if (v23)
            {
              __int16 v24 = [v21 priorValue];
              v25 = [v24 cloudID];
              [v9 removeObjectForKey:v25];
            }
            else
            {
              int64_t v26 = +[_KSTextReplacementHelper validateTextReplacement:v21];
              if (v26)
              {
                int64_t v27 = v26;
                v28 = [v21 priorValue];

                if (v28)
                {
                  v29 = KSCategory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    [v21 priorValue];
                    v31 = v30 = v5;
                    v32 = [v31 cloudID];
                    v33 = [v64 objectForKeyedSubscript:v32];
                    *(_DWORD *)buf = 136315394;
                    v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
                    __int16 v77 = 2112;
                    v78 = v33;
                    _os_log_impl(&dword_22B2BC000, v29, OS_LOG_TYPE_INFO, "%s  >>> Not removing entry: %@, as the replacement entry is not valid", buf, 0x16u);

                    uint64_t v9 = v64;
                    id v5 = v30;
                  }

                  v34 = [v21 priorValue];
                  v35 = [v34 cloudID];
                  [v9 removeObjectForKey:v35];
                }
                v36 = +[_KSTextReplacementHelper errorWithCode:v27 forEntry:v21];
                [v5 addObject:v36];
              }
              else
              {
                [v62 addObject:v21];
              }
              v37 = [v21 cloudID];
              v38 = [v21 priorValue];
              v39 = [v38 cloudID];
              int v40 = [v37 isEqualToString:v39];

              if (v40)
              {
                v41 = KSCategory();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
                  _os_log_impl(&dword_22B2BC000, v41, OS_LOG_TYPE_INFO, "%s  >>> the modified entry's unique ID should not be the same as prior, changing", buf, 0xCu);
                }

                v42 = [v21 uniqueID];
                [v21 setCloudID:v42];
              }
              +[_KSTextReplacementHelper extractAggdMetricsForTextReplacement:v21];
              uint64_t v9 = v64;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
        }
        while (v18);
      }

      a1 = v58;
      if ([*(id *)(v58 + 48) generation] != *(void *)(v58 + 72)) {
        break;
      }
      v43 = [*(id *)(v58 + 56) textReplacementManager];

      if (!v43) {
        break;
      }
      v44 = KSCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = [v9 allValues];
        *(_DWORD *)buf = 136315650;
        v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
        __int16 v77 = 2112;
        v78 = v62;
        __int16 v79 = 2112;
        v80 = v45;
        _os_log_impl(&dword_22B2BC000, v44, OS_LOG_TYPE_INFO, "%s  >>> adding entries: %@, removing entries %@", buf, 0x20u);
      }
      v46 = [*(id *)(v58 + 56) textReplacementManager];
      v47 = [v9 allValues];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke_54;
      v65[3] = &unk_264890D40;
      id v66 = v5;
      [v46 addEntries:v62 removeEntries:v47 withCompletionHandler:v65];

      uint64_t v6 = [(ArraySlicer *)v60 nextSlice];

      uint64_t v8 = [(ArraySlicer *)v59 nextSlice];

      if (!(v6 | v8))
      {
        uint64_t v48 = 0;
        v2 = v55;
        goto LABEL_38;
      }
    }
    v50 = [(ArraySlicer *)v60 unconsumed];
    v51 = [(ArraySlicer *)v59 unconsumed];
    v49 = v56;
    if ([v50 count]) {
      [v56 setObject:v50 forKeyedSubscript:@"_KSTextReplacementUpdateDidFailEntriesKey"];
    }
    if ([v51 count]) {
      [v56 setObject:v51 forKeyedSubscript:@"_KSTextReplacementDeleteDidFailEntriesKey"];
    }

    uint64_t v48 = 11;
    v2 = v55;
  }
  else
  {
    uint64_t v48 = 0;
LABEL_38:
    v49 = v56;
  }
  if ([v5 count] || objc_msgSend(v57, "count"))
  {
    [v49 setObject:v5 forKeyedSubscript:@"_KSTextReplacementUpdateDidFailErrorsKey"];
    [v49 setObject:v57 forKeyedSubscript:@"_KSTextReplacementDeleteDidFailErrorsKey"];
    uint64_t v48 = 11;
  }
  v52 = [MEMORY[0x263F087E8] errorWithDomain:@"KSTextReplacementErrorDomain" code:v48 userInfo:v49];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) textReplacementManager];
  v54 = v53 = v49;
  [v54 requestSync:0 withCompletionBlock:&__block_literal_global_58];
}

uint64_t __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke_54(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __44___KSTextReplacementServer_removeAllEntries__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x230F44DF0]();
  double v3 = [*(id *)(a1 + 32) textReplacementManager];
  [v3 removeAllEntries];

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = [*(id *)(a1 + 32) textReplacementManager];
  [v6 requestSync:0 withCompletionBlock:&__block_literal_global_61];
}

void __44___KSTextReplacementServer_removeAllEntries__block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = KSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    v2 = "-[_KSTextReplacementServer removeAllEntries]_block_invoke_2";
    _os_log_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_INFO, "%s  >>> completed remove all TR entries", (uint8_t *)&v1, 0xCu);
  }
}

void __60___KSTextReplacementServer_requestSync_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textReplacementManager];
  [v2 requestSync:*(void *)(a1 + 48) withCompletionBlock:*(void *)(a1 + 40)];
}

void __60___KSTextReplacementServer_textReplacementEntriesForClient___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) textReplacementManager];
  uint64_t v3 = [v2 textReplacementEntries];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v9, (void)v10))[*(id *)(a1 + 40) addObject:v9]; {
      }
        }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textReplacementManager];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    id v4 = [*(id *)(a1 + 32) textReplacementManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke_2;
    v8[3] = &unk_264890808;
    id v9 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v6 = v3;
    [v4 queryTextReplacementsWithPredicate:v5 callback:v8];
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v10, (void)v16))[v4 addObject:v10]; {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v12 = v11;
  long long v13 = KSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    uint64_t v15 = [NSNumber numberWithDouble:-v12];
    *(_DWORD *)buf = 136315650;
    v21 = "-[_KSTextReplacementServer queryTextReplacementsWithPredicate:callback:]_block_invoke_2";
    __int16 v22 = 2112;
    int v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_22B2BC000, v13, OS_LOG_TYPE_INFO, "%s  time spent reading %@ entries is %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63___KSTextReplacementServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];
}

void __65___KSTextReplacementServer_connection_didReceiveIncomingMessage___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = KSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[_KSTextReplacementServer connection:didReceiveIncomingMessage:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_INFO, "%s  >>> PUSH notif received, completed pulling TR entries", (uint8_t *)&v1, 0xCu);
  }
}

@end