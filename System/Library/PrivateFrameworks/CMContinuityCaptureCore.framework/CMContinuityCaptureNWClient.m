@interface CMContinuityCaptureNWClient
- (CMContinuityCaptureMetricsReporter)metricReporter;
- (CMContinuityCaptureNWClient)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5;
- (CMContinuityCaptureTimeSyncClock)timeSyncClock;
- (ContinuityCaptureTaskDelegate)delegate;
- (ContinuityCaptureTransportDevice)device;
- (NSDate)sessionActivationStartTime;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)debugInfo;
- (int64_t)preferredTransport;
- (unint64_t)currentSessionID;
- (unint64_t)lastActivationTime;
- (void)activateEntity:(int64_t)a3 configuration:(id)a4 option:(unint64_t)a5 entityCompletion:(id)a6 overallCompletion:(id)a7;
- (void)invalidate;
- (void)resetSession:(id)a3;
- (void)setPreferredTransport:(int64_t)a3 resetConnection:(BOOL)a4 completion:(id)a5;
- (void)setupTCPListener;
- (void)terminateEntity:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
@end

@implementation CMContinuityCaptureNWClient

- (CMContinuityCaptureNWClient)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CMContinuityCaptureNWClient;
  v12 = [(CMContinuityCaptureNWTransportBase *)&v24 initWithDevice:v9];
  if (v12)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeEntities = v12->_activeEntities;
    v12->_activeEntities = v13;

    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v12->_queue, a4);
    id v15 = objc_storeWeak((id *)&v12->_taskDelegate, v11);
    [(CMContinuityCaptureNWTransportBase *)v12 setTaskDelegate:v11];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __65__CMContinuityCaptureNWClient_initWithDevice_queue_taskDelegate___block_invoke;
    v21 = &unk_264C99DE8;
    objc_copyWeak(&v22, &location);
    [(CMContinuityCaptureNWTransportBase *)v12 createTimeSyncClock:&v18];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    [(CMContinuityCaptureNWClient *)v12 setupTCPListener];
    v16 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v16 connectToContinuityCaptureServerWithDelegate:v12];

    [(ContinuityCaptureTransportDevice *)v12->_device activate:1];
  }

  return v12;
}

void __65__CMContinuityCaptureNWClient_initWithDevice_queue_taskDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained willChangeValueForKey:@"timeSyncClock"];
    objc_storeStrong(v5 + 10, a2);
    [v5 didChangeValueForKey:@"timeSyncClock"];
  }
}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (void)setupTCPListener
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
  v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(secure_tcp, v4);

  objc_msgSend(NSString, "stringWithFormat:", @"%d", (unsigned __int16)tcpPort);
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (OS_nw_listener *)nw_listener_create_with_port((const char *)[v5 UTF8String], secure_tcp);
  listener = self->_listener;
  self->_listener = v6;

  if (self->_listener)
  {
    v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_listener;
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ NW listener %@", buf, 0x16u);
    }

    id v10 = self->_listener;
    id v11 = [(CMContinuityCaptureNWClient *)self queue];
    nw_listener_set_queue(v10, v11);

    v12 = self->_listener;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke;
    handler[3] = &unk_264C99E38;
    objc_copyWeak(&v18, &location);
    nw_listener_set_new_connection_handler(v12, handler);
    v13 = self->_listener;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_8;
    v15[3] = &unk_264C99E60;
    objc_copyWeak(&v16, &location);
    nw_listener_set_state_changed_handler(v13, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    nw_listener_start((nw_listener_t)self->_listener);
  }
  else
  {
    v14 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp listener", buf, 0xCu);
    }
  }
  objc_destroyWeak(&location);
}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ New connection  %@", buf, 0x16u);
  }
  v7 = (id *)(a1 + 32);
  v8 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a2);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_5;
    handler[3] = &unk_264C99E10;
    objc_copyWeak(&v14, v7);
    void handler[4] = v9;
    id v10 = v4;
    v13 = v10;
    nw_connection_set_state_changed_handler(v10, handler);
    id v11 = [v9 queue];
    nw_connection_set_queue(v10, v11);

    nw_connection_start(v10);
    objc_destroyWeak(&v14);
  }
}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v11 = 138412802;
    id v12 = WeakRetained;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW connection state %d error %@", (uint8_t *)&v11, 0x1Cu);
  }
  if (a2 != 3)
  {
    if ((a2 & 0xFFFFFFFB) != 0)
    {
      if (a2 != 5) {
        goto LABEL_11;
      }
    }
    else
    {
      v8 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      if (!v8) {
        goto LABEL_11;
      }
      nw_connection_cancel(v8);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 24) setActiveConnection:0];
    goto LABEL_11;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setActiveConnection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) scheduleReadForConnection:*(void *)(a1 + 40) dataTillNow:0];
LABEL_11:
}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_8(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW lsitener state %d error %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (ContinuityCaptureTransportDevice)device
{
  return self->_device;
}

- (ContinuityCaptureTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskDelegate);
  return (ContinuityCaptureTaskDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)currentSessionID
{
  return self->_currentSessionID;
}

- (void)activateEntity:(int64_t)a3 configuration:(id)a4 option:(unint64_t)a5 entityCompletion:(id)a6 overallCompletion:(id)a7
{
  id v18 = a4;
  int v11 = (void (**)(id, int64_t, void))a6;
  id v12 = a7;
  if (v18)
  {
    activeEntities = self->_activeEntities;
    uint64_t v14 = [NSNumber numberWithInteger:a3];
    LOBYTE(activeEntities) = [(NSMutableSet *)activeEntities containsObject:v14];

    if ((activeEntities & 1) == 0)
    {
      __int16 v15 = objc_opt_new();
      [v18 setSessionID:v15];

      [v18 setGenerationID:CMContinuityCaptureGetStreamSessionGenerationID()];
    }
  }
  id v16 = self->_activeEntities;
  uint64_t v17 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)v16 addObject:v17];

  if ([(NSMutableSet *)self->_activeEntities count] == 1) {
    self->_currentSessionID = CMContinuityCaptureGetActivateGenerationID();
  }
  v11[2](v11, a3, 0);
  (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
}

- (id)debugInfo
{
  return 0;
}

- (void)invalidate
{
}

- (void)resetSession:(id)a3
{
}

- (void)setPreferredTransport:(int64_t)a3 resetConnection:(BOOL)a4 completion:(id)a5
{
}

- (void)terminateEntity:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  activeEntities = self->_activeEntities;
  v7 = NSNumber;
  id v9 = (void (**)(id, int64_t, void))a5;
  int v8 = [v7 numberWithInteger:a3];
  [(NSMutableSet *)activeEntities removeObject:v8];

  v9[2](v9, a3, 0);
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(CMContinuityCaptureNWClient *)self device];
  v7 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v6, self];

  return (NSString *)v7;
}

- (unint64_t)lastActivationTime
{
  return self->lastActivationTime;
}

- (CMContinuityCaptureMetricsReporter)metricReporter
{
  return (CMContinuityCaptureMetricsReporter *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)preferredTransport
{
  return self->preferredTransport;
}

- (NSDate)sessionActivationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->metricReporter, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_activeEntities, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_taskDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end