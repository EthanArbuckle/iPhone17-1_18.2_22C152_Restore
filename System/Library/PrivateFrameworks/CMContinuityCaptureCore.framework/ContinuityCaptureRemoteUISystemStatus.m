@interface ContinuityCaptureRemoteUISystemStatus
+ (id)sharedInstance;
+ (void)invalidate;
- (BOOL)invalidated;
- (ContinuityCaptureRemoteUISystemStatus)initWithQueue:(id)a3;
- (int64_t)callState;
- (unint64_t)activeCallCountOnMainQueue;
- (void)_avSystemControllerProcessDied;
- (void)_handleCall:(id)a3;
- (void)_handleCallAudioSessionActiveNotification:(id)a3;
- (void)_handleCallStatusChangedNotification:(id)a3;
- (void)_resolveActiveCallState;
- (void)_setupAVSystemController;
- (void)addObserver:(id)a3;
- (void)holdIdleSleepAssertionForReason:(id)a3;
- (void)invalidate;
- (void)releaseCurrentIdleSleepAssertion;
- (void)removeObserver:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setupCallStateMonitoring;
@end

@implementation ContinuityCaptureRemoteUISystemStatus

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_69 != -1) {
    dispatch_once(&sharedInstance_onceToken_69, &__block_literal_global_71);
  }
  v2 = (void *)_systemStatus;
  return v2;
}

uint64_t __55__ContinuityCaptureRemoteUISystemStatus_sharedInstance__block_invoke()
{
  v0 = [ContinuityCaptureRemoteUISystemStatus alloc];
  _systemStatus = [(ContinuityCaptureRemoteUISystemStatus *)v0 initWithQueue:MEMORY[0x263EF83A0]];
  return MEMORY[0x270F9A758]();
}

- (ContinuityCaptureRemoteUISystemStatus)initWithQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuityCaptureRemoteUISystemStatus;
  v6 = [(ContinuityCaptureRemoteUIPowerButtonStatus *)&v20 initWithQueue:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    incomingCallIDs = v7->_incomingCallIDs;
    v7->_incomingCallIDs = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeCallIds = v7->_activeCallIds;
    v7->_activeCallIds = v10;

    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v7->_callState);
    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__ContinuityCaptureRemoteUISystemStatus_initWithQueue___block_invoke;
    v17[3] = &unk_264C990F8;
    objc_copyWeak(&v18, &location);
    dispatch_async(queue, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v15 = v7;
  }

  return v7;
}

void __55__ContinuityCaptureRemoteUISystemStatus_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setupCallStateMonitoring];
    id WeakRetained = v2;
  }
}

- (BOOL)invalidated
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL invalidated = a3;
  objc_sync_exit(obj);
}

+ (void)invalidate
{
  if (([(id)_systemStatus invalidated] & 1) == 0)
  {
    [(id)_systemStatus invalidate];
    id v2 = (void *)_systemStatus;
    [v2 setInvalidated:1];
  }
}

- (void)invalidate
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7E310] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F7E328] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F54470] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F54348] object:0];
}

- (unint64_t)activeCallCountOnMainQueue
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(v2);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ContinuityCaptureRemoteUISystemStatus_activeCallCountOnMainQueue__block_invoke;
  block[3] = &unk_264C99328;
  block[4] = &v7;
  dispatch_async_and_wait(v2, block);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__ContinuityCaptureRemoteUISystemStatus_activeCallCountOnMainQueue__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(MEMORY[0x263F7E1A0], "sharedInstance", 0);
  id v3 = [v2 currentAudioAndVideoCalls];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v7) status] == 1) {
          ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)holdIdleSleepAssertionForReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    __int16 v15 = 2080;
    *(void *)v16 = "-[ContinuityCaptureRemoteUISystemStatus holdIdleSleepAssertionForReason:]";
    *(_WORD *)&v16[8] = 2112;
    *(void *)&v16[10] = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_preventSystemSleepAssertionID)
  {
    uint64_t v6 = [NSString stringWithFormat:@"idleSleepPreventionSystemActivityForContinuityCapture(%d)_%@", getpid(), v4];
    int v7 = IOPMAssertionDeclareSystemActivity();
    long long v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = self;
      __int16 v15 = 1024;
      *(_DWORD *)v16 = v7;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = 1;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ IOPMAssertionDeclareSystemActivity returned %x systemState %d", buf, 0x18u);
    }

    if (!v7)
    {
      v12[0] = @"audio-in";
      v12[1] = @"Camera";
      long long v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
      IOReturn v10 = IOPMAssertionSetProperty(self->_preventSystemSleepAssertionID, @"ResourcesUsed", v9);
      long long v11 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v14 = self;
        __int16 v15 = 1024;
        *(_DWORD *)v16 = v10;
        *(_WORD *)&v16[4] = 2112;
        *(void *)&v16[6] = v9;
        _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ IOPMAssertionSetProperty returned %x for setting kIOPMAssertionResourcesUsed: %@", buf, 0x1Cu);
      }
    }
  }
}

