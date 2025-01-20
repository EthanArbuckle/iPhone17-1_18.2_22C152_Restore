@interface CSDeviceActivationEventNotificationHandler
+ (id)sharedInstance;
- (BOOL)_hasPendingActivationForType:(unint64_t)a3;
- (BOOL)_isVoiceTriggerEvent:(id)a3;
- (CSDeviceActivationEvent)pendingActivationEvent;
- (CSDeviceActivationEventNotificationHandler)init;
- (NSMapTable)delegates;
- (OS_dispatch_queue)queue;
- (id)pendingCompletion;
- (void)_notifyActivationEvent:(id)a3 completion:(id)a4;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)notifyActivationEvent:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3 forType:(unint64_t)a4;
- (void)setDelegates:(id)a3;
- (void)setPendingActivationEvent:(id)a3;
- (void)setPendingCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CSDeviceActivationEventNotificationHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingActivationEvent, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setPendingCompletion:(id)a3
{
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingActivationEvent:(id)a3
{
}

- (CSDeviceActivationEvent)pendingActivationEvent
{
  return self->_pendingActivationEvent;
}

- (void)setDelegates:(id)a3
{
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_hasPendingActivationForType:(unint64_t)a3
{
  pendingActivationEvent = self->_pendingActivationEvent;
  if (pendingActivationEvent)
  {
    if ([(CSDeviceActivationEvent *)pendingActivationEvent type] == a3)
    {
      uint64_t v5 = mach_absolute_time();
      unint64_t v6 = v5 - [(CSDeviceActivationEvent *)self->_pendingActivationEvent hosttime];
      LODWORD(v7) = 5.0;
      LOBYTE(pendingActivationEvent) = v6 <= +[CSFTimeUtils secondsToHostTime:v7];
    }
    else
    {
      LOBYTE(pendingActivationEvent) = 0;
    }
  }
  return (char)pendingActivationEvent;
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSDeviceActivationEventNotificationHandler _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AOP First Pass trigger", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSDeviceActivationEventNotificationHandler _startMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AOP First Pass trigger", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)_isVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  BOOL v5 = v4 == 1;
  if ([v3 type] == 2)
  {
    unint64_t v6 = [v3 deviceId];

    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v4 == 1;
    }
    BOOL v5 = v7;
  }
  if ([v3 type] == 6)
  {
    v8 = [v3 deviceId];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if ([v3 type] == 8)
  {
    v10 = [v3 deviceId];

    if (v10) {
      BOOL v9 = 1;
    }
  }

  return v9 || v5;
}

- (void)_notifyActivationEvent:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void))a4;
  if ([(CSDeviceActivationEventNotificationHandler *)self _isVoiceTriggerEvent:v7])
  {
    delegates = self->_delegates;
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "type"));
    v11 = [(NSMapTable *)delegates objectForKey:v10];

    if (!v11)
    {
      pendingActivationEvent = self->_pendingActivationEvent;
      if (pendingActivationEvent)
      {
        v13 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          v15 = [(CSDeviceActivationEvent *)pendingActivationEvent localizedDescription];
          *(_DWORD *)buf = 136315394;
          v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
          __int16 v34 = 2114;
          v35 = v15;
          _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Returning error for already existing pending activation event : %{public}@", buf, 0x16u);
        }
        pendingCompletion = (void (**)(id, void, void *))self->_pendingCompletion;
        if (pendingCompletion)
        {
          v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:601 userInfo:0];
          pendingCompletion[2](pendingCompletion, 0, v17);

          id v18 = self->_pendingCompletion;
          self->_pendingCompletion = 0;
        }
      }
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
        _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s No delegate registered : Postpone activation event handling until we have delegate registered", buf, 0xCu);
      }
      objc_storeStrong((id *)&self->_pendingActivationEvent, a3);
      v20 = (void *)MEMORY[0x1BA9E7570](v8);
      id v21 = self->_pendingCompletion;
      self->_pendingCompletion = v20;

      v22 = [(CSDeviceActivationEvent *)self->_pendingActivationEvent UUID];
      dispatch_time_t v23 = dispatch_time(0, 5000000000);
      queue = self->_queue;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __80__CSDeviceActivationEventNotificationHandler__notifyActivationEvent_completion___block_invoke;
      v30[3] = &unk_1E6201030;
      v30[4] = self;
      id v31 = v22;
      id v25 = v22;
      dispatch_after(v23, queue, v30);

      goto LABEL_14;
    }
