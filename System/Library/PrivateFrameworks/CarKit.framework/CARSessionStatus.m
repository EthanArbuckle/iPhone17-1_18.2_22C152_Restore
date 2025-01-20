@interface CARSessionStatus
+ (id)sessionUpdatesQueue;
- (CARObserverHashTable)sessionObservers;
- (CARSession)currentSession;
- (CARSession)session;
- (CARSessionChangedNotificationConverter)notificationConverter;
- (CARSessionObserving)sessionObserver;
- (CARSessionStatus)init;
- (CARSessionStatus)initWithOptions:(unint64_t)a3;
- (OS_dispatch_source)connectingTimer;
- (id)initAndWaitUntilSessionUpdated;
- (id)initForCarPlayShell;
- (unint64_t)sessionStatusOptions;
- (unint64_t)timeoutInterval;
- (void)_handleAuthenticationSucceeded:(id)a3;
- (void)_handleCarCapabilitiesUpdated;
- (void)_handleConfigurationUpdated;
- (void)_handleConnectingTimeout;
- (void)_handleEndpointActivated:(id)a3;
- (void)_handleInCarNotification;
- (void)_handleSessionChanged;
- (void)_handleStartingWiredConnectionNotification;
- (void)_notifyCancelledConnectionAttemptOnTransport:(unint64_t)a3;
- (void)_notifyDidConnectSession:(id)a3;
- (void)_notifyDidDisconnectSession:(id)a3;
- (void)_notifyDidUpdateSession:(id)a3;
- (void)_notifyStartedConnectionAttemptOnTransport:(unint64_t)a3;
- (void)_startConnectingTimer;
- (void)_stopConnectingTimer;
- (void)_updateSession;
- (void)addSessionObserver:(id)a3;
- (void)dealloc;
- (void)removeSessionObserver:(id)a3;
- (void)setConnectingTimer:(id)a3;
- (void)setNotificationConverter:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionObserver:(id)a3;
- (void)setSessionObservers:(id)a3;
- (void)setTimeoutInterval:(unint64_t)a3;
- (void)waitForSessionInitialization;
@end

@implementation CARSessionStatus

uint64_t __36__CARSessionStatus_initWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSession];
}

- (CARSessionStatus)init
{
  return [(CARSessionStatus *)self initWithOptions:0];
}

uint64_t __48__CARSessionStatus_waitForSessionInitialization__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSession];
}

- (void)addSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSessionStatus *)self sessionObservers];
  [v5 addObserver:v4];
}

- (CARObserverHashTable)sessionObservers
{
  return self->_sessionObservers;
}

- (CARSession)currentSession
{
  v2 = [(CARSessionStatus *)self session];
  if ([v2 _sessionReady]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CARSession *)v3;
}

- (void)_updateSession
{
  id v3 = [(CARSessionStatus *)self session];
  uint64_t v4 = [v3 endpoint];

  FigEndpointCopyActiveCarPlayEndpoint();
  if (v4)
  {
    [(CARSessionStatus *)self _stopConnectingTimer];
    id v5 = [(CARSessionStatus *)self session];
    [(CARSessionStatus *)self setSession:0];
    if ([v5 _sessionReady]) {
      [(CARSessionStatus *)self _notifyDidDisconnectSession:v5];
    }
  }
}

- (CARSession)session
{
  return self->_session;
}

- (id)initAndWaitUntilSessionUpdated
{
  return [(CARSessionStatus *)self initWithOptions:1];
}

- (void)waitForSessionInitialization
{
  id v3 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CARSessionStatus_waitForSessionInitialization__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __39__CARSessionStatus_sessionUpdatesQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.CarKit.CARSessionStatus", attr);
  v2 = (void *)sessionUpdatesQueue___updatesQueue;
  sessionUpdatesQueue___updatesQueue = (uint64_t)v1;
}

