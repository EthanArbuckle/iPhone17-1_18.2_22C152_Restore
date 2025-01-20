@interface CCUISatelliteMonitor
- (BOOL)_shouldShowDisableOffGridModeButton;
- (BOOL)canShowDemo;
- (BOOL)isAnyServiceSupported;
- (BOOL)isDisconnecting;
- (BOOL)isMessagingServiceAvailable;
- (BOOL)isSupported;
- (BOOL)waitingForOffGridModeToDisableBeforeDisconnecting;
- (CCUISatelliteMonitor)initWithQueue:(id)a3;
- (CCUISatelliteMonitorDelegate)delegate;
- (CTStewieStateMonitor)stewieStateMonitor;
- (CoreTelephonyClient)client;
- (IDSOffGridStateManager)offGridStateManager;
- (OS_dispatch_queue)queue;
- (id)_satelliteServices;
- (int64_t)offGridMode;
- (int64_t)offGridModePublishStatus;
- (unint64_t)_calculateState;
- (unint64_t)state;
- (void)_disconnectFromSatelliteWithCompletion:(id)a3;
- (void)_manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6;
- (void)_reevaluateState;
- (void)disconnectFromSatellite;
- (void)notifyDelegateOfStateChange:(unint64_t)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setOffGridMode:(int64_t)a3;
- (void)setOffGridModePublishStatus:(int64_t)a3;
- (void)setOffGridStateManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStewieStateMonitor:(id)a3;
- (void)setWaitingForOffGridModeToDisableBeforeDisconnecting:(BOOL)a3;
- (void)start;
- (void)stateChanged:(id)a3;
- (void)turnOff;
@end

@implementation CCUISatelliteMonitor

- (CCUISatelliteMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CCUISatelliteMonitor;
  v6 = [(CCUISatelliteMonitor *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v5];
    client = v6->_client;
    v6->_client = (CoreTelephonyClient *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F23A60]) initWithDelegate:v6 queue:v5];
    stewieStateMonitor = v6->_stewieStateMonitor;
    v6->_stewieStateMonitor = (CTStewieStateMonitor *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F6AB58]) initWithQueue:v5 error:0];
    offGridStateManager = v6->_offGridStateManager;
    v6->_offGridStateManager = (IDSOffGridStateManager *)v11;

    [(IDSOffGridStateManager *)v6->_offGridStateManager setDelegate:v6];
    *(_OWORD *)&v6->_offGridMode = xmmword_1D7BBF740;
  }

  return v6;
}

- (BOOL)canShowDemo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(CTStewieStateMonitor *)self->_stewieStateMonitor getState];
  [(CCUISatelliteMonitor *)self _satelliteServices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "isDemoAllowedForService:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "integerValue", (void)v9)))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)start
{
  [(CTStewieStateMonitor *)self->_stewieStateMonitor start];

  [(CCUISatelliteMonitor *)self _reevaluateState];
}

- (void)turnOff
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F6AB50]);
  [v3 setEntryPointSource:@"ControlCenter"];
  [(CCUISatelliteMonitor *)self setWaitingForOffGridModeToDisableBeforeDisconnecting:1];
  offGridStateManager = self->_offGridStateManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CCUISatelliteMonitor_turnOff__block_invoke;
  v5[3] = &unk_1E6A8A580;
  objc_copyWeak(&v6, &location);
  [(IDSOffGridStateManager *)offGridStateManager setOffGridMode:1 options:v3 completion:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __31__CCUISatelliteMonitor_turnOff__block_invoke(uint64_t a1, void *a2, void *a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CCUISatelliteMonitor_turnOff__block_invoke_2;
  block[3] = &unk_1E6A8A318;
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = a2;
  v6[2] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v6);
}

void __31__CCUISatelliteMonitor_turnOff__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = *(void *)(a1 + 40);
    WeakRetained[9] = *(void *)(a1 + 48);
    id v3 = WeakRetained;
    [WeakRetained _reevaluateState];
    WeakRetained = v3;
  }
}

- (void)disconnectFromSatellite
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__CCUISatelliteMonitor_disconnectFromSatellite__block_invoke;
  v3[3] = &unk_1E6A8A5A8;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(CCUISatelliteMonitor *)self _disconnectFromSatelliteWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__CCUISatelliteMonitor_disconnectFromSatellite__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__CCUISatelliteMonitor_disconnectFromSatellite__block_invoke_2;
  v2[3] = &unk_1E6A8A278;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
}

void __47__CCUISatelliteMonitor_disconnectFromSatellite__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setWaitingForOffGridModeToDisableBeforeDisconnecting:0];
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v2);
    [v3 _reevaluateState];
  }
}

- (void)_disconnectFromSatelliteWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F23A40]);
  [v5 setReason:1];
  id v6 = [(CCUISatelliteMonitor *)self client];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CCUISatelliteMonitor__disconnectFromSatelliteWithCompletion___block_invoke;
  v8[3] = &unk_1E6A8A5D0;
  id v9 = v4;
  id v7 = v4;
  [v6 exitStewieWithContext:v5 completion:v8];
}

