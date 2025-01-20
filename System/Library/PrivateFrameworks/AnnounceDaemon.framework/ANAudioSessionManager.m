@interface ANAudioSessionManager
- (ANAudioSessionManager)initWithAudioSession:(id)a3 queue:(id)a4 endpointID:(id)a5;
- (ANTelephonyObserver)telephonyObserver;
- (ANTimer)activationRetryTimer;
- (ANTimer)callEndTimer;
- (ANTimer)deactivationTimer;
- (AVAudioSession)audioSession;
- (BOOL)activateAudioSessionWithError:(id *)a3;
- (BOOL)canRetryAudioSessionActivation;
- (NSUUID)endpointUUID;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)makeTimerIdentifier;
- (id)waitForCallEndCompletion;
- (void)_activateAudioSessionWithCompletionHandler:(id)a3;
- (void)_deactivateAudioSession;
- (void)activateAudioSessionWithCompletionHandler:(id)a3;
- (void)deactivateAudioSessionAfterDelay:(double)a3;
- (void)dealloc;
- (void)observer:(id)a3 didUpdateActiveCallStatus:(BOOL)a4;
- (void)setActivationRetryTimer:(id)a3;
- (void)setCallEndTimer:(id)a3;
- (void)setCanRetryAudioSessionActivation:(BOOL)a3;
- (void)setDeactivationTimer:(id)a3;
- (void)setWaitForCallEndCompletion:(id)a3;
- (void)startCallEndTimer;
@end

@implementation ANAudioSessionManager

- (ANAudioSessionManager)initWithAudioSession:(id)a3 queue:(id)a4 endpointID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ANAudioSessionManager;
  v12 = [(ANAudioSessionManager *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioSession, a3);
    if (v10)
    {
      v14 = (OS_dispatch_queue *)v10;
      queue = v13->_queue;
      v13->_queue = v14;
    }
    else
    {
      v16 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
      queue = v13->_queue;
      v13->_queue = v16;
    }

    ANLogBuildCategoryName();
    uint64_t v18 = ANLogWithCategory();
    log = v13->_log;
    v13->_log = (OS_os_log *)v18;

    objc_storeStrong((id *)&v13->_endpointUUID, a5);
    v20 = [[ANTelephonyObserver alloc] initWithQueue:v13->_queue];
    telephonyObserver = v13->_telephonyObserver;
    v13->_telephonyObserver = v20;

    id waitForCallEndCompletion = v13->_waitForCallEndCompletion;
    v13->_id waitForCallEndCompletion = 0;

    callEndTimer = v13->_callEndTimer;
    v13->_callEndTimer = 0;
  }
  return v13;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_DEBUG, "Released", v1, 2u);
}

- (BOOL)activateAudioSessionWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [(ANAudioSessionManager *)self deactivationTimer];

  if (v5)
  {
    v6 = [(ANAudioSessionManager *)self deactivationTimer];
    [v6 cancel];

    [(ANAudioSessionManager *)self setActivationRetryTimer:0];
    v7 = [(ANAudioSessionManager *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Canceled pending audio session deactivation", (uint8_t *)&v20, 2u);
    }
  }
  v8 = [(ANAudioSessionManager *)self audioSession];
  char v9 = [v8 setActive:1 error:a3];

  id v10 = [(ANAudioSessionManager *)self log];
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(ANAudioSessionManager *)self audioSession];
      int v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Activated Audio Session %@", (uint8_t *)&v20, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ANAudioSessionManager activateAudioSessionWithError:]((uint64_t)a3, v11, v13, v14, v15, v16, v17, v18);
  }

  return v9;
}

- (void)activateAudioSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ANAudioSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ANAudioSessionManager_activateAudioSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BCE168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__ANAudioSessionManager_activateAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanRetryAudioSessionActivation:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _activateAudioSessionWithCompletionHandler:v3];
}

