@interface SRSensorWriter
+ (id)clientInterface;
+ (id)connectionToDaemon;
+ (id)remoteInterface;
+ (void)initialize;
- (BOOL)_setSensorConfiguration:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)_setSensorConfiguration:(id)a3 error:(id *)a4;
- (BOOL)authorized;
- (BOOL)connectionDidInterrupt;
- (BOOL)connectionDidInvalidate;
- (BOOL)isMonitoring;
- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)provideSample:(id)a3 error:(id *)a4;
- (BOOL)provideSample:(id)a3 timestamp:(double)a4 error:(id *)a5;
- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5 error:(id *)a6;
- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5 error:(id *)a6;
- (BOOL)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)provideSampleData:(id)a3 error:(id *)a4;
- (BOOL)provideSampleData:(id)a3 timestamp:(double)a4 error:(id *)a5;
- (BOOL)requestNewSegmentInFlight;
- (BOOL)retryGetMonitoring;
- (NSArray)_requestedConfigurations;
- (NSCache)eligibilityCache;
- (NSDictionary)lastConfiguration;
- (NSDictionary)lastMetadata;
- (NSDictionary)nextDatastoreFiles;
- (NSString)sensorIdentifier;
- (NSString)writerAuthorizationService;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)writerAuthorizationUpdateQueue;
- (SRAuthorizationStore)authStore;
- (SRDatastore)datastore;
- (SRSensorWriter)init;
- (SRSensorWriter)initWithIdentifier:(id)a3;
- (SRSensorWriter)initWithIdentifier:(id)a3 xpcConnection:(id)a4 daemonNotification:(id)a5 authStore:(id)a6 tccStore:(id)a7;
- (SRSensorWriterDelegate)delegate;
- (SRTCCStore)tccStore;
- (double)roundingInterval;
- (id)chooseAuthStore;
- (int64_t)_writerAuthorizationStatus;
- (unint64_t)lastConfigurationContinuousTime;
- (unint64_t)lastMetadataContinuousTime;
- (void)_requestWriterAuthorizationWithCompletion:(id)a3;
- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8;
- (void)bundleEligibility:(id)a3 completion:(id)a4;
- (void)checkForMonitoring;
- (void)daemonForcedResetDatastoreFiles:(id)a3;
- (void)daemonNotificationDaemonDidChangeTimeSignificantly:(id)a3;
- (void)daemonNotificationDaemonDidResetDatastore:(id)a3;
- (void)daemonNotificationDaemonDidStart:(id)a3;
- (void)dealloc;
- (void)didReceiveUpdateToConfigurationRequests;
- (void)evaluateAuthorizationState;
- (void)evaluateAuthorizationStateWithNewValue:(BOOL)a3;
- (void)flushDatabase;
- (void)provideSample:(id)a3;
- (void)provideSample:(id)a3 timestamp:(double)a4;
- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4;
- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5;
- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5;
- (void)provideSampleData:(id)a3;
- (void)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4;
- (void)provideSampleData:(id)a3 timestamp:(double)a4;
- (void)registerWithDaemonForWritingIfNeededWithReply:(id)a3;
- (void)requestNewSegment;
- (void)setAuthStore:(id)a3;
- (void)setAuthorized:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionDidInterrupt:(BOOL)a3;
- (void)setConnectionDidInvalidate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEligibilityCache:(id)a3;
- (void)setLastConfiguration:(id)a3;
- (void)setLastConfigurationContinuousTime:(unint64_t)a3;
- (void)setLastMetadata:(id)a3;
- (void)setLastMetadataContinuousTime:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4;
- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4 datastore:(id)a5;
- (void)setMonitoring:(BOOL)a3;
- (void)setNextDatastoreFiles:(id)a3;
- (void)setRequestNewSegmentInFlight:(BOOL)a3;
- (void)setRetryGetMonitoring:(BOOL)a3;
- (void)setRoundingInterval:(double)a3;
- (void)setSensorIdentifier:(id)a3;
- (void)setTccStore:(id)a3;
- (void)setWriterAuthorizationUpdateQueue:(id)a3;
- (void)set_requestedConfigurations:(id)a3;
- (void)set_writerAuthorizationStatus:(int64_t)a3;
- (void)setupConnection;
- (void)startUpdatingAuthorizations;
- (void)updateWriterAuthorizationStatus;
@end

@implementation SRSensorWriter

- (BOOL)isMonitoring
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_monitoring);
  return v2 & 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogWriter = (uint64_t)os_log_create("com.apple.SensorKit", "Writer");
  }
}

+ (id)clientInterface
{
  unsigned __int8 v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D179248];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0), sel_resetDatastoreFiles_, 0, 0);
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), sel_setMonitoring_withRequestedConfigurations_, 1, 0);
  return v2;
}

+ (id)remoteInterface
{
  unsigned __int8 v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181418];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0), sel_requestFileHandleForWritingWithReply_, 0, 1);
  return v2;
}

+ (id)connectionToDaemon
{
  unsigned __int8 v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SensorKit.writer" options:4096];

  return v2;
}

- (SRSensorWriter)init
{
  return 0;
}

