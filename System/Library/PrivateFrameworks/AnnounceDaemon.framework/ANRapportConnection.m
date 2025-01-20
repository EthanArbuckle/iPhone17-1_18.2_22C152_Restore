@interface ANRapportConnection
+ (id)sharedConnection;
- (ANRapportConnection)init;
- (ANRapportConnectionDelegate)delegate;
- (BOOL)_needsScan;
- (BOOL)isTimerSuspended;
- (NSArray)activeDevices;
- (NSArray)devices;
- (NSDate)lastScanStartTimestamp;
- (NSMapTable)deviceDelegatesToQueues;
- (NSMutableDictionary)clients;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)rapportQueue;
- (OS_dispatch_source)timer;
- (RPCompanionLinkClient)companionLinkClient;
- (RPCompanionLinkDevice)localDevice;
- (double)_remainingScanTimeInterval;
- (id)activateLinkWithOptions:(unint64_t)a3;
- (id)sendMessage:(id)a3 device:(id)a4 responseHandler:(id)a5;
- (void)_cancelTimer;
- (void)_decrementMessageCountForCompanionLinkClient:(id)a3;
- (void)_executeBlockForDelegates:(id)a3;
- (void)_handleLinkInvalidation;
- (void)_handleTimerExpired;
- (void)_incrementMessageCountForCompanionLinkClient:(id)a3;
- (void)_linkForDevice:(id)a3 handler:(id)a4;
- (void)_notifyDeviceDelegatesConnectionDidFindDevice:(id)a3;
- (void)_notifyDeviceDelegatesConnectionDidLoseDevice:(id)a3;
- (void)_registerHandlers;
- (void)_registerHomeLocationStatusRequestHandler;
- (void)_registerMessageRequestHandler;
- (void)_sendDailyRequest:(id)a3 handler:(id)a4;
- (void)_sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4;
- (void)_sendMessage:(id)a3 linkClient:(id)a4 handler:(id)a5;
- (void)_setupLink:(id)a3;
- (void)_simulateDeliveryFailureForMessage:(id)a3;
- (void)_startTimer;
- (void)_tearDownLink;
- (void)_updateDevices;
- (void)activateLinkWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)addDeviceDelegate:(id)a3 queue:(id)a4;
- (void)deactivateLinkWithOptions:(unint64_t)a3;
- (void)registerDailyRequest:(id)a3;
- (void)sendDailyRequest:(id)a3 handler:(id)a4;
- (void)sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4;
- (void)setActiveDevices:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setClients:(id)a3;
- (void)setCompanionLinkClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsTimerSuspended:(BOOL)a3;
- (void)setLastScanStartTimestamp:(id)a3;
- (void)setRapportQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation ANRapportConnection

- (ANRapportConnection)init
{
  v21.receiver = self;
  v21.super_class = (Class)ANRapportConnection;
  v2 = [(ANRapportConnection *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.announce.RapportMessageQueue", v3);
    rapportQueue = v2->_rapportQueue;
    v2->_rapportQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.announce.RapportClientQueue", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v8;

    activeDevices = v2->_activeDevices;
    v2->_activeDevices = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
    deviceDelegatesToQueues = v2->_deviceDelegatesToQueues;
    v2->_deviceDelegatesToQueues = (NSMapTable *)v11;

    v13 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    v14 = [v13 numberForDefault:*MEMORY[0x1E4F4A690]];
    [v14 doubleValue];
    double v16 = v15;

    uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v16];
    lastScanStartTimestamp = v2->_lastScanStartTimestamp;
    v2->_lastScanStartTimestamp = (NSDate *)v17;

    timer = v2->_timer;
    v2->_timer = 0;

    v2->_isTimerSuspended = 0;
  }
  return v2;
}

+ (id)sharedConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ANRapportConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, block);
  }
  v2 = (void *)sharedConnection_shared;
  return v2;
}

uint64_t __39__ANRapportConnection_sharedConnection__block_invoke()
{
  sharedConnection_shared = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (RPCompanionLinkDevice)localDevice
{
  v2 = [(ANRapportConnection *)self companionLinkClient];
  v3 = [v2 localDevice];

  return (RPCompanionLinkDevice *)v3;
}

- (NSArray)devices
{
  v2 = [(ANRapportConnection *)self activeDevices];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)activateLinkWithOptions:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Activate Rapport link started.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  dispatch_queue_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ANRapportConnection_activateLinkWithOptions___block_invoke;
  v11[3] = &unk_1E6BCE3F8;
  p_long long buf = &buf;
  v7 = v6;
  v12 = v7;
  [(ANRapportConnection *)self activateLinkWithOptions:a3 completion:v11];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 138412290;
    double v15 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Activate Rapport link finished.", v14, 0xCu);
  }

  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v9;
}