- (void)releaseCurrentIdleSleepAssertion
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%@  IOPMAssertionRelease failed (%d)", (uint8_t *)&v3, 0x12u);
}

- (void)addObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ Received: %@", buf, 0x16u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v6 = [v4 name];
  if ([v6 isEqualToString:*MEMORY[0x263F7E310]]) {
    goto LABEL_6;
  }
  uint64_t v7 = [v4 name];
  if ([v7 isEqualToString:*MEMORY[0x263F7E328]])
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v10 = [v4 name];
  char v11 = [v10 isEqualToString:*MEMORY[0x263F54348]];

  if ((v11 & 1) == 0)
  {
    __int16 v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received unhandled notification from call center: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_7:
  __int16 v8 = objc_loadWeakRetained(&location);
  if (v8)
  {
    id v9 = [v4 object];
    [v8 _handleCall:v9];

LABEL_9:
  }
  objc_destroyWeak(&location);
}

- (void)_setupAVSystemController
{
  v14[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  avSystemController = self->_avSystemController;
  self->_avSystemController = v3;

  __int16 v5 = self->_avSystemController;
  uint64_t v6 = *MEMORY[0x263F54348];
  v14[0] = *MEMORY[0x263F54470];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [(AVSystemController *)v5 setAttribute:v7 forKey:*MEMORY[0x263F544A0] error:0];

  __int16 v8 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_avSystemController;
    int v10 = 138412546;
    char v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Setup avSystemController: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_avSystemControllerProcessDied
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__ContinuityCaptureRemoteUISystemStatus__avSystemControllerProcessDied__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__ContinuityCaptureRemoteUISystemStatus__avSystemControllerProcessDied__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setupAVSystemController];
    id WeakRetained = v2;
  }
}

- (void)_handleCallAudioSessionActiveNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ Received: %@", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__ContinuityCaptureRemoteUISystemStatus__handleCallAudioSessionActiveNotification___block_invoke;
  block[3] = &unk_264C99198;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __83__ContinuityCaptureRemoteUISystemStatus__handleCallAudioSessionActiveNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54350]];
    int v5 = [v4 BOOLValue];

    if (WeakRetained[96] != v5)
    {
      uint64_t v6 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = WeakRetained[96];
        int v9 = 138412802;
        uint64_t v10 = v7;
        __int16 v11 = 1024;
        int v12 = v8;
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ _hasActiveCallAudioSession changed %d -> %d ", (uint8_t *)&v9, 0x18u);
      }

      WeakRetained[96] = v5;
      [WeakRetained _resolveActiveCallState];
    }
  }
}

- (int64_t)callState
{
  return atomic_load((unint64_t *)&self->_callState);
}