- (SRSensorWriter)initWithIdentifier:(id)a3
{
  if ([a3 length])
  {
    uint64_t v5 = [(id)objc_opt_class() connectionToDaemon];
    uint64_t v6 = (SRSensorWriter *)-[SRDaemonNotification initWithSensor:]([SRDaemonNotification alloc], a3);
    uint64_t v7 = [(SRSensorWriter *)self initWithIdentifier:a3 xpcConnection:v5 daemonNotification:v6 authStore:0 tccStore:0];
    self = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (SRSensorWriter)initWithIdentifier:(id)a3 xpcConnection:(id)a4 daemonNotification:(id)a5 authStore:(id)a6 tccStore:(id)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SRSensorWriter;
  v12 = [(SRSensorWriter *)&v21 init];
  if (v12)
  {
    if ([a3 length])
    {
      [(SRSensorWriter *)v12 setSensorIdentifier:a3];
      v12->_monitoring = 0;
      v12->_connection = (NSXPCConnection *)a4;
      [(SRSensorWriter *)v12 setupConnection];
      v13 = (id *)a5;
      v12->_daemonNotification = (SRDaemonNotification *)v13;
      if (v13) {
        objc_storeWeak(v13 + 3, v12);
      }
      v12->_eligibilityCache = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
      id v14 = +[SRSensorDescription sensorDescriptionForSensor:v12->_sensorIdentifier];
      if (!v14)
      {
        v15 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = a3;
          _os_log_fault_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_FAULT, "Failed to find a sensor description for service: %{public}@", buf, 0xCu);
        }
      }
      [v14 roundingInterval];
      v12->_roundingInterval = v16;
      v17 = (NSString *)(id)[v14 writerAuthorizationService];
      v12->_writerAuthorizationService = v17;
      if (v17)
      {
        if (a7) {
          v18 = (SRTCCStorePassThrough *)a7;
        }
        else {
          v18 = objc_alloc_init(SRTCCStorePassThrough);
        }
        v12->_tccStore = (SRTCCStore *)v18;
        v12->_writerAuthorizationUpdateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SensorKit.writerAuthorizationUpdate", 0);
        [(SRSensorWriter *)v12 startUpdatingAuthorizations];
        [+[SRAuthorizationClient sharedInstance] addListener:v12 forBundleId:@"com.apple.private.SensorKit._compositeBundle"];
      }
      else
      {
        if (a6) {
          v19 = (SRAuthorizationStore *)a6;
        }
        else {
          v19 = (SRAuthorizationStore *)[(SRSensorWriter *)v12 chooseAuthStore];
        }
        v12->_authStore = v19;
        [(SRSensorWriter *)v12 set_writerAuthorizationStatus:1];
        [(SRAuthorizationStore *)[(SRSensorWriter *)v12 authStore] addReaderAuthorizationDelegate:v12];
      }
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  self->_daemonNotification = 0;
  [(NSXPCConnection *)self->_connection invalidate];

  self->_connection = 0;
  self->_authStore = 0;
  [(SRSensorWriter *)self setTccStore:0];

  self->_datastore = 0;
  [(SRSensorWriter *)self setNextDatastoreFiles:0];

  self->_sensorIdentifier = 0;
  self->_defaults = 0;

  self->__requestedConfigurations = 0;
  notify_cancel(self->_notifyToken);
  [(SRSensorWriter *)self setWriterAuthorizationUpdateQueue:0];

  self->_writerAuthorizationService = 0;
  [(SRSensorWriter *)self setLastMetadata:0];
  [(SRSensorWriter *)self setLastConfiguration:0];

  v3.receiver = self;
  v3.super_class = (Class)SRSensorWriter;
  [(SRSensorWriter *)&v3 dealloc];
}

- (id)chooseAuthStore
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", self->_sensorIdentifier), "authorizationStoreCohort");
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", self->_sensorIdentifier, 0);
    uint64_t v6 = (void *)MEMORY[0x223C5D6B0]();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = (void *)+[SRSensorsCache defaultCache]();
    uint64_t v8 = -[SRSensorsCache allSensorDescriptions](v7);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          id v14 = (void *)MEMORY[0x223C5D6B0]();
          if (objc_msgSend(v4, "isEqualToString:", objc_msgSend(v13, "authorizationStoreCohort"))) {
            objc_msgSend(v5, "addObject:", objc_msgSend(v13, "name"));
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
    id v15 = +[SRAuthorizationStore sharedAuthorizationStoreForSensors:v5];

    return v15;
  }
  else
  {
    v17 = [SRAuthorizationStore alloc];
    v18 = -[SRAuthorizationStore initWithSensors:](v17, "initWithSensors:", [MEMORY[0x263EFFA08] setWithObject:self->_sensorIdentifier]);
    return v18;
  }
}

- (void)daemonNotificationDaemonDidStart:(id)a3
{
  if ([(SRSensorWriter *)self connectionDidInvalidate])
  {
    uint64_t v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has restarted after being invalidated. Re-establishing connection", buf, 2u);
    }
    [(NSXPCConnection *)[(SRSensorWriter *)self connection] invalidate];
    -[SRSensorWriter setConnection:](self, "setConnection:", [(id)objc_opt_class() connectionToDaemon]);
    [(SRSensorWriter *)self setupConnection];
  }
  if ([(SRSensorWriter *)self retryGetMonitoring])
  {
    uint64_t v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_INFO, "Trying to get monitoring flag after daemon restart", v6, 2u);
    }
    [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:&__block_literal_global_5];
  }
}

void __51__SRSensorWriter_daemonNotificationDaemonDidStart___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      uint64_t v5 = a2;
      _os_log_error_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)daemonNotificationDaemonDidChangeTimeSignificantly:(id)a3
{
  int v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has synced time. Requesting a new segment and time info", buf, 2u);
  }
  if ([(SRSensorWriter *)self authorized])
  {
    [(SRSensorWriter *)self requestNewSegment];
  }
  else
  {
    uint64_t v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "Writer is not authorized so not asking for a new segment", v6, 2u);
    }
  }
}

- (void)daemonNotificationDaemonDidResetDatastore:(id)a3
{
  int v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has reset our datastore. Requesting a new segment", buf, 2u);
  }
  if ([(SRSensorWriter *)self authorized])
  {
    [(SRSensorWriter *)self requestNewSegment];
  }
  else
  {
    uint64_t v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "Writer is not authorized so not asking for a new segment", v6, 2u);
    }
  }
}