- (void)deactivateAudioSessionAfterDelay:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(ANAudioSessionManager *)self deactivationTimer];

  if (v5)
  {
    id v6 = [(ANAudioSessionManager *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Request to deactivate audio session when deactivation already in progress. Ignoring.", buf, 2u);
    }
  }
  else
  {
    v7 = [(ANAudioSessionManager *)self log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 <= 0.0)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Will deactivate audio session immediately", buf, 2u);
      }

      [(ANAudioSessionManager *)self _deactivateAudioSession];
    }
    else
    {
      if (v8)
      {
        char v9 = [NSNumber numberWithDouble:a3];
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v9;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Will deactivate audio session in (%@) seconds", buf, 0xCu);
      }
      id v10 = (void *)MEMORY[0x1E4F4A938];
      id v11 = [(ANAudioSessionManager *)self makeTimerIdentifier];
      v12 = [v10 timerWithLabel:@"AudioSessionDeactivation" identifier:v11];
      [(ANAudioSessionManager *)self setDeactivationTimer:v12];

      objc_initWeak((id *)buf, self);
      uint64_t v13 = [(ANAudioSessionManager *)self deactivationTimer];
      uint64_t v14 = [(ANAudioSessionManager *)self queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58__ANAudioSessionManager_deactivateAudioSessionAfterDelay___block_invoke;
      v15[3] = &unk_1E6BCDE80;
      objc_copyWeak(&v16, (id *)buf);
      [v13 startWithValue:v14 queue:v15 handler:a3];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __58__ANAudioSessionManager_deactivateAudioSessionAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained deactivationTimer];
  [v1 cancel];

  [WeakRetained setDeactivationTimer:0];
  [WeakRetained _deactivateAudioSession];
}

- (id)makeTimerIdentifier
{
  v2 = [(ANAudioSessionManager *)self endpointUUID];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
  }
  v5 = v4;

  return v5;
}

- (void)_activateAudioSessionWithCompletionHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ANAudioSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ANAudioSessionManager *)self endpointUUID];
  if (v6)
  {
    v7 = [(ANAudioSessionManager *)self endpointUUID];
    int v8 = objc_msgSend(v7, "an_isLocalDevice");

    if (!v8) {
      goto LABEL_7;
    }
  }
  char v9 = [(ANAudioSessionManager *)self telephonyObserver];
  int v10 = [v9 hasCalls];

  if (v10)
  {
    id v11 = [(ANAudioSessionManager *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = _Block_copy(v4);
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "There is an active call, wait for call to end then call completion handler: %@", buf, 0xCu);
    }
    [(ANAudioSessionManager *)self setWaitForCallEndCompletion:v4];
  }
  else
  {
LABEL_7:
    id v35 = 0;
    [(ANAudioSessionManager *)self activateAudioSessionWithError:&v35];
    id v13 = v35;
    if ([v13 code] == 561017449
      && [(ANAudioSessionManager *)self canRetryAudioSessionActivation])
    {
      uint64_t v14 = [MEMORY[0x1E4F4A8E0] sharedInstance];
      uint64_t v15 = [v14 numberForDefault:*MEMORY[0x1E4F4A5F0]];
      [v15 doubleValue];
      double v17 = v16;

      uint64_t v18 = [(ANAudioSessionManager *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ANAudioSessionManager _activateAudioSessionWithCompletionHandler:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      v26 = [(ANAudioSessionManager *)self activationRetryTimer];
      [v26 cancel];

      [(ANAudioSessionManager *)self setCanRetryAudioSessionActivation:0];
      v27 = (void *)MEMORY[0x1E4F4A938];
      v28 = [(ANAudioSessionManager *)self makeTimerIdentifier];
      v29 = [v27 timerWithLabel:@"AudioSessionActivationRetry" identifier:v28];
      [(ANAudioSessionManager *)self setActivationRetryTimer:v29];

      objc_initWeak((id *)buf, self);
      v30 = [(ANAudioSessionManager *)self activationRetryTimer];
      v31 = [(ANAudioSessionManager *)self queue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __68__ANAudioSessionManager__activateAudioSessionWithCompletionHandler___block_invoke;
      v32[3] = &unk_1E6BCE190;
      objc_copyWeak(&v34, (id *)buf);
      id v33 = v4;
      [v30 startWithValue:v31 queue:v32 handler:v17];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*((void (**)(id, id))v4 + 2))(v4, v13);
    }
  }
}

void __68__ANAudioSessionManager__activateAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activateAudioSessionWithCompletionHandler:*(void *)(a1 + 32)];
  v2 = [WeakRetained activationRetryTimer];
  [v2 cancel];
}

- (void)_deactivateAudioSession
{
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, a2, a3, "Failed to deactivate Audio Session. Error = %@", a5, a6, a7, a8, 2u);
}