void __47__ANRapportConnection_activateLinkWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    dispatch_queue_t v4 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = &stru_1F34A0E10;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@.", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)activateLinkWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(ANRapportConnection *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke;
  block[3] = &unk_1E6BCEBF8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 48) & 4) != 0)
  {
    [*(id *)(a1 + 32) setIsTimerSuspended:1];
    [*(id *)(a1 + 32) _cancelTimer];
  }
  v2 = [*(id *)(a1 + 32) companionLinkClient];

  if (!v2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v12 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v29 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@### Forcing Link Active", buf, 0xCu);
      }
    }
    else if (([*(id *)(a1 + 32) _needsScan] & 1) == 0)
    {
      unint64_t v11 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v29 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@### No scan needed.", buf, 0xCu);
      }

      goto LABEL_16;
    }
    v13 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v29 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@### Will activate link", buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastScanStartTimestamp:v14];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_23;
    v26[3] = &unk_1E6BCE1C0;
    id v27 = *(id *)(a1 + 40);
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v26);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_24;
    v22[3] = &unk_1E6BCEBD0;
    id v23 = v15;
    double v16 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v24 = v17;
    uint64_t v25 = v18;
    id v19 = v15;
    [v16 _setupLink:v22];

    id v10 = v27;
    goto LABEL_23;
  }
  id v3 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v29 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@### Rapport Link Already Active", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _startTimer];
  [*(id *)(a1 + 32) _remainingScanTimeInterval];
  if (v4 <= 0.0 || (*(unsigned char *)(a1 + 48) & 2) == 0)
  {
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  double v5 = v4;
  id v6 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    v29 = &stru_1F34A0E10;
    __int16 v30 = 2048;
    double v31 = v5;
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@### Waiting %fl seconds for scan to complete", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_25;
  block[3] = &unk_1E6BCE1C0;
  id v21 = *(id *)(a1 + 40);
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  id v9 = dispatch_get_global_queue(2, 0);
  dispatch_after(v8, v9, v7);

  id v10 = v21;
LABEL_23:
}

uint64_t __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_23(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    double v5 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler post-scan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ANLogHandleRapportConnection();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = &stru_1F34A0E10;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@.", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    if (dispatch_block_testcancel(v6))
    {
      dispatch_block_t v7 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@### Activation handler already called. Skipping.", (uint8_t *)&v16, 0xCu);
      }

      goto LABEL_18;
    }
    dispatch_block_cancel(v6);
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_16:
    v9();
    goto LABEL_18;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Rapport Link Activated", (uint8_t *)&v16, 0xCu);
  }

  if ((*(unsigned char *)(a1 + 48) & 2) != 0)
  {
    id v10 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    unint64_t v11 = [v10 numberForDefault:*MEMORY[0x1E4F4A698]];
    [v11 doubleValue];
    double v13 = v12;

    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    dispatch_block_t v15 = dispatch_get_global_queue(2, 0);
    dispatch_after(v14, v15, *(dispatch_block_t *)(a1 + 32));

    goto LABEL_18;
  }
  if (!dispatch_block_testcancel(*(dispatch_block_t *)(a1 + 32)))
  {
    dispatch_time_t v8 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler immediately", (uint8_t *)&v16, 0xCu);
    }

    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_16;
  }
LABEL_18:
}

