@interface CSLanguageDetectorAssetMonitor
+ (id)sharedInstance;
- (CSLanguageDetectorAssetMonitor)init;
- (CSLanguageDetectorAssetMonitorDelegate)delegate;
- (OS_dispatch_queue)queue;
- (int)notifyToken;
- (void)_supportedLocale:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)startMonitor;
- (void)supportedLocale:(id)a3;
@end

@implementation CSLanguageDetectorAssetMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSLanguageDetectorAssetMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLanguageDetectorAssetMonitorDelegate *)WeakRetained;
}

- (void)_supportedLocale:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if ([MEMORY[0x1E4F5D450] supportLanguageDetector])
    {
      v4 = objc_alloc_init(CSAssetDownloadingOption);
      [(CSAssetDownloadingOption *)v4 setAllowLanguageDetectorAssetDownloading:1];
      v5 = +[CSAssetManager sharedManager];
      [v5 setAssetDownloadingOption:v4];

      v6 = +[CSAssetManager sharedManager];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__CSLanguageDetectorAssetMonitor__supportedLocale___block_invoke;
      v7[3] = &unk_1E658D030;
      id v8 = v3;
      [v6 assetOfType:2 language:@"en-US" completion:v7];
    }
    else
    {
      v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1052 userInfo:0];
      (*((void (**)(id, void, CSAssetDownloadingOption *))v3 + 2))(v3, 0, v4);
    }
  }
}

void __51__CSLanguageDetectorAssetMonitor__supportedLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v5 languageDetectorSupportedLocale];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = [v6 localizedDescription];
      int v12 = 136315394;
      v13 = "-[CSLanguageDetectorAssetMonitor _supportedLocale:]_block_invoke";
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s LanguageDetector supported locale is nil : %{public}@", (uint8_t *)&v12, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)supportedLocale:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CSLanguageDetectorAssetMonitor_supportedLocale___block_invoke;
  v7[3] = &unk_1E658D3A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __50__CSLanguageDetectorAssetMonitor_supportedLocale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _supportedLocale:*(void *)(a1 + 40)];
}

- (void)startMonitor
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 8) == -1)
  {
    id v3 = *(NSObject **)(v1 + 24);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_2;
    handler[3] = &unk_1E658D0D0;
    handler[4] = v1;
    notify_register_dispatch("com.apple.MobileAsset.LanguageDetectorAssets.ma.new-asset-installed", (int *)(v1 + 8), v3, handler);
  }
  else
  {
    v2 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[CSLanguageDetectorAssetMonitor startMonitor]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v2, OS_LOG_TYPE_ERROR, "%s Cannot start monitoring language detector asset, since we already registered", buf, 0xCu);
    }
  }
}

uint64_t __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_3;
  v3[3] = &unk_1E6589A40;
  v3[4] = v1;
  return [v1 _supportedLocale:v3];
}

void __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v5 languageDetectorAssetMonitor:*(void *)(a1 + 32) didReceiveNewAssetWithSupportLocale:v6];
  }
}

- (CSLanguageDetectorAssetMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSLanguageDetectorAssetMonitor;
  v2 = [(CSLanguageDetectorAssetMonitor *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("CSLanguageDetectorAssetMonitor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3347 != -1) {
    dispatch_once(&sharedInstance_onceToken_3347, &__block_literal_global_3348);
  }
  v2 = (void *)sharedInstance_sharedInstance_3349;
  return v2;
}

void __48__CSLanguageDetectorAssetMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSLanguageDetectorAssetMonitor);
  uint64_t v1 = (void *)sharedInstance_sharedInstance_3349;
  sharedInstance_sharedInstance_3349 = (uint64_t)v0;
}

@end