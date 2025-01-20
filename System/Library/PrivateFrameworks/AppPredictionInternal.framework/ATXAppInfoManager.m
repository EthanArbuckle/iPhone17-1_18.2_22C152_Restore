@interface ATXAppInfoManager
@end

@implementation ATXAppInfoManager

void __36___ATXAppInfoManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [_ATXAppInfoManager alloc];
  v2 = +[_ATXDataStore sharedInstance];
  uint64_t v3 = [(_ATXAppInfoManager *)v1 initWithDataStore:v2];
  v4 = (void *)sharedInstance__pasExprOnceResult_37;
  sharedInstance__pasExprOnceResult_37 = v3;
}

void __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_app_install();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_cold_1(v2, v4);
    }
  }
}

uint64_t __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0xF4241) {
    [*(id *)(a1 + 32) removeObjectAtIndex:0];
  }
  v4 = [v3 eventBody];
  int v5 = [v4 starting];

  v6 = [v3 eventBody];
  v7 = v6;
  if (!v5)
  {
    int v12 = [v6 starting];

    if (v12) {
      goto LABEL_15;
    }
    v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v13)
    {
      v14 = [v13 bundleID];
      v15 = [v3 eventBody];
      v16 = [v15 bundleID];
      if (([(_ATXAppLaunch *)v14 isEqualToString:v16] & 1) == 0)
      {

        goto LABEL_12;
      }
      v17 = [v3 eventBody];
      v18 = [v17 extensionHostID];

      if (!v18)
      {
        v19 = [_ATXAppLaunch alloc];
        v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) bundleID];
        v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) absoluteTimestamp];
        v22 = [v3 eventBody];
        v23 = [v22 absoluteTimestamp];
        v24 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) launchReason];
        v14 = [(_ATXAppLaunch *)v19 initWithBundleId:v20 startDate:v21 endDate:v23 timeZone:0 reason:v24];

        [*(id *)(a1 + 32) addObject:v14];
LABEL_12:
      }
    }
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0;
    goto LABEL_14;
  }
  v8 = [v6 extensionHostID];

  if (!v8)
  {
    uint64_t v9 = [v3 eventBody];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
LABEL_14:
  }
LABEL_15:

  return 1;
}

void __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "_ATXAppInfoManager: Can't read App.InFocus stream with error: %@", (uint8_t *)&v4, 0xCu);
}

@end