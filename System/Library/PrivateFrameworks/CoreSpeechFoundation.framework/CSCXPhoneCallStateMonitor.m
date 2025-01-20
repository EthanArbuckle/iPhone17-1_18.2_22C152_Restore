@interface CSCXPhoneCallStateMonitor
+ (id)sharedInstance;
- (BOOL)firstPartyCall;
- (CSCXPhoneCallStateMonitor)init;
- (CXCallObserver)callObserver;
- (TUCallProviderManager)tuCallProviderManager;
- (unint64_t)phoneCallState;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)setCallObserver:(id)a3;
- (void)setTuCallProviderManager:(id)a3;
@end

@implementation CSCXPhoneCallStateMonitor

- (unint64_t)phoneCallState
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(CXCallObserver *)self->_callObserver calls];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v32 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v19;
    *(void *)&long long v3 = 136316162;
    long long v16 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          int v10 = [v7 hasConnected];
          int v11 = [v7 isOnHold];
          int v12 = [v7 hasEnded];
          int v13 = [v7 isOutgoing];
          *(_DWORD *)buf = v16;
          v23 = "-[CSCXPhoneCallStateMonitor phoneCallState]";
          __int16 v24 = 1024;
          int v25 = v10;
          __int16 v26 = 1024;
          int v27 = v11;
          __int16 v28 = 1024;
          int v29 = v12;
          __int16 v30 = 1024;
          int v31 = v13;
          _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Call : [connected:%d] [onhold:%d] [hasEnd:%d] [isOutputgoing:%d]", buf, 0x24u);
        }
        if (objc_msgSend(v7, "hasEnded", v16))
        {
          unint64_t v14 = 1;
          goto LABEL_23;
        }
        if ([v7 isOutgoing] && !objc_msgSend(v7, "hasConnected"))
        {
          unint64_t v14 = 4;
          goto LABEL_23;
        }
        if (([v7 hasConnected] & 1) == 0
          && ([v7 hasEnded] & 1) == 0
          && ([v7 isOnHold] & 1) == 0
          && ![v7 isOutgoing])
        {
          unint64_t v14 = 2;
          goto LABEL_23;
        }
        if ([v7 hasConnected])
        {
          unint64_t v14 = 3;
          goto LABEL_23;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v32 count:16];
      unint64_t v14 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_23:

  return v14;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3591 != -1) {
    dispatch_once(&sharedInstance_onceToken_3591, &__block_literal_global_3592);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_3593;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuCallProviderManager, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

- (void)setTuCallProviderManager:(id)a3
{
}

- (TUCallProviderManager)tuCallProviderManager
{
  return self->_tuCallProviderManager;
}

- (void)setCallObserver:(id)a3
{
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (BOOL)firstPartyCall
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(CXCallObserver *)self->_callObserver calls];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    char v6 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = [v8 providerIdentifier];
        int v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[CSCXPhoneCallStateMonitor firstPartyCall]";
          __int16 v24 = 2112;
          int v25 = v9;
          _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Call : [providerIdentifier: %@]", buf, 0x16u);
        }
        if (!v9)
        {
          char v6 = 0;
          goto LABEL_18;
        }
        int v11 = [(TUCallProviderManager *)self->_tuCallProviderManager providerWithIdentifier:v9];
        int v12 = v11;
        if (v11)
        {
          if (([v11 isSystemProvider] & 1) == 0)
          {
            int v13 = (void *)CSLogContextFacilityCoreSpeech;
            char v6 = 0;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v14 = v13;
              v15 = [v8 providerIdentifier];
              *(_DWORD *)buf = 136315394;
              v23 = "-[CSCXPhoneCallStateMonitor firstPartyCall]";
              __int16 v24 = 2112;
              int v25 = v15;
              _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Call identifier is not first party: %@", buf, 0x16u);

              char v6 = 0;
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v6 = 1;
  }
LABEL_18:

  return v6 & 1;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = a4;
    int v9 = [v8 hasConnected];
    int v10 = [v8 isOnHold];
    int v11 = [v8 hasEnded];
    int v12 = [v8 isOutgoing];

    *(_DWORD *)buf = 136316162;
    v15 = "-[CSCXPhoneCallStateMonitor callObserver:callChanged:]";
    __int16 v16 = 1024;
    int v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 1024;
    int v23 = v12;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Received Call Observer Input : [connected:%d] [onhold:%d] [hasEnd:%d] [isOutputgoing:%d]", buf, 0x24u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__CSCXPhoneCallStateMonitor_callObserver_callChanged___block_invoke;
  v13[3] = &unk_1E6201240;
  v13[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v13];
}

void __54__CSCXPhoneCallStateMonitor_callObserver_callChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) notifyObserver:v3];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "phoneCallState"));
  }
}

- (void)_stopMonitoring
{
  callObserver = self->_callObserver;
  if (callObserver)
  {
    self->_callObserver = 0;
  }
  tuCallProviderManager = self->_tuCallProviderManager;
  if (tuCallProviderManager)
  {
    self->_tuCallProviderManager = 0;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  if (!self->_callObserver)
  {
    id v9 = v4;
    uint64_t v5 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F191A0]);
    callObserver = self->_callObserver;
    self->_callObserver = v5;

    [(CXCallObserver *)self->_callObserver setDelegate:self queue:0];
    id v4 = v9;
  }
  if (!self->_tuCallProviderManager)
  {
    id v10 = v4;
    v7 = (TUCallProviderManager *)objc_alloc_init(MEMORY[0x1E4FADAB8]);
    tuCallProviderManager = self->_tuCallProviderManager;
    self->_tuCallProviderManager = v7;

    id v4 = v10;
  }
}

- (CSCXPhoneCallStateMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSCXPhoneCallStateMonitor;
    self = [(CSEventMonitor *)&v5 init];
    id v3 = self;
  }

  return v3;
}

uint64_t __43__CSCXPhoneCallStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3593 = objc_alloc_init(CSCXPhoneCallStateMonitor);
  return MEMORY[0x1F41817F8]();
}

@end