uint64_t __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_25(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    double v5 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler post-scan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateLinkWithOptions:(unint64_t)a3
{
  double v5 = [(ANRapportConnection *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ANRapportConnection_deactivateLinkWithOptions___block_invoke;
  v6[3] = &unk_1E6BCEC20;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __49__ANRapportConnection_deactivateLinkWithOptions___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if ((v2 & 2) != 0)
  {
    [*(id *)(result + 32) setIsTimerSuspended:0];
    result = [*(id *)(v1 + 32) _startTimer];
    uint64_t v2 = *(void *)(v1 + 40);
  }
  if (v2)
  {
    id v3 = *(void **)(v1 + 32);
    return [v3 _tearDownLink];
  }
  return result;
}

- (void)addDeviceDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dispatch_time_t v8 = [(ANRapportConnection *)self clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke;
  v11[3] = &unk_1E6BCE448;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    int v4 = v3;
  }
  else
  {
    int v4 = dispatch_get_global_queue(21, 0);
  }
  double v5 = v4;
  id v6 = [WeakRetained deviceDelegatesToQueues];
  [v6 setObject:v5 forKey:*(void *)(a1 + 40)];

  if (objc_opt_respondsToSelector())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [WeakRetained devices];
    uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke_2;
          block[3] = &unk_1E6BCDF90;
          id v14 = *(id *)(a1 + 40);
          id v15 = WeakRetained;
          uint64_t v16 = v11;
          dispatch_async(v5, block);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) connection:*(void *)(a1 + 40) didFindDevice:*(void *)(a1 + 48)];
}

- (id)sendMessage:(id)a3 device:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke;
  v14[3] = &unk_1E6BCEC98;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  uint64_t v16 = self;
  id v12 = v10;
  id v17 = v12;
  [(ANRapportConnection *)self _linkForDevice:v9 handler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 0;
}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v8 = [v7 BOOLForDefault:*MEMORY[0x1E4F4A648]];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _simulateDeliveryFailureForMessage:*(void *)(a1 + 32)];
  }
  else if (v5)
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_3;
    v17[3] = &unk_1E6BCEC70;
    id v19 = *(id *)(a1 + 48);
    objc_copyWeak(&v20, (id *)(a1 + 56));
    int8x16_t v15 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v15.i64[0];
    int8x16_t v18 = vextq_s8(v15, v15, 8uLL);
    [v10 _sendMessage:v11 linkClient:v5 handler:v17];

    objc_destroyWeak(&v20);
  }
  else
  {
    id v13 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_2;
    block[3] = &unk_1E6BCEC48;
    objc_copyWeak(&v24, (id *)(a1 + 56));
    int8x16_t v16 = *(int8x16_t *)(a1 + 32);
    id v14 = (id)v16.i64[0];
    int8x16_t v22 = vextq_s8(v16, v16, 8uLL);
    id v23 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(&v24);
  }
}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained delegate];
  [v2 connection:*(void *)(a1 + 32) failedDeliveryForMessage:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  if (v6)
  {
    int v8 = dispatch_get_global_queue(25, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_4;
    v10[3] = &unk_1E6BCEC48;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = v6;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v13);
  }
}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained delegate];
  [v2 connection:*(void *)(a1 + 32) failedDeliveryForMessage:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)sendDailyRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ANRapportConnection_sendDailyRequest_handler___block_invoke;
  v9[3] = &unk_1E6BCECC0;
  id v8 = v7;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(ANRapportConnection *)self _linkForDevice:v6 handler:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __48__ANRapportConnection_sendDailyRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _sendDailyRequest:v3 handler:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily failed to get link client to send daily request.", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)registerDailyRequest:(id)a3
{
  id v4 = a3;
  companionLinkClient = self->_companionLinkClient;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ANRapportConnection_registerDailyRequest___block_invoke;
  v7[3] = &unk_1E6BCECE8;
  id v8 = v4;
  id v6 = v4;
  [(RPCompanionLinkClient *)companionLinkClient registerRequestID:@"com.apple.announce.dailyanalytics" options:0 handler:v7];
}

void __44__ANRapportConnection_registerDailyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F947A8];
  id v7 = a4;
  id v8 = [a3 objectForKey:v6];
  id v9 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = &stru_1F34A0E10;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Daily Request from %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v10, 0, 0);
}

- (void)sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ANRapportConnection_sendHomeLocationStatusRequestToDevice_handler___block_invoke;
  v9[3] = &unk_1E6BCECC0;
  id v8 = v7;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(ANRapportConnection *)self _linkForDevice:v6 handler:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __69__ANRapportConnection_sendHomeLocationStatusRequestToDevice_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _sendHomeLocationStatusRequestToDevice:v3 handler:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@### Home Location Status Request failed to get link client", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_simulateDeliveryFailureForMessage:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Forcing Rapport Delivery Failure", (uint8_t *)&v8, 0xCu);
  }

  int v6 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E4F4A738], @"Force Delivery Failure Enabled in User Defaults");
  id v7 = [(ANRapportConnection *)self delegate];
  [v7 connection:self failedDeliveryForMessage:v4 withError:v6];
}

