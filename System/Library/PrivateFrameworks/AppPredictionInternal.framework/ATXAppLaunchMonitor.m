@interface ATXAppLaunchMonitor
@end

@implementation ATXAppLaunchMonitor

uint64_t __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 8) objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v35 = a3;
  v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2((uint64_t)v5, v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D25F6CC0](WeakRetained);
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__45;
    v48 = __Block_byref_object_dispose__45;
    id v49 = 0;
    v10 = (void *)v8[4];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_88;
    v41[3] = &unk_1E68B04E0;
    v43 = &v44;
    id v42 = *(id *)(a1 + 32);
    objc_msgSend(v10, "runWithLockAcquired:", v41, v35);
    v11 = (void *)v45[5];
    v12 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
    v13 = [v11 objectForKeyedSubscript:v12];

    if ([v8 isValidAppLaunchBundleId:v13])
    {
      if (![MEMORY[0x1E4F4AF00] isAppClipForBundleId:v13])
      {
        v16 = [MEMORY[0x1E4F1C9C8] date];
        v17 = (void *)v45[5];
        v18 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];
        v20 = (void *)v19;
        v21 = &stru_1F2740B58;
        if (v19) {
          v21 = (__CFString *)v19;
        }
        v22 = v21;

        v23 = __atxlog_handle_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_1();
        }

        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [v25 stringByAppendingString:@"-appLaunch"];

        id v27 = v26;
        [v27 UTF8String];
        v28 = (void *)os_transaction_create();
        v29 = (void *)MEMORY[0x1E4F93B18];
        uint64_t v30 = v8[1];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_94;
        v36[3] = &unk_1E68B0508;
        v36[4] = v8;
        id v31 = v13;
        id v37 = v31;
        v32 = v22;
        v38 = v32;
        id v33 = v16;
        id v39 = v33;
        id v34 = v28;
        id v40 = v34;
        [v29 runAsyncOnQueue:v30 afterDelaySeconds:v36 block:5.0];

        _Block_object_dispose(&v44, 8);
        goto LABEL_17;
      }
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v13;
        v15 = "Received an app clip bundle id: '%@' in app launch monitoring. Ignoring.";
LABEL_10:
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v13;
        v15 = "Received invalid bundle id: '%@' in app launch monitoring. Ignoring.";
        goto LABEL_10;
      }
    }

    _Block_object_dispose(&v44, 8);
LABEL_17:
  }
}

void __29___ATXAppLaunchMonitor_start__block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__45;
  v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29___ATXAppLaunchMonitor_start__block_invoke_72;
  v6[3] = &unk_1E68B0420;
  v6[4] = &v7;
  [v2 runWithLockAcquired:v6];
  if (v8[5])
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v8[5]];
    double v5 = v4;

    [*(id *)(a1 + 32) updateLaunchHistoryFromDuet:0 callback:v5];
  }
  else
  {
    [*(id *)(a1 + 32) updateLaunchHistoryFromDuet:0 callback:1209600.0];
  }
  _Block_object_dispose(&v7, 8);
}

