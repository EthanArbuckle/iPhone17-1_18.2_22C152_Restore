@interface SRReaderSensorKitBackend
+ (SRReaderSensorKitBackend)new;
+ (id)clientInterface;
+ (id)connectionToEndpoint;
+ (id)remoteInterface;
+ (void)initialize;
- (NSXPCConnection)connection;
- (SRReaderSensorKitBackend)init;
- (SRReaderSensorKitBackend)initWithSensor:(id)a3 xpcConnection:(id)a4;
- (id)datastore;
- (void)continueFetchRequest:(void *)a3 from:(uint64_t)a4 to:(double)a5 withDatastoreFiles:(double)a6 callback:;
- (void)dealloc;
- (void)fetch:(id)a3 withCallback:(id)a4;
- (void)fetchDevices:(id)a3 reply:(id)a4;
- (void)fetchReaderMetadata:(id)a3 reply:(id)a4;
- (void)fetchSampleBytesFrom:(uint64_t)a3 to:(void *)a4 inSegment:(uint64_t)a5 fetchRequest:(double)a6 retryAttempt:(double)a7 sampleCallback:;
- (void)resetDatastoreFiles:(id)a3;
- (void)setConnection:(id)a3;
- (void)setupConnection;
- (void)startRecording:(id)a3 reply:(id)a4;
- (void)stopRecording:(id)a3 reply:(id)a4;
@end

@implementation SRReaderSensorKitBackend

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogSensorKitBackend = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitReaderBackend");
  }
}

- (SRReaderSensorKitBackend)init
{
  return 0;
}

+ (SRReaderSensorKitBackend)new
{
  return 0;
}

+ (id)clientInterface
{
  v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D175EE0];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0), sel_resetDatastoreFiles_, 0, 0);
  return v2;
}

+ (id)remoteInterface
{
  v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181238];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0), sel_requestFileHandleForReading_reply_, 0, 1);
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), sel_requestFileHandleForReading_afterSegment_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startRecording_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopRecording_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_fetchAllDevices_reply_, 1, 1);
  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0), sel_fetchReaderMetadata_reply_, 0, 1);
  return v2;
}

+ (id)connectionToEndpoint
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SensorKit.reader" options:4096];

  return v2;
}

- (void)setupConnection
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_INFO))
  {
    sensor = self->_sensor;
    LODWORD(buf.receiver) = 138543362;
    *(id *)((char *)&buf.receiver + 4) = sensor;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Setting up connection to daemon", (uint8_t *)&buf, 0xCu);
  }
  connection = self->_connection;
  -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  id v6 = objc_alloc((Class)self);
  if (v6)
  {
    buf.receiver = v6;
    buf.super_class = (Class)SRSensorReaderClient;
    uint64_t v7 = [(SRReaderSensorKitBackend *)&buf init];
    v8 = v7;
    if (v7) {
      objc_storeWeak((id *)&v7->_datastore, self);
    }
  }
  else
  {
    v8 = 0;
  }
  [(NSXPCConnection *)connection setExportedObject:v8];
  -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  objc_initWeak(&buf.receiver, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__SRReaderSensorKitBackend_setupConnection__block_invoke;
  v15[3] = &unk_26452E018;
  objc_copyWeak(&v16, &buf.receiver);
  [(NSXPCConnection *)connection setInterruptionHandler:v15];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __43__SRReaderSensorKitBackend_setupConnection__block_invoke_52;
  v13 = &unk_26452E018;
  objc_copyWeak(&v14, &buf.receiver);
  [(NSXPCConnection *)connection setInvalidationHandler:&v10];
  Weak = objc_loadWeak(&buf.receiver);
  if (Weak) {
    Weak[24] = 0;
  }
  [(NSXPCConnection *)connection resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf.receiver);
}

void __43__SRReaderSensorKitBackend_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_INFO))
  {
    if (Weak) {
      uint64_t v3 = Weak[4];
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_INFO, "[%{public}@] Connection to daemon has been interrupted.", (uint8_t *)&v4, 0xCu);
  }
}

void __43__SRReaderSensorKitBackend_setupConnection__block_invoke_52(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_INFO))
  {
    if (Weak) {
      uint64_t v3 = Weak[4];
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_INFO, "[%{public}@] Connection to daemon has been invalidated.", (uint8_t *)&v4, 0xCu);
  }
  if (Weak) {
    *((unsigned char *)Weak + 24) = 1;
  }
}