- (void)_resolveActiveCallState
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = atomic_load((unint64_t *)&self->_callState);
  unint64_t v4 = atomic_load((unint64_t *)&self->_callState);
  if ([(NSMutableSet *)self->_activeCallIds count] || self->_hasActiveCallAudioSession)
  {
    unint64_t v3 = 0;
  }
  else if (!v4 && ![(NSMutableSet *)self->_activeCallIds count] && !self->_hasActiveCallAudioSession)
  {
    unint64_t v3 = 1;
  }
  if (v3 != v4)
  {
    int v5 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(NSMutableSet *)self->_activeCallIds count];
      BOOL hasActiveCallAudioSession = self->_hasActiveCallAudioSession;
      *(_DWORD *)buf = 138413314;
      v19 = self;
      __int16 v20 = 1024;
      int v21 = v6;
      __int16 v22 = 1024;
      BOOL v23 = hasActiveCallAudioSession;
      __int16 v24 = 1024;
      int v25 = v4;
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ #ofActiveCalls %d callAudioSessionActive %d callState %d -> %d", buf, 0x24u);
    }

    [(ContinuityCaptureRemoteUISystemStatus *)self willChangeValueForKey:@"callState"];
    atomic_store(v3, (unint64_t *)&self->_callState);
    [(ContinuityCaptureRemoteUISystemStatus *)self didChangeValueForKey:@"callState"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v8 = self->_observers;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "callActive:", v3 == 0, (void)v13);
        }
        uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setupCallStateMonitoring
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  callCenter = self->_callCenter;
  self->_callCenter = v3;

  int v5 = [(TUCallCenter *)self->_callCenter neighborhoodActivityConduit];
  callCenterNeighborhoodActivityConduit = self->_callCenterNeighborhoodActivityConduit;
  self->_callCenterNeighborhoodActivityConduit = v5;

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__handleCallStatusChangedNotification_ name:*MEMORY[0x263F7E310] object:0];

  int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__handleCallStatusChangedNotification_ name:*MEMORY[0x263F7E328] object:0];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(TUCallCenter *)self->_callCenter currentAudioAndVideoCalls];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [(ContinuityCaptureRemoteUISystemStatus *)self _handleCall:*(void *)(*((void *)&v16 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(ContinuityCaptureRemoteUISystemStatus *)self _setupAVSystemController];
  long long v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__avSystemControllerProcessDied name:*MEMORY[0x263F54470] object:0];

  long long v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__handleCallAudioSessionActiveNotification_ name:*MEMORY[0x263F54348] object:0];
}

