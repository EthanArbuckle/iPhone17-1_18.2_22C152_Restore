@interface MPCAssetLoader
- (BOOL)_configureItem:(id)a3 playerItem:(id)a4 error:(id *)a5;
- (MPCAssetLoader)initWithDelegate:(id)a3;
- (MPCAssetLoaderDelegate)delegate;
- (MPCPlayerItemConfigurator)configurator;
- (double)unloadingPlaybackAssetsOnIdleDuration;
- (void)loadAssetFor:(id)a3 task:(id)a4 completion:(id)a5;
- (void)loadAssetValuesFor:(id)a3 keys:(id)a4 completion:(id)a5;
- (void)setConfigurator:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MPCAssetLoader

- (void)setConfigurator:(id)a3
{
}

- (MPCAssetLoader)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCAssetLoader;
  v5 = [(MPCAssetLoader *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurator, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (MPCPlayerItemConfigurator)configurator
{
  return self->_configurator;
}

- (void)setDelegate:(id)a3
{
}

- (MPCAssetLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCAssetLoaderDelegate *)WeakRetained;
}

- (BOOL)_configureItem:(id)a3 playerItem:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v8);

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ConfigureItem", "", buf, 2u);
  }

  v14 = [(MPCAssetLoader *)self configurator];
  id v24 = 0;
  [v14 configureQueueItem:v8 playerItem:v9 error:&v24];

  id v15 = v24;
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    id v18 = [v8 analyticsContentType];
    uint64_t v19 = [v18 UTF8String];
    id v20 = [v8 analyticsFormatType];
    uint64_t v21 = [v20 UTF8String];
    int v22 = [v8 isStartItem];
    *(_DWORD *)buf = 136446722;
    uint64_t v26 = v19;
    __int16 v27 = 2082;
    uint64_t v28 = v21;
    __int16 v29 = 1026;
    int v30 = v22;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v17, OS_SIGNPOST_INTERVAL_END, v11, "ConfigureItem", " enableTelemetry=YES contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 0x1Cu);
  }
  if (a5 && v15) {
    *a5 = v15;
  }

  return v15 == 0;
}

- (double)unloadingPlaybackAssetsOnIdleDuration
{
  v2 = [MEMORY[0x263F12178] standardUserDefaults];
  [v2 unloadingPlaybackAssetsOnIdleDuration];
  double v4 = v3;

  return v4;
}

- (void)loadAssetValuesFor:(id)a3 keys:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isAssetLoaded])
  {
    v10 = [v7 asset];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__MPCAssetLoader_loadAssetValuesFor_keys_completion___block_invoke;
    v11[3] = &unk_2643C54B8;
    id v12 = v9;
    [v10 loadValuesAsynchronouslyForKeys:v8 completionHandler:v11];
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 0, @"Asset is not loaded or was recently released due to MediaServices interruption");
    (*((void (**)(id, void *))v9 + 2))(v9, v10);
  }
}

uint64_t __53__MPCAssetLoader_loadAssetValuesFor_keys_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadAssetFor:(id)a3 task:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(MPCAssetLoader *)self configurator];

  if (!v12)
  {
    int v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MPCAssetLoader.m" lineNumber:67 description:@"MPCAssetLoader must have a configurator set to work properly"];
  }
  if (([v9 hasLoadableAsset] & 1) == 0)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MPCAssetLoader.m", 68, @"Attempting to load an item which has no loadable asset: %@", v9 object file lineNumber description];
  }
  id v13 = v9;
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  v35 = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke;
  v36 = &unk_2643C5EE8;
  v37 = self;
  id v38 = v13;
  msv_dispatch_on_main_queue();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_2;
  aBlock[3] = &unk_2643C0548;
  id v14 = v11;
  id v32 = v14;
  id v15 = v38;
  id v30 = v15;
  uint64_t v31 = self;
  v16 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if ([v10 isCancelled])
  {
    v17 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 28, @"MPCAssetLoadingOperation - Asset loading cancelled - Item:%@", v15);
    v16[2](v16, 0, v17);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      configurator = self->_configurator;
      id v19 = v15;
      id v20 = [(MPCPlayerItemConfigurator *)configurator audioAssetTypeSelector];
      [v19 setAudioAssetTypeSelector:v20];
    }
    uint64_t v21 = +[MPCMFAssetLoadingTask wrap:v10];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_4;
    v24[3] = &unk_2643C0570;
    id v25 = v10;
    uint64_t v28 = v16;
    id v26 = v15;
    __int16 v27 = self;
    [v26 _loadAssetAndPlayerItemWithTask:v21 completion:v24];

    v17 = v25;
  }
}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLoadingDidStartForItem:*(void *)(a1 + 40)];
}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_2(int8x16_t *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(a1[3].i64[0] + 16))();
  int8x16_t v7 = a1[2];
  id v5 = (id)v7.i64[0];
  id v6 = v4;
  msv_dispatch_on_main_queue();
}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 28, @"MPCAssetLoadingOperation - Asset loading cancelled - Item:%@", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  else if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    id v15 = 0;
    [v9 _configureItem:v10 playerItem:v5 error:&v15];
    id v11 = v15;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!v6)
    {
      id v12 = [*(id *)(a1 + 40) itemError];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 24, @"MPCAssetLoadingOperation - Asset loading failed [No AVPlayerItem] - Item:%@", *(void *)(a1 + 40));
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v6 = v14;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLoadingDidCompleteForItem:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

@end