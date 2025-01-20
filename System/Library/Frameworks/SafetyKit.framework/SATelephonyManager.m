@interface SATelephonyManager
- (BOOL)callFailed;
- (BOOL)callInProgress;
- (OS_dispatch_queue)callQueue;
- (SATelephonyDelegateProtocol)delegate;
- (SATelephonyManager)initWithQueue:(id)a3;
- (TUCall)call;
- (void)_callStatusChanged:(id)a3;
- (void)_canPlaceNewCall:(id)a3;
- (void)_currentCallEnded;
- (void)_currentCallEndedWithUpdatedFailureStatus:(BOOL)a3;
- (void)handleCallChanged:(id)a3 force:(BOOL)a4;
- (void)placeVoiceCall:(id)a3 completionHandler:(id)a4;
- (void)setCall:(id)a3;
- (void)setCallFailed:(BOOL)a3;
- (void)setCallInProgress:(BOOL)a3;
- (void)setCallQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SATelephonyManager

- (SATelephonyManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SATelephonyManager;
  v6 = [(SATelephonyManager *)&v9 init];
  if (v6)
  {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__callStatusChanged_ name:*MEMORY[0x263F7E310] object:0];
    objc_storeStrong((id *)&v6->_callQueue, a3);
  }
  return v6;
}

id __36__SATelephonyManager_initWithQueue___block_invoke()
{
  return (id)[MEMORY[0x263F7E1A0] sharedInstance];
}

- (void)placeVoiceCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SATelephonyManager placeVoiceCall:completionHandler:]((uint64_t)v6, v8, v9);
  }

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke;
  v12[3] = &unk_2651C91C8;
  objc_copyWeak(&v15, &location);
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  [(SATelephonyManager *)self _canPlaceNewCall:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (a2)
  {
    [WeakRetained setCallInProgress:1];
    [v6 setCallFailed:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F7E248]) initWithType:2 value:*(void *)(a1 + 32)];
    id v8 = objc_alloc_init(MEMORY[0x263F7E1B0]);
    uint64_t v9 = [v8 defaultProvider];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F7E230]) initWithProvider:v9];
    [v10 setHandle:v7];
    [v10 setShowUIPrompt:0];
    [v10 setPreferDefaultApp:0];
    int v11 = [v10 isValid];
    v12 = sa_default_log();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_cold_1();
      }

      id v14 = sa_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v10 URL];
        *(_DWORD *)buf = 136315395;
        v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke";
        __int16 v42 = 2113;
        v43 = v15;
        _os_log_impl(&dword_245182000, v14, OS_LOG_TYPE_DEFAULT, "%s - request is valid, request.URL: %{private}@", buf, 0x16u);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_8;
      block[3] = &unk_2651C91A0;
      id v36 = v10;
      objc_copyWeak(&v38, v4);
      id v37 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v38);
      v16 = v36;
    }
    else
    {
      v27 = v9;
      v29 = v7;
      v30 = v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v10 URL];
        *(_DWORD *)buf = 136315650;
        v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke_4";
        __int16 v42 = 2112;
        v43 = v10;
        __int16 v44 = 2112;
        v45 = v18;
        _os_log_impl(&dword_245182000, v13, OS_LOG_TYPE_DEFAULT, "%s - request is not valid, request: %@, request.URL: %@", buf, 0x20u);
      }
      id v28 = v8;

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v19 = [v10 validityErrors];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * v23);
            v25 = sa_default_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke";
              __int16 v42 = 2112;
              v43 = v24;
              _os_log_error_impl(&dword_245182000, v25, OS_LOG_TYPE_ERROR, "%s - unable to place voice call, error: %@", buf, 0x16u);
            }

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v21);
      }

      uint64_t v26 = *(void *)(a1 + 40);
      v16 = +[SAError errorWithCode:3];
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v16);
      id v7 = v29;
      id v6 = v30;
      uint64_t v9 = v27;
      id v8 = v28;
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    id v7 = +[SAError errorWithCode:4];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v7);
  }
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_8(uint64_t a1)
{
  v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_2;
  v4[3] = &unk_2651C9178;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  [v2 dialWithRequest:v3 completion:v4];

  objc_destroyWeak(&v6);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained callQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_3;
  block[3] = &unk_2651C9150;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCall:*(void *)(a1 + 32)];
  [WeakRetained handleCallChanged:*(void *)(a1 + 32) force:1];
  (*(void (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0, 0);
}

- (void)_currentCallEndedWithUpdatedFailureStatus:(BOOL)a3
{
  objc_initWeak(&location, self);
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SATelephonyManager__currentCallEndedWithUpdatedFailureStatus___block_invoke;
  block[3] = &unk_2651C91F0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(callQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __64__SATelephonyManager__currentCallEndedWithUpdatedFailureStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCallFailed:*(unsigned __int8 *)(a1 + 40)];
  [WeakRetained _currentCallEnded];
}

- (void)_currentCallEnded
{
  objc_initWeak(&location, self);
  callQueue = self->_callQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SATelephonyManager__currentCallEnded__block_invoke;
  v4[3] = &unk_2651C9218;
  objc_copyWeak(&v5, &location);
  dispatch_async(callQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__SATelephonyManager__currentCallEnded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained callInProgress])
  {
    [WeakRetained setCallInProgress:0];
    [WeakRetained setCall:0];
    v1 = [WeakRetained delegate];
    if ([WeakRetained callFailed]) {
      uint64_t v2 = 3;
    }
    else {
      uint64_t v2 = 2;
    }
    [v1 telephonyManager:WeakRetained didUpdateVoiceCallStatus:v2];
  }
}