- (void)setupConnection
{
  uint64_t v3 = [(SRSensorWriter *)self connection];
  -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)v3 setExportedObject:+[SRSensorWriterClient sensorWriterClientWithWriter:self]];
  -[NSXPCConnection setExportedInterface:](v3, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SRSensorWriter_setupConnection__block_invoke;
  v6[3] = &unk_26452E018;
  objc_copyWeak(&v7, &location);
  [(NSXPCConnection *)v3 setInterruptionHandler:v6];
  [(SRSensorWriter *)self setConnectionDidInterrupt:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SRSensorWriter_setupConnection__block_invoke_69;
  v4[3] = &unk_26452E018;
  objc_copyWeak(&v5, &location);
  [(NSXPCConnection *)v3 setInvalidationHandler:v4];
  [(SRSensorWriter *)self setConnectionDidInvalidate:0];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __33__SRSensorWriter_setupConnection__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon interrupted", v4, 2u);
  }
  return [objc_loadWeak((id *)(a1 + 32)) setConnectionDidInterrupt:1];
}

uint64_t __33__SRSensorWriter_setupConnection__block_invoke_69(uint64_t a1)
{
  unsigned __int8 v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon invalidated", v5, 2u);
  }
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak setConnectionDidInvalidate:1];
  return [Weak setMonitoring:0];
}

- (void)checkForMonitoring
{
  [(SRSensorWriter *)self setRetryGetMonitoring:1];

  [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:&__block_literal_global_71];
}

void __36__SRSensorWriter_checkForMonitoring__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      uint64_t v5 = a2;
      _os_log_error_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)registerWithDaemonForWritingIfNeededWithReply:(id)a3
{
  if ([(SRSensorWriter *)self connectionDidInterrupt]
    || [(SRSensorWriter *)self retryGetMonitoring])
  {
    uint64_t v5 = [(SRSensorWriter *)self connection];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__SRSensorWriter_registerWithDaemonForWritingIfNeededWithReply___block_invoke;
    v8[3] = &unk_26452E1D0;
    v8[4] = a3;
    id v6 = [(NSXPCConnection *)v5 remoteObjectProxyWithErrorHandler:v8];
    [v6 startWritingForSensor:self->_sensorIdentifier];
    if (v6)
    {
      [(SRSensorWriter *)self setConnectionDidInterrupt:0];
      (*((void (**)(id, void))a3 + 2))(a3, 0);
    }
  }
  else
  {
    id v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
}

uint64_t __64__SRSensorWriter_registerWithDaemonForWritingIfNeededWithReply___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v4 = 0;
    _os_log_error_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_ERROR, "Failed to connect with daemon", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)daemonForcedResetDatastoreFiles:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([a3 objectForKeyedSubscript:0x26D16A268])
  {
    [(SRSensorWriter *)self resetDatastoreFiles:a3];
    if ([a3 count]
      && [(NSArray *)[(SRSensorWriter *)self _requestedConfigurations] count])
    {
      [(SRSensorWriter *)self didReceiveUpdateToConfigurationRequests];
    }
  }
  else
  {
    uint64_t v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      sensorIdentifier = self->_sensorIdentifier;
      int v7 = 138543362;
      uint64_t v8 = sensorIdentifier;
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Daemon is resetting the writer datastore, asking for a new segment", (uint8_t *)&v7, 0xCu);
    }
    [(SRSensorWriter *)self requestNewSegment];
  }
}

- (SRDatastore)datastore
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SRSensorWriter *)self nextDatastoreFiles];
  if (!v3) {
    return self->_datastore;
  }
  int v4 = v3;
  [(SRSensorWriter *)self setNextDatastoreFiles:0];
  [(SRSensorWriter *)self flushDatabase];

  self->_datastore = 0;
  id v5 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A268];
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A288];
  id v7 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A2A8];
  id v8 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A2C8];
  uint64_t v9 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    sensorIdentifier = self->_sensorIdentifier;
    *(_DWORD *)buf = 138544386;
    long long v22 = (NSDictionary *)sensorIdentifier;
    __int16 v23 = 2114;
    uint64_t v24 = v5;
    __int16 v25 = 2114;
    v26 = v6;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating a new datastore with samples: %{public}@, metadata: %{public}@, configuration: %{public}@, defaults: %{public}@", buf, 0x34u);
  }
  if ([(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A268])
  {

    self->_defaults = (SRDefaults *)-[SRDefaults initWithDictionary:]([SRDefaults alloc], v8);
    uint64_t v11 = [SRDatastore alloc];
    if (v11) {
      uint64_t v11 = (SRDatastore *)-[SRDatastore initWithSampleFile:metadataFile:configurationFile:permission:defaults:](v11, v5, v6, v7, 1, (uint64_t)self->_defaults);
    }
    self->_datastore = v11;
    if (v6)
    {
      uint64_t v12 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
      {
        lastMetadata = self->_lastMetadata;
        *(_DWORD *)buf = 138412290;
        long long v22 = lastMetadata;
        _os_log_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_INFO, "Carrying over previous metadata: %@", buf, 0xCu);
      }
      [(SRSensorWriter *)self setMetadata:[(SRSensorWriter *)self lastMetadata] continuousTimestamp:[(SRSensorWriter *)self lastMetadataContinuousTime] datastore:self->_datastore];
    }
    if (v7)
    {
      id v14 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
      {
        lastConfiguration = self->_lastConfiguration;
        *(_DWORD *)buf = 138412290;
        long long v22 = lastConfiguration;
        _os_log_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_INFO, "Carrying over previous configuration: %@", buf, 0xCu);
      }
      long long v20 = 0;
      if (![(SRSensorWriter *)self _setSensorConfiguration:[(SRSensorWriter *)self lastConfiguration] continuousTimestamp:[(SRSensorWriter *)self lastConfigurationContinuousTime] error:&v20])
      {
        double v16 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          long long v22 = v20;
          _os_log_error_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_ERROR, "Error carrying over previous configuration because %{public}@", buf, 0xCu);
        }
      }
    }
    v17 = [(SRSensorWriter *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(SRSensorWriterDelegate *)v17 sensorWriterDidResetDatastore:self];
    }
    return self->_datastore;
  }
  long long v19 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_DEBUG, "No sample file received so clearing the datastore", buf, 2u);
  }
  return 0;
}

- (void)provideSample:(id)a3
{
}

