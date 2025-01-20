@interface ABDeviceSceneResourceLoader
+ (id)sharedLoader;
- (ABDeviceSceneResourceLoader)init;
- (ABDeviceSceneResourceLoadingCancellable)loadResourcesWithCompletion:(uint64_t)a1;
- (BOOL)_loadResources;
- (BOOL)areResourcesLoaded;
- (BOOL)shouldAbortLoading;
- (double)sceneModel;
- (uint64_t)sceneView;
- (void)_didCancelWithToken:(id)a3 completion:(id)a4;
- (void)_didCompleteWithSuccess:(BOOL)a3;
- (void)_doCleanup;
- (void)releaseResources;
- (void)setShouldAbortLoading:(BOOL)a3;
@end

@implementation ABDeviceSceneResourceLoader

uint64_t __45__ABDeviceSceneResourceLoader__loadResources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = [WeakRetained shouldAbortLoading];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (BOOL)shouldAbortLoading
{
  return self->_shouldAbortLoading;
}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didCompleteWithSuccess:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didCompleteWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = ABLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"failure";
    if (v3) {
      v6 = @"success";
    }
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_24741F000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) finished loading scene resources: (%{public}@)", buf, 0x16u);
  }

  int64_t v7 = 2;
  if (!v3) {
    int64_t v7 = 3;
  }
  self->_state = v7;
  [(ABDeviceSceneResourceLoader *)self setShouldAbortLoading:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = (void *)[(NSMutableOrderedSet *)self->_completions copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        (*(void (**)(uint64_t, BOOL))(v13 + 16))(v13, v3);
        completions = self->_completions;
        v15 = (void *)MEMORY[0x24C555A80](v13);
        [(NSMutableOrderedSet *)completions removeObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)setShouldAbortLoading:(BOOL)a3
{
  self->_shouldAbortLoading = a3;
}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_18(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained _loadResources];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_2;
  v4[3] = &unk_265212EF8;
  objc_copyWeak(&v5, v1);
  char v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
}

- (ABDeviceSceneResourceLoadingCancellable)loadResourcesWithCompletion:(uint64_t)a1
{
  v36[2] = *(id *)MEMORY[0x263EF8340];
  char v3 = a2;
  if (!a1)
  {
LABEL_10:
    int64_t v7 = 0;
    goto LABEL_20;
  }
  v4 = ABLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = *(void *)(a1 + 24) - 1;
    if (v5 > 2) {
      char v6 = @"Empty";
    }
    else {
      char v6 = off_265212F90[v5];
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_24741F000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested scene resources, current state is (%{public}@)", buf, 0x16u);
  }

  if (*(void *)(a1 + 24) == 2)
  {
    if (v3) {
      v3[2](v3, 1);
    }
    goto LABEL_10;
  }
  v8 = (void *)[v3 copy];

  objc_initWeak(&location, (id)a1);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3042000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36[0] = 0;
  uint64_t v9 = [ABDeviceSceneResourceLoadingCancellable alloc];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke;
  v26[3] = &unk_265212ED0;
  objc_copyWeak(&v29, &location);
  v28 = buf;
  char v3 = v8;
  v27 = v3;
  int64_t v7 = [(ABDeviceSceneResourceLoadingCancellable *)v9 initWithCancelBlock:v26];
  objc_storeWeak((id *)(*(void *)&buf[8] + 40), v7);
  if (v3)
  {
    uint64_t v10 = *(void **)(a1 + 8);
    uint64_t v11 = (void *)MEMORY[0x24C555A80](v3);
    [v10 addObject:v11];
  }
  if (*(void *)(a1 + 24) != 1)
  {
    v12 = ABLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v31 = 138543362;
      uint64_t v32 = a1;
      _os_log_impl(&dword_24741F000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) begin loading scene resources", v31, 0xCu);
    }

    *(void *)(a1 + 24) = 1;
    if (!*(void *)(a1 + 32))
    {
      uint64_t v13 = dispatch_get_global_queue(21, 0);
      dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.device-scene-loader", 0, v13);
      v15 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v14;
    }
    id v16 = objc_alloc(MEMORY[0x263F16B10]);
    long long v17 = [MEMORY[0x263F1C920] mainScreen];
    [v17 bounds];
    uint64_t v18 = objc_msgSend(v16, "initWithFrame:");
    long long v19 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v18;

    [*(id *)(a1 + 48) setAntialiasingMode:2];
    [*(id *)(a1 + 48) setJitteringEnabled:1];
    v20 = [MEMORY[0x263F1C550] blackColor];
    [*(id *)(a1 + 48) setBackgroundColor:v20];

    v21 = [*(id *)(a1 + 48) layer];
    [v21 setAllowsDisplayCompositing:0];

    v22 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_18;
    block[3] = &unk_265212F20;
    objc_copyWeak(&v25, &location);
    dispatch_async(v22, block);
    objc_destroyWeak(&v25);
  }

  objc_destroyWeak(&v29);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
LABEL_20:

  return v7;
}