- (void)_canPlaceNewCall:(id)a3
{
  id v4 = a3;
  if (+[SAGestalt inAirplaneMode])
  {
    callQueue = self->_callQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke;
    block[3] = &unk_2651C9240;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(callQueue, block);
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke_13;
    v8[3] = &unk_2651C9268;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __39__SATelephonyManager__canPlaceNewCall___block_invoke(uint64_t a1)
{
  uint64_t v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__SATelephonyManager__canPlaceNewCall___block_invoke_cold_1(v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v3 = [v2 currentCalls];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained callQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke_2;
  block[3] = &unk_2651C9150;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 136315138;
    long long v16 = v5;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      id v10 = objc_msgSend(WeakRetained, "call", v16, (void)v17);
      if (![v9 isEqualToCall:v10]) {
        break;
      }
      int v11 = [v9 status];

      if (v11 != 6) {
        goto LABEL_12;
      }
      v12 = sa_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        uint64_t v22 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke_2";
        _os_log_impl(&dword_245182000, v12, OS_LOG_TYPE_DEFAULT, "%s - current call out of sync, cleaning up", buf, 0xCu);
      }

      [WeakRetained _currentCallEnded];
LABEL_13:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

LABEL_12:
    if ([v9 status] != 6)
    {
      id v14 = sa_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        uint64_t v22 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
        _os_log_impl(&dword_245182000, v14, OS_LOG_TYPE_DEFAULT, "%s - cannot place new call because there is already a call in progress", buf, 0xCu);
      }

      char v13 = 0;
      goto LABEL_19;
    }
    goto LABEL_13;
  }
LABEL_15:
  char v13 = 1;
LABEL_19:

  id v15 = sa_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __39__SATelephonyManager__canPlaceNewCall___block_invoke_2_cold_1(v13, v15);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleCallChanged:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SATelephonyManager_handleCallChanged_force___block_invoke;
  v8[3] = &unk_2651C9290;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  BOOL v11 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (id *)(a1 + 32);
  id v3 = *(void **)(a1 + 32);
  long long v5 = [WeakRetained call];
  int v6 = [v3 isEqualToCall:v5];

  id v7 = sa_default_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*v4 handle];
      id v10 = [v9 value];
      int v30 = 136315394;
      long long v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
      __int16 v32 = 2112;
      long long v33 = v10;
      _os_log_impl(&dword_245182000, v8, OS_LOG_TYPE_DEFAULT, "%s - we found our call, call: %@", (uint8_t *)&v30, 0x16u);
    }
    BOOL v11 = [WeakRetained call];
    int v12 = [v11 status];
    if (v12 == [*v4 status])
    {
      int v13 = *(unsigned __int8 *)(a1 + 48);

      if (!v13)
      {
        uint64_t v8 = sa_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_1(v4, v8);
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    uint64_t v8 = [WeakRetained delegate];
    int v14 = [*v4 status];
    switch(v14)
    {
      case 1:
        uint64_t v21 = sa_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [*v4 handle];
          uint64_t v23 = [v22 value];
          int v30 = 136315650;
          long long v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          __int16 v32 = 2112;
          long long v33 = v23;
          __int16 v34 = 2048;
          uint64_t v35 = 1;
          _os_log_impl(&dword_245182000, v21, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);
        }
        [WeakRetained setCallFailed:0];
        long long v18 = v8;
        id v19 = WeakRetained;
        uint64_t v20 = 1;
        goto LABEL_20;
      case 6:
        uint64_t v24 = sa_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [*v4 handle];
          uint64_t v26 = [v25 value];
          int v27 = [WeakRetained callFailed];
          int v30 = 136315650;
          long long v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          uint64_t v28 = 2;
          if (v27) {
            uint64_t v28 = 3;
          }
          __int16 v32 = 2112;
          long long v33 = v26;
          __int16 v34 = 2048;
          uint64_t v35 = v28;
          _os_log_impl(&dword_245182000, v24, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);
        }
        objc_msgSend(WeakRetained, "_currentCallEndedWithUpdatedFailureStatus:", objc_msgSend(*v4, "sa_hasFailed"));
        break;
      case 3:
        id v15 = sa_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = [*v4 handle];
          long long v17 = [v16 value];
          int v30 = 136315650;
          long long v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          __int16 v32 = 2112;
          long long v33 = v17;
          __int16 v34 = 2048;
          uint64_t v35 = 0;
          _os_log_impl(&dword_245182000, v15, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);
        }
        long long v18 = v8;
        id v19 = WeakRetained;
        uint64_t v20 = 0;
