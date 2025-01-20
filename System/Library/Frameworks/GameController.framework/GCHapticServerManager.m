@interface GCHapticServerManager
@end

@implementation GCHapticServerManager

void __40___GCHapticServerManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_GCHapticServerManager);
  v1 = (void *)+[_GCHapticServerManager sharedInstance]::hapticServerManager;
  +[_GCHapticServerManager sharedInstance]::hapticServerManager = (uint64_t)v0;
}

void __30___GCHapticServerManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[12];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __30___GCHapticServerManager_init__block_invoke_2;
    v7[3] = &unk_26D22BC60;
    id v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __30___GCHapticServerManager_init__block_invoke_2(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v15 = getGCHapticsLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "App state changed %@", buf, 0xCu);
    }
  }
  v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateKey];
  uint64_t v2 = [v18 intValue];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(a1 + 40) + 88);
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v21;
    uint64_t v6 = BKSApplicationStateDisplayIDKey;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v7), v17);
        v9 = [v8 bundleIdentifier];
        v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          if (v2 == 2)
          {
            if (gc_isInternalBuild())
            {
              v13 = getGCHapticsLogger();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v17;
                v26 = v8;
                _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Application backgrounded, muting %@", buf, 0xCu);
              }
            }
            [v8 setMute:1 forReason:3];
            [v8 notifyClientOnStopWithReason:2 error:0];
          }
          else if (v2 == 8)
          {
            if (gc_isInternalBuild())
            {
              v12 = getGCHapticsLogger();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v17;
                v26 = v8;
                _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "Application foregrounded, unmuting %@", buf, 0xCu);
              }
            }
            [v8 setMute:0 forReason:3];
          }
          [v8 setApplicationState:v2];
        }

        ++v7;
      }
      while (v3 != v7);
      uint64_t v14 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v3 = v14;
    }
    while (v14);
  }
}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  long long v4 = v3;
  if (WeakRetained && v3)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCHapticsLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412546;
        id v7 = WeakRetained;
        __int16 v8 = 2048;
        uint64_t v9 = [v4 clientID];
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ has lost its connection to haptic client %lu.", (uint8_t *)&v6, 0x16u);
      }
    }
    [WeakRetained removeHapticClient:v4];
  }
}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = v5;
  if (WeakRetained && v5)
  {
    id v7 = [v3 objectForKeyedSubscript:BKSApplicationStateDisplayIDKey];
    [v6 setBundleIdentifier:v7];

    __int16 v8 = +[NSMutableArray array];
    uint64_t v9 = WeakRetained[12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_2;
    v11[3] = &unk_26D22BC60;
    v12 = WeakRetained;
    id v13 = v8;
    id v10 = v8;
    dispatch_async(v9, v11);
  }
}