- (BOOL)provideSample:(id)a3 error:(id *)a4
{
  uint64_t v7 = mach_continuous_time();
  double v8 = SRAbsoluteTimeFromContinuousTime(v7);

  return [(SRSensorWriter *)self provideSample:a3 timestamp:a4 error:v8];
}

- (void)provideSample:(id)a3 timestamp:(double)a4
{
}

- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  double v8 = SRAbsoluteTimeFromContinuousTime(a4);

  return [(SRSensorWriter *)self provideSample:a3 timestamp:a5 error:v8];
}

- (BOOL)provideSample:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  uint64_t v8 = [a3 binarySampleRepresentation];

  return [(SRSensorWriter *)self provideSampleData:v8 timestamp:a5 error:a4];
}

- (void)provideSampleData:(id)a3
{
}

- (BOOL)provideSampleData:(id)a3 error:(id *)a4
{
  uint64_t v7 = mach_continuous_time();
  double v8 = SRAbsoluteTimeFromContinuousTime(v7);

  return [(SRSensorWriter *)self provideSampleData:a3 timestamp:a4 error:v8];
}

- (void)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4
{
}

- (BOOL)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  double v8 = SRAbsoluteTimeFromContinuousTime(a4);

  return [(SRSensorWriter *)self provideSampleData:a3 timestamp:a5 error:v8];
}

- (void)provideSampleData:(id)a3 timestamp:(double)a4
{
}

- (BOOL)provideSampleData:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  uint64_t v9 = [a3 bytes];
  uint64_t v10 = [a3 length];

  return [(SRSensorWriter *)self provideSampleBytes:v9 length:v10 timestamp:a5 error:a4];
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4
{
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = mach_continuous_time();
  double v10 = SRAbsoluteTimeFromContinuousTime(v9);

  return [(SRSensorWriter *)self provideSampleBytes:a3 length:a4 timestamp:a5 error:v10];
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5
{
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5 error:(id *)a6
{
  double v10 = SRAbsoluteTimeFromContinuousTime(a5);

  return [(SRSensorWriter *)self provideSampleBytes:a3 length:a4 timestamp:a6 error:v10];
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5
{
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5 error:(id *)a6
{
  uint64_t v34 = 0;
  if (a6) {
    double v10 = (SRError **)a6;
  }
  else {
    double v10 = (SRError **)&v34;
  }
  if (![(SRSensorWriter *)self authorized])
  {
    uint64_t v22 = 12289;
LABEL_22:
    __int16 v23 = +[SRError errorWithCode:v22];
    BOOL result = 0;
    *double v10 = v23;
    return result;
  }
  if (![(SRSensorWriter *)self isMonitoring])
  {
    uint64_t v22 = 12288;
    goto LABEL_22;
  }
  if ([(SRSensorWriter *)self _writerAuthorizationStatus] != 1)
  {
    uint64_t v22 = 12295;
    goto LABEL_22;
  }
  if (!a3)
  {
    *double v10 = +[SRError errorWithCode:12290];
    __int16 v25 = SRLogWriter;
    BOOL v26 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v26) {
      return result;
    }
    __int16 v33 = 0;
    __int16 v27 = "Trying to write null sample";
    v28 = (uint8_t *)&v33;
LABEL_28:
    _os_log_impl(&dword_21FCA3000, v25, OS_LOG_TYPE_DEFAULT, v27, v28, 2u);
    return 0;
  }
  if (!a4)
  {
    *double v10 = +[SRError errorWithCode:12290];
    __int16 v25 = SRLogWriter;
    BOOL v29 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v29) {
      return result;
    }
    __int16 v32 = 0;
    __int16 v27 = "Trying to write a sample of 0 bytes";
    v28 = (uint8_t *)&v32;
    goto LABEL_28;
  }
  uint64_t v11 = [(SRSensorWriter *)self datastore];
  v13 = v11;
  if (self->_roundingInterval > 0.0)
  {
    if (!v11)
    {
      if (-[SRDatastore writeSampleBytes:length:timestamp:error:](0, (const char *)a3, a4, v10, 0.000000999999997)) {
        goto LABEL_39;
      }
LABEL_40:
      uint64_t v22 = 12294;
      goto LABEL_22;
    }
    id Property = objc_getProperty(v11, v12, 40, 1);
    if (Property)
    {
      double v15 = *((double *)Property + 6);
      [*((id *)Property + 5) doubleValue];
      a5 = fmax(v15, v16) + 0.000000999999997;
    }
    else
    {
      a5 = 0.000000999999997;
    }
  }
  if (!-[SRDatastore writeSampleBytes:length:timestamp:error:]((BOOL)v13, (const char *)a3, a4, v10, a5))
  {
    if (v13) {
      return 0;
    }
    goto LABEL_40;
  }
  if (v13)
  {
    v18 = objc_getProperty(v13, v17, 40, 1);
    if (v18)
    {
      uint64_t v19 = v18[3];
      if (v19 && (uint64_t v20 = *(void *)(v19 + 16)) != 0)
      {
        unint64_t v21 = *(void *)(v20 + 4);
      }
      else
      {
        uint64_t v30 = v18[2];
        if (v30) {
          unint64_t v21 = *(void *)(v30 + 24) - *(void *)(v30 + 16) + 56;
        }
        else {
          unint64_t v21 = 56;
        }
      }
      goto LABEL_33;
    }
  }
LABEL_39:
  unint64_t v21 = 0;
LABEL_33:
  defaults = self->_defaults;
  if (defaults) {
    defaults = (SRDefaults *)defaults->_segmentSize;
  }
  if (v21 > (unint64_t)defaults) {
    [(SRSensorWriter *)self requestNewSegment];
  }
  return 1;
}

- (void)requestNewSegment
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(SRSensorWriter *)self requestNewSegmentInFlight])
  {
    uint64_t v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      sensorIdentifier = self->_sensorIdentifier;
      *(_DWORD *)buf = 138543362;
      double v8 = sensorIdentifier;
      _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Request for a new segment is already inflight", buf, 0xCu);
    }
  }
  else
  {
    [(SRSensorWriter *)self setRequestNewSegmentInFlight:1];
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__SRSensorWriter_requestNewSegment__block_invoke;
    v5[3] = &unk_26452E670;
    objc_copyWeak(&v6, (id *)buf);
    [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __35__SRSensorWriter_requestNewSegment__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = a2;
      _os_log_error_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_ERROR, "Error registering with daemon because %{public}@", buf, 0xCu);
    }
  }
  else
  {
    int v4 = (id *)(a1 + 32);
    id v5 = (void *)[objc_loadWeak((id *)(a1 + 32)) connection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__SRSensorWriter_requestNewSegment__block_invoke_77;
    v9[3] = &unk_26452E670;
    objc_copyWeak(&v10, v4);
    id v6 = (void *)[v5 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__SRSensorWriter_requestNewSegment__block_invoke_78;
    v7[3] = &unk_26452E698;
    objc_copyWeak(&v8, v4);
    [v6 requestFileHandleForWritingWithReply:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
  }
}

uint64_t __35__SRSensorWriter_requestNewSegment__block_invoke_77(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to get proxy object to request a new segment because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [objc_loadWeak((id *)(a1 + 32)) setRequestNewSegmentInFlight:0];
}

uint64_t __35__SRSensorWriter_requestNewSegment__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak setRequestNewSegmentInFlight:0];
  uint64_t v4 = [a2 objectForKeyedSubscript:0x26D16A308];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "Error requesting new segment %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  [Weak resetDatastoreFiles:a2];
  uint64_t result = [a2 count];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(Weak, "_requestedConfigurations"), "count");
    if (result) {
      return [Weak didReceiveUpdateToConfigurationRequests];
    }
  }
  return result;
}

