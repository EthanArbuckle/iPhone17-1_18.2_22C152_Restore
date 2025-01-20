@interface SRReaderLongTermBackend
+ (id)clientInterface;
+ (id)connectionToEndpoint;
+ (id)new;
+ (id)remoteInterface;
+ (void)initialize;
- (NSXPCConnection)connection;
- (SRReaderLongTermBackend)init;
- (SRReaderLongTermBackend)initWithSensor:(id)a3 xpcConnection:(id)a4;
- (void)continueFetchRequest:(id)a3 samples:(id)a4 timestamp:(double)a5 cursor:(id)a6 fetchState:(unint64_t)a7 error:(id)a8 withCallback:(id)a9;
- (void)dealloc;
- (void)fetch:(id)a3 withCallback:(id)a4;
- (void)fetchDevices:(id)a3 reply:(id)a4;
- (void)fetchReaderMetadata:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setupConnection;
- (void)startRecording:(id)a3 reply:(id)a4;
- (void)stopRecording:(id)a3 reply:(id)a4;
@end

@implementation SRReaderLongTermBackend

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogLongTermBackend = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogLongTermBackend");
  }
}

- (SRReaderLongTermBackend)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1812F8];
}

+ (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181358];
}

+ (id)connectionToEndpoint
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKit.LongTermStorageHelper"];

  return v2;
}

- (void)setupConnection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_INFO))
  {
    sensor = self->_sensor;
    *(_DWORD *)buf = 138543362;
    v15 = sensor;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Setting up connection to daemon", buf, 0xCu);
  }
  connection = self->_connection;
  -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)connection setExportedObject:self];
  -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__SRReaderLongTermBackend_setupConnection__block_invoke;
  v12[3] = &unk_26452E018;
  objc_copyWeak(&v13, (id *)buf);
  [(NSXPCConnection *)connection setInterruptionHandler:v12];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __42__SRReaderLongTermBackend_setupConnection__block_invoke_18;
  v10 = &unk_26452E018;
  objc_copyWeak(&v11, (id *)buf);
  [(NSXPCConnection *)connection setInvalidationHandler:&v7];
  Weak = objc_loadWeak((id *)buf);
  if (Weak) {
    Weak[8] = 0;
  }
  [(NSXPCConnection *)connection resume];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __42__SRReaderLongTermBackend_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_INFO))
  {
    if (Weak) {
      uint64_t v3 = Weak[2];
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_INFO, "[%{public}@] Connection to daemon has been interrupted.", (uint8_t *)&v4, 0xCu);
  }
}

void __42__SRReaderLongTermBackend_setupConnection__block_invoke_18(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_INFO))
  {
    if (Weak) {
      uint64_t v3 = Weak[2];
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_INFO, "[%{public}@] Connection to daemon has been invalidated.", (uint8_t *)&v4, 0xCu);
  }
  if (Weak) {
    *((unsigned char *)Weak + 8) = 1;
  }
}

- (void)fetch:(id)a3 withCallback:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a3, "sensor"), "hasSuffix:", @".tombstones"))
  {
    [a3 from];
    uint64_t v7 = (void (*)(id, void, void, void, void, uint64_t, void, void))*((void *)a4 + 2);
    v7(a4, 0, 0, 0, 0, 1, 0, 0);
    return;
  }
  sensor = self->_sensor;
  v9 = [(SRReaderLongTermBackend *)self connection];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke;
  v24[3] = &unk_26452E0B8;
  v24[5] = a3;
  v24[6] = a4;
  v24[4] = sensor;
  id v10 = [(NSXPCConnection *)v9 remoteObjectProxyWithErrorHandler:v24];
  if (-[NSString isEqualToString:](sensor, "isEqualToString:", [a3 sensor]))
  {
    [a3 from];
    double v12 = v11;
    objc_initWeak(&location, self);
    if ([(NSString *)sensor isEqualToString:@"com.apple.SensorKit.cardioMetrics"])
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke_21;
      v21[3] = &unk_26452E358;
      id v13 = &v22;
      objc_copyWeak(&v22, &location);
      v21[4] = a3;
      v21[5] = a4;
      [v10 fetchCardioSamples:a3 reply:v21];
    }
    else
    {
      if (![(NSString *)sensor isEqualToString:@"com.apple.SensorKit.mobilityMetrics"])
      {
        uint64_t v16 = SRLogLongTermBackend;
        if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_FAULT))
        {
          uint64_t v18 = [a3 sensor];
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v18;
          _os_log_fault_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_FAULT, "Trying to fetch long term data for a sensor %{public}@ that doesn't support it", buf, 0xCu);
        }
        (*((void (**)(id, void, void, void, void, uint64_t, void, SRError *, double))a4 + 2))(a4, 0, 0, 0, 0, 1, 0, +[SRError errorWithCode:8194], v12);
        goto LABEL_17;
      }
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke_2;
      v19[3] = &unk_26452E358;
      id v13 = &v20;
      objc_copyWeak(&v20, &location);
      v19[4] = a3;
      v19[5] = a4;
      [v10 fetchMobilitySamples:a3 reply:v19];
    }
    objc_destroyWeak(v13);
