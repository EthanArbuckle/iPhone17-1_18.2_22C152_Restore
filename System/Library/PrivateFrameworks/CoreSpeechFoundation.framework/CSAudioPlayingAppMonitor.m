@interface CSAudioPlayingAppMonitor
+ (id)sharedMonitor;
- (CSAudioPlayingAppMonitor)init;
- (id)playingApps;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAudioPlayingState;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
- (void)handleAudioPlayingStateChange:(id)a3;
@end

@implementation CSAudioPlayingAppMonitor

- (void)_startObservingSystemControllerLifecycle
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = (uint64_t *)MEMORY[0x1E4F74E28];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E28] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel__systemControllerDied_ name:v7 object:v8];
}

- (void)_systemControllerDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSAudioPlayingAppMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAudioPlayingAppMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSAudioPlayingAppMonitor *)self _startObservingAudioPlayingState];
  [(CSAudioPlayingAppMonitor *)self handleAudioPlayingStateChange:0];
}

- (void)_startObservingAudioPlayingState
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74E90];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E90] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  __int16 v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel_handleAudioPlayingStateChange_ name:v7 object:v8];
}

- (void)handleAudioPlayingStateChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__CSAudioPlayingAppMonitor_handleAudioPlayingStateChange___block_invoke;
  v3[3] = &unk_1E6201240;
  v3[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __58__CSAudioPlayingAppMonitor_handleAudioPlayingStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)_stopMonitoring
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CSAudioPlayingAppMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSAudioPlayingAppMonitor *)self _startObservingAudioPlayingState];
}

- (id)playingApps
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v3 = [v2 attributeForKey:*MEMORY[0x1E4F74C80]];

  if (v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v17 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      __int16 v8 = (void *)MEMORY[0x1E4F74C88];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", *v8, v17);
          v11 = v10;
          if (v10)
          {
            uint64_t v12 = [v10 integerValue];
            v13 = [MEMORY[0x1E4F28F80] processInfo];
            int v14 = [v13 processIdentifier];

            if (v14 != v12)
            {
              v15 = [[CSAudioPlayingApp alloc] initWithPid:v12];
              if (v15) {
                [v18 addObject:v15];
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    id v3 = v17;
  }

  return v18;
}

- (CSAudioPlayingAppMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSAudioPlayingAppMonitor;
    self = [(CSEventMonitor *)&v5 init];
    id v3 = self;
  }

  return v3;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_2587);
  }
  v2 = (void *)sharedMonitor_sharedMonitor;
  return v2;
}

uint64_t __41__CSAudioPlayingAppMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_sharedMonitor = objc_alloc_init(CSAudioPlayingAppMonitor);
  return MEMORY[0x1F41817F8]();
}

@end