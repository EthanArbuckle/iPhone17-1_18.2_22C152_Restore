@interface CSAudioRouteChangeMonitorImpl
- (BOOL)_fetchHearstConnectionState;
- (BOOL)_fetchJarvisConnectionState;
- (BOOL)carPlayConnected;
- (BOOL)jarvisConnected;
- (CSAudioRouteChangeMonitorImpl)init;
- (int64_t)hearstOwnership;
- (int64_t)hearstRouteStatus;
- (void)_fetchHearstRouteStatusWithCompletion:(id)a3;
- (void)_notifyHearstRouteStatus:(int64_t)a3;
- (void)_notifyJarvisConnectionState:(BOOL)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAudioRouteChange;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
- (void)carPlayAuxStreamSupportDidChange:(id)a3;
- (void)carPlayIsConnectedDidChange:(id)a3;
- (void)getHearstOwnershipStatus:(id)a3;
- (void)getHearstRouteStatus:(id)a3;
- (void)getJarvisConnected:(id)a3;
- (void)pickableRoutesDidChange:(id)a3;
- (void)preferredExternalRouteDidChange:(id)a3;
@end

@implementation CSAudioRouteChangeMonitorImpl

uint64_t __50__CSAudioRouteChangeMonitorImpl_hearstRouteStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

uint64_t __48__CSAudioRouteChangeMonitorImpl_jarvisConnected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (BOOL)jarvisConnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CSAudioRouteChangeMonitorImpl_jarvisConnected__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)hearstRouteStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CSAudioRouteChangeMonitorImpl_hearstRouteStatus__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAudioRouteChangeMonitorImpl pickableRoutesDidChange:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received external pickable route change notification", buf, 0xCu);
  }
  int64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke_6;
  v5[3] = &unk_1E61FF998;
  v5[4] = v3;
  return [v3 _fetchHearstRouteStatusWithCompletion:v5];
}

- (void)_fetchHearstRouteStatusWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAudioRouteChangeMonitorImpl *)self _fetchHearstConnectionState];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v6 = 4;
  if (!v5) {
    uint64_t v6 = 5;
  }
  uint64_t v18 = v6;
  v7 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  uint64_t v8 = [v7 attributeForKey:*MEMORY[0x1E4F74C70]];

  if (v8
    && ([v8 objectForKey:*MEMORY[0x1E4F74DE0]],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F74E20]];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__CSAudioRouteChangeMonitorImpl__fetchHearstRouteStatusWithCompletion___block_invoke;
    v11[3] = &unk_1E61FF9C0;
    id v12 = v8;
    v14 = &v15;
    id v13 = v4;
    [(CSAudioRouteChangeMonitor *)self routeIsDoAPSupportedWithRouteUID:v10 withCompletion:v11];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v16[3]);
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)_fetchHearstConnectionState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  int64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74C48]];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v25;
  uint64_t v8 = (void *)MEMORY[0x1E4F74D98];
  uint64_t v9 = (void *)MEMORY[0x1E4F74DD0];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v12 = [v11 objectForKey:*v8];
      if (![v12 BOOLValue]) {
        goto LABEL_12;
      }
      id v13 = [v11 objectForKey:*v9];
      if (([v13 BOOLValue] & 1) == 0)
      {

LABEL_12:
        continue;
      }
      [v11 objectForKey:*MEMORY[0x1E4F74DD8]];
      uint64_t v14 = v7;
      uint64_t v15 = v8;
      id v16 = v4;
      v18 = uint64_t v17 = v9;
      int v23 = [v18 BOOLValue];

      uint64_t v9 = v17;
      id v4 = v16;
      uint64_t v8 = v15;
      uint64_t v7 = v14;

      if (v23)
      {
        v19 = [v11 objectForKey:*MEMORY[0x1E4F74D78]];
        char v20 = [v19 BOOLValue];

        if (v20)
        {
          BOOL v21 = 1;
          goto LABEL_16;
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v6);
LABEL_15:
  BOOL v21 = 0;
LABEL_16:

  return v21;
}

uint64_t __71__CSAudioRouteChangeMonitorImpl__fetchHearstRouteStatusWithCompletion___block_invoke(uint64_t a1, int a2)
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
      uint64_t v6 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F74D58]];

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
    v10 = "-[CSAudioRouteChangeMonitorImpl _fetchHearstRouteStatusWithCompletion:]_block_invoke";
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

uint64_t __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke_6(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 40) != a2)
  {
    *(void *)(v2 + 40) = a2;
    return [*(id *)(result + 32) _notifyHearstRouteStatus:a2];
  }
  return result;
}

- (void)pickableRoutesDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_startObservingSystemControllerLifecycle
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74E28];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E28] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  uint64_t v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  uint64_t v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel__systemControllerDied_ name:v7 object:v8];
}

