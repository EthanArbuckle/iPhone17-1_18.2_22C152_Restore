@interface CRVehiclePolicyMonitor
- (BOOL)isMonitoring;
- (CRVehiclePolicyMonitor)initWithVehicleCertificateSerial:(id)a3;
- (CRVehiclePolicyMonitoring)delegate;
- (NSData)vehicleCertificateSerial;
- (NSXPCConnection)serviceConnection;
- (id)monitoringConnection;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setServiceConnection:(id)a3;
- (void)setVehicleCertificateSerial:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)willDisableCertificateSerial:(id)a3 reply:(id)a4;
- (void)willEnableCertificateSerial:(id)a3 reply:(id)a4;
@end

@implementation CRVehiclePolicyMonitor

- (CRVehiclePolicyMonitor)initWithVehicleCertificateSerial:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRVehiclePolicyMonitor;
  v5 = [(CRVehiclePolicyMonitor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CRVehiclePolicyMonitor *)v5 setVehicleCertificateSerial:v4];
    v7 = [(CRVehiclePolicyMonitor *)v6 monitoringConnection];
    [(CRVehiclePolicyMonitor *)v6 setServiceConnection:v7];

    [(CRVehiclePolicyMonitor *)v6 setMonitoring:0];
  }

  return v6;
}

- (void)dealloc
{
  [(CRVehiclePolicyMonitor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)CRVehiclePolicyMonitor;
  [(CRVehiclePolicyMonitor *)&v3 dealloc];
}

- (id)monitoringConnection
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.monitoring.service" options:4096];
  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327480];
  [v3 setRemoteObjectInterface:v4];
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F031F488];
  [v3 setExportedInterface:v5];
  [v3 setExportedObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CRVehiclePolicyMonitor_monitoringConnection__block_invoke;
  v9[3] = &unk_1E5E3A938;
  v9[4] = self;
  [v3 setInterruptionHandler:v9];
  v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit vehicle policy monitoring service.", v8, 2u);
  }

  [v3 resume];
  return v3;
}

uint64_t __46__CRVehiclePolicyMonitor_monitoringConnection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isMonitoring];
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 startMonitoring];
  }
  return result;
}

- (void)startMonitoring
{
  [(CRVehiclePolicyMonitor *)self setMonitoring:1];
  id v5 = [(CRVehiclePolicyMonitor *)self vehicleCertificateSerial];
  objc_super v3 = [(CRVehiclePolicyMonitor *)self serviceConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_19];
  [v4 startMonitoringCertificateSerial:v5 reply:&__block_literal_global_35_0];
}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_33()
{
  v0 = CarGeneralLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEFAULT, "started monitoring", v1, 2u);
  }
}

- (void)stopMonitoring
{
  [(CRVehiclePolicyMonitor *)self setMonitoring:0];
  id v5 = [(CRVehiclePolicyMonitor *)self vehicleCertificateSerial];
  objc_super v3 = [(CRVehiclePolicyMonitor *)self serviceConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_37_1];
  [v4 stopMonitoringCertificateSerial:v5 reply:&__block_literal_global_40_0];
}

void __40__CRVehiclePolicyMonitor_stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __40__CRVehiclePolicyMonitor_stopMonitoring__block_invoke_38()
{
  v0 = CarGeneralLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEFAULT, "stopped monitoring", v1, 2u);
  }
}

- (void)willEnableCertificateSerial:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "client received willEnableCertificateSerial", buf, 2u);
  }

  objc_super v9 = [(CRVehiclePolicyMonitor *)self vehicleCertificateSerial];
  char v10 = [v9 isEqualToData:v7];

  if (v10)
  {
    v11 = [(CRVehiclePolicyMonitor *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CRVehiclePolicyMonitor *)self delegate];
      [v13 willEnableVehicleTrackedByMonitor:self];
    }
    v6[2](v6);
  }
  else
  {
    v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "not monitoring this serial, ignoring", v15, 2u);
    }
  }
}

- (void)willDisableCertificateSerial:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "client received willDisableCertificateSerial", buf, 2u);
  }

  objc_super v9 = [(CRVehiclePolicyMonitor *)self vehicleCertificateSerial];
  char v10 = [v9 isEqualToData:v7];

  if (v10)
  {
    v11 = [(CRVehiclePolicyMonitor *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CRVehiclePolicyMonitor *)self delegate];
      [v13 willDisableVehicleTrackedByMonitor:self];
    }
    v6[2](v6);
  }
  else
  {
    v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "not monitoring this serial, ignoring", v15, 2u);
    }
  }
}

- (NSData)vehicleCertificateSerial
{
  return self->_vehicleCertificateSerial;
}

- (void)setVehicleCertificateSerial:(id)a3
{
}

- (CRVehiclePolicyMonitoring)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRVehiclePolicyMonitoring *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicleCertificateSerial, 0);
}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "failed to connect to monitoring service %@", (uint8_t *)&v2, 0xCu);
}

@end