@interface CSVoiceTriggerAssetDownloadMonitor
+ (id)sharedInstance;
- (CSVoiceTriggerAssetDownloadMonitor)init;
- (const)_notificationKey;
- (void)_didInstalledNewVoiceTriggerAsset;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSVoiceTriggerAssetDownloadMonitor

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSEventMonitor *)self notifyObserver:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 CSVoiceTriggerAssetDownloadMonitor:self didInstallNewAsset:1];
  }
}

- (void)_didInstalledNewVoiceTriggerAsset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSVoiceTriggerAssetDownloadMonitor _didInstalledNewVoiceTriggerAsset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s New VoiceTrigger is now installed", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__CSVoiceTriggerAssetDownloadMonitor__didInstalledNewVoiceTriggerAsset__block_invoke;
  v4[3] = &unk_1E6201240;
  v4[4] = self;
  [(CSEventMonitor *)self enumerateObservers:v4];
}

uint64_t __71__CSVoiceTriggerAssetDownloadMonitor__didInstalledNewVoiceTriggerAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

- (void)_stopMonitoring
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
    }
  }
  if (+[CSUtils hasRemoteCoreSpeech])
  {
    if (+[CSUtils hasRemoteBuiltInMic])
    {
      int gibraltarMacNotifyToken = self->_gibraltarMacNotifyToken;
      if (gibraltarMacNotifyToken != -1)
      {
        notify_cancel(gibraltarMacNotifyToken);
        self->_int gibraltarMacNotifyToken = -1;
        v6 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315138;
          v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
          _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Gibraltar VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  int darwinNotifyToken = self->_darwinNotifyToken;
  if (darwinNotifyToken != -1)
  {
    notify_cancel(darwinNotifyToken);
    self->_int darwinNotifyToken = -1;
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Studio Display VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_notifyToken == -1)
  {
    v5 = [(CSVoiceTriggerAssetDownloadMonitor *)self _notificationKey];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_notifyToken, v4, handler);
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : VoiceTrigger Asset Download", buf, 0xCu);
    }
  }
  if (+[CSUtils hasRemoteCoreSpeech])
  {
    if (+[CSUtils hasRemoteBuiltInMic])
    {
      if (self->_gibraltarMacNotifyToken == -1)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_3;
        v10[3] = &unk_1E6201110;
        v10[4] = self;
        notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsMac.ma.new-asset-installed", &self->_gibraltarMacNotifyToken, v4, v10);
        uint64_t v7 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
          _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Gibraltar VoiceTrigger Asset Download", buf, 0xCu);
        }
      }
    }
  }
  if (self->_darwinNotifyToken == -1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_4;
    v9[3] = &unk_1E6201110;
    v9[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay.ma.new-asset-installed", &self->_darwinNotifyToken, v4, v9);
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Studio Display VoiceTrigger Asset Download", buf, 0xCu);
    }
  }
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInstalledNewVoiceTriggerAsset];
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInstalledNewVoiceTriggerAsset];
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInstalledNewVoiceTriggerAsset];
}

- (const)_notificationKey
{
  BOOL v2 = +[CSUtils supportMphAssets];
  if (CSIsIPad_onceToken != -1) {
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_22);
  }
  if (CSIsIPad_isIPad)
  {
    if (v2) {
      return "com.apple.MobileAsset.VoiceTriggerAssetsIPad.ma.new-asset-installed";
    }
    else {
      return "com.apple.MobileAsset.VoiceTriggerHSAssetsIPad.ma.new-asset-installed";
    }
  }
  else
  {
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    id v4 = "com.apple.MobileAsset.VoiceTriggerHSAssets.ma.new-asset-installed";
    if (v2) {
      id v4 = "com.apple.MobileAsset.VoiceTriggerAssets.ma.new-asset-installed";
    }
    if (CSIsHorseman_isHorseman) {
      return "com.apple.MobileAsset.VoiceTriggerAssetsMarsh.ma.new-asset-installed";
    }
    else {
      return v4;
    }
  }
}

- (CSVoiceTriggerAssetDownloadMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerAssetDownloadMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_int gibraltarMacNotifyToken = -1;
    result->_int darwinNotifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5210 != -1) {
    dispatch_once(&sharedInstance_onceToken_5210, &__block_literal_global_5211);
  }
  BOOL v2 = (void *)sharedInstance__sharedInstance_5212;
  return v2;
}

uint64_t __52__CSVoiceTriggerAssetDownloadMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_5212 = objc_alloc_init(CSVoiceTriggerAssetDownloadMonitor);
  return MEMORY[0x1F41817F8]();
}

@end