- (void)setMetadata:(id)a3
{
  uint64_t v5 = mach_continuous_time();

  [(SRSensorWriter *)self setMetadata:a3 continuousTimestamp:v5];
}

- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4
{
  uint64_t v7 = [(SRSensorWriter *)self datastore];

  [(SRSensorWriter *)self setMetadata:a3 continuousTimestamp:a4 datastore:v7];
}

- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4 datastore:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v9 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v20];
  uint64_t v10 = v20;
  if (v20)
  {
    uint64_t v11 = SRLogWriter;
    if (!os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = (SRError *)a3;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    uint64_t v12 = "Error trying to archive metadata %{public}@ %{public}@";
    uint64_t v13 = v11;
    uint32_t v14 = 22;
    goto LABEL_9;
  }
  double v15 = v9;
  double v16 = (const void *)[v9 bytes];
  size_t v17 = [v15 length];
  double v18 = SRAbsoluteTimeFromContinuousTime(a4);
  if (a5
    && (writeMetadataBytesForFrameStore(*((SRFramesStoreOffsetEnumerator **)a5 + 6), v16, v17, &v20, v18) & 1) != 0)
  {
    [(SRSensorWriter *)self setLastMetadata:a3];
    [(SRSensorWriter *)self setLastMetadataContinuousTime:a4];
    return;
  }
  uint64_t v19 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v20;
    uint64_t v12 = "Failed to write metadata because %{public}@";
    uint64_t v13 = v19;
    uint32_t v14 = 12;
LABEL_9:
    _os_log_error_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
}

- (BOOL)_setSensorConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v7 = mach_continuous_time();

  return [(SRSensorWriter *)self _setSensorConfiguration:a3 continuousTimestamp:v7 error:a4];
}

- (BOOL)_setSensorConfiguration:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  if (a5) {
    int v8 = (SRError **)a5;
  }
  else {
    int v8 = (SRError **)&v21;
  }
  if (![(SRSensorWriter *)self authorized])
  {
    uint64_t v16 = 12289;
LABEL_12:
    size_t v17 = +[SRError errorWithCode:v16];
    LOBYTE(v15) = 0;
    *int v8 = v17;
    return v15;
  }
  if (![(SRSensorWriter *)self isMonitoring])
  {
    uint64_t v16 = 12288;
    goto LABEL_12;
  }
  uint64_t v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:v8];
  if (!v9)
  {
    double v18 = SRLogWriter;
    int v15 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR);
    if (!v15) {
      return v15;
    }
    uint64_t v19 = *v8;
    *(_DWORD *)buf = 138543618;
    id v23 = a3;
    __int16 v24 = 2114;
    uint64_t v25 = v19;
    _os_log_error_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_ERROR, "Error trying to archive metadata %{public}@ %{public}@", buf, 0x16u);
    goto LABEL_16;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(SRSensorWriter *)self datastore];
  uint64_t v12 = (const void *)[v10 bytes];
  size_t v13 = [v10 length];
  double v14 = SRAbsoluteTimeFromContinuousTime(a4);
  if (!v11)
  {
LABEL_16:
    LOBYTE(v15) = 0;
    return v15;
  }
  int v15 = writeMetadataBytesForFrameStore((SRFramesStoreOffsetEnumerator *)v11->_configuration, v12, v13, v8, v14);
  if (v15)
  {
    [(SRSensorWriter *)self setLastConfiguration:a3];
    [(SRSensorWriter *)self setLastConfigurationContinuousTime:a4];
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (void)didReceiveUpdateToConfigurationRequests
{
  if ([(SRSensorWriterDelegate *)self->_delegate conformsToProtocol:&unk_26D181478])
  {
    delegate = self->_delegate;
    if (objc_opt_respondsToSelector())
    {
      requestedConfigurations = self->__requestedConfigurations;
      [(SRSensorWriterDelegate *)delegate sensorWriter:self didReceiveUpdateToConfigurationRequests:requestedConfigurations];
    }
  }
}

- (void)set_requestedConfigurations:(id)a3
{
  if (!-[NSArray isEqualToArray:](self->__requestedConfigurations, "isEqualToArray:")
    && ([a3 count] || -[NSArray count](self->__requestedConfigurations, "count")))
  {

    self->__requestedConfigurations = (NSArray *)[a3 copy];
    if ([(SRSensorWriter *)self isMonitoring])
    {
      [(SRSensorWriter *)self didReceiveUpdateToConfigurationRequests];
    }
  }
}

- (void)setMonitoring:(BOOL)a3
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(SRSensorWriter *)self setRetryGetMonitoring:0];
  int v5 = [(SRSensorWriter *)self isMonitoring];
  int v6 = SRLogWriter;
  if (v5 == v3)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      sensorIdentifier = self->_sensorIdentifier;
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = sensorIdentifier;
      __int16 v20 = 1026;
      LODWORD(v21) = [(SRSensorWriter *)self isMonitoring];
      _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_INFO, "[%@] monitoring is already %{public, BOOL}d. Ignoring update", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_sensorIdentifier;
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v7;
      __int16 v20 = 1026;
      LODWORD(v21) = v3;
      _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] monitoring requested to set to %{public, BOOL}d", buf, 0x12u);
    }
    if (v3)
    {
      int64_t v8 = [(SRSensorWriter *)self _writerAuthorizationStatus];
      if (v8 == 1)
      {
        objc_initWeak((id *)buf, self);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __32__SRSensorWriter_setMonitoring___block_invoke;
        v16[3] = &unk_26452E528;
        objc_copyWeak(&v17, (id *)buf);
        v16[4] = self;
        [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:v16];
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        double v14 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = self->_sensorIdentifier;
          *(_DWORD *)buf = 138543874;
          uint64_t v19 = v15;
          __int16 v20 = 2050;
          int64_t v21 = v8;
          __int16 v22 = 1026;
          int v23 = 0;
          _os_log_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] does not have explicit writer authorization (status: %{public}ld). Setting monitoring to %{public, BOOL}d", buf, 0x1Cu);
        }
        [(SRSensorWriter *)self setMonitoring:0];
        [(SRSensorWriter *)self setRetryGetMonitoring:1];
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)&self->_monitoring);
      uint64_t v10 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = self->_sensorIdentifier;
        BOOL v12 = [(SRSensorWriter *)self isMonitoring];
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v11;
        __int16 v20 = 1026;
        LODWORD(v21) = v12;
        _os_log_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_DEFAULT, "[%@] monitoring set to %{public, BOOL}d", buf, 0x12u);
      }
      -[SRSensorWriter resetDatastoreFiles:](self, "resetDatastoreFiles:", [NSDictionary dictionary]);
      size_t v13 = [(SRSensorWriter *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(SRSensorWriterDelegate *)v13 sensorWriterDidStopMonitoring:self];
      }
    }
  }
}