- (void)_setupLink:(id)a3
{
  id v4 = a3;
  [(ANRapportConnection *)self setActiveDevices:MEMORY[0x1E4F1CBF0]];
  [(ANRapportConnection *)self _tearDownLink];
  id v5 = (RPCompanionLinkClient *)objc_opt_new();
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v5;

  [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:self->_rapportQueue];
  [(RPCompanionLinkClient *)self->_companionLinkClient setControlFlags:2084];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __34__ANRapportConnection__setupLink___block_invoke;
  v18[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v19, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:v18];
  [(RPCompanionLinkClient *)self->_companionLinkClient setInterruptionHandler:&__block_literal_global_24];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__ANRapportConnection__setupLink___block_invoke_36;
  v16[3] = &unk_1E6BCED10;
  objc_copyWeak(&v17, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceFoundHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__ANRapportConnection__setupLink___block_invoke_38;
  v14[3] = &unk_1E6BCED10;
  objc_copyWeak(&v15, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceLostHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__ANRapportConnection__setupLink___block_invoke_39;
  v12[3] = &unk_1E6BCED38;
  objc_copyWeak(&v13, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceChangedHandler:v12];
  [(ANRapportConnection *)self _registerHandlers];
  id v7 = self->_companionLinkClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__ANRapportConnection__setupLink___block_invoke_41;
  v9[3] = &unk_1E6BCE9A0;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [(RPCompanionLinkClient *)v7 activateWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __34__ANRapportConnection__setupLink___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    id v4 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@### Rapport Connection Invalidated", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained _handleLinkInvalidation];
}

void __34__ANRapportConnection__setupLink___block_invoke_35()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    uint64_t v2 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v0, OS_LOG_TYPE_DEFAULT, "%@### Rapport Connection Interrupted", (uint8_t *)&v1, 0xCu);
  }
}

void __34__ANRapportConnection__setupLink___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 serviceTypes];
    int v7 = 138412802;
    id v8 = &stru_1F34A0E10;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@### Device Found: %@, Service Types: %@", (uint8_t *)&v7, 0x20u);
  }
  [WeakRetained _updateDevices];
  [WeakRetained _notifyDeviceDelegatesConnectionDidFindDevice:v3];
}

void __34__ANRapportConnection__setupLink___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@### Device Lost: %@", (uint8_t *)&v6, 0x16u);
  }

  [WeakRetained _updateDevices];
  [WeakRetained _notifyDeviceDelegatesConnectionDidLoseDevice:v3];
}

void __34__ANRapportConnection__setupLink___block_invoke_39(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 1024;
    int v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@### Device Changed (flags = %d): %@", (uint8_t *)&v8, 0x1Cu);
  }

  [WeakRetained _updateDevices];
  [WeakRetained _notifyDeviceDelegatesConnectionDidFindDevice:v5];
}

void __34__ANRapportConnection__setupLink___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = ANLogHandleRapportConnection();
  int v6 = v5;
  if (v3)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 138412546;
    int8x16_t v16 = &stru_1F34A0E10;
    __int16 v17 = 2112;
    id v18 = v3;
    int v7 = "%@### Error activating link '%@'";
    int v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 138412290;
    int8x16_t v16 = &stru_1F34A0E10;
    int v7 = "%@### Link activated succcessfully";
    int v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1DA5ED000, v8, v9, v7, buf, v10);