- (void)setWaitForCallEndCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ANAudioSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ANAudioSessionManager *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (ANTimer *)_Block_copy(self->_waitForCallEndCompletion);
    int v8 = _Block_copy(v4);
    int v19 = 138412546;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Set wait for call end completion \n old handler: %@ \n new handler: %@", (uint8_t *)&v19, 0x16u);
  }
  char v9 = [(ANAudioSessionManager *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    callEndTimer = self->_callEndTimer;
    int v19 = 138412290;
    uint64_t v20 = callEndTimer;
    _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Call end timer set to nil [%@]", (uint8_t *)&v19, 0xCu);
  }

  id v11 = self->_callEndTimer;
  self->_callEndTimer = 0;

  id waitForCallEndCompletion = self->_waitForCallEndCompletion;
  if (v4)
  {
    if (waitForCallEndCompletion)
    {
      id v13 = [(ANAudioSessionManager *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (ANTimer *)_Block_copy(self->_waitForCallEndCompletion);
        uint64_t v15 = _Block_copy(v4);
        int v19 = 138412546;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "Existing call end completion handler, replacing with new handler.\n old handler: %@ \n new handler: %@", (uint8_t *)&v19, 0x16u);
      }
      double v16 = (void (**)(id, void *))self->_waitForCallEndCompletion;
      double v17 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:", 1018);
      v16[2](v16, v17);
    }
    [(ANAudioSessionManager *)self startCallEndTimer];
    uint64_t v18 = _Block_copy(v4);
    id waitForCallEndCompletion = self->_waitForCallEndCompletion;
  }
  else
  {
    uint64_t v18 = 0;
  }
  self->_id waitForCallEndCompletion = v18;
}

- (void)startCallEndTimer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ANAudioSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1E4F4A938];
  v5 = [(ANAudioSessionManager *)self makeTimerIdentifier];
  id v6 = [v4 timerWithLabel:@"CallEndTimer" identifier:v5];
  callEndTimer = self->_callEndTimer;
  self->_callEndTimer = v6;

  int v8 = [(ANAudioSessionManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [(ANAudioSessionManager *)self callEndTimer];
    *(_DWORD *)buf = 138412290;
    int v19 = v9;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Call End Timer Created [%@]", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  int v10 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v11 = [v10 numberForDefault:*MEMORY[0x1E4F4A608]];
  [v11 doubleValue];
  double v13 = v12;

  uint64_t v14 = self->_callEndTimer;
  uint64_t v15 = [(ANAudioSessionManager *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__ANAudioSessionManager_startCallEndTimer__block_invoke;
  v16[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v17, (id *)buf);
  [(ANTimer *)v14 startWithValue:v15 queue:v16 handler:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __42__ANAudioSessionManager_startCallEndTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [WeakRetained callEndTimer];
    *(_DWORD *)buf = 138412290;
    char v9 = v3;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "Call End Timer Fired [%@]", buf, 0xCu);
  }
  id v4 = [WeakRetained waitForCallEndCompletion];

  if (v4)
  {
    id v7 = 0;
    [WeakRetained activateAudioSessionWithError:&v7];
    id v5 = v7;
    id v6 = [WeakRetained waitForCallEndCompletion];
    ((void (**)(void, id))v6)[2](v6, v5);

    [WeakRetained setWaitForCallEndCompletion:0];
  }
}

- (void)observer:(id)a3 didUpdateActiveCallStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = [(ANAudioSessionManager *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v12 = v4;
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "CallIsActive changed to %d", buf, 8u);
  }

  id v7 = [(ANAudioSessionManager *)self waitForCallEndCompletion];

  if (v7)
  {
    if (!v4)
    {
      id v10 = 0;
      [(ANAudioSessionManager *)self activateAudioSessionWithError:&v10];
      id v8 = v10;
      char v9 = [(ANAudioSessionManager *)self waitForCallEndCompletion];
      ((void (**)(void, id))v9)[2](v9, v8);

      [(ANAudioSessionManager *)self setWaitForCallEndCompletion:0];
    }
  }
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (OS_os_log)log
{
  return self->_log;
}

- (ANTimer)deactivationTimer
{
  return self->_deactivationTimer;
}

- (void)setDeactivationTimer:(id)a3
{
}

- (ANTimer)activationRetryTimer
{
  return self->_activationRetryTimer;
}

- (void)setActivationRetryTimer:(id)a3
{
}

- (BOOL)canRetryAudioSessionActivation
{
  return self->_canRetryAudioSessionActivation;
}

- (void)setCanRetryAudioSessionActivation:(BOOL)a3
{
  self->_canRetryAudioSessionActivation = a3;
}

- (ANTelephonyObserver)telephonyObserver
{
  return self->_telephonyObserver;
}

- (id)waitForCallEndCompletion
{
  return self->_waitForCallEndCompletion;
}

- (ANTimer)callEndTimer
{
  return self->_callEndTimer;
}

- (void)setCallEndTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callEndTimer, 0);
  objc_storeStrong(&self->_waitForCallEndCompletion, 0);
  objc_storeStrong((id *)&self->_telephonyObserver, 0);
  objc_storeStrong((id *)&self->_activationRetryTimer, 0);
  objc_storeStrong((id *)&self->_deactivationTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)activateAudioSessionWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_activateAudioSessionWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end