void __29___ATXAppLaunchMonitor_start__block_invoke_72(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a2 + 56) predictionContextForCurrentContext];
  uint64_t v3 = [v7 userContext];
  uint64_t v4 = [v3 lastAppLaunchDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __29___ATXAppLaunchMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5B6A8];
  uint64_t v3 = a2;
  uint64_t v4 = [v2 userContext];
  id v5 = (id)v3[1];
  v3[1] = v4;
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [v3 dateByAddingTimeInterval:-*(double *)(a1 + 56)];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__45;
  v24 = __Block_byref_object_dispose__45;
  id v25 = 0;
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_2;
  v19[3] = &unk_1E68B0420;
  v19[4] = &v20;
  [v5 runWithLockAcquired:v19];
  id v6 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  id v7 = [v6 getAppLaunchesBetweenStartDate:v4 endDate:v3];
  v8 = [v6 getScreenTransitionsBetweenStartDate:v4 endDate:v3];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_3;
  v13[3] = &unk_1E68B0490;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = v9;
  id v18 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  [v10 runAsyncWithLockAcquired:v13];
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_4;
  v14[3] = &unk_1E68B0468;
  id v7 = v3;
  uint64_t v8 = a1[6];
  id v15 = v7;
  uint64_t v16 = v8;
  +[_ATXAppLaunchMonitor mergeAppLaunches:v5 andBacklightTransitions:v6 callingAppLaunchBlock:v14];
  uint64_t v12 = a1[8];
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v9, v10, v11);
  }

  id v13 = self;
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v19 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    if (v19 && v11)
    {
      uint64_t v16 = a1 + 32;
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v16 + 8);
      if (v13) {
        id v17 = v13;
      }
      else {
        id v17 = &stru_1F2740B58;
      }
      id v18 = [*(id *)(v14 + 56) predictionContextForCurrentContext];
      [v15 _addLaunchWithLockWitness:v14 bundleId:v19 date:v11 timeZone:v12 reason:v17 context:v18];
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) addScreenLockAtDate:v11];
  }
}

id __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_94(uint64_t a1)
{
  return self;
}

uint64_t __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObject:v4];
  uint64_t v6 = (void *)v5[1];

  uint64_t v7 = *(void *)(a1 + 32);
  return [v6 registerCallback:v7];
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Received clip launch with event: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    uint64_t v6 = [v3 webClipBundleId];
    if (v6)
    {
      uint64_t v7 = [v3 clipBundleId];
      if (v7)
      {
        uint64_t v8 = [v3 urlHash];
        if (v8)
        {
          uint64_t v9 = objc_opt_new();
          [v9 setBundleId:v7];
          [v9 setUrlHash:v8];
          -[NSObject setCaptureType:](v9, "setCaptureType:", objc_msgSend((id)objc_opt_class(), "petClipCaptureTypeFromDuetClipLaunchReason:", objc_msgSend(v3, "launchReason")));
          [WeakRetained[7] trackScalarForMessage:v9];
          uint64_t v10 = [v3 launchReason];
          id v11 = [MEMORY[0x1E4F1C9C8] now];
          [WeakRetained handleAppOrClipLaunchNotificationForBundleId:v6 poweringAppClipBundleId:v7 urlHash:v8 isClip:1 appLaunchReason:@"ATXClipLaunch" appClipLaunchReason:v10 date:v11];
        }
        else
        {
          uint64_t v9 = __atxlog_handle_hero();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_3();
          }
        }
      }
      else
      {
        uint64_t v8 = __atxlog_handle_hero();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_2();
        }
      }
    }
    else
    {
      uint64_t v7 = __atxlog_handle_hero();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_1();
      }
    }
  }
}

void __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2((uint64_t)v5, v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    unsigned int v31 = 0x80000000;
    uint64_t v10 = (void *)WeakRetained[4];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_114;
    v25[3] = &unk_1E68B04E0;
    id v27 = &v28;
    id v26 = *(id *)(a1 + 32);
    [v10 runWithLockAcquired:v25];
    if (*((_DWORD *)v29 + 6) != 0x80000000)
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = [v12 stringByAppendingString:@"-backlightChanged"];

      id v14 = v13;
      [v14 UTF8String];
      id v15 = (void *)os_transaction_create();
      uint64_t v16 = objc_opt_new();
      id v17 = (void *)MEMORY[0x1E4F93B18];
      uint64_t v18 = v9[1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_2;
      v21[3] = &unk_1E68B0580;
      v21[4] = v9;
      v24 = &v28;
      id v19 = v16;
      id v22 = v19;
      id v20 = v15;
      id v23 = v20;
      [v17 runAsyncOnQueue:v18 afterDelaySeconds:v21 block:5.0];
    }
    _Block_object_dispose(&v28, 8);
  }
}

void __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_114(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 8);
  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 intValue];
  }
}

id __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_2(uint64_t a1)
{
  return self;
}