uint64_t __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_2(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v5)];
        id v7 = [v6 bundleIdentifier];
        if (v7)
        {
          __int16 v8 = *(void **)(a1 + 40);
          uint64_t v9 = [v6 bundleIdentifier];
          LOBYTE(v8) = [v8 containsObject:v9];

          if ((v8 & 1) == 0)
          {
            id v10 = *(void **)(a1 + 40);
            int v11 = [v6 bundleIdentifier];
            [v10 addObject:v11];
          }
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v3);
  }

  if (gc_isInternalBuild())
  {
    id v13 = getGCHapticsLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v14;
      _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "Monitoring application state changes for %@", buf, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 72) updateInterestedBundleIDs:*(void *)(a1 + 40)];
}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = v3;
  if (WeakRetained && v3)
  {
    uint64_t v5 = [v3 addInvalidationHandler:*(void *)(a1 + 40)];
    int v6 = (void *)WeakRetained[7];
    id v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v6 setObject:v5 forKey:v7];

    __int16 v8 = (void *)WeakRetained[11];
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v8 setObject:v4 forKey:v9];

    if (gc_isInternalBuild())
    {
      id v10 = getGCHapticsLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = WeakRetained[11];
        int v13 = 138412546;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "%@ clients: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v14 = getGCHapticsLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "%@ remove haptic client: %@", buf, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  if (gc_isInternalBuild())
  {
    long long v17 = getGCHapticsLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v2;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "client controller identifier: %@", buf, 0xCu);
    }
  }
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v2];
    [v3 unregisterHapticClient:*(void *)(a1 + 40)];
    if (([v3 hasClients] & 1) == 0)
    {
      if (gc_isInternalBuild())
      {
        v19 = getGCHapticsLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_3((uint64_t)v3, v19);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v2];
      if (gc_isInternalBuild())
      {
        uint64_t v20 = getGCHapticsLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_2();
        }
      }
      [v3 stopAllHaptics];
    }
  }
  [*(id *)(a1 + 40) teardownAndReleaseChannels];
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) clientID]);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
    int v6 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) clientID]);
    [v5 removeObjectForKey:v6];

    id v7 = *(void **)(*(void *)(a1 + 32) + 88);
    __int16 v8 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) clientID]);
    [v7 removeObjectForKey:v8];
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = (id *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 64);
  long long v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  long long v23 = __45___GCHapticServerManager_removeHapticClient___block_invoke_17;
  v24 = &unk_26D22BD28;
  id v25 = v10[1];
  id v13 = v9;
  id v26 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:&v21];
  objc_msgSend(*((id *)*v10 + 8), "removeObjectsForKeys:", v13, v21, v22, v23, v24);
  if (gc_isInternalBuild())
  {
    long long v18 = getGCHapticsLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_1();
    }
  }
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a3 + 48) == *(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) object];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 40) + 48);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v15 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v6 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v5];
        id v7 = [v6[1] identifier];
        __int16 v8 = [v13 identifier];
        int v9 = [v7 isEqual:v8];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);

          goto LABEL_11;
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (gc_isInternalBuild())
    {
      id v10 = getGCHapticsLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "Unregistered haptic logical device: %@", buf, 0xCu);
      }
    }
    [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

void __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke_23(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * v5)];
        id v7 = [v6 identifier];
        if ([v7 isEqual:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
        {
          [v6 notifyClientOnStopWithReason:3 error:0];
          [v6 invalidateDueToControllerDisconnect];
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __55___GCHapticServerManager_notifyPlayerNoLongerRetained___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isActiveAtTime:(double)mach_absolute_time() * 0.0000000416666667] & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      long long v8 = getGCHapticsLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "%@ no longer retained by client and is not active - it will be safely released", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v2 = [*(id *)(a1 + 32) hapticLogicalDevice];
    BOOL v3 = v2 == 0;

    if (!v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) hapticLogicalDevice];
      [v4[4] removeObject:*(void *)(a1 + 32)];
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = *(void **)(*(void *)(a1 + 40) + 64);
    id v7 = [v5 identifier];
    [v6 removeObjectForKey:v7];
  }
}

void __38___GCHapticServerManager_enterRunloop__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C6E130]();
  char v3 = [*(id *)(a1 + 32) readClientDataForStartTime:*(double *)(a1 + 48) endTime:*(double *)(a1 + 56)];
  char v4 = [*(id *)(a1 + 32) playersHaveImpendingCommandsForStartTime:*(double *)(a1 + 48) endTime:*(double *)(a1 + 56)];
  if (v3) {
    char v5 = 0;
  }
  else {
    char v5 = ([*(id *)(a1 + 32) activeEvents] | v4) ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(*(void *)(a1 + 32) + 88) count] != 0;
  }
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_24(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C6E130]();
  [*(id *)(a1 + 32) processScheduledCommandsForStartTime:*(double *)(a1 + 40) endTime:*(double *)(a1 + 48)];
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C6E130]();
  [*(id *)(a1 + 32) processActiveEventsForStartTime:*(double *)(a1 + 40) endTime:*(double *)(a1 + 48)];
  double v4 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    double v7 = v3 - v4;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        uint64_t v11 = v10;
        if (v10[8])
        {
          [v10 addActiveTime:v7];
          v11[8] = 0;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C6E130]();
  [*(id *)(a1 + 32) identifyCompletedClients];
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_11();
  _os_log_debug_impl(&dword_220998000, v0, OS_LOG_TYPE_DEBUG, "%@ clients: %@", v1, 0x16u);
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_11();
  _os_log_debug_impl(&dword_220998000, v0, OS_LOG_TYPE_DEBUG, "%@ logical haptic devices: %@", v1, 0x16u);
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "%@ no longer has clients, removing...", (uint8_t *)&v2, 0xCu);
}

@end