- (NSXPCConnection)connection
{
  if (self && self->_connectionDidInvalidate)
  {

    self->_connection = (NSXPCConnection *)(id)[(id)objc_opt_class() connectionToEndpoint];
    self->_deviceDetails = 0;
    [(SRReaderSensorKitBackend *)self setupConnection];
  }
  return self->_connection;
}

- (SRReaderSensorKitBackend)initWithSensor:(id)a3 xpcConnection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SRReaderSensorKitBackend;
  uint64_t v6 = [(SRReaderSensorKitBackend *)&v8 init];
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

  self->_datastore = 0;
  objc_setProperty_atomic(self, v3, 0, 40);

  v4.receiver = self;
  v4.super_class = (Class)SRReaderSensorKitBackend;
  [(SRReaderSensorKitBackend *)&v4 dealloc];
}

- (void)fetch:(id)a3 withCallback:(id)a4
{
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke;
  v13[3] = &unk_26452E090;
  v13[4] = self;
  v13[5] = a4;
  sensor = self->_sensor;
  objc_super v8 = [(SRReaderSensorKitBackend *)self connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke_58;
  v12[3] = &unk_26452E0B8;
  v12[5] = a3;
  v12[6] = v13;
  v12[4] = sensor;
  id v9 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke_60;
  v10[3] = &unk_26452E0E0;
  objc_copyWeak(&v11, &location);
  v10[4] = a3;
  v10[5] = v13;
  [v9 requestFileHandleForReading:a3 reply:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 a7)
{
  double v9 = a7.n128_f64[0];
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a6)
  {
    uint64_t v12 = 1;
    if (a6 == 1) {
      (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(a7);
    }
    return v12;
  }
  if (!a3)
  {
    uint64_t v15 = SRLogSensorKitBackend;
    if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 32);
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_fault_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_FAULT, "[%{public}@] Received sample with length of 0", (uint8_t *)&v17, 0xCu);
    }
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t, uint64_t, void, SRError *, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, 0, a4, a5, 1, 0, +[SRError errorWithCode:8194], v9);
    return 0;
  }
  v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v13();
}

uint64_t __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke_58(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v4 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    uint64_t v12 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to proxy to remote because %{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) to];
  return (*(uint64_t (**)(uint64_t, void, void, void, void, uint64_t, void, id, double))(v5 + 16))(v5, 0, 0, 0, 0, 1, 0, +[SRError connectionNotFoundError], v6);
}

void __47__SRReaderSensorKitBackend_fetch_withCallback___block_invoke_60(uint64_t a1, void *a2)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v5 = *(void **)(a1 + 32);
  [v5 from];
  double v7 = v6;
  [*(id *)(a1 + 32) to];
  uint64_t v9 = *(void *)(a1 + 40);

  -[SRReaderSensorKitBackend continueFetchRequest:from:to:withDatastoreFiles:callback:](Weak, (uint64_t)v5, a2, v9, v7, v8);
}

- (void)continueFetchRequest:(void *)a3 from:(uint64_t)a4 to:(double)a5 withDatastoreFiles:(double)a6 callback:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  uint64_t v12 = [a3 objectForKeyedSubscript:0x26D16A308];
  if (v12)
  {
    uint64_t v13 = v12;
    objc_msgSend(a1, "resetDatastoreFiles:", objc_msgSend(NSDictionary, "dictionary"));
    id v14 = *(void (**)(uint64_t, void, void, void, void, uint64_t, void, uint64_t, __n128))(a4 + 16);
    uint64_t v15 = a4;
    v16.n128_f64[0] = a6;
    uint64_t v17 = v13;
LABEL_4:
    v14(v15, 0, 0, 0, 0, 1, 0, v17, v16);
    return;
  }
  [a1 resetDatastoreFiles:a3];
  if (![a1 datastore])
  {
    id v14 = *(void (**)(uint64_t, void, void, void, void, uint64_t, void, uint64_t, __n128))(a4 + 16);
    uint64_t v15 = a4;
    v16.n128_f64[0] = a6;
    uint64_t v17 = 0;
    goto LABEL_4;
  }
  uint64_t v18 = (void *)[a3 objectForKeyedSubscript:0x26D16A268];
  if (v18 && (uint64_t v19 = [-[NSFileHandle pathname](v18) lastPathComponent]) != 0)
  {
    -[SRReaderSensorKitBackend fetchSampleBytesFrom:to:inSegment:fetchRequest:retryAttempt:sampleCallback:](a1, v19, a2, 0, a4, a5, a6);
  }
  else
  {
    if (a3)
    {
      if ([a3 objectForKeyedSubscript:0x26D16A268])
      {
        v20 = SRLogSensorKitBackend;
        if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = a1[4];
          int v22 = 138543362;
          uint64_t v23 = v21;
          _os_log_error_impl(&dword_21FCA3000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get segment name from file handle", (uint8_t *)&v22, 0xCu);
        }
      }
    }
    (*(void (**)(uint64_t, void, void, void, void, uint64_t, void, void, double))(a4 + 16))(a4, 0, 0, 0, 0, 1, 0, 0, a6);
  }
}