uint64_t __63__CCUISatelliteMonitor__disconnectFromSatelliteWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_satelliteServices
{
  return &unk_1F2F4B7D0;
}

- (BOOL)isSupported
{
  client = self->_client;
  uint64_t v7 = 0;
  id v3 = [(CoreTelephonyClient *)client getStewieSupport:&v7];
  id v4 = v3;
  if (v7) {
    char v5 = 0;
  }
  else {
    char v5 = [v3 hwSupport];
  }

  return v5;
}

- (BOOL)isAnyServiceSupported
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(CTStewieStateMonitor *)self->_stewieStateMonitor getState];
  [(CCUISatelliteMonitor *)self _satelliteServices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v3, "isAllowedService:", objc_msgSend(v9, "integerValue", (void)v12)) & 1) != 0
          || (objc_msgSend(v3, "isDemoAllowedForService:", objc_msgSend(v9, "integerValue")) & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (void)notifyDelegateOfStateChange:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained satelliteMonitor:self didChangeState:a3];
}

- (void)stateChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CCUISatelliteMonitor_stateChanged___block_invoke;
  block[3] = &unk_1E6A898F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __37__CCUISatelliteMonitor_stateChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reevaluateState];
}

- (void)_reevaluateState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CCUISatelliteMonitor *)self _calculateState];
  if (v3 != self->_state)
  {
    unint64_t v4 = v3;
    uint64_t v5 = *MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v8 = v4;
      _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "[Satellite] State changed to %lu", buf, 0xCu);
    }
    self->_state = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__CCUISatelliteMonitor__reevaluateState__block_invoke;
    id v6[3] = &unk_1E6A8A048;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __40__CCUISatelliteMonitor__reevaluateState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfStateChange:*(void *)(a1 + 40)];
}

- (unint64_t)_calculateState
{
  if ([(CCUISatelliteMonitor *)self isAnyServiceSupported])
  {
    unint64_t v3 = [(CTStewieStateMonitor *)self->_stewieStateMonitor getState];
    if ([v3 displayStewieInStatusBar])
    {
      BOOL v4 = [(CCUISatelliteMonitor *)self isMessagingServiceAvailable];
      if (([v3 isStewieActiveOverBB] & 1) == 0)
      {
        if (self->_offGridMode == 2 && v4) {
          unint64_t v5 = 3;
        }
        else {
          unint64_t v5 = 2;
        }
        goto LABEL_11;
      }
      if (!self->_offGridModePublishStatus)
      {
        int64_t offGridMode = self->_offGridMode;
        if (offGridMode == 2 && v4)
        {
          unint64_t v5 = 4;
          goto LABEL_11;
        }
        if (offGridMode == 1 && v4)
        {
          unint64_t v5 = 6;
          goto LABEL_11;
        }
      }
      unint64_t v5 = 5;
    }
    else
    {
      unint64_t v5 = 1;
    }
LABEL_11:

    return v5;
  }
  return 0;
}

- (BOOL)_shouldShowDisableOffGridModeButton
{
  return self->_offGridMode == 2
      && [(CCUISatelliteMonitor *)self isMessagingServiceAvailable];
}

- (BOOL)isMessagingServiceAvailable
{
  v2 = [(CTStewieStateMonitor *)self->_stewieStateMonitor getState];
  if (([v2 isAllowedService:16] & 1) != 0
    || ([v2 isAllowedService:32] & 1) != 0
    || ([v2 isActiveService:16] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isActiveService:32];
  }

  return v3;
}

- (void)_manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CCUISatelliteMonitor__manager_offGridModeUpdated_publishStatus_context___block_invoke;
  block[3] = &unk_1E6A8A5F8;
  void block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x1E4F14428], block);
  BOOL v8 = [(CCUISatelliteMonitor *)self waitingForOffGridModeToDisableBeforeDisconnecting];
  if (a5 == 1 && v8) {
    [(CCUISatelliteMonitor *)self disconnectFromSatellite];
  }
}

uint64_t __74__CCUISatelliteMonitor__manager_offGridModeUpdated_publishStatus_context___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 48);
  return [*(id *)(a1 + 32) _reevaluateState];
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CCUISatelliteMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUISatelliteMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void)setStewieStateMonitor:(id)a3
{
}

- (IDSOffGridStateManager)offGridStateManager
{
  return self->_offGridStateManager;
}

- (void)setOffGridStateManager:(id)a3
{
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (int64_t)offGridMode
{
  return self->_offGridMode;
}

- (void)setOffGridMode:(int64_t)a3
{
  self->_int64_t offGridMode = a3;
}

- (int64_t)offGridModePublishStatus
{
  return self->_offGridModePublishStatus;
}

- (void)setOffGridModePublishStatus:(int64_t)a3
{
  self->_offGridModePublishStatus = a3;
}

- (BOOL)waitingForOffGridModeToDisableBeforeDisconnecting
{
  return self->_waitingForOffGridModeToDisableBeforeDisconnecting;
}

- (void)setWaitingForOffGridModeToDisableBeforeDisconnecting:(BOOL)a3
{
  self->_waitingForOffGridModeToDisableBeforeDisconnecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridStateManager, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end