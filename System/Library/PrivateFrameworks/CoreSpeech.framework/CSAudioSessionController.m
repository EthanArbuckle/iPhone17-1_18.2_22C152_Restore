@interface CSAudioSessionController
+ (id)sharedInstance;
- (BOOL)_createXPCClientConnectionIfNeeded;
- (BOOL)shouldKeepConnection;
- (CSAudioSessionController)init;
- (CSAudioSessionController)initWithEndpointId:(id)a3;
- (CSAudioSessionInfoProviding)sessionInfoProvider;
- (CSXPCClient)xpcClient;
- (NSHashTable)observers;
- (NSUUID)endpointId;
- (OS_dispatch_queue)queue;
- (unsigned)_getAudioSessionID;
- (unsigned)getAudioSessionID;
- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4;
- (void)_audioRouteChanged:(id)a3;
- (void)_handleInterruption:(id)a3;
- (void)_mediaServicesWereLost:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_registerAudioRouteChangeNotification;
- (void)_registerInterruptionNotification;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_teardownXPCClientIfNeeded;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)coreSpeechDaemonStateMonitor:(id)a3 didReceiveStateChanged:(unint64_t)a4;
- (void)dealloc;
- (void)getAudioSessionIDWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setEndpointId:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionInfoProvider:(id)a3;
- (void)setShouldKeepConnection:(BOOL)a3;
- (void)setXpcClient:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAudioSessionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_sessionInfoProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEndpointId:(id)a3
{
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (void)setShouldKeepConnection:(BOOL)a3
{
  self->_shouldKeepConnection = a3;
}

- (BOOL)shouldKeepConnection
{
  return self->_shouldKeepConnection;
}

- (void)setXpcClient:(id)a3
{
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setSessionInfoProvider:(id)a3
{
}

- (CSAudioSessionInfoProviding)sessionInfoProvider
{
  return self->_sessionInfoProvider;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)coreSpeechDaemonStateMonitor:(id)a3 didReceiveStateChanged:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__CSAudioSessionController_coreSpeechDaemonStateMonitor_didReceiveStateChanged___block_invoke;
  v5[3] = &unk_1E658D3C8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __80__CSAudioSessionController_coreSpeechDaemonStateMonitor_didReceiveStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40) == 1)
  {
    v2 = *MEMORY[0x1E4F5D158];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAudioSessionController coreSpeechDaemonStateMonitor:didReceiveStateChanged:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeech Daemon reset notification", buf, 0xCu);
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionOwnerResetNotification:", *(void *)(a1 + 32), 0, (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSAudioSessionController_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CSAudioSessionController_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioSessionController:didReceiveAudioSessionOwnerLostNotification:", *(void *)(a1 + 32), 0, (void)v10);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }

  v8 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s reset sessionInfoProvider since xpcClient disconnected", buf, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_teardownXPCClientIfNeeded", (void)v10);
}

- (void)_teardownXPCClientIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    uint64_t v4 = *MEMORY[0x1E4F5D158];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[CSAudioSessionController _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
      xpcClient = self->_xpcClient;
    }
    [(CSXPCClient *)xpcClient setDelegate:0];
    uint64_t v5 = [(CSAudioSessionController *)self sessionInfoProvider];
    [v5 unregisterObserver:self];

    uint64_t v6 = self->_xpcClient;
    self->_xpcClient = 0;

    [(CSAudioSessionController *)self setSessionInfoProvider:self->_xpcClient];
  }
}

