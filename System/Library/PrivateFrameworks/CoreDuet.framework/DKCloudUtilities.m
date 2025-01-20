@interface DKCloudUtilities
@end

@implementation DKCloudUtilities

uint64_t __35___DKCloudUtilities_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __25___DKCloudUtilities_init__block_invoke(uint64_t a1)
{
  v2 = [_DKThrottledActivity alloc];
  v3 = -[_DKCloudUtilities keyValueStore](*(void *)(a1 + 32));
  uint64_t v4 = [(_DKThrottledActivity *)v2 initWithStore:v3 namespace:@"_DKCloudUtilities"];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  -[_DKCloudUtilities _fetchCloudKitConfigurationAndStatus](v7);
}

void __39___DKCloudUtilities__accountDidChange___block_invoke(uint64_t a1)
{
}

void __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke_2;
  v2[3] = &unk_1E560D730;
  v2[4] = v1;
  -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:](v1, v2);
}

void __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24)) {
    -[_DKCloudUtilities _updateNumberOfSyncedDevicesWithCompletionHandler:](v1, &__block_literal_global_9);
  }
}

void __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKCloudUtilities _updateAccountInfo:error:]((uint64_t)WeakRetained, v6, v5);

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  }
  v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke_cold_1();
  }
}

void __46___DKCloudUtilities__updateAccountInfo_error___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_DKCloudSyncAvailablityChangedNotification" object:0];
}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = +[_CDLogging syncChannel];
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_2(v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:](v2, 1, *(void **)(a1 + 40));
  }
}

uint64_t __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  int v5 = [v4 isEqualToString:@"metadata_device_type"];

  if (v5)
  {
    id v6 = [v3 recordID];
    uint64_t v7 = [v6 recordName];

    uint64_t v8 = [*(id *)(a1 + 32) arrayForKey:@"_DKCloudSyncDevices"];
    if ([v8 count])
    {
      if ([v8 containsObject:v7])
      {
LABEL_7:

        goto LABEL_8;
      }
      v9 = (void *)[v8 mutableCopy];
      [v9 addObject:v7];
      [*(id *)(a1 + 32) setArray:v9 forKey:@"_DKCloudSyncDevices"];
      v10 = +[_CDObservationCenter sharedInstance];
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count", @"count"));
      v16 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      [v10 postNotificationName:@"_DKCloudDeviceCountChangedNotification" userInfo:v12 sender:*(void *)(a1 + 40)];
    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v17[0] = v7;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v13 setArray:v14 forKey:@"_DKCloudSyncDevices"];

      v9 = +[_CDObservationCenter sharedInstance];
      [v9 postNotificationName:@"_DKCloudDeviceCountChangedNotification" userInfo:&unk_1EDE1E9F8 sender:*(void *)(a1 + 40)];
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_584(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 isEqualToString:@"metadata_device_type"])
  {
    id v6 = [v5 recordName];
    uint64_t v7 = [*(id *)(a1 + 32) arrayForKey:@"_DKCloudSyncDevices"];
    if ([v7 count])
    {
      uint64_t v8 = (void *)[v7 mutableCopy];
      [v8 removeObject:v6];
      [*(id *)(a1 + 32) setArray:v8 forKey:@"_DKCloudSyncDevices"];
      v9 = +[_CDObservationCenter sharedInstance];
      v12 = @"count";
      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v13[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [v9 postNotificationName:@"_DKCloudDeviceCountChangedNotification" userInfo:v11 sender:*(void *)(a1 + 40)];
    }
  }
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setData:v4 forKey:@"_DKCloudSyncMetadataChangeToken"];
  }
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_4;
    v29[3] = &unk_1E560D578;
    v30 = *(id *)(a1 + 32);
    +[_DKSyncSerializer performSyncBlock:v29];
    v9 = v30;
LABEL_29:

    goto LABEL_30;
  }
  id v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_2(a1, v3, v4);
  }

  if ([v3 code] == 2)
  {
    id v5 = [v3 domain];
    uint64_t v6 = *MEMORY[0x1E4F19C40];
    int v7 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v7)
    {
      uint64_t v8 = [v3 userInfo];
      v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      [v9 allValues];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ([v15 code] == 21)
            {
              v16 = [v15 domain];
              char v17 = [v16 isEqualToString:v6];

              if (v17)
              {

                goto LABEL_21;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      goto LABEL_29;
    }
  }
  if ([v3 code] != 21
    || ([v3 domain],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isEqualToString:*MEMORY[0x1E4F19C40]],
        v18,
        !v19))
  {
LABEL_30:
    uint64_t v23 = *(void *)(a1 + 72);
    if (v23) {
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v3);
    }
    goto LABEL_32;
  }
LABEL_21:
  v20 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_INFO, "Change token expired, may retry fetching number of synced devices", v24, 2u);
  }

  [*(id *)(a1 + 48) removeObjectForKey:@"_DKCloudSyncMetadataChangeToken"];
  unint64_t v21 = *(void *)(a1 + 80);
  v22 = +[_CDLogging syncChannel];
  v9 = v22;
  if (v21 > 2)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_1();
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "Will retry fetching number of synced devices", v24, 2u);
  }

  -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:](*(void *)(a1 + 56), *(void *)(a1 + 80) + 1, *(void *)(a1 + 72));
LABEL_32:
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) arrayForKey:@"_DKCloudSyncDevices"];
  if ((unint64_t)[v1 count] >= 2)
  {
    uint64_t v2 = +[_DKSyncPeerStatusTracker sharedInstance];
    id v3 = [v2 allPeers];
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1728000.0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "me", (void)v16) & 1) == 0)
          {
            uint64_t v11 = [v10 lastSeenDate];
            uint64_t v12 = v11;
            if (!v11
              || ([v11 timeIntervalSinceNow],
                  double v14 = v13,
                  [v4 timeIntervalSinceNow],
                  v14 < v15))
            {
              [v2 setLastSeenDate:v4 onPeer:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

void __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Finished fetching account info", v2, v3, v4, v5, v6);
}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Succesfully deleted zones", v2, v3, v4, v5, v6);
}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_2(void *a1)
{
  uint64_t v2 = [a1 domain];
  [a1 code];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_5(&dword_18ECEB000, v3, v4, "Failed to delete zones: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Exceeded maximum retries, unable to fetch number of synced devices", v1, 2u);
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [a2 domain];
  int v7 = 138413058;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  double v14 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "Failed to fetch record zone changes for %@: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
}

@end