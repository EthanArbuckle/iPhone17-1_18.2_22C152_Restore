@interface CSAudioRouteChangeMonitorImplWatch
- (BOOL)carPlayConnected;
- (BOOL)jarvisConnected;
- (CSAudioRouteChangeMonitorImplWatch)init;
- (int64_t)hearstOwnership;
- (int64_t)hearstRouteStatus;
- (void)_fetchHearstRouteStatusWithCompletion:(id)a3;
- (void)_notifyHearstRouteStatus:(int64_t)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAudioRouteChange;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
- (void)activeAudioRouteDidChange:(id)a3;
- (void)getHearstOwnershipStatus:(id)a3;
- (void)getHearstRouteStatus:(id)a3;
- (void)getJarvisConnected:(id)a3;
@end

@implementation CSAudioRouteChangeMonitorImplWatch

- (void).cxx_destruct
{
}

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
    uint64_t v7 = "-[CSAudioRouteChangeMonitorImplWatch _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAudioRouteChangeMonitorImplWatch *)self _startObservingSystemControllerLifecycle];
  [(CSAudioRouteChangeMonitorImplWatch *)self _startObservingAudioRouteChange];
  [(CSAudioRouteChangeMonitorImplWatch *)self activeAudioRouteDidChange:0];
}

- (void)_notifyHearstRouteStatus:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[CSAudioRouteChangeMonitorImplWatch _notifyHearstRouteStatus:]";
    __int16 v9 = 2050;
    int64_t v10 = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Hearst Route State: %{public}ld", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CSAudioRouteChangeMonitorImplWatch__notifyHearstRouteStatus___block_invoke;
  v6[3] = &unk_1E6201188;
  v6[4] = self;
  v6[5] = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

void __63__CSAudioRouteChangeMonitorImplWatch__notifyHearstRouteStatus___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) notifyObserver:v4];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = *(void *)(a1 + 40) - 1;
    if (v3 <= 4 && ((0x1Bu >> v3) & 1) != 0) {
      [v4 CSAudioRouteChangeMonitor:*(void *)(a1 + 32) didReceiveAudioRouteChangeEvent:qword_1BA25E928[v3]];
    }
  }
}

- (void)_fetchHearstRouteStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 5;
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  int v6 = [v5 attributeForKey:*MEMORY[0x1E4F74C70]];

  if (v6
    && ([v6 objectForKey:*MEMORY[0x1E4F74DE0]],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    __int16 v8 = [v6 objectForKey:*MEMORY[0x1E4F74E20]];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__CSAudioRouteChangeMonitorImplWatch__fetchHearstRouteStatusWithCompletion___block_invoke;
    v9[3] = &unk_1E61FF9C0;
    id v10 = v6;
    v12 = &v13;
    id v11 = v4;
    [(CSAudioRouteChangeMonitor *)self routeIsDoAPSupportedWithRouteUID:v8 withCompletion:v9];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v14[3]);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __76__CSAudioRouteChangeMonitorImplWatch__fetchHearstRouteStatusWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F74D48]];

    if (v4)
    {
      uint64_t v5 = 1;
    }
    else
    {
      int v6 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F74D58]];

      if (!v6) {
        goto LABEL_7;
      }
      uint64_t v5 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
LABEL_7:
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[CSAudioRouteChangeMonitorImplWatch _fetchHearstRouteStatusWithCompletion:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Current Picked route supportDoAP: %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  return result;
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSAudioRouteChangeMonitorImplWatch _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AudioRouteChangeMonitor", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startObservingAudioRouteChange
{
  id v6 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  unint64_t v3 = (void *)MEMORY[0x1E4F74A80];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F74A80]];
  [v6 setAttribute:v4 forKey:*MEMORY[0x1E4F74EB0] error:0];
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_activeAudioRouteDidChange_ name:*v3 object:v6];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(CSAudioRouteChangeMonitorImplWatch *)self _startObservingSystemControllerLifecycle];
  [(CSAudioRouteChangeMonitorImplWatch *)self _startObservingAudioRouteChange];
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSAudioRouteChangeMonitorImplWatch _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioRouteChangeMonitor", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CSAudioRouteChangeMonitorImplWatch__startMonitoringWithQueue___block_invoke;
  v5[3] = &unk_1E61FF998;
  v5[4] = self;
  [(CSAudioRouteChangeMonitorImplWatch *)self _fetchHearstRouteStatusWithCompletion:v5];
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch__startMonitoringWithQueue___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 32) = a2;
  return result;
}

- (void)activeAudioRouteDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSAudioRouteChangeMonitorImplWatch activeAudioRouteDidChange:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received active route change notification", buf, 0xCu);
  }
  unint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke_2;
  v5[3] = &unk_1E61FF998;
  v5[4] = v3;
  return [v3 _fetchHearstRouteStatusWithCompletion:v5];
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 32) = a2;
  return [*(id *)(a1 + 32) _notifyHearstRouteStatus:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (int64_t)hearstOwnership
{
  return 0;
}

- (void)getHearstOwnershipStatus:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__CSAudioRouteChangeMonitorImplWatch_getHearstOwnershipStatus___block_invoke;
    block[3] = &unk_1E61FFB80;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __63__CSAudioRouteChangeMonitorImplWatch_getHearstOwnershipStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)carPlayConnected
{
  return 0;
}

- (BOOL)jarvisConnected
{
  return 0;
}

- (void)getJarvisConnected:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CSAudioRouteChangeMonitorImplWatch_getJarvisConnected___block_invoke;
    block[3] = &unk_1E61FFB80;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __57__CSAudioRouteChangeMonitorImplWatch_getJarvisConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)hearstRouteStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CSAudioRouteChangeMonitorImplWatch_hearstRouteStatus__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__CSAudioRouteChangeMonitorImplWatch_hearstRouteStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)getHearstRouteStatus:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CSAudioRouteChangeMonitorImplWatch_getHearstRouteStatus___block_invoke;
    v7[3] = &unk_1E62012B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __59__CSAudioRouteChangeMonitorImplWatch_getHearstRouteStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CSAudioRouteChangeMonitorImplWatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAudioRouteChangeMonitorImplWatch;
  v2 = [(CSEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioRouteChangeMonitorImplWatch queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end