void __32__SRSensorWriter_setMonitoring___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)(a1 + 40);
  id Weak = objc_loadWeak((id *)(a1 + 40));
  int v6 = Weak;
  if (a2)
  {
    uint64_t v7 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = a2;
      _os_log_error_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_ERROR, "[%@] Error registering with daemon because %{public}@. Setting monitoring to false", buf, 0x16u);
    }
    [v6 setMonitoring:0];
    [v6 setRetryGetMonitoring:1];
  }
  else
  {
    int64_t v8 = objc_msgSend((id)objc_msgSend(Weak, "connection"), "remoteObjectProxy");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__SRSensorWriter_setMonitoring___block_invoke_136;
    v10[3] = &unk_26452E6C0;
    objc_copyWeak(&v11, v4);
    v10[4] = *(void *)(a1 + 32);
    [v8 requestFileHandleForWritingWithReply:v10];
    objc_destroyWeak(&v11);
  }
}

void __32__SRSensorWriter_setMonitoring___block_invoke_136(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id Weak = (unsigned __int8 *)objc_loadWeak((id *)(a1 + 40));
  uint64_t v5 = [a2 objectForKeyedSubscript:0x26D16A308];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_error_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_ERROR, "[%@] Error requesting file handle %{public}@. Setting monitoring to false", (uint8_t *)&v12, 0x16u);
    }
    [Weak resetDatastoreFiles:MEMORY[0x263EFFA78]];
    [Weak setMonitoring:0];
    [Weak setRetryGetMonitoring:1];
  }
  else
  {
    [Weak resetDatastoreFiles:a2];
    if (Weak)
    {
      atomic_store(1u, Weak + 40);
      int64_t v8 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        uint64_t v13 = [Weak sensorIdentifier];
        __int16 v14 = 1026;
        LODWORD(v15) = [Weak isMonitoring];
        _os_log_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_DEFAULT, "[%@] monitoring set to %{public, BOOL}d", (uint8_t *)&v12, 0x12u);
      }
      if (objc_msgSend((id)objc_msgSend(Weak, "_requestedConfigurations"), "count")) {
        [Weak didReceiveUpdateToConfigurationRequests];
      }
      uint64_t v9 = (void *)[Weak delegate];
      if (objc_opt_respondsToSelector()) {
        [v9 sensorWriterWillStartMonitoring:Weak];
      }
    }
    else
    {
      uint64_t v10 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_ERROR, "Writer instance is nil so not setting the monitoring flag", (uint8_t *)&v12, 2u);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SRSensorWriterDelegate *)a3;
  if ([(SRSensorWriter *)self _writerAuthorizationStatus]
    && [a3 conformsToProtocol:&unk_26D1814D8]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "sensorWriter:didChangeWriterAuthorizationStatus:", self, -[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus"));
  }
  if ([(SRSensorWriter *)self isMonitoring] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [a3 sensorWriterWillStartMonitoring:self];
  }
}

- (SRSensorWriterDelegate)delegate
{
  return self->_delegate;
}

