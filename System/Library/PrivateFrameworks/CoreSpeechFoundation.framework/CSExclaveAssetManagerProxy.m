@interface CSExclaveAssetManagerProxy
+ (id)sharedManager;
- (CSExclaveAdBlockerAnalyzing)exclaveAdblockerAnalyzer;
- (CSExclaveAssetManagerProxy)init;
- (CSExclaveAssetsControlling)exclaveRecordClient;
- (OS_dispatch_queue)queue;
- (void)setExclaveAdblockerAnalyzer:(id)a3;
- (void)setExclaveRecordClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4;
- (void)stopSecureMobileAssetLoaderService:(id)a3;
@end

@implementation CSExclaveAssetManagerProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exclaveAdblockerAnalyzer, 0);
  objc_storeStrong((id *)&self->_exclaveRecordClient, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setExclaveAdblockerAnalyzer:(id)a3
{
}

- (CSExclaveAdBlockerAnalyzing)exclaveAdblockerAnalyzer
{
  return self->_exclaveAdblockerAnalyzer;
}

- (void)setExclaveRecordClient:(id)a3
{
}

- (CSExclaveAssetsControlling)exclaveRecordClient
{
  return self->_exclaveRecordClient;
}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke;
  block[3] = &unk_1E61FF900;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke_2;
  v3[3] = &unk_1E61FF610;
  id v4 = *(id *)(a1 + 40);
  [v1 startSecureMobileAssetLoaderService:v2 completion:v3];
}

uint64_t __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v3 = a2;
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[CSExclaveAssetManagerProxy startSecureMobileAssetLoaderService:completion:]_block_invoke_2";
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Starting Secure Mobile Asset failed with error %u", (uint8_t *)&v6, 0x12u);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke;
  v7[3] = &unk_1E62012B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke_2;
  v2[3] = &unk_1E61FF610;
  id v3 = *(id *)(a1 + 40);
  [v1 stopSecureMobileAssetLoaderService:v2];
}

uint64_t __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v3 = a2;
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[CSExclaveAssetManagerProxy stopSecureMobileAssetLoaderService:]_block_invoke_2";
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Stopping Secure Mobile Asset failed with error %u", (uint8_t *)&v6, 0x12u);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (CSExclaveAssetManagerProxy)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSExclaveAssetManagerProxy;
  uint64_t v2 = [(CSExclaveAssetManagerProxy *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespeech.csexclave.assetmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[CSExclaveMessageHandlingFactory exclaveAssetsController];
    exclaveRecordClient = v2->_exclaveRecordClient;
    v2->_exclaveRecordClient = (CSExclaveAssetsControlling *)v5;

    uint64_t v7 = +[CSExclaveMessageHandlingFactory exclaveAdblockerAnalyzer];
    exclaveAdblockerAnalyzer = v2->_exclaveAdblockerAnalyzer;
    v2->_exclaveAdblockerAnalyzer = (CSExclaveAdBlockerAnalyzing *)v7;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3037);
  }
  uint64_t v2 = (void *)sharedManager_assetManager;
  return v2;
}

uint64_t __43__CSExclaveAssetManagerProxy_sharedManager__block_invoke()
{
  sharedManager_assetManager = objc_alloc_init(CSExclaveAssetManagerProxy);
  return MEMORY[0x1F41817F8]();
}

@end