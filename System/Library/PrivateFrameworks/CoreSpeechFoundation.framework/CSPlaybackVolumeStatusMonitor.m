@interface CSPlaybackVolumeStatusMonitor
+ (id)sharedInstance;
- (CSPlaybackVolumeStatusMonitor)init;
- (unint64_t)_volumeStatusFromLevel:(float)a3;
- (unint64_t)playbackVolumeStatus;
- (void)CSVolumeMonitor:(id)a3 systemVolumeDidChange:(id)a4;
- (void)_fetchAndUpdatePlaybackVolumeStatus;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_updatePlaybackVolumeStatusWithNotification:(id)a3;
@end

@implementation CSPlaybackVolumeStatusMonitor

uint64_t __71__CSPlaybackVolumeStatusMonitor_CSVolumeMonitor_systemVolumeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaybackVolumeStatusWithNotification:*(void *)(a1 + 40)];
}

- (void)_updatePlaybackVolumeStatusWithNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x1E4F74AE8]];
  [v5 floatValue];
  float v7 = v6;

  LODWORD(v8) = 1.0;
  if (v7 <= 1.0) {
    *(float *)&double v8 = v7;
  }
  float v9 = fmaxf(*(float *)&v8, 0.0);
  *(float *)&double v8 = v9;
  unint64_t v10 = [(CSPlaybackVolumeStatusMonitor *)self _volumeStatusFromLevel:v8];
  if (v10 != self->_volumeStatus)
  {
    unint64_t v11 = v10;
    self->_volumeStatus = v10;
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[CSPlaybackVolumeStatusMonitor _updatePlaybackVolumeStatusWithNotification:]";
      __int16 v16 = 2048;
      double v17 = v9;
      __int16 v18 = 2048;
      unint64_t v19 = v11;
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Updated audio volume = %f, volumeStatus = %lu", buf, 0x20u);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__CSPlaybackVolumeStatusMonitor__updatePlaybackVolumeStatusWithNotification___block_invoke;
    v13[3] = &unk_1E6201240;
    v13[4] = self;
    [(CSEventMonitor *)self enumerateObserversInQueue:v13];
  }
}

- (unint64_t)_volumeStatusFromLevel:(float)a3
{
  if (a3 > 0.0)
  {
    v4 = +[CSFPreferences sharedPreferences];
    [v4 nearlyMutedPlaybackVolumeLevel];
    float v6 = v5;

    if (v6 >= a3) {
      return 1;
    }
  }
  if (a3 <= 0.0) {
    return 2;
  }
  return 0;
}

- (void)CSVolumeMonitor:(id)a3 systemVolumeDidChange:(id)a4
{
  id v5 = a4;
  float v6 = [v5 userInfo];
  float v7 = [v6 objectForKey:*MEMORY[0x1E4F74A70]];

  if (v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__CSPlaybackVolumeStatusMonitor_CSVolumeMonitor_systemVolumeDidChange___block_invoke;
    v9[3] = &unk_1E6201030;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(queue, v9);
  }
}

- (void).cxx_destruct
{
}

- (void)_fetchAndUpdatePlaybackVolumeStatus
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v10 = 0.0;
  v3 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v9 = 0;
  int v4 = [v3 getActiveCategoryVolume:&v10 andName:&v9];
  id v5 = v9;

  if (v4)
  {
    *(float *)&double v6 = v10;
    self->_volumeStatus = [(CSPlaybackVolumeStatusMonitor *)self _volumeStatusFromLevel:v6];
    float v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[CSPlaybackVolumeStatusMonitor _fetchAndUpdatePlaybackVolumeStatus]";
      __int16 v13 = 2048;
      double v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s activeVolumeLevel = %f, activeAudioCategory = %{public}@", buf, 0x20u);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__CSPlaybackVolumeStatusMonitor__fetchAndUpdatePlaybackVolumeStatus__block_invoke;
    v8[3] = &unk_1E6201240;
    v8[4] = self;
    [(CSEventMonitor *)self enumerateObserversInQueue:v8];
  }
}

uint64_t __68__CSPlaybackVolumeStatusMonitor__fetchAndUpdatePlaybackVolumeStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

uint64_t __77__CSPlaybackVolumeStatusMonitor__updatePlaybackVolumeStatusWithNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = +[CSVolumeMonitor sharedInstance];
  [v3 removeObserver:self];

  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[CSPlaybackVolumeStatusMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitor: playback volume status", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CSPlaybackVolumeStatusMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
  int v5 = +[CSVolumeMonitor sharedInstance];
  [v5 addObserver:self];

  double v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSPlaybackVolumeStatusMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitor: playback volume status", buf, 0xCu);
  }
}

uint64_t __59__CSPlaybackVolumeStatusMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAndUpdatePlaybackVolumeStatus];
}

- (unint64_t)playbackVolumeStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CSPlaybackVolumeStatusMonitor_playbackVolumeStatus__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__CSPlaybackVolumeStatusMonitor_playbackVolumeStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (CSPlaybackVolumeStatusMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSPlaybackVolumeStatusMonitor;
  v2 = [(CSEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSPlaybackVolumeStatusMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_10162 != -1) {
      dispatch_once(&sharedInstance_onceToken_10162, &__block_literal_global_10163);
    }
    id v2 = (id)sharedInstance__sharedInstance_10164;
  }
  return v2;
}

uint64_t __47__CSPlaybackVolumeStatusMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_10164 = objc_alloc_init(CSPlaybackVolumeStatusMonitor);
  return MEMORY[0x1F41817F8]();
}

@end