- (CARSessionStatus)initWithOptions:(unint64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CARSessionStatus;
  uint64_t v4 = [(CARSessionStatus *)&v28 init];
  id v5 = v4;
  if (v4)
  {
    [(CARSessionStatus *)v4 setSession:0];
    [(CARSessionStatus *)v5 setTimeoutInterval:30];
    v6 = [(id)objc_opt_class() sessionUpdatesQueue];
    v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);

    objc_initWeak(&location, v5);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __36__CARSessionStatus_initWithOptions___block_invoke;
    handler[3] = &unk_1E5E3AC10;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v7, handler);
    [(CARSessionStatus *)v5 setConnectingTimer:v7];
    dispatch_activate(v7);
    v8 = +[CARSessionChangedNotificationConverter sharedInstance];
    [(CARSessionStatus *)v5 setNotificationConverter:v8];

    v9 = [CARObserverHashTable alloc];
    v10 = [(id)objc_opt_class() sessionUpdatesQueue];
    v11 = [(CARObserverHashTable *)v9 initWithProtocol:&unk_1F0327838 callbackQueue:v10];
    [(CARSessionStatus *)v5 setSessionObservers:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v5 selector:sel__handleAuthenticationSucceeded_ name:@"CARSessionAuthenticationSucceededNotification" object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v5 selector:sel__handleEndpointActivated_ name:@"CARSessionEndpointActivatedNotification" object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v5 selector:sel__handleSessionChanged name:@"CARSessionStatusChangedNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v5 selector:sel__handleSessionChanged name:@"CARSessionServerConnectionDiedNotification" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)CRSessionStatusInCarNotificationCallback, @"com.apple.carplay.in-car", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v5, (CFNotificationCallback)CRSessionStatusStartingWiredConnectionNotificationCallback, @"com.apple.carplay.starting-wired-connection", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v18 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v18, v5, (CFNotificationCallback)CRSessionStatusAccessoryUpdatedNotificationCallback, @"CARSessionAccessoryUpdatedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v19 = [(id)objc_opt_class() sessionUpdatesQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__CARSessionStatus_initWithOptions___block_invoke_2;
    block[3] = &unk_1E5E3A938;
    v20 = v5;
    v24 = v20;
    dispatch_async(v19, block);

    v20->_sessionStatusOptions = a3;
    if ((a3 & 4) != 0)
    {
      v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v21, v20, (CFNotificationCallback)CRSessionStatusCapabilitiesUpdatedNotificationCallback, @"CARSessionCarCapabilitiesUpdatedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (a3) {
      [(CARSessionStatus *)v20 waitForSessionInitialization];
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v5;
}

+ (id)sessionUpdatesQueue
{
  if (sessionUpdatesQueue_onceToken != -1) {
    dispatch_once(&sessionUpdatesQueue_onceToken, &__block_literal_global_598);
  }
  v2 = (void *)sessionUpdatesQueue___updatesQueue;
  return v2;
}

- (void)setTimeoutInterval:(unint64_t)a3
{
  self->_timeoutInterval = a3;
}

- (void)setSessionObservers:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void)setNotificationConverter:(id)a3
{
}

- (void)setConnectingTimer:(id)a3
{
}

void __36__CARSessionStatus_initWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectingTimeout];
}

- (id)initForCarPlayShell
{
  return [(CARSessionStatus *)self initWithOptions:30];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARSessionStatus;
  [(CARSessionStatus *)&v4 dealloc];
}

- (void)setSessionObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionObserver);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_sessionObserver);
    [(CARSessionStatus *)self removeSessionObserver:v5];

    objc_storeWeak((id *)&self->_sessionObserver, 0);
  }
  v6 = obj;
  if (obj)
  {
    objc_storeWeak((id *)&self->_sessionObserver, obj);
    [(CARSessionStatus *)self addSessionObserver:obj];
    v6 = obj;
  }
}

- (void)removeSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSessionStatus *)self sessionObservers];
  [v5 removeObserver:v4];
}

- (void)_handleAuthenticationSucceeded:(id)a3
{
  id v4 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CARSessionStatus__handleAuthenticationSucceeded___block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __51__CARSessionStatus__handleAuthenticationSucceeded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  char v3 = [v2 isAuthenticated];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setSession:0];
    id v4 = *(void **)(a1 + 32);
    [v4 _updateSession];
  }
}

- (void)_handleEndpointActivated:(id)a3
{
  id v4 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CARSessionStatus__handleEndpointActivated___block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __45__CARSessionStatus__handleEndpointActivated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  char v3 = [v2 isActivated];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setSession:0];
    id v4 = *(void **)(a1 + 32);
    [v4 _updateSession];
  }
}

