@interface MPCAssistantGetVolume
- (void)getVolumeLevelForUID:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantGetVolume

- (void)getVolumeLevelForUID:(id)a3 completion:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v11[0] = a3;
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  [v6 arrayWithObjects:v11 count:1];
  v8 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
  v10 = v5;
  id v9 = v5;
  MRAVReconnaissanceSessionBeginSearch();
  CFRelease(v8);
}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with error: %{public}@", buf, 0xCu);
    }

    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
  else
  {
    id v9 = [a2 firstObject];

    v10 = objc_alloc_init(MPCAssistantConnection);
    CFRetain(*(CFTypeRef *)(a1 + 40));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_2;
    v14[3] = &unk_2643C5D30;
    uint64_t v17 = a3;
    v18 = v9;
    v15 = v10;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v16 = v11;
    uint64_t v19 = v12;
    v13 = v10;
    [(MPCAssistantConnection *)v13 connectToEndpoint:a3 completion:v14];
  }
}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  MRAVEndpointGetOutputDeviceVolume();
}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = *(id *)(a1 + 32);
  id v7 = a2;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v12 = 138543362;
      double v13 = *(double *)&v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with error: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v10.n128_u64[0] = 0;
    (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(v10);
  }
  else
  {
    if (v9)
    {
      int v12 = 134217984;
      double v13 = a3;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with volume: %f", (uint8_t *)&v12, 0xCu);
    }

    v11.n128_f32[0] = a3;
    (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(v11);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end