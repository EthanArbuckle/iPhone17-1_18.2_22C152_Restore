@interface HDCloudSyncTapToRadar
+ (BOOL)isTapToRadarAllowed;
+ (void)openTapToRadarWithTitle:(id)a3 description:(id)a4;
+ (void)showTapToRadarRequestWithTitle:(id)a3 message:(id)a4 proceed:(id)a5 disable:(id)a6 completion:(id)a7;
@end

@implementation HDCloudSyncTapToRadar

+ (BOOL)isTapToRadarAllowed
{
  int v2 = [MEMORY[0x1E4F2B860] isAppleInternalInstall];
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x1E4F2B860] isTestingDevice] ^ 1;
  }
  return v2;
}

+ (void)showTapToRadarRequestWithTitle:(id)a3 message:(id)a4 proceed:(id)a5 disable:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([a1 isTapToRadarAllowed])
  {
    if (showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting == 1)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_2;
      v26 = &unk_1E62F2F20;
      id v27 = v16;
      HKDispatchAsyncOnGlobalConcurrentQueue();
      id v17 = v27;
    }
    else
    {
      showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting = 1;
      id v17 = objc_alloc_init(MEMORY[0x1E4F65D98]);
      [v17 setTitle:v12];
      [v17 setMessage:v13];
      [v17 setDefaultButton:@"Tap-to-Radar"];
      [v17 setCancelButton:@"Not Now"];
      [v17 setOtherButton:@"Do not ask again"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_3;
      v18[3] = &unk_1E6308C08;
      id v22 = a1;
      id v19 = v14;
      id v20 = v15;
      id v21 = v16;
      [v17 presentWithResponseHandler:v18];
    }
  }
  else
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke;
    v31 = &unk_1E62F2F20;
    id v32 = v16;
    HKDispatchAsyncOnGlobalConcurrentQueue();
    id v17 = v32;
  }
}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 110, @"Tap to radar is not available on this device.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Tap to radar is already presented.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_3(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting = 0;
  switch(a3)
  {
    case 2:
      _HKInitializeLogging();
      id v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = a1[7];
        int v16 = 138543362;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Do not ask again' button pressed", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v11 = a1[5];
      goto LABEL_10;
    case 1:
      _HKInitializeLogging();
      id v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = a1[7];
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Not Now' button pressed", (uint8_t *)&v16, 0xCu);
      }
      break;
    case 0:
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[7];
        int v16 = 138543362;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Tap-to-Radar' button pressed", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v11 = a1[4];
LABEL_10:
      (*(void (**)(void))(v11 + 16))();
      break;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

+ (void)openTapToRadarWithTitle:(id)a3 description:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([a1 isTapToRadarAllowed])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", v9, v6, 6, 6, 0, 2, 0);
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 openURL:v7 configuration:0 completionHandler:&__block_literal_global_195];
  }
}

void __61__HDCloudSyncTapToRadar_openTapToRadarWithTitle_description___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

@end