LABEL_7:

  [WeakRetained _startTimer];
  if (*(void *)(a1 + 32))
  {
    int v11 = [WeakRetained clientQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__ANRapportConnection__setupLink___block_invoke_42;
    v12[3] = &unk_1E6BCE560;
    id v14 = *(id *)(a1 + 32);
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

uint64_t __34__ANRapportConnection__setupLink___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_linkForDevice:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [(ANRapportConnection *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke;
  block[3] = &unk_1E6BCED88;
  objc_copyWeak(&v15, &location);
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = [WeakRetained clients];
  id v5 = [a1[4] identifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"Client"];
    int v8 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = &stru_1F34A0E10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@### Found existing link! %@", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__7;
    v34 = __Block_byref_object_dispose__7;
    id v35 = (id)objc_opt_new();
    [*(id *)(*(void *)&buf[8] + 40) setDestinationDevice:a1[4]];
    [*(id *)(*(void *)&buf[8] + 40) setDispatchQueue:WeakRetained[4]];
    [*(id *)(*(void *)&buf[8] + 40) setServiceType:*MEMORY[0x1E4F4A4D8]];
    id v9 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
    v30[0] = @"Client";
    v30[1] = @"Count";
    v31[0] = v10;
    int v11 = [NSNumber numberWithInt:0];
    v31[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    id v6 = [v9 dictionaryWithDictionary:v12];

    id v13 = [a1[5] clients];
    id v14 = [a1[4] identifier];
    [v13 setObject:v6 forKey:v14];

    id v15 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v26 = 138412546;
      id v27 = &stru_1F34A0E10;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "%@### Creating new link %@", v26, 0x16u);
    }

    __int16 v17 = *(void **)(*(void *)&buf[8] + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke_45;
    v20[3] = &unk_1E6BCED60;
    id v18 = a1[4];
    id v19 = a1[5];
    id v21 = v18;
    id v22 = v19;
    objc_copyWeak(&v25, v2);
    id v23 = a1[6];
    id v24 = buf;
    [v17 activateWithCompletion:v20];

    objc_destroyWeak(&v25);
    _Block_object_dispose(buf, 8);
  }
}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ANLogHandleRapportConnection();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 138412802;
      id v14 = &stru_1F34A0E10;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@### Failed to activate device: %@ with error %@", buf, 0x20u);
    }
    id v7 = [*(id *)(a1 + 40) clientQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke_46;
    v10[3] = &unk_1E6BCE1E8;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v7, v10);

    (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v3, v8);
    objc_destroyWeak(&v12);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 138412546;
      id v14 = &stru_1F34A0E10;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@### Successfully activated device: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke_46(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained clients];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 removeObjectForKey:v3];
}

- (void)_handleLinkInvalidation
{
  [(ANRapportConnection *)self _cancelTimer];
  [(ANRapportConnection *)self _tearDownLink];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(ANRapportConnection *)self setActiveDevices:v3];
}

- (void)_tearDownLink
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ANRapportConnection *)self companionLinkClient];
    int v6 = 138412546;
    id v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing Down Companion Link: %@", (uint8_t *)&v6, 0x16u);
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:0];
  [(RPCompanionLinkClient *)self->_companionLinkClient setInterruptionHandler:0];
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;
}

- (void)_registerHandlers
{
  [(ANRapportConnection *)self _registerMessageRequestHandler];
  [(ANRapportConnection *)self _registerHomeLocationStatusRequestHandler];
}

- (void)_registerMessageRequestHandler
{
  objc_initWeak(&location, self);
  companionLinkClient = self->_companionLinkClient;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke;
  v4[3] = &unk_1E6BCEE00;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(RPCompanionLinkClient *)companionLinkClient registerRequestID:@"com.apple.announce.announcement.message" options:0 handler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__ANRapportConnection__registerMessageRequestHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 objectForKey:*MEMORY[0x1E4F947A8]];
  uint64_t v10 = [MEMORY[0x1E4F4A930] senderWithID:v9 type:2];
  id v11 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v22 = &stru_1F34A0E10;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Message from %@", buf, 0x16u);
  }

  id v12 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_48;
  block[3] = &unk_1E6BCEDD8;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  void block[4] = *(void *)(a1 + 32);
  id v17 = v7;
  id v18 = v10;
  id v19 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v7;
  dispatch_async(v12, block);

  objc_destroyWeak(&v20);
}

void __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_2;
  v8[3] = &unk_1E6BCEDB0;
  id v9 = *(id *)(a1 + 56);
  [v3 connection:v4 didReceiveMessage:v5 fromSender:v6 senderContext:v7 handler:v8];
}

uint64_t __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerHomeLocationStatusRequestHandler
{
  objc_initWeak(&location, self);
  companionLinkClient = self->_companionLinkClient;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke;
  v4[3] = &unk_1E6BCEE00;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(RPCompanionLinkClient *)companionLinkClient registerRequestID:@"com.apple.announce.home-location-status-request" options:0 handler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F947A8]];
    *(_DWORD *)long long buf = 138412546;
    id v18 = &stru_1F34A0E10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Home Location Status Request from %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [WeakRetained delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke_52;
    block[3] = &unk_1E6BCE380;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    void block[4] = *(void *)(a1 + 32);
    id v15 = v7;
    dispatch_async(v13, block);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], 0, 0);
  }
}

