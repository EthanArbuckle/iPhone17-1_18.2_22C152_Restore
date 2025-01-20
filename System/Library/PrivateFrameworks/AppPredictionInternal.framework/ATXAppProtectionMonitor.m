@interface ATXAppProtectionMonitor
@end

@implementation ATXAppProtectionMonitor

void __42___ATXAppProtectionMonitor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_46;
  sharedInstance__pasExprOnceResult_46 = v1;
}

void __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) appProtectionSubjectMonitorSubscription];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v34;
      *(void *)&long long v6 = 138412290;
      long long v32 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
          if ((objc_msgSend(v10, "isHidden", v32) & 1) != 0 || objc_msgSend(v10, "isLocked"))
          {
            v11 = objc_opt_new();
            v12 = objc_opt_new();
            if ([v10 isLocked])
            {
              v13 = __atxlog_handle_default();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v14 = [v10 bundleIdentifier];
                *(_DWORD *)buf = v32;
                v38 = v14;
                _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is locked", buf, 0xCu);
              }
              v15 = [v10 bundleIdentifier];
              [v11 addObject:v15];
            }
            if ([v10 isHidden])
            {
              v16 = __atxlog_handle_default();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = [v10 bundleIdentifier];
                *(_DWORD *)buf = v32;
                v38 = v17;
                _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is hidden", buf, 0xCu);
              }
              v18 = [v10 bundleIdentifier];
              [v12 addObject:v18];
            }
            v19 = [[ATXAppProtectionLockedOrHidden alloc] initWithLockedApps:v11 hiddenApps:v12];
            v20 = __atxlog_handle_default();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = [v10 bundleIdentifier];
              *(_DWORD *)buf = v32;
              v38 = v21;
              _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Sending internal notification for locked/hidden app: %@", buf, 0xCu);
            }
            +[ATXInternalLockedOrHiddenAppNotification postNotificationWithLockedOrHiddenApps:v19];
LABEL_20:

            goto LABEL_21;
          }
          if (![v10 isHidden] || (objc_msgSend(v10, "isLocked") & 1) == 0)
          {
            v11 = objc_opt_new();
            v12 = objc_opt_new();
            if (([v10 isLocked] & 1) == 0)
            {
              v22 = __atxlog_handle_default();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = [v10 bundleIdentifier];
                *(_DWORD *)buf = v32;
                v38 = v23;
                _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is no longer locked", buf, 0xCu);
              }
              v24 = [v10 bundleIdentifier];
              [v11 addObject:v24];
            }
            if (([v10 isHidden] & 1) == 0)
            {
              v25 = __atxlog_handle_default();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = [v10 bundleIdentifier];
                *(_DWORD *)buf = v32;
                v38 = v26;
                _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is no longer hidden", buf, 0xCu);
              }
              v27 = [v10 bundleIdentifier];
              [v12 addObject:v27];
            }
            v28 = __atxlog_handle_default();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = [v10 bundleIdentifier];
              *(_DWORD *)buf = v32;
              v38 = v29;
              _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Sending internal notification for unlocked/unhidden app: %@", buf, 0xCu);
            }
            v19 = [[ATXAppProtectionUnLockedOrUnHidden alloc] initWithUnLockedApps:v11 unHiddenApps:v12];
            +[ATXInternalUnLockedOrUnHiddenAppNotification postNotificationWithUnLockedOrUnHiddenApps:v19];
            goto LABEL_20;
          }
LABEL_21:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v30 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v7 = v30;
      }
      while (v30);
    }
    v31 = __atxlog_handle_default();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Received App Protection change:  %@. Refreshing blending layer suggestions immediately", buf, 0xCu);
    }

    ATXUpdatePredictionsImmediatelyWithReason(21);
  }
}

id __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  Class v3 = NSClassFromString(&cfstr_Apapplication.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end