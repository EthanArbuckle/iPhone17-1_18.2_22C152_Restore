@interface CSVolumeMonitor
+ (id)sharedInstance;
- (BOOL)_fetchSystemVolumeForCategory:(id)a3 usingSystemController:(id)a4 volume:(float *)a5;
- (BOOL)_supportAVSystemVolumeFetch;
- (CSVolumeMonitor)init;
- (float)_getNewSystemVolumesWithNotification:(id)a3 category:(id)a4;
- (float)alarmVolume;
- (float)musicVolume;
- (void)_notifyObserver:(id)a3 volumeDidChanged:(float)a4 forAudioCategory:(id)a5;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingSystemControllerLifecycle;
- (void)dealloc;
- (void)fetchVolumeFromAVSystemControllerForAudioCategory:(id)a3;
- (void)musicVolumeWithCompletion:(id)a3;
- (void)startObservingSystemVolumes;
- (void)systemControllerDied:(id)a3;
- (void)systemVolumeDidChange:(id)a3;
@end

@implementation CSVolumeMonitor

- (void)systemVolumeDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke_2;
  v14 = &unk_1E6200210;
  v15 = v2;
  id v16 = *(id *)(a1 + 40);
  [v2 enumerateObserversInQueue:&v11];
  v3 = objc_msgSend(*(id *)(a1 + 40), "userInfo", v11, v12, v13, v14, v15);
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F74AC8]];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    id v6 = [v5 volumeCategoryForAudioCategory:v4];

    if ([v6 isEqualToString:@"Audio/Video"])
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSVolumeMonitor systemVolumeDidChange:]_block_invoke";
        __int16 v19 = 2114;
        v20 = v4;
        _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Observer: received system volume change for audioCategory %{public}@", buf, 0x16u);
      }
      id v8 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
    }
    else
    {
      if (![v6 isEqualToString:@"Alarm"])
      {
LABEL_11:

        goto LABEL_12;
      }
      v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSVolumeMonitor systemVolumeDidChange:]_block_invoke";
        __int16 v19 = 2114;
        v20 = v4;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Observer: received system volume change for audioCategory %{public}@", buf, 0x16u);
      }
      id v8 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
    }
    [*(id *)(a1 + 32) _getNewSystemVolumesWithNotification:*(void *)(a1 + 40) category:v6];
    *(_DWORD *)(*(void *)(a1 + 32) + *v8) = v10;
    goto LABEL_11;
  }
LABEL_12:
}

- (float)_getNewSystemVolumesWithNotification:(id)a3 category:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"Audio/Video"])
  {
    id v8 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
  }
  else
  {
    float v9 = 0.0;
    if (![v7 isEqualToString:@"Alarm"]) {
      goto LABEL_6;
    }
    id v8 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
  }
  float v9 = *(float *)((char *)&self->super.super.isa + *v8);
LABEL_6:
  int v10 = [v6 userInfo];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F74AE8]];
  [v11 floatValue];
  float v13 = v12;

  float v14 = 1.0;
  if (v13 <= 1.0) {
    float v14 = v13;
  }
  float v15 = fmaxf(v14, 0.0);
  if (vabds_f32(v9, v15) <= 0.02)
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[CSVolumeMonitor _getNewSystemVolumesWithNotification:category:]";
      __int16 v25 = 2050;
      double v26 = v9;
      __int16 v27 = 2050;
      double v28 = v15;
      _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_INFO, "%s Receiving fake system volume change: %{public}f -> %{public}f, ignoring...", buf, 0x20u);
    }
    float v15 = v9;
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__CSVolumeMonitor__getNewSystemVolumesWithNotification_category___block_invoke;
    v20[3] = &unk_1E61FF878;
    v20[4] = self;
    float v22 = v15;
    double v16 = COERCE_DOUBLE(v7);
    double v21 = v16;
    [(CSEventMonitor *)self enumerateObserversInQueue:v20];
    v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[CSVolumeMonitor _getNewSystemVolumesWithNotification:category:]";
      __int16 v25 = 2114;
      double v26 = v16;
      __int16 v27 = 2050;
      double v28 = v9;
      __int16 v29 = 2050;
      double v30 = v15;
      _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Observer: system volume for category %{public}@, changed from %{public}f to %{public}f", buf, 0x2Au);
    }
  }
  return v15;
}

void __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 CSVolumeMonitor:*(void *)(a1 + 32) systemVolumeDidChange:*(void *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
}

- (BOOL)_supportAVSystemVolumeFetch
{
  return 1;
}

- (void)_startObservingSystemControllerLifecycle
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74E28];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E28] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  id v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel_systemControllerDied_ name:v7 object:v8];
}

- (void)startObservingSystemVolumes
{
  [(CSVolumeMonitor *)self fetchVolumeFromAVSystemControllerForAudioCategory:@"Audio/Video"];
  [(CSVolumeMonitor *)self fetchVolumeFromAVSystemControllerForAudioCategory:@"Alarm"];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74EE0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74EE0] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  id v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel_systemVolumeDidChange_ name:v7 object:v8];
}

- (void)systemControllerDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSVolumeMonitor systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSVolumeMonitor *)self startObservingSystemVolumes];
}