void __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = [v3 connectionDidReceiveRequestForHomeLocationStatus:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateDevices
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ANRapportConnection *)self companionLinkClient];
  id v4 = [v3 activeDevices];
  id v5 = (void *)[v4 copy];
  [(ANRapportConnection *)self setActiveDevices:v5];

  id v6 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(ANRapportConnection *)self activeDevices];
    int v8 = 138412546;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2048;
    uint64_t v11 = [v7 count];
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@### Updated Devices (%lu)", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_incrementMessageCountForCompanionLinkClient:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ANRapportConnection__incrementMessageCountForCompanionLinkClient___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __68__ANRapportConnection__incrementMessageCountForCompanionLinkClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  uint64_t v3 = [*(id *)(a1 + 40) destinationDevice];
  id v4 = [v3 identifier];
  id v7 = [v2 objectForKey:v4];

  if (v7)
  {
    id v5 = [v7 objectForKey:@"Count"];
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    [v7 setObject:v6 forKey:@"Count"];
  }
}

- (void)_decrementMessageCountForCompanionLinkClient:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ANRapportConnection__decrementMessageCountForCompanionLinkClient___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __68__ANRapportConnection__decrementMessageCountForCompanionLinkClient___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  uint64_t v3 = [*(id *)(a1 + 40) destinationDevice];
  id v4 = [v3 identifier];
  id v5 = [v2 objectForKey:v4];

  if (v5)
  {
    id v6 = [v5 objectForKey:@"Count"];
    int v7 = [v6 intValue];
    if (v7 > 1)
    {
      id v14 = [NSNumber numberWithInt:(v7 - 1)];
      [v5 setObject:v14 forKey:@"Count"];
    }
    else
    {
      id v8 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [*(id *)(a1 + 40) destinationDevice];
        __int16 v10 = [v9 name];
        int v15 = 138412546;
        id v16 = &stru_1F34A0E10;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@### Invalidating and Removing Link For: %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v11 = [*(id *)(a1 + 32) clients];
      uint64_t v12 = [*(id *)(a1 + 40) destinationDevice];
      id v13 = [v12 identifier];
      [v11 removeObjectForKey:v13];

      [*(id *)(a1 + 40) invalidate];
    }
  }
}