- (void)fetchSampleBytesFrom:(uint64_t)a3 to:(void *)a4 inSegment:(uint64_t)a5 fetchRequest:(double)a6 retryAttempt:(double)a7 sampleCallback:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3052000000;
    v35[3] = __Block_byref_object_copy_;
    v35[4] = __Block_byref_object_dispose_;
    v35[5] = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3052000000;
    v33[3] = __Block_byref_object_copy_;
    v33[4] = __Block_byref_object_dispose_;
    v33[5] = 0;
    id v14 = (void *)[a1 datastore];
    double v16 = [(SRDatastore *)v14 startTimeOfCurrentSegment];
    if (a6 > a7 || v16 > a7)
    {
      (*(void (**)(uint64_t, void, void, void, void, uint64_t, void, void, double))(a5 + 16))(a5, 0, 0, 0, 0, 1, 0, 0, a7);
    }
    else
    {
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      *(double *)&v32[3] = a6;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 1;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke;
      v27[3] = &unk_26452E108;
      v27[6] = v36;
      v27[7] = v35;
      v27[8] = v34;
      v27[9] = v33;
      v27[10] = v32;
      v27[11] = &v28;
      v27[4] = a1;
      v27[5] = a5;
      -[SRDatastore fetchSamplesFrom:to:callback:](v14, (uint64_t)v27, a6, a7);
      uint64_t v17 = SRLogSensorKitBackend;
      if (*((unsigned char *)v29 + 24))
      {
        if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = a1[4];
          *(_DWORD *)objc_super buf = 138543618;
          uint64_t v38 = v18;
          __int16 v39 = 2114;
          uint64_t v40 = a2;
          _os_log_impl(&dword_21FCA3000, v17, OS_LOG_TYPE_INFO, "[%{public}@] Requesting next segment after %{public}@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, a1);
        uint64_t v19 = a1[4];
        v20 = (void *)[a1 connection];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke_68;
        v25[3] = &unk_26452E130;
        v26[1] = a4;
        v26[2] = *(id *)&a7;
        v25[7] = a5;
        v25[4] = v19;
        objc_copyWeak(v26, (id *)buf);
        v26[3] = *(id *)&a6;
        v25[5] = a2;
        v25[6] = a3;
        uint64_t v21 = (void *)[v20 remoteObjectProxyWithErrorHandler:v25];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke_69;
        v23[3] = &unk_26452E158;
        objc_copyWeak(v24, (id *)buf);
        v23[5] = a5;
        v23[6] = v32;
        v24[1] = *(id *)&a7;
        v23[4] = a3;
        [v21 requestFileHandleForReading:a3 afterSegment:a2 reply:v23];
        objc_destroyWeak(v24);
        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
      }
      else if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = a1[4];
        *(_DWORD *)objc_super buf = 138543362;
        uint64_t v38 = v22;
        _os_log_impl(&dword_21FCA3000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending fetching early due to an error or delegate's intent", buf, 0xCu);
      }
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(v32, 8);
    }
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v36, 8);
  }
}

