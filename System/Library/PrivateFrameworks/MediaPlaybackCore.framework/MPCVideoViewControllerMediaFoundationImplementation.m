@interface MPCVideoViewControllerMediaFoundationImplementation
@end

@implementation MPCVideoViewControllerMediaFoundationImplementation

uint64_t __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v1 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v4, &location);
  uint64_t v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

void __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_3(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = [WeakRetained _stateDictionary];
    int v28 = 138412290;
    v29 = v3;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "com.apple.mediaplaybackcore.videodebug: %@", (uint8_t *)&v28, 0xCu);
  }
  id v4 = [WeakRetained internalController];
  v5 = [v4 view];
  v6 = [v5 layer];
  [v6 borderWidth];
  double v8 = v7;

  if (v8 <= 0.0)
  {
    v18 = [MEMORY[0x263F825C8] systemPinkColor];
    v19 = [WeakRetained view];
    [v19 setBackgroundColor:v18];

    id v20 = [MEMORY[0x263F825C8] redColor];
    uint64_t v21 = [v20 CGColor];
    v22 = [WeakRetained internalController];
    v23 = [v22 view];
    v24 = [v23 layer];
    [v24 setBorderColor:v21];

    v25 = [WeakRetained internalController];
    v26 = [v25 view];
    v27 = [v26 layer];
    [v27 setBorderWidth:2.0];

    v14 = [WeakRetained internalController];
    v15 = [v14 view];
    v16 = v15;
    double v17 = 0.85;
  }
  else
  {
    v9 = [MEMORY[0x263F825C8] clearColor];
    v10 = [WeakRetained view];
    [v10 setBackgroundColor:v9];

    v11 = [WeakRetained internalController];
    v12 = [v11 view];
    v13 = [v12 layer];
    [v13 setBorderWidth:0.0];

    v14 = [WeakRetained internalController];
    v15 = [v14 view];
    v16 = v15;
    double v17 = 1.0;
  }
  [v15 setAlpha:v17];
}

uint64_t __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v8 = WeakRetained;
    if (WeakRetained)
    {
      v9 = [WeakRetained _stateDictionary];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end