- (void)_sendMessage:(id)a3 linkClient:(id)a4 handler:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ANRapportConnection *)self _incrementMessageCountForCompanionLinkClient:v9];
  objc_initWeak(&location, self);
  uint64_t v11 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  uint64_t v12 = [v11 numberForDefault:*MEMORY[0x1E4F4A6A8]];

  uint64_t v21 = *MEMORY[0x1E4F947C0];
  v22[0] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__ANRapportConnection__sendMessage_linkClient_handler___block_invoke;
  v16[3] = &unk_1E6BCEE28;
  id v14 = v9;
  id v17 = v14;
  objc_copyWeak(&v19, &location);
  id v15 = v10;
  id v18 = v15;
  [v14 sendRequestID:@"com.apple.announce.announcement.message" request:v8 options:v13 responseHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __55__ANRapportConnection__sendMessage_linkClient_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = ANLogHandleRapportConnection();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) destinationDevice];
      uint64_t v11 = [v10 name];
      int v15 = 138412802;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Send Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 32) destinationDevice];
      id v13 = [v12 name];
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Send Successful to: %@", (uint8_t *)&v15, 0x16u);
    }
    id v9 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _decrementMessageCountForCompanionLinkClient:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendDailyRequest:(id)a3 handler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(ANRapportConnection *)self _incrementMessageCountForCompanionLinkClient:v6];
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v9 = [v8 numberForDefault:*MEMORY[0x1E4F4A6A8]];

  uint64_t v18 = *MEMORY[0x1E4F947C0];
  v19[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__ANRapportConnection__sendDailyRequest_handler___block_invoke;
  v13[3] = &unk_1E6BCEE28;
  id v11 = v6;
  id v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v7;
  id v15 = v12;
  [v11 sendRequestID:@"com.apple.announce.dailyanalytics" request:MEMORY[0x1E4F1CC08] options:v10 responseHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__ANRapportConnection__sendDailyRequest_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = ANLogHandleRapportConnection();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) destinationDevice];
      id v11 = [v10 name];
      int v15 = 138412802;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Send Daily Request Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) destinationDevice];
      id v13 = [v12 name];
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Send Daily Request Successful to: %@", (uint8_t *)&v15, 0x16u);
    }
    id v9 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Daily Request Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _decrementMessageCountForCompanionLinkClient:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(ANRapportConnection *)self _incrementMessageCountForCompanionLinkClient:v6];
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v9 = [v8 numberForDefault:*MEMORY[0x1E4F4A6A0]];

  uint64_t v18 = *MEMORY[0x1E4F947C0];
  v19[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ANRapportConnection__sendHomeLocationStatusRequestToDevice_handler___block_invoke;
  v13[3] = &unk_1E6BCEE28;
  id v11 = v6;
  id v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v7;
  id v15 = v12;
  [v11 sendRequestID:@"com.apple.announce.home-location-status-request" request:MEMORY[0x1E4F1CC08] options:v10 responseHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __70__ANRapportConnection__sendHomeLocationStatusRequestToDevice_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = ANLogHandleRapportConnection();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) destinationDevice];
      id v11 = [v10 name];
      int v15 = 138412802;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Home Location Status Request Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) destinationDevice];
      id v13 = [v12 name];
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Home Location Status Request Successful to: %@", (uint8_t *)&v15, 0x16u);
    }
    id v9 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Home Location Status Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _decrementMessageCountForCompanionLinkClient:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_executeBlockForDelegates:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANRapportConnection *)self deviceDelegatesToQueues];
  id v6 = [v5 keyEnumerator];
  id v7 = [v6 allObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        id v13 = [(ANRapportConnection *)self deviceDelegatesToQueues];
        id v14 = [v13 objectForKey:v12];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__ANRapportConnection__executeBlockForDelegates___block_invoke;
        block[3] = &unk_1E6BCE560;
        id v15 = v4;
        void block[4] = v12;
        id v18 = v15;
        dispatch_async(v14, block);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

uint64_t __49__ANRapportConnection__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_notifyDeviceDelegatesConnectionDidFindDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidFindDevice___block_invoke;
  v6[3] = &unk_1E6BCEE50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ANRapportConnection *)self _executeBlockForDelegates:v6];
}

void __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidFindDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 connection:*(void *)(a1 + 32) didFindDevice:*(void *)(a1 + 40)];
  }
}

- (void)_notifyDeviceDelegatesConnectionDidLoseDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidLoseDevice___block_invoke;
  v6[3] = &unk_1E6BCEE50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ANRapportConnection *)self _executeBlockForDelegates:v6];
}

void __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidLoseDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 connection:*(void *)(a1 + 32) didLoseDevice:*(void *)(a1 + 40)];
  }
}

- (double)_remainingScanTimeInterval
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  id v6 = [(ANRapportConnection *)self lastScanStartTimestamp];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [(ANRapportConnection *)self activeDevices];
    uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    id v13 = [(ANRapportConnection *)self lastScanStartTimestamp];
    int v19 = 138413058;
    long long v20 = &stru_1F34A0E10;
    __int16 v21 = 2112;
    long long v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@### Active Device Count: %@, Scan Start: %@, Now: %@", (uint8_t *)&v19, 0x2Au);
  }
  id v14 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v15 = [v14 numberForDefault:*MEMORY[0x1E4F4A698]];
  [v15 doubleValue];
  double v17 = v16;

  return v17 - (v5 - v8);
}