- (void)_handleInCarNotification
{
  char v3 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CARSessionStatus__handleInCarNotification__block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__CARSessionStatus__handleInCarNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyStartedConnectionAttemptOnTransport:3];
  v2 = *(void **)(a1 + 32);
  return [v2 _startConnectingTimer];
}

- (void)_handleStartingWiredConnectionNotification
{
  objc_initWeak(&location, self);
  v2 = [(id)objc_opt_class() sessionUpdatesQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CARSessionStatus__handleStartingWiredConnectionNotification__block_invoke;
  v3[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__CARSessionStatus__handleStartingWiredConnectionNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyStartedConnectionAttemptOnTransport:1];
  [WeakRetained _startConnectingTimer];
}

- (void)_handleSessionChanged
{
  char v3 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CARSessionStatus__handleSessionChanged__block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__CARSessionStatus__handleSessionChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSession];
}

- (void)_handleConfigurationUpdated
{
  char v3 = [(id)objc_opt_class() sessionUpdatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CARSessionStatus__handleConfigurationUpdated__block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __47__CARSessionStatus__handleConfigurationUpdated__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) session];
  [v2 _updateConfiguration];

  char v3 = *(void **)(a1 + 32);
  id v4 = [v3 session];
  [v3 _notifyDidUpdateSession:v4];

  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Configuration updated for session %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_handleCarCapabilitiesUpdated
{
  objc_initWeak(&location, self);
  v2 = [(id)objc_opt_class() sessionUpdatesQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__CARSessionStatus__handleCarCapabilitiesUpdated__block_invoke;
  v3[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__CARSessionStatus__handleCarCapabilitiesUpdated__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained session];
  [v2 _updateCarCapabilities];

  char v3 = [WeakRetained session];
  [WeakRetained _notifyDidUpdateSession:v3];

  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CarCapabilities updated for session %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startConnectingTimer
{
  char v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_INFO, "starting session connecting timeout", v6, 2u);
  }

  id v4 = [(CARSessionStatus *)self connectingTimer];
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * [(CARSessionStatus *)self timeoutInterval]);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_activate(v4);
}

- (void)_stopConnectingTimer
{
  v2 = [(CARSessionStatus *)self connectingTimer];
  dispatch_source_cancel(v2);
}

- (void)_handleConnectingTimeout
{
  [(CARSessionStatus *)self _stopConnectingTimer];
  [(CARSessionStatus *)self _notifyCancelledConnectionAttemptOnTransport:3];
}

- (void)_notifyStartedConnectionAttemptOnTransport:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[CARSessionConfiguration _descriptionForTransportType:a3];
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "attempting connection on transport %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(CARSessionStatus *)self sessionObservers];
  [v7 startedConnectionAttemptOnTransport:a3];
}

- (void)_notifyCancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[CARSessionConfiguration _descriptionForTransportType:a3];
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "cancelled connection attempt on transport %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(CARSessionStatus *)self sessionObservers];
  [v7 cancelledConnectionAttemptOnTransport:a3];
}

- (void)_notifyDidConnectSession:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "connected session %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CARSessionStatus *)self sessionObservers];
  [v6 sessionDidConnect:v4];
}

- (void)_notifyDidDisconnectSession:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(v4, "_fig_safe_description");
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "disconnected session %@", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(CARSessionStatus *)self sessionObservers];
  [v7 sessionDidDisconnect:v4];
}

- (void)_notifyDidUpdateSession:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "updated session %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(CARSessionStatus *)self sessionObservers];
  int v7 = [v4 configuration];
  [v6 session:v4 didUpdateConfiguration:v7];
}

- (CARSessionObserving)sessionObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionObserver);
  return (CARSessionObserving *)WeakRetained;
}

- (CARSessionChangedNotificationConverter)notificationConverter
{
  return self->_notificationConverter;
}

- (OS_dispatch_source)connectingTimer
{
  return self->_connectingTimer;
}

- (unint64_t)timeoutInterval
{
  return self->_timeoutInterval;
}

- (unint64_t)sessionStatusOptions
{
  return self->_sessionStatusOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectingTimer, 0);
  objc_storeStrong((id *)&self->_sessionObservers, 0);
  objc_storeStrong((id *)&self->_notificationConverter, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_sessionObserver);
}

@end