- (void)_systemControllerDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSAudioRouteChangeMonitorImpl _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAudioRouteChangeMonitorImpl *)self _startObservingSystemControllerLifecycle];
  [(CSAudioRouteChangeMonitorImpl *)self _startObservingAudioRouteChange];
  [(CSAudioRouteChangeMonitorImpl *)self preferredExternalRouteDidChange:0];
  [(CSAudioRouteChangeMonitorImpl *)self pickableRoutesDidChange:0];
  [(CSAudioRouteChangeMonitorImpl *)self carPlayAuxStreamSupportDidChange:0];
  [(CSAudioRouteChangeMonitorImpl *)self carPlayIsConnectedDidChange:0];
}

- (void)_notifyJarvisConnectionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSAudioRouteChangeMonitorImpl _notifyJarvisConnectionState:]";
    __int16 v10 = 1026;
    BOOL v11 = v3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Jarvis Connection State : %{public}d", buf, 0x12u);
  }
  self->_isJarvisConnected = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CSAudioRouteChangeMonitorImpl__notifyJarvisConnectionState___block_invoke;
  v6[3] = &unk_1E6201138;
  v6[4] = self;
  BOOL v7 = v3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

void __62__CSAudioRouteChangeMonitorImpl__notifyJarvisConnectionState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) notifyObserver:v3];
  if (objc_opt_respondsToSelector()) {
    [v3 CSAudioRouteChangeMonitor:*(void *)(a1 + 32) didReceiveAudioRouteChangeEvent:*(unsigned char *)(a1 + 40) == 0];
  }
}

- (void)_notifyHearstRouteStatus:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[CSAudioRouteChangeMonitorImpl _notifyHearstRouteStatus:]";
    __int16 v9 = 2050;
    int64_t v10 = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Hearst Route State: %{public}ld", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CSAudioRouteChangeMonitorImpl__notifyHearstRouteStatus___block_invoke;
  v6[3] = &unk_1E6201188;
  v6[4] = self;
  void v6[5] = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

void __58__CSAudioRouteChangeMonitorImpl__notifyHearstRouteStatus___block_invoke(uint64_t a1, void *a2)
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

- (BOOL)_fetchJarvisConnectionState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  unint64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74B40]];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"NO";
    if (v4) {
      int v6 = @"YES";
    }
    int v12 = 136315394;
    uint64_t v13 = "-[CSAudioRouteChangeMonitorImpl _fetchJarvisConnectionState]";
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s General CarPlay is connected ? %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if (v4)
  {
    BOOL v7 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    __int16 v8 = [v7 attributeForKey:*MEMORY[0x1E4F74B30]];
    int v4 = [v8 BOOLValue];

    __int16 v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v10 = @"NO";
      if (v4) {
        int64_t v10 = @"YES";
      }
      int v12 = 136315394;
      uint64_t v13 = "-[CSAudioRouteChangeMonitorImpl _fetchJarvisConnectionState]";
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s aux stream supported ? %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v4;
}

- (void)_stopMonitoring
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  stateCapture = self->_stateCapture;
  if (stateCapture)
  {
    [(CSStateCapture *)stateCapture setStateCaptureBlock:0];
    uint64_t v5 = self->_stateCapture;
    self->_stateCapture = 0;
  }
  int v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[CSAudioRouteChangeMonitorImpl _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AudioRouteChangeMonitor", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_startObservingAudioRouteChange
{
  id v12 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  unint64_t v3 = (void *)MEMORY[0x1E4F74C60];
  int v4 = (void *)MEMORY[0x1E4F74C98];
  uint64_t v5 = (void *)MEMORY[0x1E4F74B38];
  int v6 = (void *)MEMORY[0x1E4F74B48];
  int v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F74C60], *MEMORY[0x1E4F74C98], *MEMORY[0x1E4F74B38], *MEMORY[0x1E4F74B48], 0);
  [v12 setAttribute:v7 forKey:*MEMORY[0x1E4F74EB0] error:0];
  __int16 v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_pickableRoutesDidChange_ name:*v3 object:v12];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_preferredExternalRouteDidChange_ name:*v4 object:v12];

  int64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_carPlayAuxStreamSupportDidChange_ name:*v5 object:v12];

  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_carPlayIsConnectedDidChange_ name:*v6 object:v12];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CSAudioRouteChangeMonitorImpl *)self _startObservingSystemControllerLifecycle];
  [(CSAudioRouteChangeMonitorImpl *)self _startObservingAudioRouteChange];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[CSAudioRouteChangeMonitorImpl _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioRouteChangeMonitor", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
  if (!self->_stateCapture)
  {
    int v7 = objc_alloc_init(CSStateCapture);
    stateCapture = self->_stateCapture;
    self->_stateCapture = v7;

    [(CSStateCapture *)self->_stateCapture start];
    objc_initWeak((id *)buf, self);
    uint64_t v9 = self->_stateCapture;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_3;
    v10[3] = &unk_1E61FFD38;
    objc_copyWeak(&v11, (id *)buf);
    [(CSStateCapture *)v9 setStateCaptureBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_2;
  v4[3] = &unk_1E61FF998;
  v4[4] = v2;
  [v2 _fetchHearstRouteStatusWithCompletion:v4];
  uint64_t result = [*(id *)(a1 + 32) _fetchJarvisConnectionState];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

CSStateCaptureOptions *__59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained carPlayConnected];
  char v3 = [WeakRetained jarvisConnected];
  uint64_t v4 = [WeakRetained hearstRouteStatus];
  uint64_t v5 = [CSStateCaptureOptions alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_4;
  v8[3] = &__block_descriptor_42_e42_v16__0___CSStateCaptureOptionsMutablity__8l;
  char v9 = v2;
  char v10 = v3;
  v8[4] = v4;
  int v6 = [(CSStateCaptureOptions *)v5 initWithMutableBuilder:v8];

  return v6;
}

void __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_4(uint64_t a1, void *a2)
{
  char v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v8 = [v3 dictionary];
  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v8 setValue:v5 forKey:@"CarPlayConnected"];

  int v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  [v8 setValue:v6 forKey:@"JarvisConnected"];

  int v7 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  [v8 setValue:v7 forKey:@"HearstRouteStatus"];

  [v4 setStateData:v8];
  [v4 setStateDataTitle:@"CoreSpeech-AccessoryDeviceConnectionStateCapture"];
}

uint64_t __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 40) = a2;
  return result;
}