- (BOOL)_needsScan
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_companionLinkClient)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSince1970];
    double v5 = v4;

    id v6 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    double v7 = [v6 numberForDefault:*MEMORY[0x1E4F4A698]];
    [v7 doubleValue];
    double v9 = v8;

    uint64_t v10 = [(ANRapportConnection *)self lastScanStartTimestamp];
    [v10 timeIntervalSince1970];
    double v12 = v9 + v11;

    if (v12 >= v5) {
      goto LABEL_6;
    }
    id v13 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(ANRapportConnection *)self lastScanStartTimestamp];
      int v27 = 138412546;
      __int16 v28 = &stru_1F34A0E10;
      __int16 v29 = 2112;
      __int16 v30 = v14;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@### Last Scan Completion: %@", (uint8_t *)&v27, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    double v16 = [v15 numberForDefault:*MEMORY[0x1E4F4A690]];
    [v16 doubleValue];
    double v18 = v17;

    double v19 = v5 - v12;
    if (v19 > v18)
    {
      uint64_t v24 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [NSNumber numberWithDouble:v19];
        v26 = [NSNumber numberWithDouble:v18];
        int v27 = 138412802;
        __int16 v28 = &stru_1F34A0E10;
        __int16 v29 = 2112;
        __int16 v30 = v25;
        __int16 v31 = 2112;
        uint64_t v32 = v26;
        _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_DEFAULT, "%@### Needs Scan. Elapsed time (%@) since last scan exceeds scan interval (%@)", (uint8_t *)&v27, 0x20u);
      }
    }
    else
    {
LABEL_6:
      long long v20 = [(ANRapportConnection *)self activeDevices];
      __int16 v21 = [v20 activeDevicesSupportingAnnounce];
      uint64_t v22 = [v21 count];

      if (v22) {
        return 0;
      }
      uint64_t v24 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        __int16 v28 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_DEFAULT, "%@### Needs Scan. No devices.", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  return 1;
}

- (void)_startTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(ANRapportConnection *)self isTimerSuspended])
  {
    id v3 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v26 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@### Ignoring request to start timer. Timer is suspended.", buf, 0xCu);
    }
  }
  else
  {
    double v4 = [(ANRapportConnection *)self timer];

    if (v4)
    {
      [(ANRapportConnection *)self _cancelTimer];
      double v5 = ANLogHandleRapportConnection();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v26 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@### Creating new deactivation timer", buf, 0xCu);
      }
    }
    id v6 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    double v7 = [v6 numberForDefault:*MEMORY[0x1E4F4A688]];
    [v7 doubleValue];
    double v9 = v8;

    uint64_t v10 = [(ANRapportConnection *)self clientQueue];
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
    [(ANRapportConnection *)self setTimer:v11];

    double v12 = [(ANRapportConnection *)self timer];
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, (unint64_t)(v9 * 1000000000.0), 0);

    objc_initWeak(&location, self);
    id v14 = [(ANRapportConnection *)self timer];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __34__ANRapportConnection__startTimer__block_invoke;
    uint64_t v22 = &unk_1E6BCDE80;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v14, &v19);

    id v15 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = objc_msgSend(NSNumber, "numberWithDouble:", v9, v19, v20, v21, v22);
        *(_DWORD *)long long buf = 138412546;
        v26 = &stru_1F34A0E10;
        __int16 v27 = 2112;
        __int16 v28 = v17;
        _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@### Will deactivate client link in (%@) seconds", buf, 0x16u);
      }
    }

    double v18 = [(ANRapportConnection *)self timer];
    dispatch_resume(v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __34__ANRapportConnection__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimerExpired];
}

- (void)_handleTimerExpired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = ANLogHandleRapportConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    double v5 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@### Deactivation timer expired", (uint8_t *)&v4, 0xCu);
  }

  [(ANRapportConnection *)self _cancelTimer];
  [(ANRapportConnection *)self _tearDownLink];
}

- (void)_cancelTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANRapportConnection *)self timer];

  if (v3)
  {
    int v4 = ANLogHandleRapportConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [(ANRapportConnection *)self timer];
      int v7 = 138412546;
      double v8 = &stru_1F34A0E10;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@### Removing client link deactivation timer %@", (uint8_t *)&v7, 0x16u);
    }
    uint64_t v6 = [(ANRapportConnection *)self timer];
    dispatch_source_cancel(v6);

    [(ANRapportConnection *)self setTimer:0];
  }
}

- (ANRapportConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANRapportConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (OS_dispatch_queue)rapportQueue
{
  return self->_rapportQueue;
}

- (void)setRapportQueue:(id)a3
{
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (NSArray)activeDevices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveDevices:(id)a3
{
}

- (NSDate)lastScanStartTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastScanStartTimestamp:(id)a3
{
}

- (NSMapTable)deviceDelegatesToQueues
{
  return self->_deviceDelegatesToQueues;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)isTimerSuspended
{
  return self->_isTimerSuspended;
}

- (void)setIsTimerSuspended:(BOOL)a3
{
  self->_isTimerSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_deviceDelegatesToQueues, 0);
  objc_storeStrong((id *)&self->_lastScanStartTimestamp, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end