uint64_t __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke(void *a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a7;
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1[6] + 8) + 24) != a5)
  {
    if (a6)
    {
      uint64_t v39 = a8;
      uint64_t v41 = 0;
      v35 = (void *)MEMORY[0x263EFFA08];
      v36 = (void *)MEMORY[0x263F08928];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      *(void *)(*(void *)(a1[7] + 8) + 40) = objc_msgSend(v36, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v35, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0), objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a5, a6), &v41);
      uint64_t v19 = v41;
      if (v41)
      {
        v20 = SRLogSensorKitBackend;
        if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(a1[4] + 32);
          *(_DWORD *)objc_super buf = 138543618;
          uint64_t v43 = v32;
          __int16 v44 = 2114;
          uint64_t v45 = v19;
          _os_log_error_impl(&dword_21FCA3000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error trying to unarchive metadata %{public}@", buf, 0x16u);
        }
      }
      uint64_t v8 = a7;
      a8 = v39;
    }
    else
    {
      *(void *)(*(void *)(a1[7] + 8) + 40) = 0;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = a5;
  }
  if (*(void *)(*(void *)(a1[8] + 8) + 24) != v8)
  {
    if (a8)
    {
      uint64_t v41 = 0;
      uint64_t v38 = (void *)MEMORY[0x263F08928];
      uint64_t v40 = a8;
      uint64_t v21 = (void *)MEMORY[0x263EFFA08];
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = v8;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v34 = v24;
      uint64_t v8 = v23;
      *(void *)(*(void *)(a1[9] + 8) + 40) = objc_msgSend(v38, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v21, "setWithObjects:", v22, v34, v25, v26, v27, v28, objc_opt_class(), 0), objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v23, v40), &v41);
      uint64_t v29 = v41;
      if (v41)
      {
        uint64_t v30 = SRLogSensorKitBackend;
        if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = *(void *)(a1[4] + 32);
          *(_DWORD *)objc_super buf = 138543618;
          uint64_t v43 = v33;
          __int16 v44 = 2114;
          uint64_t v45 = v29;
          _os_log_error_impl(&dword_21FCA3000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Error trying to unarchive configuration %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      *(void *)(*(void *)(a1[9] + 8) + 40) = 0;
    }
    *(void *)(*(void *)(a1[8] + 8) + 24) = v8;
  }
  *(double *)(*(void *)(a1[10] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = (*(uint64_t (**)(double))(a1[5] + 16))(a2);
  return *(unsigned __int8 *)(*(void *)(a1[11] + 8) + 24);
}

uint64_t __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(uint64_t *)(a1 + 72) <= 1
    && (objc_super v4 = (void *)[a2 domain], objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F07F70]))&& objc_msgSend(a2, "code") == 4097)
  {
    uint64_t v5 = SRLogSensorKitBackend;
    if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v6;
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection was interrupted so retrying the fetch request", (uint8_t *)&v14, 0xCu);
    }
    id Weak = objc_loadWeak((id *)(a1 + 64));
    return -[SRReaderSensorKitBackend fetchSampleBytesFrom:to:inSegment:fetchRequest:retryAttempt:sampleCallback:](Weak, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72) + 1, *(void *)(a1 + 56), *(double *)(a1 + 88), *(double *)(a1 + 80));
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    unint64_t v10 = *(void *)(a1 + 80);
    id v11 = +[SRError connectionNotFoundError];
    uint64_t v12 = *(uint64_t (**)(uint64_t, void, void, void, void, uint64_t, void, id, __n128))(v9 + 16);
    v13.n128_u64[0] = v10;
    return v12(v9, 0, 0, 0, 0, 1, 0, v11, v13);
  }
}

uint64_t __103__SRReaderSensorKitBackend_fetchSampleBytesFrom_to_inSegment_fetchRequest_retryAttempt_sampleCallback___block_invoke_69(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 40);
  v6.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v7.n128_u64[0] = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);

  return -[SRReaderSensorKitBackend continueFetchRequest:from:to:withDatastoreFiles:callback:](Weak, v8, a2, v5, v6, v7);
}

- (void)fetchReaderMetadata:(id)a3 reply:(id)a4
{
  sensor = self->_sensor;
  __n128 v7 = [(SRReaderSensorKitBackend *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SRReaderSensorKitBackend_fetchReaderMetadata_reply___block_invoke;
  v8[3] = &unk_26452E180;
  v8[4] = sensor;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v8), "fetchReaderMetadata:reply:", a3, a4);
}