- (void)carPlayIsConnectedDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v9 = "-[CSAudioRouteChangeMonitorImpl carPlayIsConnectedDidChange:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay connection change notification", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CSAudioRouteChangeMonitorImpl_carPlayIsConnectedDidChange___block_invoke;
  v7[3] = &unk_1E6201240;
  v7[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v7];
  if ([(CSAudioRouteChangeMonitorImpl *)self carPlayConnected]
    || [(CSAudioRouteChangeMonitorImpl *)self jarvisConnected])
  {
    int v6 = +[CSCarKitUtils sharedInstance];
    [v6 handleHeadUnitConnectedWithAsyncCompletion:0];
  }
}

uint64_t __61__CSAudioRouteChangeMonitorImpl_carPlayIsConnectedDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)carPlayAuxStreamSupportDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSAudioRouteChangeMonitorImpl_carPlayAuxStreamSupportDidChange___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

unsigned __int8 *__66__CSAudioRouteChangeMonitorImpl_carPlayAuxStreamSupportDidChange___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSAudioRouteChangeMonitorImpl carPlayAuxStreamSupportDidChange:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay AuxStream support change notification", (uint8_t *)&v5, 0xCu);
  }
  int v3 = [*(id *)(a1 + 32) _fetchJarvisConnectionState];
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  if (result[32] != v3) {
    return (unsigned __int8 *)objc_msgSend(result, "_notifyJarvisConnectionState:");
  }
  return result;
}

- (void)preferredExternalRouteDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSAudioRouteChangeMonitorImpl preferredExternalRouteDidChange:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received external route change notification", buf, 0xCu);
  }
  int v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke_4;
  v5[3] = &unk_1E61FF998;
  v5[4] = v3;
  return [v3 _fetchHearstRouteStatusWithCompletion:v5];
}

uint64_t __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 40) != a2)
  {
    *(void *)(v2 + 40) = a2;
    return [*(id *)(result + 32) _notifyHearstRouteStatus:a2];
  }
  return result;
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
    block[2] = __58__CSAudioRouteChangeMonitorImpl_getHearstOwnershipStatus___block_invoke;
    block[3] = &unk_1E61FFB80;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __58__CSAudioRouteChangeMonitorImpl_getHearstOwnershipStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)carPlayConnected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  int v3 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v4 = [v3 attributeForKey:*MEMORY[0x1E4F74B40]];
  char v5 = [v4 BOOLValue];

  int v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    [v6 timeIntervalSinceDate:v2];
    int v11 = 136315394;
    id v12 = "-[CSAudioRouteChangeMonitorImpl carPlayConnected]";
    __int16 v13 = 2050;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch CarPlay connection attribute elapsed time = %{public}lf", (uint8_t *)&v11, 0x16u);
  }
  return v5;
}

- (void)getJarvisConnected:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__CSAudioRouteChangeMonitorImpl_getJarvisConnected___block_invoke;
    v7[3] = &unk_1E62012B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __52__CSAudioRouteChangeMonitorImpl_getJarvisConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getHearstRouteStatus:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__CSAudioRouteChangeMonitorImpl_getHearstRouteStatus___block_invoke;
    v7[3] = &unk_1E62012B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __54__CSAudioRouteChangeMonitorImpl_getHearstRouteStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CSAudioRouteChangeMonitorImpl)init
{
  if (+[CSUtils isDarwinOS])
  {
    int v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSAudioRouteChangeMonitorImpl;
    id v4 = [(CSEventMonitor *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSAudioRouteChangeMonitorImpl queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;
    }
    self = v4;
    int v3 = self;
  }

  return v3;
}

@end