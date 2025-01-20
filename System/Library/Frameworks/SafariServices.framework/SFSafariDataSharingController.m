@interface SFSafariDataSharingController
@end

@implementation SFSafariDataSharingController

void __50___SFSafariDataSharingController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(_SFSafariDataSharingController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;
}

void __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  [*(id *)(a1 + 32) _loadAppBundlesWithSeparateDataIfNeeded];
  if (([*(id *)(*v2 + 16) containsObject:v2[1]] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v3 setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"AppBundleIDsWithSeperateData"];
    [v3 synchronize];
    v4 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "Apps currently using SafariViewController in Separated data mode...", v6, 2u);
    }
    v5 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke_cold_1((uint64_t)v2, v5);
    }
  }
}

void __54___SFSafariDataSharingController_clearAllWebsitesData__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v3 = [v2 arrayForKey:@"AppBundleIDsWithSeperateData"];
  v4 = (void *)[v3 mutableCopy];

  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = v4;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v11 = [*(id *)(a1 + 32) systemDataContainerURLWithAppBundleID:v10];
          v12 = [v11 URLByAppendingPathComponent:@"/Library"];

          v13 = [v12 path];
          int v14 = [v5 fileExistsAtPath:v13];

          if (v14)
          {
            [v5 removeItemAtURL:v12 error:0];
          }
          else
          {
            v15 = WBS_LOG_CHANNEL_PREFIXViewService();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_INFO, "Skip clearing data for app since it has been uninstalled", buf, 2u);
            }
            v16 = WBS_LOG_CHANNEL_PREFIXViewService();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v25 = v10;
              _os_log_debug_impl(&dword_1A690B000, v16, OS_LOG_TYPE_DEBUG, "App bundle ID: %{private}@", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }

    v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v17 removeObjectForKey:@"AppBundleIDsWithSeperateData"];
    [v17 synchronize];

    v4 = v18;
  }
}

void __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "... apps: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end