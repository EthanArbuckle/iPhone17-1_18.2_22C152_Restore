@interface CSUAFDownloadMonitor
+ (id)sharedInstance;
- (CSUAFDownloadMonitor)init;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyAssets:(id)a3 onQueue:(id)a4;
@end

@implementation CSUAFDownloadMonitor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_assetSetDict, 0);
}

- (void)notifyAssets:(id)a3 onQueue:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CSUAFDownloadMonitor_notifyAssets_onQueue___block_invoke;
  v4[3] = &unk_1E6201240;
  v4[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4, a4);
}

void __45__CSUAFDownloadMonitor_notifyAssets_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 assetDownloadMonitorDelegate:*(void *)(a1 + 32) assetType:0];
    [v3 assetDownloadMonitorDelegate:*(void *)(a1 + 32) assetType:6];
    [v3 assetDownloadMonitorDelegate:*(void *)(a1 + 32) assetType:4];
  }
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSUAFDownloadMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s UAFDownloadMonitor stop monitoring", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke;
  v14[3] = &unk_1E61FF4C8;
  objc_copyWeak(&v16, &location);
  id v5 = v4;
  id v15 = v5;
  v6 = (void *)MEMORY[0x1BA9E7570](v14);
  v7 = [MEMORY[0x1E4FB3598] sharedManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke_272;
  v12[3] = &unk_1E61FFB80;
  id v8 = v6;
  id v13 = v8;
  v9 = [v7 observeAssetSet:@"com.apple.siri.understanding" queue:0 handler:v12];
  id observerToken = self->_observerToken;
  self->_id observerToken = v9;

  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSUAFDownloadMonitor _startMonitoringWithQueue:]";
    __int16 v20 = 2112;
    v21 = @"com.apple.siri.understanding";
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Adding observer for AssetSet: %@ to asset manager", buf, 0x16u);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[CSUAFDownloadMonitor _startMonitoringWithQueue:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s AssetSet update for %{public}@ received", (uint8_t *)&v6, 0x16u);
    }
    [WeakRetained notifyAssets:v3 onQueue:*(void *)(a1 + 32)];
  }
}

uint64_t __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CSUAFDownloadMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSUAFDownloadMonitor;
    self = [(CSEventMonitor *)&v5 init];
    id v3 = self;
  }

  return v3;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_1368 != -1) {
      dispatch_once(&sharedInstance_onceToken_1368, &__block_literal_global_1369);
    }
    id v2 = (id)sharedInstance_sharedManager;
  }
  return v2;
}

uint64_t __38__CSUAFDownloadMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedManager = objc_alloc_init(CSUAFDownloadMonitor);
  return MEMORY[0x1F41817F8]();
}

@end