- (void)_audioRouteChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CSAudioSessionController__audioRouteChanged___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__CSAudioSessionController__audioRouteChanged___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[CSAudioSessionController _audioRouteChanged:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *(void *)(a1 + 32);
          long long v10 = objc_msgSend(*(id *)(a1 + 40), "userInfo", (void)v11);
          [v8 audioSessionController:v9 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_mediaServicesWereReset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CSAudioSessionController__mediaServicesWereReset___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__CSAudioSessionController__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[CSAudioSessionController _mediaServicesWereReset:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *(void *)(a1 + 32);
          long long v10 = objc_msgSend(*(id *)(a1 + 40), "userInfo", (void)v12);
          [v8 audioSessionController:v9 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) _registerInterruptionNotification];
  return [*(id *)(a1 + 32) _registerAudioRouteChangeNotification];
}

- (void)_mediaServicesWereLost:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CSAudioSessionController__mediaServicesWereLost___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__CSAudioSessionController__mediaServicesWereLost___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[CSAudioSessionController _mediaServicesWereLost:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *(void *)(a1 + 32);
          long long v10 = objc_msgSend(*(id *)(a1 + 40), "userInfo", (void)v11);
          [v8 audioSessionController:v9 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_handleInterruption:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CSAudioSessionController__handleInterruption___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__CSAudioSessionController__handleInterruption___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[CSAudioSessionController _handleInterruption:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *(void *)(a1 + 32);
          long long v10 = objc_msgSend(*(id *)(a1 + 40), "userInfo", (void)v11);
          [v8 audioSessionController:v9 didReceiveAudioSessionInterruptionNotificationWithUserInfo:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_registerAudioRouteChangeNotification
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[CSAudioSessionController _registerAudioRouteChangeNotification]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_registerInterruptionNotification
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[CSAudioSessionController _registerInterruptionNotification]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_stopMonitoring
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSAudioSessionController _stopMonitoring]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v4, 0xCu);
  }
  [(CSAudioSessionController *)self setShouldKeepConnection:0];
}

- (void)_startMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSAudioSessionController _startMonitoring]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v5, 0xCu);
  }
  [(CSAudioSessionController *)self setShouldKeepConnection:1];
  [(CSAudioSessionController *)self _createXPCClientConnectionIfNeeded];
  int v4 = +[CSCoreSpeechDaemonStateMonitor sharedInstance];
  [v4 addObserver:self];
}

- (BOOL)_createXPCClientConnectionIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_xpcClient) {
    goto LABEL_3;
  }
  int v3 = [[CSXPCClient alloc] initWithType:2];
  xpcClient = self->_xpcClient;
  self->_xpcClient = v3;

  [(CSAudioSessionController *)self setSessionInfoProvider:self->_xpcClient];
  int v5 = [(CSAudioSessionController *)self sessionInfoProvider];
  [v5 registerObserver:self];

  [(CSXPCClient *)self->_xpcClient setDelegate:self];
  [(CSXPCClient *)self->_xpcClient connect];
  if (self->_xpcClient)
  {
LABEL_3:
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F5D158];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      int v9 = 136315138;
      long long v10 = "-[CSAudioSessionController _createXPCClientConnectionIfNeeded]";
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s audioProvider not exist", (uint8_t *)&v9, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __122__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWi"
          "thUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __121__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWit"
          "hUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __111__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionRouteChangeNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __111__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionRouteChangeNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __112__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unsigned)getAudioSessionID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CSAudioSessionController_getAudioSessionID__block_invoke;
  v5[3] = &unk_1E658D438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__CSAudioSessionController_getAudioSessionID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getAudioSessionID];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)_getAudioSessionID
{
  [(CSAudioSessionController *)self _createXPCClientConnectionIfNeeded];
  endpointId = self->_endpointId;
  if (endpointId)
  {
    uint64_t v4 = [(NSUUID *)endpointId UUIDString];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(CSAudioSessionController *)self sessionInfoProvider];
  unsigned int v6 = [v5 audioSessionIdForDeviceId:v4];

  return v6;
}

- (void)getAudioSessionIDWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__CSAudioSessionController_getAudioSessionIDWithCompletion___block_invoke;
    v7[3] = &unk_1E658D3A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __60__CSAudioSessionController_getAudioSessionIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _getAudioSessionID];
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);
  return v3(v1, v2, 0);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__CSAudioSessionController_unregisterObserver___block_invoke;
    v7[3] = &unk_1E658D4B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __47__CSAudioSessionController_unregisterObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (!result)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    return [v3 _stopMonitoring];
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__CSAudioSessionController_registerObserver___block_invoke;
    v7[3] = &unk_1E658D4B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __45__CSAudioSessionController_registerObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result == 1)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    return [v3 _startMonitoring];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)*MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSAudioSessionController dealloc]";
    __int16 v9 = 2114;
    long long v10 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@ deallocated", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioSessionController;
  [(CSAudioSessionController *)&v6 dealloc];
}

- (CSAudioSessionController)initWithEndpointId:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioSessionController;
  uint64_t v5 = [(CSAudioSessionController *)&v14 init];
  if (v5)
  {
    objc_super v6 = dispatch_get_global_queue(33, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("CSAudioSessionController Queue", 0, v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v9;

    uint64_t v11 = [v4 copy];
    endpointId = v5->_endpointId;
    v5->_endpointId = (NSUUID *)v11;
  }
  return v5;
}

- (CSAudioSessionController)init
{
  return [(CSAudioSessionController *)self initWithEndpointId:0];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_545 != -1) {
    dispatch_once(&sharedInstance_onceToken_545, &__block_literal_global_546);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __42__CSAudioSessionController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSAudioSessionController);
  uint64_t v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

@end