uint64_t __65__CSVolumeMonitor__getNewSystemVolumesWithNotification_category___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) _notifyObserver:a2 volumeDidChanged:*(void *)(a1 + 40) forAudioCategory:a3];
}

- (BOOL)_fetchSystemVolumeForCategory:(id)a3 usingSystemController:(id)a4 volume:(float *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!a5) {
    goto LABEL_14;
  }
  BOOL v11 = 0;
  *a5 = 0.5;
  if (!v8 || !v9) {
    goto LABEL_15;
  }
  if (![(CSVolumeMonitor *)self _supportAVSystemVolumeFetch])
  {
    float v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[CSVolumeMonitor _fetchSystemVolumeForCategory:usingSystemController:volume:]";
      _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Fetching system volume on wrong device.", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman
    || ![v10 getVolume:a5 category:v8 mode:0 route:@"Speaker" deviceIdentifier:@"PuffinOutput" routeSubtype:0])
  {
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  float v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = *a5;
    int v16 = 136315650;
    v17 = "-[CSVolumeMonitor _fetchSystemVolumeForCategory:usingSystemController:volume:]";
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2050;
    double v21 = v13;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Fetched system volume for %{public}@ as %{public}f.", (uint8_t *)&v16, 0x20u);
  }
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (void)fetchVolumeFromAVSystemControllerForAudioCategory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CSVolumeMonitor_fetchVolumeFromAVSystemControllerForAudioCategory___block_invoke;
  v7[3] = &unk_1E6201030;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__CSVolumeMonitor_fetchVolumeFromAVSystemControllerForAudioCategory___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int v14 = 1056964608;
  id v3 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v4 = [v3 attributeForKey:*MEMORY[0x1E4F74BC8]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s System is now muted, fetching volume as 0...", buf, 0xCu);
    }
    uint64_t v7 = 0;
    int v14 = 0;
  }
  else
  {
    uint64_t v8 = [v3 volumeCategoryForAudioCategory:*(void *)(a1 + 32)];
    if (v8)
    {
      uint64_t v7 = (void *)v8;
      if (([*(id *)(a1 + 40) _fetchSystemVolumeForCategory:v8 usingSystemController:v3 volume:&v14] & 1) == 0)
      {
        id v9 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          int v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
          __int16 v17 = 2114;
          uint64_t v18 = v10;
          _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get the system volume for audio category %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      BOOL v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        int v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
        __int16 v17 = 2114;
        uint64_t v18 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Unable to get the volume category for audio category '%{public}@'", buf, 0x16u);
      }
      uint64_t v7 = 0;
    }
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"Audio/Video"])
  {
    float v12 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
LABEL_18:
    *(_DWORD *)(*(void *)(a1 + 40) + *v12) = v14;
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"Alarm"])
  {
    float v12 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
    goto LABEL_18;
  }
LABEL_19:
}

- (float)alarmVolume
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1056964608;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CSVolumeMonitor_alarmVolume__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __30__CSVolumeMonitor_alarmVolume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 36);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)musicVolumeWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__CSVolumeMonitor_musicVolumeWithCompletion___block_invoke;
    v7[3] = &unk_1E62012B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __45__CSVolumeMonitor_musicVolumeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(void *)(a1 + 40) + 16))(*(float *)(*(void *)(a1 + 32) + 32));
}

- (float)musicVolume
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1056964608;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CSVolumeMonitor_musicVolume__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __30__CSVolumeMonitor_musicVolume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 32);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_notifyObserver:(id)a3 volumeDidChanged:(float)a4 forAudioCategory:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  [(CSEventMonitor *)self notifyObserver:v11];
  if ([v8 isEqualToString:@"Audio/Video"])
  {
    self->_musicVolumeLevel = a4;
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v9 = a4;
      [v11 CSVolumeMonitor:self didReceiveMusicVolumeChanged:v9];
    }
  }
  else if ([v8 isEqualToString:@"Alarm"])
  {
    self->_alarmVolumeLevel = a4;
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v10 = a4;
      [v11 CSVolumeMonitor:self didReceiveAlarmVolumeChanged:v10];
    }
  }
}

- (void)dealloc
{
  float v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSVolumeMonitor;
  [(CSEventMonitor *)&v4 dealloc];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSVolumeMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(CSVolumeMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSVolumeMonitor *)self startObservingSystemVolumes];
}

- (CSVolumeMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSVolumeMonitor;
  v2 = [(CSEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVolumeMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    [(CSVolumeMonitor *)v2 fetchVolumeFromAVSystemControllerForAudioCategory:@"Audio/Video"];
    [(CSVolumeMonitor *)v2 fetchVolumeFromAVSystemControllerForAudioCategory:@"Alarm"];
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
    if (sharedInstance_onceToken_4589 != -1) {
      dispatch_once(&sharedInstance_onceToken_4589, &__block_literal_global_4590);
    }
    id v2 = (id)sharedInstance__sharedInstance_4591;
  }
  return v2;
}

uint64_t __33__CSVolumeMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_4591 = objc_alloc_init(CSVolumeMonitor);
  return MEMORY[0x1F41817F8]();
}

@end