void __54__SRReaderSensorKitBackend_fetchReaderMetadata_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v4 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get earliest eligible time because %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)startRecording:(id)a3 reply:(id)a4
{
  sensor = self->_sensor;
  uint64_t v7 = [(SRReaderSensorKitBackend *)self connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__SRReaderSensorKitBackend_startRecording_reply___block_invoke;
  v10[3] = &unk_26452E1A8;
  v10[4] = sensor;
  v10[5] = a4;
  id v8 = [(NSXPCConnection *)v7 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SRReaderSensorKitBackend_startRecording_reply___block_invoke_70;
  v9[3] = &unk_26452E1D0;
  v9[4] = a4;
  [v8 startRecording:a3 reply:v9];
}

uint64_t __49__SRReaderSensorKitBackend_startRecording_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v4 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get remote proxy because %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), +[SRError connectionNotFoundError]);
}

uint64_t __49__SRReaderSensorKitBackend_startRecording_reply___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopRecording:(id)a3 reply:(id)a4
{
  sensor = self->_sensor;
  int v7 = [(SRReaderSensorKitBackend *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SRReaderSensorKitBackend_stopRecording_reply___block_invoke;
  v8[3] = &unk_26452E1A8;
  v8[4] = sensor;
  void v8[5] = a4;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v8), "stopRecording:reply:", a3, a4);
}

uint64_t __48__SRReaderSensorKitBackend_stopRecording_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v4 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get remote proxy because %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), +[SRError connectionNotFoundError]);
}

- (void)fetchDevices:(id)a3 reply:(id)a4
{
  sensor = self->_sensor;
  int v7 = [(SRReaderSensorKitBackend *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SRReaderSensorKitBackend_fetchDevices_reply___block_invoke;
  v8[3] = &unk_26452E1A8;
  v8[4] = sensor;
  void v8[5] = a4;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v8), "fetchAllDevices:reply:", a3, a4);
}

uint64_t __47__SRReaderSensorKitBackend_fetchDevices_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v4 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get remote proxy because %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetDatastoreFiles:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 40);
  }
}

- (id)datastore
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self) {
    return self->_datastore;
  }
  id Property = objc_getProperty(self, a2, 40, 1);
  if (!Property) {
    return self->_datastore;
  }
  uint64_t v5 = Property;
  objc_setProperty_atomic(self, v4, 0, 40);

  self->_datastore = 0;
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:0x26D16A268];
  int v7 = (void *)[v5 objectForKeyedSubscript:0x26D16A288];
  uint64_t v8 = (void *)[v5 objectForKeyedSubscript:0x26D16A2A8];
  __int16 v9 = (void *)[v5 objectForKeyedSubscript:0x26D16A2C8];

  uint64_t v10 = (NSDictionary *)(id)[v5 objectForKeyedSubscript:0x26D16A2E8];
  self->_deviceDetails = v10;
  uint64_t v11 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_INFO))
  {
    sensor = self->_sensor;
    int v18 = 138544643;
    uint64_t v19 = sensor;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2113;
    uint64_t v29 = v10;
    _os_log_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Creating a new datastore with samples: %{public}@, metadata: %{public}@, configuration: %{public}@, defaults: %{public}@, deviceDetails: %{private}@", (uint8_t *)&v18, 0x3Eu);
  }
  if (v6)
  {
    __n128 v13 = -[SRDefaults initWithDictionary:]([SRDefaults alloc], v9);
    int v14 = [SRDatastore alloc];
    if (v14) {
      int v14 = (SRDatastore *)-[SRDatastore initWithSampleFile:metadataFile:configurationFile:permission:defaults:](v14, v6, v7, v8, 0, (uint64_t)v13);
    }
    self->_datastore = v14;

    return self->_datastore;
  }
  uint64_t v16 = SRLogSensorKitBackend;
  if (os_log_type_enabled((os_log_t)SRLogSensorKitBackend, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = self->_sensor;
    int v18 = 138543362;
    uint64_t v19 = v17;
    _os_log_debug_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] No sample file received so clearing the datastore", (uint8_t *)&v18, 0xCu);
  }
  return 0;
}

- (void)setConnection:(id)a3
{
}

@end