uint64_t __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v3 addObject:v4];
  id v6 = (void *)v5[1];

  uint64_t v7 = *(void *)(a1 + 32);
  return [v6 registerCallback:v7];
}

void __72___ATXAppLaunchMonitor_processDonationsForPreviousAppSessionEndIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a2[4];
  id v5 = a2;
  uint64_t v6 = [v4 lastAppLaunchDate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = (void *)a2[4];
  uint64_t v10 = [v9 lastAppLaunch];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v17 = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Donation processing - Processing donations for %@, launched on: %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-5.0];
    [*(id *)(a1 + 32) updateActionPredictionPipelineForAppSession:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDate:v16];
  }
}

id __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke(uint64_t a1, uint64_t a2)
{
  return self;
}

void __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_122(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__45;
  uint64_t v20 = __Block_byref_object_dispose__45;
  id v21 = 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_2;
  v15[3] = &unk_1E68B0420;
  v15[4] = &v16;
  [v3 runWithLockAcquired:v15];
  [*(id *)(a1 + 32) logAppLaunchForBundleId:*(void *)(a1 + 40) launchReason:*(void *)(a1 + 48)];
  LOBYTE(v7) = 15;
  +[_ATXAppLaunchMonitor _logPredictionForBundleId:*(void *)(a1 + 40) poweringAppClipBundleId:*(void *)(a1 + 56) urlHash:*(void *)(a1 + 64) isClip:*(unsigned __int8 *)(a1 + 92) appLaunchReason:*(void *)(a1 + 48) appClipLaunchReason:*(unsigned int *)(a1 + 88) consumerType:7 consumerSubType:v7 context:v17[5]];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_3;
  v8[3] = &unk_1E68B05F8;
  id v9 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 48);
  uint64_t v14 = &v16;
  id v13 = *(id *)(a1 + 80);
  [v4 runAsyncWithLockAcquired:v8];

  _Block_object_dispose(&v16, 8);
}

uint64_t __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 56) updateContextStreamAndReturnPredictionContextForCurrentContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[3];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a2;
  [v3 addLaunchForBundleId:v4 date:v5 completion:0];
  [*(id *)(a1 + 48) _addLaunchWithLockWitness:v6 bundleId:*(void *)(a1 + 32) date:*(void *)(a1 + 40) timeZone:0 reason:*(void *)(a1 + 56) context:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  if (([*(id *)(*(void *)(a1 + 48) + 72) containsObject:*(void *)(a1 + 32)] & 1) == 0) {
    ATXUpdatePredictionsDefaultInterval(1);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_4;
  block[3] = &unk_1E68AB818;
  id v9 = *(id *)(a1 + 64);
  dispatch_async(v7, block);
}

id __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_4()
{
  return self;
}

void __72___ATXAppLaunchMonitor_handleBacklightChangeNotificationWithValue_date___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v6 = v3;
  if (v4 == 1)
  {
    [v3[4] addScreenLockAtDate:*(void *)(a1 + 32)];
  }
  else if (!v4)
  {
    [v3[3] stopAppUsageAtDate:*(void *)(a1 + 32)];
  }
  id v5 = self;
}

void __36___ATXAppLaunchMonitor_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)a2[4];
  uint64_t v3 = a2;
  [v2 clearAppLaunchInfo];
  int v4 = [v3[5] histogramForLaunchType:0];
  [v4 resetData];

  id v5 = [v3[5] histogramForLaunchType:1];
  [v5 resetData];

  uint64_t v6 = [v3[5] histogramForLaunchType:92];
  [v6 resetData];

  uint64_t v7 = [v3[5] histogramForLaunchType:93];
  [v7 resetData];

  uint64_t v8 = [v3[5] histogramForLaunchType:11];
  [v8 resetData];

  id v9 = [v3[5] histogramForLaunchType:2];
  [v9 resetData];

  id v10 = [v3[5] histogramForLaunchType:3];
  [v10 resetData];

  id v11 = v3[5];
  id v12 = [v11 histogramForLaunchType:5];
  [v12 resetData];

  +[_ATXAppLaunchHistogramManager resetDataForCategoricalHistograms];
  id v13 = +[ATXHistogramBundleIdTable sharedInstance];
  [v13 clear];
}