LABEL_13:
    [v11 activationEventNotificationHandler:self event:v7 completion:v8];
LABEL_14:

    goto LABEL_15;
  }
  if ([v7 type] == 3)
  {
    v26 = self->_delegates;
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "type"));
    v11 = [(NSMapTable *)v26 objectForKey:v27];

    goto LABEL_13;
  }
  if ([v7 type] == 7)
  {
    v28 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
      _os_log_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_DEFAULT, "%s corespeechd received mediaserverd launched event", buf, 0xCu);
    }
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
  else if (v8)
  {
    v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:114 userInfo:0];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v29);
  }
LABEL_15:
}

void __80__CSDeviceActivationEventNotificationHandler__notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) UUID];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  uint64_t v4 = CSLogContextFacilityCoreSpeech;
  BOOL v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 136315394;
      v14 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Pending Timeout fired for %{public}@ returning error for timeout", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 32);
    if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:602 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 32);
      *(void *)(v10 + 32) = 0;

      uint64_t v7 = *(void *)(a1 + 32);
    }
    v12 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
  else if (v5)
  {
    int v13 = 136315138;
    v14 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s There is no pending activation event to timeout", (uint8_t *)&v13, 0xCu);
  }
}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CSDeviceActivationEventNotificationHandler_notifyActivationEvent_completion___block_invoke;
  block[3] = &unk_1E61FFFB8;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __79__CSDeviceActivationEventNotificationHandler_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    BOOL v5 = [v3 localizedDescription];
    int v7 = 136315394;
    uint64_t v8 = "-[CSDeviceActivationEventNotificationHandler notifyActivationEvent:completion:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event in CoreSpeechDaemon: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(a1 + 40) _notifyActivationEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)setDelegate:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSDeviceActivationEventNotificationHandler_setDelegate_forType___block_invoke;
  block[3] = &unk_1E6200148;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __66__CSDeviceActivationEventNotificationHandler_setDelegate_forType___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  [v3 setObject:v2 forKey:v4];

  if ([*(id *)(a1 + 32) _hasPendingActivationForType:*(void *)(a1 + 48)])
  {
    BOOL v5 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(*(void *)(a1 + 32) + 24);
      int v7 = v5;
      id v8 = [v6 localizedDescription];
      int v13 = 136315394;
      id v14 = "-[CSDeviceActivationEventNotificationHandler setDelegate:forType:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Found pending activation : %{public}@, handle pending activation immediately", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) activationEventNotificationHandler:*(void *)(a1 + 32) event:*(void *)(*(void *)(a1 + 32) + 24) completion:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = 0;
  }
}

- (void)stop
{
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  if (CSHasAOP_hasAOP)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__CSDeviceActivationEventNotificationHandler_stop__block_invoke;
    block[3] = &unk_1E6201288;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __50__CSDeviceActivationEventNotificationHandler_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoring];
}

- (void)start
{
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  if (CSHasAOP_hasAOP)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__CSDeviceActivationEventNotificationHandler_start__block_invoke;
    block[3] = &unk_1E6201288;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __51__CSDeviceActivationEventNotificationHandler_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoring];
}

- (void)dealloc
{
  [(CSDeviceActivationEventNotificationHandler *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)CSDeviceActivationEventNotificationHandler;
  [(CSDeviceActivationEventNotificationHandler *)&v3 dealloc];
}

- (CSDeviceActivationEventNotificationHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSDeviceActivationEventNotificationHandler;
  uint64_t v2 = [(CSDeviceActivationEventNotificationHandler *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSDeviceActivationEventNotificationHandler Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSMapTable *)v5;

    pendingActivationEvent = v2->_pendingActivationEvent;
    v2->_pendingActivationEvent = 0;

    id pendingCompletion = v2->_pendingCompletion;
    v2->_id pendingCompletion = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_452 != -1) {
    dispatch_once(&sharedInstance_onceToken_452, &__block_literal_global_453);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_454;
  return v2;
}

uint64_t __60__CSDeviceActivationEventNotificationHandler_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_454 = objc_alloc_init(CSDeviceActivationEventNotificationHandler);
  return MEMORY[0x1F41817F8]();
}

@end