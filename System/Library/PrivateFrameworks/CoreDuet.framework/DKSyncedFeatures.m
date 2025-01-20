@interface DKSyncedFeatures
@end

@implementation DKSyncedFeatures

uint64_t __35___DKSyncedFeatures_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v6);

  if (v5)
  {
    v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke_cold_1((uint64_t)v5, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v8 = *(void *)(v8 + 16);
    }
    if (v8 != a2)
    {
      v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [NSNumber numberWithInteger:a2];
        int v15 = 138412290;
        v16 = v10;
        _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "ScreenTime sync state: %@", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        *(void *)(v11 + 16) = a2;
      }
      v12 = (void *)MEMORY[0x1E4F1CC28];
      if (a2 == 1) {
        v12 = (void *)MEMORY[0x1E4F1CC38];
      }
      v13 = (void *)MEMORY[0x1E4F1CB18];
      id v14 = v12;
      v7 = [v13 standardUserDefaults];
      [v7 setObject:v14 forKey:@"ScreenTimeSyncDisabled"];

      goto LABEL_4;
    }
  }
LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __47___DKSyncedFeatures_isIDSMessageGatingDisabled__block_invoke()
{
  uint64_t v0 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_INFO, "IDS Message Gating feature is disabled", v1, 2u);
  }
}

void __43___DKSyncedFeatures_isSiriPortraitDisabled__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  isSiriPortraitDisabled_previousResult = *(unsigned char *)(a1 + 32);
  v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = @"enabled";
    }
    else {
      v3 = @"disabled";
    }
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "Siri Portrait feature is %@", (uint8_t *)&v4, 0xCu);
  }
}

void __55___DKSyncedFeatures_isSupergreenDisabledForTransports___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  isSupergreenDisabledForTransports__previousResult = *(unsigned char *)(a1 + 32);
  v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = @"disabled";
    }
    else {
      v3 = @"enabled";
    }
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "Supergreen feature is %@", (uint8_t *)&v4, 0xCu);
  }
}

void __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failed to get ScreenTime sync state with error: %@", (uint8_t *)&v2, 0xCu);
}

@end