void __51___ATXAppLaunchMonitor_clearIntentHistogramHistory__block_invoke(uint64_t a1, id *a2)
{
  id v3 = a2[5];
  int v4 = a2;
  id v5 = [v3 histogramForLaunchType:14];
  [v5 resetData];

  uint64_t v6 = [a2[5] histogramForLaunchType:17];
  [v6 resetData];

  uint64_t v7 = [a2[5] histogramForLaunchType:23];
  [v7 resetData];

  uint64_t v8 = [a2[5] histogramForLaunchType:26];
  [v8 resetData];

  id v9 = [a2[5] histogramForLaunchType:20];
  [v9 resetData];

  id v10 = [a2[5] categoricalHistogramForLaunchType:29];
  [v10 resetData];

  id v11 = [a2[5] categoricalHistogramForLaunchType:40];
  [v11 resetData];

  id v12 = [a2[5] histogramForLaunchType:16];
  [v12 resetData];

  id v13 = [a2[5] histogramForLaunchType:19];
  [v13 resetData];

  uint64_t v14 = [a2[5] histogramForLaunchType:25];
  [v14 resetData];

  uint64_t v15 = [a2[5] histogramForLaunchType:28];
  [v15 resetData];

  uint64_t v16 = [a2[5] histogramForLaunchType:22];
  [v16 resetData];

  int v17 = [a2[5] categoricalHistogramForLaunchType:31];
  [v17 resetData];

  id v18 = a2[5];
  __int16 v19 = [v18 categoricalHistogramForLaunchType:39];
  [v19 resetData];

  id v24 = +[_ATXAppInfoManager sharedInstance];
  uint64_t v20 = +[_ATXAppLaunchSequenceManager sharedInstance];
  id v21 = [v24 allApps];
  [v20 deleteAllLaunchesForBundles:v21];

  id v22 = +[ATXHistogramBundleIdTable sharedInstance];
  [v22 clear];

  id v23 = +[_ATXAppPredictor sharedInstance];
  [v23 iterZeroDayAppIntentKeysWithBlock:&__block_literal_global_155];
}

void __51___ATXAppLaunchMonitor_clearIntentHistogramHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[ATXHistogramBundleIdTable sharedInstance];
  [v3 intern:v2];
}

void __67___ATXAppLaunchMonitor_addLaunchWithBundleId_date_timeZone_reason___block_invoke(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = (void *)a2[7];
  uint64_t v8 = a2;
  id v9 = [v7 predictionContextForCurrentContext];
  [v2 _addLaunchWithLockWitness:v8 bundleId:v3 date:v4 timeZone:v5 reason:v6 context:v9];
}

void __28___ATXAppLaunchMonitor_stop__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2[2];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2[1], "deregisterCallback:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = v2[1];
  v2[1] = 0;
}

void __43___ATXAppLaunchMonitor_startDeltaRecording__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)v2[1];
  v2[1] = v3;
}

void __42___ATXAppLaunchMonitor_stopDeltaRecording__block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2[1]);
  id v4 = a2;
  id v3 = a2[1];
  a2[1] = 0;
}

void __38___ATXAppLaunchMonitor_appInfoManager__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __49___ATXAppLaunchMonitor_appLaunchHistogramManager__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __48___ATXAppLaunchMonitor_appLaunchSequenceManager__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __39___ATXAppLaunchMonitor_swapDuetHelper___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __33___ATXAppLaunchMonitor_dailyDose__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "Donation Processing - App change notification bundleId: '%@', launch reason: '%@'");
}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Identifier called: %@", (uint8_t *)&v2, 0xCu);
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Web clip bundleId is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Powering clip bundleId is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "URL Hash is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
}

@end