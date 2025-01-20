@interface MPCQueueControllerBehaviorMusicDataSourceState
@end

@implementation MPCQueueControllerBehaviorMusicDataSourceState

uint64_t __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePlaybackContext];
}

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v39[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  v9 = [*(id *)(a1 + 32) _rtcSourceServiceName];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 88));
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 64);
    v38[0] = @"queue-section-id";
    v38[1] = @"queue-load-error";
    v39[0] = v12;
    v39[1] = v8;
    v38[2] = @"queue-rtc-service-id";
    v13 = v9;
    if (!v9)
    {
      v13 = [MEMORY[0x263EFF9D0] null];
    }
    v39[2] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    [WeakRetained emitEventType:@"queue-load-end" payload:v14];

    if (!v9) {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    }
    uint64_t v15 = *(void *)(a1 + 32);
    unint64_t v16 = *(void *)(v15 + 56);
    *(void *)(v15 + 56) = 4;
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 24);
    *(void *)(v17 + 24) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 64);
      if (v16 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v16);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_2643C1A90[v16];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v20;
      __int16 v34 = 2114;
      v35 = v21;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [failed reloadSection] oldState=%{public}@ newState=Error", buf, 0x16u);
    }
    v25 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void *)(v26 + 64);
      v28 = *(__CFString **)(v26 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      v35 = v28;
      __int16 v36 = 2114;
      id v37 = v8;
      _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | load playback context failed [dataSource %p] error=%{public}@ ", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(v10 + 72), a2);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    v24 = *(void **)(v22 + 32);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_65;
    v29[3] = &unk_2643C59E0;
    v29[4] = v22;
    id v30 = v9;
    id v31 = *(id *)(a1 + 48);
    [v24 reloadSection:v23 completion:v29];
  }
}

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_2;
  v5[3] = &unk_2643C1A70;
  v5[4] = v2;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v4 loadPlaybackContext:v3 completion:v5];
}

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_65(void *a1, void *a2)
{
  v34[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 88));
  v34[0] = *(void *)(a1[4] + 64);
  v33[0] = @"queue-section-id";
  v33[1] = @"queue-load-error";
  v5 = v3;
  if (!v3)
  {
    v5 = [MEMORY[0x263EFF9D0] null];
  }
  v34[1] = v5;
  v33[2] = @"queue-rtc-service-id";
  id v6 = (void *)a1[5];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v34[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  [WeakRetained emitEventType:@"queue-load-end" payload:v8];

  if (v6)
  {
    if (v3)
    {
LABEL_7:

      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = a1[4];
        uint64_t v11 = *(void *)(v10 + 64);
        uint64_t v12 = *(__CFString **)(v10 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v11;
        __int16 v29 = 2048;
        id v30 = v12;
        __int16 v31 = 2114;
        v32 = v3;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[DASOS:%{public}@] reloadSection:… | reload section failed [dataSource %p] error=%{public}@ ", buf, 0x20u);
      }
      uint64_t v13 = 4;
      goto LABEL_14;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = a1[4];
    uint64_t v15 = *(void *)(v14 + 64);
    unint64_t v16 = *(__CFString **)(v14 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v15;
    __int16 v29 = 2048;
    id v30 = v16;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | reload section succeeded [dataSource %p]", buf, 0x16u);
  }
  uint64_t v13 = 3;
LABEL_14:

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_66;
  block[3] = &unk_2643C5FC8;
  block[4] = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v17 = a1[4];
  unint64_t v18 = *(void *)(v17 + 56);
  *(void *)(v17 + 56) = v13;
  uint64_t v19 = a1[4];
  uint64_t v20 = *(void **)(v19 + 24);
  *(void *)(v19 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1[4] + 64);
    if (v18 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v18);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = off_2643C1A90[v18];
    }
    v24 = v23;
    if (v13 == 3) {
      v25 = @"Ready";
    }
    else {
      v25 = @"Error";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v22;
    __int16 v29 = 2114;
    id v30 = v24;
    __int16 v31 = 2114;
    v32 = v25;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [finished reloadSection] oldState=%{public}@ newState=%{public}@", buf, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __99___MPCQueueControllerBehaviorMusicDataSourceState_loadAdditionalItemsIfNeededWithCount_completion___block_invoke(uint64_t a1, void *a2)
{
  v32[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  v4 = [*(id *)(a1 + 32) _rtcSourceServiceName];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  v32[0] = *(void *)(*(void *)(a1 + 32) + 64);
  v31[0] = @"queue-section-id";
  v31[1] = @"queue-load-error";
  id v6 = v3;
  if (!v3)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v32[1] = v6;
  v31[2] = @"queue-rtc-service-id";
  id v7 = v4;
  if (!v4)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v32[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  [WeakRetained emitEventType:@"queue-load-end" payload:v8];

  if (v4)
  {
    if (v3)
    {
LABEL_7:

      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 64);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v10;
        __int16 v25 = 2048;
        uint64_t v26 = v11;
        __int16 v27 = 2114;
        uint64_t v28 = v3;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading completed [error] error=%{public}@", buf, 0x20u);
      }
      uint64_t v12 = 4;
      goto LABEL_14;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 64);
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading completed [success]", buf, 0x16u);
  }
  uint64_t v12 = 3;
LABEL_14:

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v15 = *(void *)(a1 + 32);
  unint64_t v16 = *(void *)(v15 + 56);
  *(void *)(v15 + 56) = v12;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 64);
    uint64_t v19 = *(void *)(a1 + 48);
    if (v16 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v16);
      uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v20 = off_2643C1A90[v16];
    }
    v21 = v20;
    if (v12 == 3) {
      uint64_t v22 = @"Ready";
    }
    else {
      uint64_t v22 = @"Error";
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v18;
    __int16 v25 = 2048;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = v21;
    __int16 v29 = 2114;
    id v30 = v22;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | changing state [finished loading additional] oldState=%{public}@ newState=%{public}@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __67___MPCQueueControllerBehaviorMusicDataSourceState_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 copy];

  return v2;
}

@end