LABEL_20:
        [v18 telephonyManager:v19 didUpdateVoiceCallStatus:v20];
        break;
      default:
        v29 = sa_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_2(v4, v29);
        }

        break;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_3((id *)(a1 + 32), v8);
  }
LABEL_29:
}

- (void)_callStatusChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  long long v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SATelephonyManager _callStatusChanged:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_245182000, v5, OS_LOG_TYPE_DEFAULT, "%s, call: %@", (uint8_t *)&v6, 0x16u);
  }

  [(SATelephonyManager *)self handleCallChanged:v4 force:0];
}

- (SATelephonyDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SATelephonyDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)callInProgress
{
  return self->_callInProgress;
}

- (void)setCallInProgress:(BOOL)a3
{
  self->_callInProgress = a3;
}

- (BOOL)callFailed
{
  return self->_callFailed;
}

- (void)setCallFailed:(BOOL)a3
{
  self->_callFailed = a3;
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (OS_dispatch_queue)callQueue
{
  return self->_callQueue;
}

- (void)setCallQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callQueue, 0);
  objc_storeStrong((id *)&self->_call, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)placeVoiceCall:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315395;
  uint64_t v4 = "-[SATelephonyManager placeVoiceCall:completionHandler:]";
  __int16 v5 = 2113;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_1(&dword_245182000, a2, a3, "%s, phoneNumberString: %{private}@", (uint8_t *)&v3);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_245182000, v0, v1, "%s - request is valid, request: %@", (uint8_t *)v2);
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
  _os_log_debug_impl(&dword_245182000, log, OS_LOG_TYPE_DEBUG, "%s - unable to place voice call, in airplane mode", (uint8_t *)&v1, 0xCu);
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s, result: %d", (uint8_t *)&v2, 0x12u);
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __int16 v4 = [*a1 handle];
  int v5 = [v4 value];
  int v6 = [*a1 status];
  int v7 = 136315650;
  __int16 v8 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s - ignoring status for call since it didn't change, call: %@, status: %lu", (uint8_t *)&v7, 0x20u);
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 handle];
  __int16 v4 = [v3 value];
  v6[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_245182000, a2, v5, "%s - unhandled status for call, call: %@", (uint8_t *)v6);
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_3(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 callUUID];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_245182000, a2, v4, "%s - ignoring status for non-current call, call: %@", (uint8_t *)v5);
}

@end