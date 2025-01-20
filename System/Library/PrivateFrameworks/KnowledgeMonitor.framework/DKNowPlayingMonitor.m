@interface DKNowPlayingMonitor
@end

@implementation DKNowPlayingMonitor

uint64_t __28___DKNowPlayingMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 primaryValue];
  v7 = [v5 primaryValue];
  if ([v6 isEqual:v7])
  {
    v8 = [v4 metadata];
    v9 = [v5 metadata];
    unsigned int v10 = [v8 isEqualToDictionary:v9];

    uint64_t v11 = v10 - 1;
  }
  else
  {

    uint64_t v11 = -1;
  }

  return v11;
}

uint64_t __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_25(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 stringValue];

  uint64_t v4 = [v3 isEqualToString:@"unknown"];
  if (v4)
  {
    id v5 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_25_cold_1(v5);
    }
  }
  return v4;
}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) outputContext];
  v3 = [v2 outputDevices];

  uint64_t v4 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_INFO, "Output devices in now playing monitor changed, %@ output devices", buf, 0xCu);
  }
  v6 = [*(id *)(a1 + 32) queue];
  id v7 = v3;
  MRMediaRemoteGetActiveOrigin();
}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_39(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _nowPlayingInfoDidChange:a3 outputDevices:v3];
  }
  else
  {
    id v5 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_39_cold_1(v5);
    }
  }
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  uint64_t v6 = [v3 _metadataFromInfo:v5 outputDevices:v4];
  uint64_t v7 = *(void *)(a1[8] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54B50]];
  uint64_t v10 = *(void *)(a1[9] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54B40]];
  uint64_t v13 = *(void *)(a1[10] + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54BA8]];

  *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = [v15 BOOLValue];
  v16 = a1[6];
  dispatch_group_leave(v16);
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_2();
    }
  }
  else
  {
    uint64_t v5 = MRNowPlayingClientGetBundleIdentifier();
    uint64_t v6 = a1 + 48;
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    uint64_t v4 = MRNowPlayingClientCopyBundleIdentifierHierarchy();
    uint64_t v9 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_1(a1 + 48, (uint64_t)v4, v9);
    }

    if ([*(id *)(*(void *)(*(void *)v6 + 8) + 40) isEqualToString:@"com.apple.tvairplayd"]&& (unint64_t)-[NSObject count](v4, "count") >= 2)
    {
      uint64_t v10 = [v4 objectAtIndexedSubscript:1];
      uint64_t v11 = *(void *)(*(void *)v6 + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_63(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_65(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v3;
    __int16 v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_225002000, v2, OS_LOG_TYPE_INFO, "Updated now playing info for %@ with %@ output devices", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v5 + 40))
  {
    *(void *)(v5 + 40) = &stru_26D866630;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if ([&unk_26D86D758 containsObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1; {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    }
      [*(id *)(a1 + 40) _stripMetadata:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    v8 = [MEMORY[0x263F350F0] playing];
    [v6 setObject:v7 forKey:v8];

    v26 = [(id)objc_opt_class() _eventWithBundleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) metadata:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    [*(id *)(a1 + 40) setCurrentEvent:v26 inferHistoricalState:1];
    unsigned int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v25 = [MEMORY[0x263F350F0] title];
    uint64_t v10 = [v9 objectForKeyedSubscript:v25];
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v12 = [MEMORY[0x263F350F0] outputDeviceIDs];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v15 = [MEMORY[0x263F350F0] mediaType];
    v16 = [v14 objectForKeyedSubscript:v15];
    v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v18 = [MEMORY[0x263F350F0] iTunesStoreIdentifier];
    v19 = [v17 objectForKeyedSubscript:v18];
    v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v21 = [MEMORY[0x263F350F0] iTunesSubscriptionIdentifier];
    v22 = [v20 objectForKeyedSubscript:v21];
    +[_DKNowPlayingMonitor setPlaybackState:v24 bundleId:v23 track:v10 outputDeviceIDs:v13 mediaType:v16 iTunesStoreIdentifier:v19 iTunesSubscriptionIdentifier:v22];

    *(_DWORD *)(*(void *)(a1 + 40) + 164) = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    [*(id *)(a1 + 40) saveBMEventWithCurrent:v26 outputDevices:*(void *)(a1 + 32) artistStoreIdentifier:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) albumStoreIdentifier:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) excludeFromSuggestions:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  }
}

void __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_25_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "Now playing monitor filtered out unknown now playing event", v1, 2u);
}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_39_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Failed to fetch active now playing origin after receiving output devices changed notification", v1, 2u);
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "Retrived now playing bundle identifier: %@; hierarchy: %@",
    (uint8_t *)&v4,
    0x16u);
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225002000, v0, OS_LOG_TYPE_ERROR, "Could not retrieve now playing client. Failed with error: %{public}@", v1, 0xCu);
}

@end