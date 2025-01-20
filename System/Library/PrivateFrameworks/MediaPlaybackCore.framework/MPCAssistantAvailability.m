@interface MPCAssistantAvailability
- (int64_t)assistantStreamingGetAvailability;
- (int64_t)assistantStreamingGetAvailability:(id)a3;
- (void)assistantRadioGetAvailability:(id)a3;
- (void)assistantRadioGetAvailability:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantAvailability

- (void)assistantRadioGetAvailability:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int64_t v20 = 0;
  int64_t v20 = [(MPCAssistantAvailability *)self assistantStreamingGetAvailability:*(unsigned int *)&a3];
  if (v18[3] == 4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F62B58]);
    if ([v7 hasLoadedRadioAvailability])
    {
      int v8 = [v7 isRadioAvailable];
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v8;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "Using cached availability: %{BOOL}u", buf, 8u);
      }

      uint64_t v10 = 4;
      if (!v8) {
        uint64_t v10 = 0;
      }
      v18[3] = v10;
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = v18[3] - 1;
        if (v12 > 3) {
          v13 = @"MPCAssistantStreamingAvailabilityNone";
        }
        else {
          v13 = off_2643C05B8[v12];
        }
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "Radio availability: %{public}@", buf, 0xCu);
      }

      v6[2](v6, v18[3]);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __69__MPCAssistantAvailability_assistantRadioGetAvailability_completion___block_invoke;
      v14[3] = &unk_2643C0598;
      v16 = &v17;
      v15 = v6;
      [v7 getRadioAvailabilityWithCompletionHandler:v14];
    }
  }
  else
  {
    ((void (*)(void (**)(id, void)))v6[2])(v6);
  }
  _Block_object_dispose(&v17, 8);
}

void __69__MPCAssistantAvailability_assistantRadioGetAvailability_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "Error fetching radio availability: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109120;
    LODWORD(v13) = a2;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "Using fetched availability: %{BOOL}u", (uint8_t *)&v12, 8u);
  }

  uint64_t v8 = 4;
  if (!a2) {
    uint64_t v8 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - 1;
    if (v10 > 3) {
      v11 = @"MPCAssistantStreamingAvailabilityNone";
    }
    else {
      v11 = off_2643C05B8[v10];
    }
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "Radio availability: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)assistantRadioGetAvailability:(id)a3
{
}

- (int64_t)assistantStreamingGetAvailability:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "Device supports streaming", (uint8_t *)&v20, 2u);
  }

  v4 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v5 = [v4 networkType];

  int IsWiFi = ICEnvironmentNetworkTypeIsWiFi();
  int IsWired = ICEnvironmentNetworkTypeIsWired();
  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  v9 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v10 = [v9 preferredMusicLowBandwidthResolution];

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    *(void *)v21 = v5;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "Network type: %ld", (uint8_t *)&v20, 0xCu);
  }

  int v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109888;
    *(_DWORD *)v21 = IsWiFi;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = IsWired;
    __int16 v22 = 1024;
    int v23 = IsCellular;
    __int16 v24 = 1024;
    BOOL v25 = v10 > 0;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "Wifi: %{BOOL}u Wired: %{BOOL}u Cellular: %{BOOL}u Allowed: %{BOOL}u", (uint8_t *)&v20, 0x1Au);
  }
  BOOL v13 = v10 > 0;

  if (IsWired | IsWiFi | IsCellular ^ 1) {
    int v14 = IsWired | IsWiFi;
  }
  else {
    int v14 = v13;
  }
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109120;
    *(_DWORD *)v21 = v14;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "Network streaming available: %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "Network connection is available", (uint8_t *)&v20, 2u);
    }
    int64_t v18 = 4;
  }
  else
  {
    if (v17)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "No network connection available", (uint8_t *)&v20, 2u);
    }
    int64_t v18 = 1;
  }

  return v18;
}

- (int64_t)assistantStreamingGetAvailability
{
  return [(MPCAssistantAvailability *)self assistantStreamingGetAvailability:0];
}

@end