- (BOOL)_loadResources
{
  char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  ABLoadDeviceSceneModel(v3, (uint64_t)location);
  __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((uint64_t)&self->_sceneModel, (uint64_t *)location);
  v4 = objc_msgSend(MEMORY[0x263F1C550], "redColor", __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)v10, (uint64_t)&self->_sceneModel.buttonModel).n128_f64[0]);
  ABDeviceSceneButtonModelSetColor(v10, v4, 0.1);

  [(SCNView *)self->_sceneView setScene:self->_sceneModel.scene];
  objc_initWeak(location, self);
  sceneView = self->_sceneView;
  char v6 = [(SCNView *)sceneView scene];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__ABDeviceSceneResourceLoader__loadResources__block_invoke;
  v8[3] = &unk_265212F70;
  objc_copyWeak(&v9, location);
  LOBYTE(sceneView) = [(SCNView *)sceneView prepareObject:v6 shouldAbortBlock:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(location);
  return (char)sceneView;
}

+ (id)sharedLoader
{
  self;
  if (sharedLoader_onceToken != -1) {
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global);
  }
  v0 = (void *)sharedLoader_loader;

  return v0;
}

uint64_t __43__ABDeviceSceneResourceLoader_sharedLoader__block_invoke()
{
  sharedLoader_loader = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (ABDeviceSceneResourceLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABDeviceSceneResourceLoader;
  v2 = [(ABDeviceSceneResourceLoader *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    completions = v2->_completions;
    v2->_completions = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    cancellables = v2->_cancellables;
    v2->_cancellables = (NSHashTable *)v5;
  }
  return v2;
}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [WeakRetained _didCancelWithToken:v2 completion:*(void *)(a1 + 32)];
}

- (void)releaseResources
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = ABLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [NSNumber numberWithInteger:a1[3]];
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = a1;
      __int16 v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_24741F000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) release scene resource, current state is (%{public}@)", buf, 0x16u);
    }
    uint64_t v4 = a1[3];
    if (v4 == 2)
    {
      [a1 _doCleanup];
    }
    else if (v4 == 1)
    {
      [a1 setShouldAbortLoading:1];
      objc_initWeak((id *)buf, a1);
      uint64_t v5 = (void *)a1[1];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __47__ABDeviceSceneResourceLoader_releaseResources__block_invoke;
      v7[3] = &unk_265212F48;
      objc_copyWeak(&v8, (id *)buf);
      char v6 = (void *)MEMORY[0x24C555A80](v7);
      [v5 addObject:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __47__ABDeviceSceneResourceLoader_releaseResources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _doCleanup];
}

- (BOOL)areResourcesLoaded
{
  if (result) {
    return *(void *)(result + 24) == 2;
  }
  return result;
}

- (void)_didCancelWithToken:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    completions = self->_completions;
    uint64_t v10 = (void *)MEMORY[0x24C555A80](v7);
    [(NSMutableOrderedSet *)completions removeObject:v10];
  }
  [(NSHashTable *)self->_cancellables removeObject:v6];
  if (![(NSHashTable *)self->_cancellables count] && self->_state == 1)
  {
    __int16 v11 = ABLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = self->_state - 1;
      if (v12 > 2) {
        uint64_t v13 = @"Empty";
      }
      else {
        uint64_t v13 = off_265212F90[v12];
      }
      int v14 = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      long long v17 = v13;
      _os_log_impl(&dword_24741F000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancel scene resource loading, current state is (%{public}@)", (uint8_t *)&v14, 0x16u);
    }

    [(ABDeviceSceneResourceLoader *)self setShouldAbortLoading:1];
  }
}

- (void)_doCleanup
{
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  memset(v4, 0, sizeof(v4));
  __copy_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((id *)&self->_sceneModel.scene, (id *)v4);
  self->_state = 0;
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)v4);
}

- (uint64_t)sceneView
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (double)sceneModel
{
  if (a1) {
    return __copy_constructor_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((void *)a2, (id *)(a1 + 56));
  }
  double result = 0.0;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  return result;
}

- (void).cxx_destruct
{
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)&self->_sceneModel.scene);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cancellables, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end