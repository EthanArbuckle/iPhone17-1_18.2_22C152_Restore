@interface CSTUPhoneCallStateMonitor
+ (id)sharedInstance;
- (BOOL)firstPartyCall;
- (CSTUPhoneCallStateMonitor)init;
- (OS_dispatch_queue)queue;
- (TUCallCenter)tuCallCenter;
- (unint64_t)_fetchTUPhoneCallState;
- (unint64_t)phoneCallState;
- (unint64_t)tuPhoneCallState;
- (void)_callStatusDidChangeHandler:(id)a3;
- (void)_registerPhoneCallStateChangeNotifier;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setQueue:(id)a3;
- (void)setTuCallCenter:(id)a3;
- (void)setTuPhoneCallState:(unint64_t)a3;
@end

@implementation CSTUPhoneCallStateMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setTuPhoneCallState:(unint64_t)a3
{
  self->_tuPhoneCallState = a3;
}

- (unint64_t)tuPhoneCallState
{
  return self->_tuPhoneCallState;
}

- (void)setTuCallCenter:(id)a3
{
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (unint64_t)_fetchTUPhoneCallState
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (!self->_tuCallCenter)
  {
    v3 = [MEMORY[0x1E4FADA98] callCenterWithQueue:self->_queue];
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__CSTUPhoneCallStateMonitor__fetchTUPhoneCallState__block_invoke;
  v9[3] = &unk_1E6200F40;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v6 = v11;
  self->_tuPhoneCallState = v11[3];
  unint64_t v7 = v6[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __51__CSTUPhoneCallStateMonitor__fetchTUPhoneCallState__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) currentAudioAndVideoCalls];
  if (![v2 count])
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSTUPhoneCallStateMonitor _fetchTUPhoneCallState]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 6;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - [TUCallStatus: %d]", buf, 0x12u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 136315394;
    long long v13 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "status", v13, (void)v14);
        v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v20 = "-[CSTUPhoneCallStateMonitor _fetchTUPhoneCallState]_block_invoke";
          __int16 v21 = 1024;
          int v22 = v10;
          _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - [TUCallStatus: %d]", buf, 0x12u);
        }
        switch(v10)
        {
          case 3:
            uint64_t v12 = 4;
            break;
          case 6:
            uint64_t v12 = 1;
            break;
          case 4:
            uint64_t v12 = 2;
            break;
          default:
            if ((v10 - 1) > 1) {
              goto LABEL_21;
            }
            uint64_t v12 = 3;
            break;
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
LABEL_21:
        if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          goto LABEL_24;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
LABEL_24:
}

- (unint64_t)phoneCallState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CSTUPhoneCallStateMonitor_phoneCallState__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__CSTUPhoneCallStateMonitor_phoneCallState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (BOOL)firstPartyCall
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  if (!self->_tuCallCenter)
  {
    unint64_t v3 = [MEMORY[0x1E4FADA98] callCenterWithQueue:self->_queue];
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CSTUPhoneCallStateMonitor_firstPartyCall__block_invoke;
  v8[3] = &unk_1E6200F40;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __43__CSTUPhoneCallStateMonitor_firstPartyCall__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) currentAudioAndVideoCalls];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 136315394;
    long long v14 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "provider", v14, (void)v15);
        uint64_t v9 = [v8 identifier];

        int v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v20 = "-[CSTUPhoneCallStateMonitor firstPartyCall]_block_invoke";
          __int16 v21 = 2112;
          int v22 = v9;
          _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s TUPhone Call - [providerIdentifier: %@]", buf, 0x16u);
        }
        if (!v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_18;
        }
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 24) providerManager];
        char v12 = [v11 providerWithIdentifier:v9];

        if (v12 && ([v12 isSystemProvider] & 1) == 0)
        {
          long long v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = "-[CSTUPhoneCallStateMonitor firstPartyCall]_block_invoke";
            __int16 v21 = 2112;
            int v22 = v9;
            _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - identifier is not first party: %@", buf, 0x16u);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)_callStatusDidChangeHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  if ([v5 isEqualToString:*MEMORY[0x1E4FADD88]])
  {

LABEL_4:
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__CSTUPhoneCallStateMonitor__callStatusDidChangeHandler___block_invoke;
    v8[3] = &unk_1E6201240;
    v8[4] = self;
    [(CSEventMonitor *)self enumerateObserversInQueue:v8];
    goto LABEL_5;
  }
  uint64_t v6 = [v4 name];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4FADDE0]];

  if (v7) {
    goto LABEL_4;
  }
LABEL_5:
}

void __57__CSTUPhoneCallStateMonitor__callStatusDidChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) notifyObserver:v3];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_fetchTUPhoneCallState"));
  }
}

- (void)_registerPhoneCallStateChangeNotifier
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (self->_tuCallCenter)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "-[CSTUPhoneCallStateMonitor _registerPhoneCallStateChangeNotifier]";
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s register tuCallCenter notification call backs", (uint8_t *)&v6, 0xCu);
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__callStatusDidChangeHandler_ name:*MEMORY[0x1E4FADD88] object:0];

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__callStatusDidChangeHandler_ name:*MEMORY[0x1E4FADDE0] object:0];
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSTUPhoneCallStateMonitor _registerPhoneCallStateChangeNotifier]";
    _os_log_error_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_ERROR, "%s No tuCallCenter to register", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_stopMonitoring
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FADD88] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FADDE0] object:0];

  self->_tuPhoneCallState = 0;
  tuCallCenter = self->_tuCallCenter;
  self->_tuCallCenter = 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = [MEMORY[0x1E4FADA98] callCenterWithQueue:self->_queue];
  tuCallCenter = self->_tuCallCenter;
  self->_tuCallCenter = v4;

  self->_tuPhoneCallState = [(CSTUPhoneCallStateMonitor *)self _fetchTUPhoneCallState];
  [(CSTUPhoneCallStateMonitor *)self _registerPhoneCallStateChangeNotifier];
}

- (CSTUPhoneCallStateMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSTUPhoneCallStateMonitor;
    id v4 = [(CSEventMonitor *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSTUPhoneCallStateMonitor queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;
    }
    self = v4;
    id v3 = self;
  }

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8150 != -1) {
    dispatch_once(&sharedInstance_onceToken_8150, &__block_literal_global_8151);
  }
  id v2 = (void *)sharedInstance_sharedInstance_8152;
  return v2;
}

uint64_t __43__CSTUPhoneCallStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_8152 = objc_alloc_init(CSTUPhoneCallStateMonitor);
  return MEMORY[0x1F41817F8]();
}

@end