LABEL_17:
    objc_destroyWeak(&location);
    return;
  }
  v14 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_FAULT))
  {
    uint64_t v17 = [a3 sensor];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = (uint64_t)sensor;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_fault_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_FAULT, "Backend is for sensor %{public}@ but fetching for sensor %{public}@", buf, 0x16u);
  }
  v15 = +[SRError errorWithCode:0];
  [a3 from];
  (*((void (**)(id, void, void, void, void, uint64_t, void, SRError *))a4 + 2))(a4, 0, 0, 0, 0, 1, 0, v15);
}

uint64_t __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get proxy object for fetch because %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) from];
  return (*(uint64_t (**)(uint64_t, void, void, void, void, uint64_t, void, uint64_t))(v5 + 16))(v5, 0, 0, 0, 0, 1, 0, a2);
}

uint64_t __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);

  return [Weak continueFetchRequest:v13 samples:a2 timestamp:a4 cursor:a3 fetchState:a5 error:v14 withCallback:a6];
}

uint64_t __46__SRReaderLongTermBackend_fetch_withCallback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);

  return [Weak continueFetchRequest:v13 samples:a2 timestamp:a4 cursor:a3 fetchState:a5 error:v14 withCallback:a6];
}

- (void)continueFetchRequest:(id)a3 samples:(id)a4 timestamp:(double)a5 cursor:(id)a6 fetchState:(unint64_t)a7 error:(id)a8 withCallback:(id)a9
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v14 = (*((uint64_t (**)(id, uint64_t, uint64_t, void, void, unint64_t, id, id, double))a9 + 2))(a9, [a4 bytes], objc_msgSend(a4, "length"), 0, 0, a7, a6, a8, a5);
  if (a7 == 1)
  {
    uint64_t v17 = SRLogLongTermBackend;
    if (!os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_INFO)) {
      return;
    }
    sensor = self->_sensor;
    int v24 = 138412290;
    v25 = sensor;
    v19 = "[%@{public}@] Fetch is complete";
    id v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
LABEL_11:
    _os_log_impl(&dword_21FCA3000, v20, v21, v19, (uint8_t *)&v24, 0xCu);
    return;
  }
  if (!a7 && (v14 & 1) == 0)
  {
    uint64_t v22 = SRLogLongTermBackend;
    if (!os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v23 = self->_sensor;
    int v24 = 138543362;
    v25 = v23;
    v19 = "[%{public}@] Ending fetching early due to an error or delegate's intent";
    id v20 = v22;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }
  v15 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = self->_sensor;
    int v24 = 138543618;
    v25 = v16;
    __int16 v26 = 2114;
    id v27 = a6;
    _os_log_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Requesting data from new cursor %{public}@", (uint8_t *)&v24, 0x16u);
  }
  [a3 setFrom:NAN];
  [a3 setCursor:a6];
  [(SRReaderLongTermBackend *)self fetch:a3 withCallback:a9];
}

- (void)fetchDevices:(id)a3 reply:(id)a4
{
  sensor = self->_sensor;
  uint64_t v7 = [(SRReaderLongTermBackend *)self connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SRReaderLongTermBackend_fetchDevices_reply___block_invoke;
  v10[3] = &unk_26452E1A8;
  v10[4] = sensor;
  v10[5] = a4;
  id v8 = [(NSXPCConnection *)v7 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SRReaderLongTermBackend_fetchDevices_reply___block_invoke_23;
  v9[3] = &unk_26452E380;
  v9[4] = a4;
  [v8 fetchDevices:a3 reply:v9];
}

uint64_t __46__SRReaderLongTermBackend_fetchDevices_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get proxy object for fetchDevices because %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __46__SRReaderLongTermBackend_fetchDevices_reply___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchReaderMetadata:(id)a3 reply:(id)a4
{
  uint64_t v5 = SRLogLongTermBackend;
  if (os_log_type_enabled((os_log_t)SRLogLongTermBackend, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_fault_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_FAULT, "fetchReaderMetadata: is not supported for the long term storage backend", v6, 2u);
  }
  (*((void (**)(id, void))a4 + 2))(a4, MEMORY[0x263EFFA78]);
}

- (void)startRecording:(id)a3 reply:(id)a4
{
}

- (void)stopRecording:(id)a3 reply:(id)a4
{
}

- (NSXPCConnection)connection
{
  if (self && self->_connectionDidInvalidate)
  {

    self->_connection = (NSXPCConnection *)(id)[(id)objc_opt_class() connectionToEndpoint];
    [(SRReaderLongTermBackend *)self setupConnection];
  }
  return self->_connection;
}

- (SRReaderLongTermBackend)initWithSensor:(id)a3 xpcConnection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SRReaderLongTermBackend;
  uint64_t v6 = [(SRReaderLongTermBackend *)&v8 init];
  if (v6)
  {
    v6->_sensor = (NSString *)[a3 copy];
    objc_sync_enter(v6);
    v6->_connection = (NSXPCConnection *)a4;
    objc_sync_exit(v6);
  }
  return v6;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];

  v3.receiver = self;
  v3.super_class = (Class)SRReaderLongTermBackend;
  [(SRReaderLongTermBackend *)&v3 dealloc];
}

- (void)setConnection:(id)a3
{
}

@end