@interface CMContinuityCaptureNWServer
- (CMContinuityCaptureNWServer)initWithQueue:(id)a3;
- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice;
- (CMContinuityCaptureTimeSyncClock)timeSyncClock;
- (ContinuityCaptureTaskDelegate)delegate;
- (ContinuityCaptureTransportDevice)localDevice;
- (NSDate)sessionActivationStartTime;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (int64_t)clientDeviceModel;
- (int64_t)currentTransport;
- (unint64_t)currentSessionID;
- (void)setCurrentSessionID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setupTCPConnection;
@end

@implementation CMContinuityCaptureNWServer

- (CMContinuityCaptureNWServer)initWithQueue:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [CMContinuityCaptureTransportNWDevice alloc];
  v8 = +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice];
  v9 = [(CMContinuityCaptureTransportNWDevice *)v7 initWithCapabilities:v8 identifier:self->_identifier remote:0];

  v19.receiver = self;
  v19.super_class = (Class)CMContinuityCaptureNWServer;
  v10 = [(CMContinuityCaptureNWTransportBase *)&v19 initWithDevice:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, v6);
    objc_storeStrong((id *)&v11->_device, v9);
    objc_storeStrong((id *)&v11->_queue, a3);
    v12 = [[CMContinuityCaptureRemoteCompositeDevice alloc] initWithTransportServer:v11 videoPreviewLayer:0];
    compositeDevice = v11->_compositeDevice;
    v11->_compositeDevice = v12;

    v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v11->_compositeDevice;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v11;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ composite device %{public}@", buf, 0x16u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v11);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __45__CMContinuityCaptureNWServer_initWithQueue___block_invoke;
    v17[3] = &unk_264C99DE8;
    objc_copyWeak(&v18, (id *)buf);
    [(CMContinuityCaptureNWTransportBase *)v11 createTimeSyncClock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    [(CMContinuityCaptureNWServer *)v11 setupTCPConnection];
    [(CMContinuityCaptureTransportNWDevice *)v11->_device activate:1];
  }

  return v11;
}

void __45__CMContinuityCaptureNWServer_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained willChangeValueForKey:@"timeSyncClock"];
    objc_storeStrong(v5 + 8, a2);
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

- (void)setupTCPConnection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [localIPAddress UTF8String];
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  if (!host_with_numeric_port)
  {
    v10 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp endpoint", buf, 0xCu);
    }
    secure_tcp = 0;
    goto LABEL_10;
  }
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
  id v5 = (OS_nw_connection *)nw_connection_create(host_with_numeric_port, secure_tcp);
  connection = self->_connection;
  self->_connection = v5;

  v7 = self->_connection;
  if (!v7)
  {
    v10 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp connection", buf, 0xCu);
    }
LABEL_10:

    goto LABEL_4;
  }
  v8 = [(CMContinuityCaptureNWServer *)self queue];
  nw_connection_set_queue(v7, v8);

  v9 = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CMContinuityCaptureNWServer_setupTCPConnection__block_invoke;
  v11[3] = &unk_264C99E60;
  objc_copyWeak(&v12, &location);
  nw_connection_set_state_changed_handler(v9, v11);
  objc_destroyWeak(&v12);
  nw_connection_start((nw_connection_t)self->_connection);
LABEL_4:

  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureNWServer_setupTCPConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v10 = 138412802;
    id v11 = WeakRetained;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW connection state %d error %@", (uint8_t *)&v10, 0x1Cu);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v8;
  if (a2 == 3 && v8)
  {
    [*((id *)v8 + 3) setActiveConnection:*((void *)v8 + 7)];
    [v9 scheduleReadForConnection:v9[7] dataTillNow:0];
  }
}

- (ContinuityCaptureTaskDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  v4 = (ContinuityCaptureTaskDelegate *)a3;
  [(CMContinuityCaptureNWTransportBase *)self setTaskDelegate:v4];
  delegate = self->_delegate;
  self->_delegate = v4;
}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(CMContinuityCaptureNWServer *)self localDevice];
  v7 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v6, self];

  return (NSString *)v7;
}

- (int64_t)clientDeviceModel
{
  return self->clientDeviceModel;
}

- (unint64_t)currentSessionID
{
  return self->currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  self->currentSessionID = a3;
}

- (int64_t)currentTransport
{
  return self->currentTransport;
}

- (NSDate)sessionActivationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice
{
  return (CMContinuityCaptureRemoteCompositeDevice *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeDevice, 0);
  objc_storeStrong((id *)&self->sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end