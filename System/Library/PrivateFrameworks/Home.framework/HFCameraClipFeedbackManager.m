@interface HFCameraClipFeedbackManager
+ (void)donateAllCameraClipsForCameraProfile:(id)a3 completion:(id)a4;
+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5;
+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 processName:(id)a5 completion:(id)a6;
+ (void)donateNotificationCenterCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5;
@end

@implementation HFCameraClipFeedbackManager

+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5
{
  v8 = (void *)MEMORY[0x263F08AB0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 processInfo];
  id v13 = [v12 processName];

  [a1 donateCameraClip:v11 forCameraProfile:v10 processName:v13 completion:v9];
}

+ (void)donateNotificationCenterCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5
{
}

+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 processName:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 uniqueIdentifier];
  id v13 = (void *)[v12 copy];

  v14 = [MEMORY[0x263EFFA08] setWithObject:v13];
  v15 = dispatch_get_global_queue(-32768, 0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke;
  v20[3] = &unk_264090938;
  id v21 = v9;
  id v22 = v14;
  id v23 = v10;
  id v24 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v14;
  id v19 = v9;
  dispatch_async(v15, v20);
}

void __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clipManager];
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_2;
  v4[3] = &unk_264090910;
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 donateClipsWithUUIDs:v5 completion:v4];
}

void __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFCameraAnalyticsEventHandler sendDonationEventWithCameraClipCount:processName:error:](HFCameraAnalyticsEventHandler, "sendDonationEventWithCameraClipCount:processName:error:", [*(id *)(a1 + 32) count], *(void *)(a1 + 40), v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_3;
  v7[3] = &unk_26408DF88;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)donateAllCameraClipsForCameraProfile:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(-32768, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke;
  v10[3] = &unk_26408D5B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F08798]);
  id v3 = [MEMORY[0x263EFF910] distantPast];
  id v4 = [MEMORY[0x263EFF910] distantFuture];
  id v5 = (void *)[v2 initWithStartDate:v3 endDate:v4];

  id v6 = [*(id *)(a1 + 32) clipManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2;
  v7[3] = &unk_2640909B0;
  id v9 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v6 fetchClipsWithDateInterval:v5 quality:0 limit:500 shouldOrderAscending:1 completion:v7];
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory(0x14uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v6;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Unable to donate all clips because there was a problem fetching all clips:%@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_7;
    block[3] = &unk_26408DF88;
    id v22 = *(id *)(a1 + 40);
    id v21 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v8 = v22;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_9;
    v18[3] = &unk_264090960;
    id v10 = v9;
    id v19 = v10;
    [v5 enumerateObjectsUsingBlock:v18];
    id v11 = HFLogForCategory(0x14uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Donating all clips:%lu for profile:%@", buf, 0x16u);
    }

    v14 = [*(id *)(a1 + 32) clipManager];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_11;
    v15[3] = &unk_264090988;
    id v16 = v10;
    id v17 = *(id *)(a1 + 40);
    id v8 = v10;
    [v14 donateClipsWithUUIDs:v8 completion:v15];
  }
}

uint64_t __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_9(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isDonated] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 uniqueIdentifier];
    [v3 addObject:v4];
  }
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  id v5 = [v4 processName];

  id v6 = +[HFCameraAnalyticsEventHandler sendDonationEventWithCameraClipCount:processName:error:](HFCameraAnalyticsEventHandler, "sendDonationEventWithCameraClipCount:processName:error:", [*(id *)(a1 + 32) count], v5, v3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_12;
  v9[3] = &unk_26408DF88;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end