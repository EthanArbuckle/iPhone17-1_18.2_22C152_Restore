@interface BLSHInternalTapToRadarManager
+ (id)sharedTapToRadarManager;
- (BLSHInternalTapToRadarManager)init;
- (id)_init;
- (void)requestTapToRadar:(id)a3 log:(id)a4 completion:(id)a5;
@end

@implementation BLSHInternalTapToRadarManager

- (BLSHInternalTapToRadarManager)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)BLSHInternalTapToRadarManager;
  return [(BLSHInternalTapToRadarManager *)&v3 init];
}

+ (id)sharedTapToRadarManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BLSHInternalTapToRadarManager_sharedTapToRadarManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTapToRadarManager__onceToken != -1) {
    dispatch_once(&sharedTapToRadarManager__onceToken, block);
  }
  v2 = (void *)sharedTapToRadarManager___ttrManager;

  return v2;
}

uint64_t __56__BLSHInternalTapToRadarManager_sharedTapToRadarManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedTapToRadarManager___ttrManager;
  sharedTapToRadarManager___ttrManager = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (void)requestTapToRadar:(id)a3 log:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v7;
  id v9 = v11;
  id v10 = v12;
  BSDispatchMain();
}

void __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_2;
  v12[3] = &unk_264533348;
  id v13 = *(id *)(a1 + 56);
  uint64_t v2 = (void (**)(void, void))MEMORY[0x223C5E2B0](v12);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  if (*(void *)(v3 + 8))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR)) {
      __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_cold_1(v4);
    }
    v2[2](v2, 1);
  }
  else
  {
    objc_storeStrong((id *)(v3 + 16), *(id *)(a1 + 40));
    v5 = [[BLSHInternalTapToRadarDialog alloc] initWithDescriptor:*(void *)(a1 + 48) log:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_3;
    v10[3] = &unk_264533370;
    v10[4] = v8;
    id v11 = v2;
    [v9 presentWithCompletion:v10];
  }
}

uint64_t __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_ttrDialog, 0);
}

void __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "could not display Tap-To-Radar dialog as another such dialog was already being displayed", v1, 2u);
}

@end