- (void)_requestWriterAuthorizationWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v5 = [(SRSensorWriter *)self _writerAuthorizationStatus];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      if ([(SRSensorWriter *)self writerAuthorizationService])
      {
        tccStore = self->_tccStore;
        uint64_t v9 = [(SRSensorWriter *)self writerAuthorizationService];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __60__SRSensorWriter__requestWriterAuthorizationWithCompletion___block_invoke;
        v12[3] = &unk_26452E6E8;
        v12[4] = a3;
        [(SRTCCStore *)tccStore requestAccessForService:v9 completion:v12];
      }
      else
      {
        uint64_t v10 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
        {
          sensorIdentifier = self->_sensorIdentifier;
          *(_DWORD *)buf = 138543362;
          __int16 v14 = sensorIdentifier;
          _os_log_fault_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_FAULT, "Failed to find authorization service for %{public}@. Unable to request authorization", buf, 0xCu);
        }
        (*((void (**)(id, SRError *))a3 + 2))(a3, +[SRError errorWithCode:4]);
      }
    }
  }
  else
  {
    uint64_t v6 = +[SRError errorWithCode:4];
    uint64_t v7 = (void (*)(id, SRError *))*((void *)a3 + 2);
    v7(a3, v6);
  }
}

uint64_t __60__SRSensorWriter__requestWriterAuthorizationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67240192;
    v6[1] = a2;
    _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEFAULT, "TCC has returned from prompt with status: %{public, BOOL}d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startUpdatingAuthorizations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  int v3 = [(SRSensorWriter *)self writerAuthorizationUpdateQueue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke;
  handler[3] = &unk_26452E270;
  objc_copyWeak(&v9, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_notifyToken, (dispatch_queue_t)v3, handler);
  if (v4)
  {
    int64_t v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240192;
      uint32_t v12 = v4;
      _os_log_fault_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_FAULT, "Failed to register for TCC notifications. Got status %{public}d", buf, 8u);
    }
  }
  uint64_t v6 = [(SRSensorWriter *)self writerAuthorizationUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke_146;
  block[3] = &unk_26452E2C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v6, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak updateWriterAuthorizationStatus];
}

uint64_t __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWriterAuthorizationStatus];
}

- (void)updateWriterAuthorizationStatus
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [+[SRAuthorizationClient sharedInstance] dataCollectionEnabled];
  uint64_t v4 = [(SRTCCStore *)self->_tccStore preflightAuthorizationStatusForService:[(SRSensorWriter *)self writerAuthorizationService]];
  uint64_t v5 = v4;
  uint64_t v6 = 2;
  if (v3) {
    uint64_t v6 = 0;
  }
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v6;
  }
  int64_t v8 = [(SRSensorWriter *)self _writerAuthorizationStatus];
  id v9 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v17 = [(SRSensorWriter *)self writerAuthorizationService];
    __int16 v18 = 2050;
    int64_t v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = v5;
    __int16 v22 = 1026;
    BOOL v23 = v3;
    __int16 v24 = 2050;
    uint64_t v25 = v7;
    _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got writer authorization status update. Current: %{public}ld, TCC: %{public}ld, Data Collection: %{public, BOOL}d, New: %{public}ld", buf, 0x30u);
  }
  if (v8 != v7)
  {
    [(SRSensorWriter *)self set_writerAuthorizationStatus:v7];
    if (v7) {
      BOOL v10 = v7 == 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      [(SRSensorWriter *)self setMonitoring:0];
      [(SRSensorWriter *)self setRetryGetMonitoring:1];
      [(SRSensorWriter *)self resetDatastoreFiles:MEMORY[0x263EFFA78]];
    }
    else if (v7 == 1)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __49__SRSensorWriter_updateWriterAuthorizationStatus__block_invoke;
      v14[3] = &unk_26452E670;
      objc_copyWeak(&v15, (id *)buf);
      [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v11 = [(SRSensorWriter *)self delegate];
    if ([(SRSensorWriterDelegate *)v11 conformsToProtocol:&unk_26D1814D8])
    {
      if (objc_opt_respondsToSelector()) {
        [(SRSensorWriterDelegate *)v11 sensorWriter:self didChangeWriterAuthorizationStatus:v7];
      }
    }
    else
    {
      uint32_t v12 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
      {
        sensorIdentifier = self->_sensorIdentifier;
        *(_DWORD *)buf = 138412546;
        id v17 = sensorIdentifier;
        __int16 v18 = 2050;
        int64_t v19 = (int64_t)v11;
        _os_log_error_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_ERROR, "[%@] Got a writer authorization change notification but the delegate (%{public}p) does not conform to SRSensorWriterAuthorizationDelegate", buf, 0x16u);
      }
    }
  }
}

uint64_t __49__SRSensorWriter_updateWriterAuthorizationStatus__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      uint64_t v6 = a2;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to connect with daemon because %{public}@", (uint8_t *)&v5, 0xCu);
    }
    return [objc_loadWeak((id *)(v3 + 32)) setRetryGetMonitoring:1];
  }
  return result;
}

- (void)evaluateAuthorizationState
{
  BOOL v3 = [(SRAuthorizationStore *)[(SRSensorWriter *)self authStore] sensorHasReaderAuthorization:self->_sensorIdentifier];

  [(SRSensorWriter *)self evaluateAuthorizationStateWithNewValue:v3];
}

- (void)evaluateAuthorizationStateWithNewValue:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&void v12[5] = *MEMORY[0x263EF8340];
  BOOL v5 = [(SRSensorWriter *)self authorized];
  [(SRSensorWriter *)self setAuthorized:v3];
  uint64_t v6 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [(SRSensorWriter *)self authorized];
    sensorIdentifier = self->_sensorIdentifier;
    int v11 = 67240450;
    v12[0] = v7;
    LOWORD(v12[1]) = 2112;
    *(void *)((char *)&v12[1] + 2) = sensorIdentifier;
    _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_INFO, "Authorization set to %{public, BOOL}d for %@", (uint8_t *)&v11, 0x12u);
  }
  if (!v5 && [(SRSensorWriter *)self authorized])
  {
    id v9 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = self->_sensorIdentifier;
      int v11 = 138543362;
      *(void *)uint32_t v12 = v10;
      _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEFAULT, "Writer is authorized for %{public}@ connecting to daemon to determine monitoring state", (uint8_t *)&v11, 0xCu);
    }
    [(SRSensorWriter *)self checkForMonitoring];
  }
}

