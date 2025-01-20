@interface CSOtherAppRecordingStateMonitor
+ (id)sharedInstance;
- (BOOL)_isEntitledWithDecodedAuditToken:(id *)a3;
- (BOOL)isOtherNonEligibleAppRecording;
- (CSOtherAppRecordingStateMonitor)init;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingOtherAppRecordingState;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
- (void)handleOtherAppRecordingStateChange:(id)a3;
@end

@implementation CSOtherAppRecordingStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13327 != -1) {
    dispatch_once(&sharedInstance_onceToken_13327, &__block_literal_global_13328);
  }
  v2 = (void *)sharedInstance_sharedInstance_13329;
  return v2;
}

- (BOOL)isOtherNonEligibleAppRecording
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  v3 = [v2 attributeForKey:*MEMORY[0x1E4F74CC8]];
  if ([v3 count])
  {
    v22 = v3;
    v23 = v2;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v25 = 0;
      uint64_t v6 = *(void *)v29;
      v7 = (void *)MEMORY[0x1E4F74CD0];
      v8 = (void *)MEMORY[0x1E4F74CB0];
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "objectForKey:", *v7, v22, v23);
          v12 = [v10 objectForKey:*v8];
          v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            buf.val[0] = 136315650;
            *(void *)&buf.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
            LOWORD(buf.val[3]) = 2112;
            *(void *)((char *)&buf.val[3] + 2) = v11;
            HIWORD(buf.val[5]) = 2112;
            *(void *)&buf.val[6] = v12;
            _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s SessionId: %@ AuditToken: %@", (uint8_t *)&buf, 0x20u);
          }
          if (v12)
          {
            memset(&buf, 0, sizeof(buf));
            +[CSUtils getTokenFromDictionary:v10 withTokenKey:*v8];
            audit_token_t atoken = buf;
            pid_t v14 = audit_token_to_pid(&atoken);
            if (+[CSUtils processIdentifier] == v14)
            {
              v15 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                atoken.val[0] = 136315138;
                *(void *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Skip checking entitled as it is corespeechd pid", (uint8_t *)&atoken, 0xCu);
              }
            }
            else
            {
              uint64_t v26 = v14;
              audit_token_t atoken = buf;
              BOOL v17 = [(CSOtherAppRecordingStateMonitor *)self _isEntitledWithDecodedAuditToken:&atoken];
              v18 = CSLogContextFacilityCoreSpeech;
              BOOL v19 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
              if (!v17)
              {
                if (v19)
                {
                  atoken.val[0] = 136315394;
                  *(void *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                  LOWORD(atoken.val[3]) = 2048;
                  *(void *)((char *)&atoken.val[3] + 2) = v26;
                  _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Process %ld is not entitled!", (uint8_t *)&atoken, 0x16u);
                }

                BOOL v20 = 1;
                goto LABEL_28;
              }
              if (v19)
              {
                atoken.val[0] = 136315394;
                *(void *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                LOWORD(atoken.val[3]) = 2048;
                *(void *)((char *)&atoken.val[3] + 2) = v26;
                _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Process %ld is entitled", (uint8_t *)&atoken, 0x16u);
              }
            }
          }
          else
          {
            v16 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              buf.val[0] = 136315138;
              *(void *)&buf.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
              _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s There was no audit token", (uint8_t *)&buf, 0xCu);
            }
            char v25 = 1;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v25 = 0;
    }

    BOOL v20 = v25 & 1;
LABEL_28:
    v3 = v22;
    v2 = v23;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_isEntitledWithDecodedAuditToken:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12[16] = v4;
  BOOL v5 = +[CSUtils checkEntitlementForToken:v12 withEntitlement:@"com.apple.corespeech.supportheysiriwhenrecord"];
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12[16] = v6;
  if (+[CSUtils checkEntitlementForToken:v12 withEntitlement:@"com.apple.corespeech.supportheysiriwhenrecord.sae"])
  {
    int v7 = AFDeviceSupportsSystemAssistantExperience();
  }
  else
  {
    int v7 = 0;
  }
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"NO";
    *(void *)&v12[4] = "-[CSOtherAppRecordingStateMonitor _isEntitledWithDecodedAuditToken:]";
    if (v5) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    *(_DWORD *)v12 = 136315650;
    *(void *)&v12[14] = v10;
    *(_WORD *)&v12[12] = 2112;
    if (v7) {
      v9 = @"YES";
    }
    *(_WORD *)&v12[22] = 2112;
    *(void *)&v12[24] = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s isGeneralEntilementEntiled: %@, isSAEEntitlementEntiledOnSAEDevice: %@", v12, 0x20u);
  }
  return v5 | v7;
}

uint64_t __70__CSOtherAppRecordingStateMonitor_handleOtherAppRecordingStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)handleOtherAppRecordingStateChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CSOtherAppRecordingStateMonitor *)self isOtherNonEligibleAppRecording])
  {
    long long v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 136315138;
      int v7 = "-[CSOtherAppRecordingStateMonitor handleOtherAppRecordingStateChange:]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Another non eligible app is recording", buf, 0xCu);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__CSOtherAppRecordingStateMonitor_handleOtherAppRecordingStateChange___block_invoke;
  v5[3] = &unk_1E6201240;
  v5[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v5];
}

- (void)_startObservingSystemControllerLifecycle
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v4 = (uint64_t *)MEMORY[0x1E4F74E28];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E28] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  BOOL v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  long long v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  uint64_t v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel__systemControllerDied_ name:v7 object:v8];
}

- (void)_systemControllerDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSOtherAppRecordingStateMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSOtherAppRecordingStateMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSOtherAppRecordingStateMonitor *)self _startObservingOtherAppRecordingState];
  [(CSOtherAppRecordingStateMonitor *)self handleOtherAppRecordingStateChange:0];
}

- (void)_startObservingOtherAppRecordingState
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74CE0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74CE0] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  BOOL v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  __int16 v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel_handleOtherAppRecordingStateChange_ name:v7 object:v8];
}

- (void)_stopMonitoring
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CSOtherAppRecordingStateMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSOtherAppRecordingStateMonitor *)self _startObservingOtherAppRecordingState];
}

- (CSOtherAppRecordingStateMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSOtherAppRecordingStateMonitor;
    self = [(CSEventMonitor *)&v5 init];
    id v3 = self;
  }

  return v3;
}

uint64_t __49__CSOtherAppRecordingStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_13329 = objc_alloc_init(CSOtherAppRecordingStateMonitor);
  return MEMORY[0x1F41817F8]();
}

@end