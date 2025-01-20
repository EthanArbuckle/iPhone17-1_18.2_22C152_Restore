@interface CSVoiceTriggerXPCService
+ (id)sharedService;
- (CSVoiceTriggerXPCClient)xpcClient;
- (CSVoiceTriggerXPCService)init;
- (OS_dispatch_queue)queue;
- (id)_createXPCClientConnectionIfNeeded:(id)a3;
- (id)fetchVoiceTriggerDailyStats;
- (void)_teardownXPCClientIfNeeded;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 xpcClient:(id)a5;
- (void)notifyVoiceTriggeredSiriSessionCancelled;
- (void)notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5;
- (void)setQueue:(id)a3;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5;
- (void)setXpcClient:(id)a3;
- (void)voiceTriggerXPCClient:(id)a3 didDisconnect:(BOOL)a4;
@end

@implementation CSVoiceTriggerXPCService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setXpcClient:(id)a3
{
}

- (CSVoiceTriggerXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_teardownXPCClientIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    v4 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSVoiceTriggerXPCService _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
      xpcClient = self->_xpcClient;
    }
    [(CSVoiceTriggerXPCClient *)xpcClient setDelegate:0];
    v5 = self->_xpcClient;
    self->_xpcClient = 0;
  }
}

- (void)voiceTriggerXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerXPCService_voiceTriggerXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__CSVoiceTriggerXPCService_voiceTriggerXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSVoiceTriggerXPCService voiceTriggerXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s reset xpcClient since it disconnected", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _teardownXPCClientIfNeeded];
}

- (id)_createXPCClientConnectionIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (CSVoiceTriggerXPCClient *)v4;
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_14;
  }
  if (CSIsWatch())
  {
    xpcClient = self->_xpcClient;
    if (xpcClient)
    {
      v5 = xpcClient;
      goto LABEL_3;
    }
  }
  uint64_t v6 = objc_alloc_init(CSVoiceTriggerXPCClient);
  [(CSVoiceTriggerXPCClient *)v6 setDelegate:self];
  [(CSVoiceTriggerXPCClient *)v6 connect];
  if (v6)
  {
    if (CSIsWatch()) {
      [(CSVoiceTriggerXPCService *)self setXpcClient:v6];
    }
    uint64_t v8 = v6;
  }
  else
  {
    v9 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[CSVoiceTriggerXPCService _createXPCClientConnectionIfNeeded:]";
      _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s voiceTriggerXPC client not exist", (uint8_t *)&v11, 0xCu);
    }
  }

LABEL_14:
  return v6;
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
}

- (id)fetchVoiceTriggerDailyStats
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2160;
  v10 = __Block_byref_object_dispose__2161;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CSVoiceTriggerXPCService_fetchVoiceTriggerDailyStats__block_invoke;
  v5[3] = &unk_1E658D438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__CSVoiceTriggerXPCService_fetchVoiceTriggerDailyStats__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSVoiceTriggerXPCService fetchVoiceTriggerDailyStats]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:0];
  uint64_t v4 = [v3 fetchVoiceTriggerStats];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__CSVoiceTriggerXPCService_notifyVoiceTriggeredSiriSessionCancelledWithXpcClient___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __82__CSVoiceTriggerXPCService_notifyVoiceTriggeredSiriSessionCancelledWithXpcClient___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVoiceTriggerXPCService notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:*(void *)(a1 + 40)];
  [v3 notifyVoiceTriggeredSiriSessionCancelled];
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CSVoiceTriggerXPCService_setRaiseToSpeakBypassing_timeout_xpcClient___block_invoke;
  v11[3] = &unk_1E658AF70;
  BOOL v14 = a3;
  double v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __71__CSVoiceTriggerXPCService_setRaiseToSpeakBypassing_timeout_xpcClient___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = &stru_1F2396200;
    uint64_t v4 = *(void *)(a1 + 48);
    if (!*(unsigned char *)(a1 + 56)) {
      id v3 = @"NOT";
    }
    int v6 = 136315650;
    int v7 = "-[CSVoiceTriggerXPCService setRaiseToSpeakBypassing:timeout:xpcClient:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    __int16 v10 = 2050;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Requesting RTS %{public}@ bypass for %{public}lf seconds", (uint8_t *)&v6, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:*(void *)(a1 + 40)];
  [v5 setRaiseToSpeakBypassing:*(unsigned __int8 *)(a1 + 56) timeout:*(double *)(a1 + 48)];
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__CSVoiceTriggerXPCService_setPhraseSpotterBypassing_timeout_xpcClient___block_invoke;
  v11[3] = &unk_1E658AF70;
  v11[4] = self;
  id v12 = v8;
  BOOL v14 = a3;
  double v13 = a4;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __72__CSVoiceTriggerXPCService_setPhraseSpotterBypassing_timeout_xpcClient___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVoiceTriggerXPCService setPhraseSpotterBypassing:timeout:xpcClient:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:*(void *)(a1 + 40)];
  [v3 setPhraseSpotterBypassing:*(unsigned __int8 *)(a1 + 56) timeout:*(double *)(a1 + 48)];
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4
{
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 xpcClient:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CSVoiceTriggerXPCService_enableVoiceTrigger_withAssertion_xpcClient___block_invoke;
  v13[3] = &unk_1E658D488;
  v13[4] = self;
  id v14 = v9;
  BOOL v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

void __71__CSVoiceTriggerXPCService_enableVoiceTrigger_withAssertion_xpcClient___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSVoiceTriggerXPCService enableVoiceTrigger:withAssertion:xpcClient:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:*(void *)(a1 + 40)];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
  [v6 systemUptime];
  objc_msgSend(v3, "enableVoiceTrigger:withAssertion:timestamp:", v4, v5);
}

- (CSVoiceTriggerXPCService)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCService;
  v2 = [(CSVoiceTriggerXPCService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerXPCService Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_2180);
  }
  v2 = (void *)sharedService_sharedInstance;
  return v2;
}

void __41__CSVoiceTriggerXPCService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(CSVoiceTriggerXPCService);
  v1 = (void *)sharedService_sharedInstance;
  sharedService_sharedInstance = (uint64_t)v0;
}

@end