- (void)flushDatabase
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  datastore = self->_datastore;
  if (datastore)
  {
    uint64_t v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      sensorIdentifier = self->_sensorIdentifier;
      int v6 = 138543362;
      BOOL v7 = sensorIdentifier;
      _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Flushing datastore to disk", (uint8_t *)&v6, 0xCu);
      datastore = self->_datastore;
    }
  }
  [(SRDatastore *)datastore syncMappedFiles];
}

- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v14 = objc_msgSend(a8, "isEqualToString:", @"com.apple.private.SensorKit._compositeBundle", a4, a5, a6, a7);
  id v15 = SRLogWriter;
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138544386;
      __int16 v18 = [(SRSensorWriter *)self writerAuthorizationService];
      __int16 v19 = 1026;
      BOOL v20 = v10;
      __int16 v21 = 1026;
      BOOL v22 = v9;
      __int16 v23 = 2114;
      id v24 = a3;
      __int16 v25 = 2114;
      id v26 = a4;
      _os_log_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got authorization client update: data collection: %{public, BOOL}d, onboarding: %{public, BOOL}d, authorized: %{public}@, denied: %{public}@", (uint8_t *)&v17, 0x2Cu);
    }
    uint64_t v16 = 0;
    if (v10 && v9)
    {
      if ([a3 containsObject:self->_sensorIdentifier]) {
        uint64_t v16 = [a4 containsObject:self->_sensorIdentifier] ^ 1;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    [(SRSensorWriter *)self updateWriterAuthorizationStatus];
    [(SRSensorWriter *)self evaluateAuthorizationStateWithNewValue:v16];
  }
  else if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
  {
    int v17 = 138543362;
    __int16 v18 = (NSString *)a8;
    _os_log_fault_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_FAULT, "Shouldn't be getting an auth update for %{public}@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)bundleEligibility:(id)a3 completion:(id)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v7 = -[NSCache objectForKey:](self->_eligibilityCache, "objectForKey:");
  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
    v13[3] = v8;
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke;
    v9[3] = &unk_26452E738;
    v9[5] = a4;
    objc_copyWeak(&v10, &location);
    void v9[4] = a3;
    v9[6] = &v12;
    [(SRSensorWriter *)self registerWithDaemonForWritingIfNeededWithReply:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v12, 8);
}

void __47__SRSensorWriter_bundleEligibility_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = a2;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Error registering with daemon because %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = (id *)(a1 + 56);
    int v6 = (void *)[objc_loadWeak((id *)(a1 + 56)) connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke_147;
    v12[3] = &unk_26452E1D0;
    v12[4] = *(void *)(a1 + 40);
    id v7 = (void *)[v6 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke_148;
    v10[3] = &unk_26452E710;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = v8;
    v10[6] = v9;
    objc_copyWeak(&v11, v5);
    void v10[5] = *(void *)(a1 + 40);
    [v7 fetchEligibilityStatusForBundleIdentifier:v8 reply:v10];
    objc_destroyWeak(&v11);
  }
}

uint64_t __47__SRSensorWriter_bundleEligibility_completion___block_invoke_147(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to get proxy object to request eligibility because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__SRSensorWriter_bundleEligibility_completion___block_invoke_148(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = SRLogWriter;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = a3;
      _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "Error fetching eligibility %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"not eligible";
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v7 = @"eligible";
    }
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_INFO, "Bundle identifier %{public}@ %{public}@ for writing", (uint8_t *)&v10, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 56)), "eligibilityCache"), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), *(void *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)sensorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSensorIdentifier:(id)a3
{
}

- (NSDictionary)nextDatastoreFiles
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNextDatastoreFiles:(id)a3
{
}

- (BOOL)requestNewSegmentInFlight
{
  return self->_requestNewSegmentInFlight;
}

- (void)setRequestNewSegmentInFlight:(BOOL)a3
{
  self->_requestNewSegmentInFlight = a3;
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (void)setAuthorized:(BOOL)a3
{
  self->_authorized = a3;
}

- (BOOL)connectionDidInterrupt
{
  return self->_connectionDidInterrupt;
}

- (void)setConnectionDidInterrupt:(BOOL)a3
{
  self->_connectionDidInterrupt = a3;
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)retryGetMonitoring
{
  return self->_retryGetMonitoring;
}

- (void)setRetryGetMonitoring:(BOOL)a3
{
  self->_retryGetMonitoring = a3;
}

- (int64_t)_writerAuthorizationStatus
{
  return self->__writerAuthorizationStatus;
}

- (void)set_writerAuthorizationStatus:(int64_t)a3
{
  self->__writerAuthorizationStatus = a3;
}

- (NSString)writerAuthorizationService
{
  return self->_writerAuthorizationService;
}

- (SRTCCStore)tccStore
{
  return (SRTCCStore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTccStore:(id)a3
{
}

- (OS_dispatch_queue)writerAuthorizationUpdateQueue
{
  return self->_writerAuthorizationUpdateQueue;
}

- (void)setWriterAuthorizationUpdateQueue:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return self->_authStore;
}

- (void)setAuthStore:(id)a3
{
}

- (NSCache)eligibilityCache
{
  return self->_eligibilityCache;
}

- (void)setEligibilityCache:(id)a3
{
}

- (double)roundingInterval
{
  return self->_roundingInterval;
}

- (void)setRoundingInterval:(double)a3
{
  self->_roundingInterval = a3;
}

- (NSDictionary)lastMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastMetadata:(id)a3
{
}

- (unint64_t)lastMetadataContinuousTime
{
  return self->_lastMetadataContinuousTime;
}

- (void)setLastMetadataContinuousTime:(unint64_t)a3
{
  self->_lastMetadataContinuousTime = a3;
}

- (NSDictionary)lastConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastConfiguration:(id)a3
{
}

- (unint64_t)lastConfigurationContinuousTime
{
  return self->_lastConfigurationContinuousTime;
}

- (void)setLastConfigurationContinuousTime:(unint64_t)a3
{
  self->_lastConfigurationContinuousTime = a3;
}

- (NSArray)_requestedConfigurations
{
  return self->__requestedConfigurations;
}

@end