- (void)_handleCall:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 status] == 4
    && (int v5 = self->_incomingCallIDs,
        [v4 uniqueProxyIdentifier],
        int v6 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v5) = [(NSMutableSet *)v5 containsObject:v6],
        v6,
        (v5 & 1) == 0))
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = [v4 provider];
    if ([v10 isFaceTimeProvider]) {
      uint64_t v11 = [(TUNeighborhoodActivityConduit *)self->_callCenterNeighborhoodActivityConduit isRingingFaceTimeCallsOnConnectedTVDevice] ^ 1;
    }
    else {
      uint64_t v11 = 1;
    }

    unint64_t v12 = 0x263F08000uLL;
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "service"));
    [v9 setObject:v13 forKeyedSubscript:@"kCMContinuityCaptureCallService"];

    long long v14 = [v4 provider];
    long long v15 = [v14 localizedName];
    [v9 setObject:v15 forKeyedSubscript:@"kCMContinuityCaptureCallProvider"];

    long long v16 = [v4 displayName];
    [v9 setObject:v16 forKeyedSubscript:@"kCMContinuityCaptureCallerName"];

    long long v17 = [v4 handle];
    uint64_t v18 = [v17 type];

    long long v19 = [v4 handle];
    __int16 v20 = [v19 value];
    if (v18 == 2)
    {
      uint64_t v21 = [v4 isoCountryCode];
      __int16 v22 = TUFormattedPhoneNumber();
      [v9 setObject:v22 forKeyedSubscript:@"kCMContinuityCaptureCallerHandle"];

      unint64_t v12 = 0x263F08000;
    }
    else
    {
      [v9 setObject:v20 forKeyedSubscript:@"kCMContinuityCaptureCallerHandle"];
    }

    BOOL v23 = [v4 callUUID];
    [v9 setObject:v23 forKeyedSubscript:@"kCMContinuityCaptureCallUUID"];

    __int16 v24 = [v4 callGroupUUID];
    int v25 = [v24 UUIDString];
    [v9 setObject:v25 forKeyedSubscript:@"kCMContinuityCaptureCallGroupUUID"];

    __int16 v26 = [v4 uniqueProxyIdentifier];
    [v9 setObject:v26 forKeyedSubscript:@"kCMContinuityCaptureCallUniqueProxyIdentifier"];

    int v27 = *(void **)(v12 + 2584);
    uint64_t v28 = [v4 provider];
    v29 = objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "isFaceTimeProvider"));
    [v9 setObject:v29 forKeyedSubscript:@"kCMContinuityCaptureIsFaceTime"];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v30 = self->_observers;
    uint64_t v31 = [(NSHashTable *)v30 countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v75 != v33) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v74 + 1) + 8 * i) incomingCall:1 data:v9 shouldDisplayNotification:v11];
        }
        uint64_t v32 = [(NSHashTable *)v30 countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v32);
    }

    incomingCallIDs = self->_incomingCallIDs;
    v36 = [v4 uniqueProxyIdentifier];
    [(NSMutableSet *)incomingCallIDs addObject:v36];
  }
  else if ([v4 status] != 4)
  {
    uint64_t v7 = self->_incomingCallIDs;
    int v8 = [v4 uniqueProxyIdentifier];
    [(NSMutableSet *)v7 removeObject:v8];
  }
  if ([v4 status] == 1)
  {
    activeCallIds = self->_activeCallIds;
    v38 = [v4 uniqueProxyIdentifier];
    [(NSMutableSet *)activeCallIds addObject:v38];

    id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v40 = [v4 uniqueProxyIdentifier];
    [v39 setObject:v40 forKeyedSubscript:@"kCMContinuityCaptureCallUniqueProxyIdentifier"];

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v41 = self->_observers;
    uint64_t v42 = [(NSHashTable *)v41 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v71 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * j) incomingCall:1 data:v39 shouldDisplayNotification:0];
        }
        uint64_t v43 = [(NSHashTable *)v41 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v43);
    }
  }
  else
  {
    if ([v4 status] == 6)
    {
      v46 = self->_activeCallIds;
      v47 = [v4 uniqueProxyIdentifier];
      [(NSMutableSet *)v46 removeObject:v47];

      id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v48 = [v4 uniqueProxyIdentifier];
      [v39 setObject:v48 forKeyedSubscript:@"kCMContinuityCaptureCallUniqueProxyIdentifier"];

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v49 = self->_observers;
      uint64_t v50 = [(NSHashTable *)v49 countByEnumeratingWithState:&v66 objects:v85 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v51; ++k)
          {
            if (*(void *)v67 != v52) {
              objc_enumerationMutation(v49);
            }
            [*(id *)(*((void *)&v66 + 1) + 8 * k) incomingCall:0 data:v39 shouldDisplayNotification:0];
          }
          uint64_t v51 = [(NSHashTable *)v49 countByEnumeratingWithState:&v66 objects:v85 count:16];
        }
        while (v51);
      }

      if ([v4 disconnectedReason] == 2)
      {
        [(ContinuityCaptureRemoteUISystemStatus *)self willChangeValueForKey:@"callState"];
        atomic_store(2uLL, (unint64_t *)&self->_callState);
        [(ContinuityCaptureRemoteUISystemStatus *)self didChangeValueForKey:@"callState"];
      }
      goto LABEL_47;
    }
    if ([v4 status] != 2) {
      goto LABEL_48;
    }
    id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v54 = [v4 uniqueProxyIdentifier];
    [v39 setObject:v54 forKeyedSubscript:@"kCMContinuityCaptureCallUniqueProxyIdentifier"];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v41 = self->_observers;
    uint64_t v55 = [(NSHashTable *)v41 countByEnumeratingWithState:&v62 objects:v84 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v63;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v63 != v57) {
            objc_enumerationMutation(v41);
          }
          objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * m), "incomingCall:data:shouldDisplayNotification:", 0, v39, 0, (void)v62);
        }
        uint64_t v56 = [(NSHashTable *)v41 countByEnumeratingWithState:&v62 objects:v84 count:16];
      }
      while (v56);
    }
  }

LABEL_47:
LABEL_48:
  v59 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v60 = [(NSMutableSet *)self->_activeCallIds count];
    uint64_t v61 = [(NSMutableSet *)self->_incomingCallIDs count];
    *(_DWORD *)buf = 138412802;
    v79 = self;
    __int16 v80 = 2048;
    uint64_t v81 = v60;
    __int16 v82 = 2048;
    uint64_t v83 = v61;
    _os_log_impl(&dword_235FC2000, v59, OS_LOG_TYPE_DEFAULT, "%@ #ofActiveCalls %ld, #ofIncomingCalls: %ld", buf, 0x20u);
  }

  [(ContinuityCaptureRemoteUISystemStatus *)self _resolveActiveCallState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCallIds, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_incomingCallIDs, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_callCenterNeighborhoodActivityConduit, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end