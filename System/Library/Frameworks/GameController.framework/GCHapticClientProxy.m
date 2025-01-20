@interface GCHapticClientProxy
@end

@implementation GCHapticClientProxy

void __60___GCHapticClientProxy__initWithConnection_server_clientID___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  [v1 invalidate];
}

void __71___GCHapticClientProxy_InvalidationObservable__addInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = [v3 invalidationHandlers];
    v5 = (void *)[v4 mutableCopy];

    v6 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 32));
    [v5 removeObject:v6];

    [v3 setInvalidationHandlers:v5];
    objc_sync_exit(v3);

    id WeakRetained = v7;
  }
}

void __62___GCHapticClientProxy_HapticServer__queryCapabilities_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:@"SupportsAudioPlayback"]
    || [v3 isEqualToString:@"SupportsAdvancedPatternPlayers"])
  {
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"HapticContinuousTimeLimit"])
  {
    v4 = *(void **)(a1 + 32);
    v5 = +[NSNumber numberWithUnsignedInt:0];
    [v4 setObject:v5 forKey:v3];
LABEL_8:

    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"UsingInternalHaptics"])
  {
LABEL_7:
    v6 = *(void **)(a1 + 32);
    v5 = +[NSNumber numberWithBool:0];
    [v6 setObject:v5 forKey:v3];
    goto LABEL_8;
  }
  if (*(void *)(a1 + 40))
  {
    if (([v3 isEqualToString:@"HapticTransientDefaultIntensity"] & 1) != 0
      || ([v3 isEqualToString:@"HapticTransientDefaultSharpness"] & 1) != 0
      || ([v3 isEqualToString:@"HapticContinuousDefaultIntensity"] & 1) != 0
      || ([v3 isEqualToString:@"HapticContinuousDefaultSharpness"] & 1) != 0)
    {
      id v7 = &unk_26D287BC0;
LABEL_17:
      [*(id *)(a1 + 32) setObject:v7 forKey:v3];
      goto LABEL_9;
    }
    if ([v3 isEqualToString:@"HapticTransientEventIDs"])
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_26D287A40;
      v10 = &unk_26D287A58;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"HapticContinuousSustainedEventIDs"])
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_26D287A70;
      v10 = &unk_26D287A88;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"HapticContinuousNonsustainedEventIDs"])
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_26D287AA0;
      v10 = &unk_26D287AB8;
LABEL_24:
      if (v8) {
        id v7 = v9;
      }
      else {
        id v7 = v10;
      }
      goto LABEL_17;
    }
  }
LABEL_9:
  if (gc_isInternalBuild())
  {
    v11 = getGCHapticsLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
      int v13 = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Set %@ to %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

uint64_t __64___GCHapticClientProxy_HapticServer__teardownAndReleaseChannels__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    int v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(v9 + 176);
      uint64_t v11 = *(void *)(v9 + 224);
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - teardownAndReleaseChannels: %@", buf, 0x16u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 224);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * v5), (void)v12);
        [v6 teardown];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 224) removeAllObjects];
}

uint64_t __53___GCHapticClientProxy_HapticServer__releaseChannels__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    int v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 176);
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v9;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseChannels", buf, 0xCu);
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 224);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v5), (void)v10);
        [v6 setRetainedByClient:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 224) removeAllObjects];
}

void __60___GCHapticClientProxy_HapticServer__requestChannels_reply___block_invoke(void *a1)
{
  if (gc_isInternalBuild())
  {
    v23 = getGCHapticsLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1[4] + 176);
      v25 = (void *)a1[6];
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v24;
      __int16 v43 = 2048;
      v44 = v25;
      _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - requestChannels (count=%lu)", buf, 0x16u);
    }
  }
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 224) count])
  {
    v26 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v26 handleFailureInMethod:a1[7] object:a1[4] file:@"GCHapticClientProxy.mm" lineNumber:564 description:@"Client attempting to request fewer channels than already reserved"];
  }
  uint64_t v3 = a1[6];
  uint64_t v4 = [*(id *)(a1[4] + 224) count];
  uint64_t v5 = +[_GCHapticServerManager sharedInstance];
  v6 = objc_msgSend(v5, "__onqueue_reserveChannels:forClient:", v3 - v4, a1[4]);

  if (v6)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
          ++*(_DWORD *)(a1[4] + 168);
          long long v12 = *(void **)(a1[4] + 224);
          long long v13 = [v11 identifier];
          [v12 setObject:v11 forKey:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }

    long long v14 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = *(id *)(a1[4] + 224);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v15);
          }
          __int16 v19 = objc_msgSend(*(id *)(a1[4] + 224), "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * v18), (void)v29);
          uint64_t v20 = [v19 identifier];
          [v14 addObject:v20];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v16);
    }

    if (gc_isInternalBuild())
    {
      v27 = getGCHapticsLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1[4] + 176);
        *(_DWORD *)buf = 134218242;
        uint64_t v42 = v28;
        __int16 v43 = 2112;
        v44 = v14;
        _os_log_impl(&dword_220998000, v27, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - reply requestChannels -> %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v21 = a1[5];
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    v40 = @"Client not registred";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v22 = +[NSError errorWithDomain:@"GameControllerHaptics" code:0 userInfo:v14];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);
  }
}

void __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke(void *a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1[4] + 176);
      uint64_t v10 = a1[6];
      int v12 = 134218240;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - removeChannel, %lu", (uint8_t *)&v12, 0x16u);
    }
  }
  unint64_t v2 = *(void **)(a1[4] + 224);
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    [v4 setRetainedByClient:0];
    uint64_t v5 = *(void **)(a1[4] + 224);
    v6 = +[NSNumber numberWithUnsignedInteger:a1[6]];
    [v5 removeObjectForKey:v6];
    id v7 = 0;
  }
  else
  {
    v6 = +[NSMutableDictionary dictionary];
    [v6 setValue:@"Attempting to remove channel that client does not have" forKey:NSLocalizedDescriptionKey];
    id v7 = +[NSError errorWithDomain:@"Game Controller Haptics" code:-4804 userInfo:v6];
  }

  if (gc_isInternalBuild())
  {
    long long v11 = getGCHapticsLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke_cold_1((uint64_t)(a1 + 4), v11);
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 176);
  uint64_t v3 = *(void *)(*(void *)a1 + 224);
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "HapticClient %lu - removeChannels - channels=%@", (uint8_t *)&v4, 0x16u);
}

@end