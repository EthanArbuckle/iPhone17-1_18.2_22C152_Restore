@interface SRSensorPruner
+ (id)clientInterface;
+ (id)connectionToDaemon;
+ (id)remoteInterface;
+ (void)initialize;
+ (void)removeAllSamplesForAllSensorsWithCompletionHandler:(id)a3;
+ (void)removeAllSamplesForAllSensorsWithConnection:(id)a3 completionHandler:(id)a4;
- (BOOL)connectionDidInterrupt;
- (BOOL)connectionDidInvalidate;
- (NSDictionary)nextDatastoreFiles;
- (NSString)sensor;
- (NSXPCConnection)connection;
- (SRDatastore)datastore;
- (SRDevice)device;
- (SRSensorPruner)initWithSensor:(id)a3 device:(id)a4;
- (SRSensorPruner)initWithSensor:(id)a3 xpcConnection:(id)a4 daemonNotification:(id)a5 device:(id)a6;
- (SRSensorPrunerDelegate)delegate;
- (void)continuePruneFrom:(double)a3 to:(double)a4 withDatastoreFiles:(id)a5;
- (void)daemonNotificationDaemonDidStart:(id)a3;
- (void)dealloc;
- (void)registerWithDaemonIfNeededWithReply:(id)a3;
- (void)removeAllSamples;
- (void)removeSamplesFrom:(double)a3 to:(double)a4;
- (void)removeSamplesFrom:(double)a3 to:(double)a4 inSegment:(id)a5;
- (void)setConnection:(id)a3;
- (void)setConnectionDidInterrupt:(BOOL)a3;
- (void)setConnectionDidInvalidate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setNextDatastoreFiles:(id)a3;
- (void)setSensor:(id)a3;
- (void)setupConnection;
@end

@implementation SRSensorPruner

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    SRLogPruner = (uint64_t)os_log_create("com.apple.SensorKit", "Pruner");
  }
}

+ (id)clientInterface
{
  uint64_t v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1783A8];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0), sel_resetDatastoreFiles_, 0, 0);
  return v2;
}

+ (id)remoteInterface
{
  uint64_t v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1813B8];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0), sel_requestFileHandleForPruningSample_reply_, 0, 1);
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), sel_requestFileHandleForPruningAfterSegment_reply_, 0, 1);
  return v2;
}

+ (id)connectionToDaemon
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SensorKit.pruner" options:4096];

  return v2;
}

- (SRSensorPruner)initWithSensor:(id)a3 device:(id)a4
{
  uint64_t v7 = [(id)objc_opt_class() connectionToDaemon];
  id v8 = -[SRDaemonNotification initWithSensor:]([SRDaemonNotification alloc], a3);

  return [(SRSensorPruner *)self initWithSensor:a3 xpcConnection:v7 daemonNotification:v8 device:a4];
}

- (SRSensorPruner)initWithSensor:(id)a3 xpcConnection:(id)a4 daemonNotification:(id)a5 device:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)SRSensorPruner;
  uint64_t v10 = [(SRSensorPruner *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [a3 length];
    if (a6 && v11)
    {
      [(SRSensorPruner *)v10 setSensor:a3];
      v10->_device = (SRDevice *)a6;
      v10->_connection = (NSXPCConnection *)a4;
      [(SRSensorPruner *)v10 setupConnection];
      uint64_t v12 = (SRDaemonNotification *)a5;
      v10->_daemonNotification = v12;
      if (v12) {
        objc_storeWeak((id *)&v12->_delegate, v10);
      }
      [(SRSensorPruner *)v10 setConnectionDidInterrupt:1];
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  self->_daemonNotification = 0;
  [(NSXPCConnection *)self->_connection invalidate];

  self->_connection = 0;
  self->_sensor = 0;
  [(SRSensorPruner *)self setDevice:0];

  self->_datastore = 0;
  [(SRSensorPruner *)self setNextDatastoreFiles:0];
  v3.receiver = self;
  v3.super_class = (Class)SRSensorPruner;
  [(SRSensorPruner *)&v3 dealloc];
}

- (void)daemonNotificationDaemonDidStart:(id)a3
{
  objc_super v3 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_INFO, "Daemon has restarted", v4, 2u);
  }
}

- (void)setupConnection
{
  objc_super v3 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_DEFAULT, "Setting up connection to daemon", (uint8_t *)buf, 2u);
  }
  uint64_t v4 = [(SRSensorPruner *)self connection];
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)v4 setExportedObject:+[SRSensorPrunerClient prunerClientWithPruner:self]];
  -[NSXPCConnection setExportedInterface:](v4, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  objc_initWeak(buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __33__SRSensorPruner_setupConnection__block_invoke;
  v10[3] = &unk_26452E018;
  objc_copyWeak(&v11, buf);
  [(NSXPCConnection *)v4 setInterruptionHandler:v10];
  [(SRSensorPruner *)self setConnectionDidInterrupt:0];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __33__SRSensorPruner_setupConnection__block_invoke_51;
  id v8 = &unk_26452E018;
  objc_copyWeak(&v9, buf);
  [(NSXPCConnection *)v4 setInvalidationHandler:&v5];
  -[SRSensorPruner setConnectionDidInvalidate:](self, "setConnectionDidInvalidate:", 0, v5, v6, v7, v8);
  [(NSXPCConnection *)v4 resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

uint64_t __33__SRSensorPruner_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon has been interrupted.", v4, 2u);
  }
  return [objc_loadWeak((id *)(a1 + 32)) setConnectionDidInterrupt:1];
}

uint64_t __33__SRSensorPruner_setupConnection__block_invoke_51(uint64_t a1)
{
  uint64_t v2 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon has been invalidated.", v4, 2u);
  }
  return [objc_loadWeak((id *)(a1 + 32)) setConnectionDidInvalidate:1];
}

- (void)registerWithDaemonIfNeededWithReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = [(SRSensorPruner *)self connectionDidInterrupt];
  if ([(SRSensorPruner *)self connectionDidInvalidate])
  {
    -[SRSensorPruner setConnection:](self, "setConnection:", [(id)objc_opt_class() connectionToDaemon]);
    [(SRSensorPruner *)self setupConnection];
  }
  if (v5)
  {
    uint64_t v6 = SRLogPruner;
    if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = [(SRSensorPruner *)self sensor];
      _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEFAULT, "Registering for pruning for %{public}@", buf, 0xCu);
    }
    connection = self->_connection;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__SRSensorPruner_registerWithDaemonIfNeededWithReply___block_invoke;
    v10[3] = &unk_26452E1D0;
    void v10[4] = a3;
    id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v10];
    objc_msgSend(v8, "startPruningForSensor:deviceId:", -[SRSensorPruner sensor](self, "sensor"), -[SRDevice deviceIdentifier](-[SRSensorPruner device](self, "device"), "deviceIdentifier"));
    if (v8)
    {
      [(SRSensorPruner *)self setConnectionDidInterrupt:0];
      (*((void (**)(id, void))a3 + 2))(a3, 0);
    }
  }
  else
  {
    id v9 = (void (*)(id, void))*((void *)a3 + 2);
    v9(a3, 0);
  }
}

uint64_t __54__SRSensorPruner_registerWithDaemonIfNeededWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SRDatastore)datastore
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v3 = [(SRSensorPruner *)self nextDatastoreFiles];
  if (!v3) {
    return self->_datastore;
  }
  uint64_t v4 = v3;
  [(SRSensorPruner *)self setNextDatastoreFiles:0];

  self->_datastore = 0;
  id v5 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A268];
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A288];
  id v7 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A2A8];
  id v8 = [(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A2C8];
  id v9 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138543874;
    v15 = v5;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_debug_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEBUG, "Creating a new datastore with samples: %{public}@, metadata: %{public}@, defaults: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  if ([(NSDictionary *)v4 objectForKeyedSubscript:0x26D16A268])
  {
    uint64_t v10 = -[SRDefaults initWithDictionary:]([SRDefaults alloc], v8);
    id v11 = [SRDatastore alloc];
    if (v11) {
      id v11 = (SRDatastore *)-[SRDatastore initWithSampleFile:metadataFile:configurationFile:permission:defaults:](v11, v5, v6, v7, 2, (uint64_t)v10);
    }
    self->_datastore = v11;

    return self->_datastore;
  }
  uint64_t v13 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    _os_log_debug_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_DEBUG, "No sample file received so clearing the datastore", (uint8_t *)&v14, 2u);
  }
  return 0;
}

- (void)removeSamplesFrom:(double)a3 to:(double)a4
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SRSensorPruner_removeSamplesFrom_to___block_invoke;
  v7[3] = &unk_26452E488;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&a3;
  v8[2] = *(id *)&a4;
  [(SRSensorPruner *)self registerWithDaemonIfNeededWithReply:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __39__SRSensorPruner_removeSamplesFrom_to___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (a2)
  {
    id v6 = (void *)[Weak delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = *(void *)(a1 + 32);
      [v6 sensorPrunerDidStopPruning:v7];
    }
  }
  else
  {
    id v8 = objc_msgSend((id)objc_msgSend(Weak, "connection"), "remoteObjectProxy");
    double v9 = *(double *)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__SRSensorPruner_removeSamplesFrom_to___block_invoke_2;
    v10[3] = &unk_26452E460;
    objc_copyWeak(&v11, v4);
    long long v12 = *(_OWORD *)(a1 + 48);
    [v8 requestFileHandleForPruningSample:v10 reply:v9];
    objc_destroyWeak(&v11);
  }
}

uint64_t __39__SRSensorPruner_removeSamplesFrom_to___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);

  return [Weak continuePruneFrom:a2 to:v5 withDatastoreFiles:v6];
}

- (void)removeSamplesFrom:(double)a3 to:(double)a4 inSegment:(id)a5
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  double v9 = [(SRSensorPruner *)self datastore];
  double v11 = [(SRDatastore *)v9 startTimeOfCurrentSegment];
  if (a3 > a4 || v11 > a4)
  {
    uint64_t v13 = [(SRSensorPruner *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [(SRSensorPrunerDelegate *)v13 sensorPrunerDidStopPruning:self];
    }
  }
  else
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    *(double *)&v19[3] = a3;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke;
    v18[3] = &unk_26452E4B0;
    v18[4] = v19;
    -[SRDatastore removeSamplesFrom:to:callback:]((uint64_t *)v9, (uint64_t)v18, a3, a4);
    int v14 = SRLogPruner;
    if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = a5;
      _os_log_debug_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_DEBUG, "Requesting next segment after %{public}@", (uint8_t *)location, 0xCu);
    }
    objc_initWeak(location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke_59;
    v16[3] = &unk_26452E500;
    v16[4] = self;
    objc_copyWeak(v17, location);
    v16[5] = a5;
    v16[6] = v19;
    v17[1] = *(id *)&a4;
    [(SRSensorPruner *)self registerWithDaemonIfNeededWithReply:v16];
    objc_destroyWeak(v17);
    objc_destroyWeak(location);
    _Block_object_dispose(v19, 8);
  }
}

uint64_t __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke_59(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_super v3 = (void *)[*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = *(void *)(a1 + 32);
      [v3 sensorPrunerDidStopPruning:v4];
    }
  }
  else
  {
    double v5 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 56)), "connection"), "remoteObjectProxy");
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke_2;
    v7[3] = &unk_26452E4D8;
    objc_copyWeak(v8, (id *)(a1 + 56));
    v7[4] = *(void *)(a1 + 48);
    v8[1] = *(id *)(a1 + 64);
    [v5 requestFileHandleForPruningAfterSegment:v6 reply:v7];
    objc_destroyWeak(v8);
  }
}

uint64_t __49__SRSensorPruner_removeSamplesFrom_to_inSegment___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 objectForKeyedSubscript:0x26D16A308];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = SRLogPruner;
    if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "Error requesting a file handle for pruning. %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  return [objc_loadWeak((id *)(a1 + 40)) continuePruneFrom:a2 to:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) withDatastoreFiles:*(double *)(a1 + 48)];
}

- (void)continuePruneFrom:(double)a3 to:(double)a4 withDatastoreFiles:(id)a5
{
  -[SRSensorPruner resetDatastoreFiles:](self, "resetDatastoreFiles:");
  uint64_t v9 = [(SRSensorPruner *)self delegate];
  if ([(SRSensorPruner *)self datastore])
  {
    uint64_t v10 = (void *)[a5 objectForKeyedSubscript:0x26D16A268];
    if (v10 && (uint64_t v11 = [-[NSFileHandle pathname](v10) lastPathComponent]) != 0)
    {
      [(SRSensorPruner *)self removeSamplesFrom:v11 to:a3 inSegment:a4];
    }
    else
    {
      if (a5)
      {
        if ([a5 objectForKeyedSubscript:0x26D16A268])
        {
          long long v12 = SRLogPruner;
          if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v13 = 0;
            _os_log_error_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_ERROR, "Failed to get segment name from file handle", v13, 2u);
          }
        }
      }
      if (objc_opt_respondsToSelector()) {
        [(SRSensorPrunerDelegate *)v9 sensorPrunerDidStopPruning:self];
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [(SRSensorPrunerDelegate *)v9 sensorPrunerDidStopPruning:self];
  }
}

- (void)removeAllSamples
{
  -[SRSensorPruner resetDatastoreFiles:](self, "resetDatastoreFiles:", [NSDictionary dictionary]);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__SRSensorPruner_removeAllSamples__block_invoke;
  v3[3] = &unk_26452E528;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(SRSensorPruner *)self registerWithDaemonIfNeededWithReply:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __34__SRSensorPruner_removeAllSamples__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v6 = [Weak delegate];
  if (a2)
  {
    uint64_t v7 = (void *)v6;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = *(void *)(a1 + 32);
      [v7 sensorPrunerDidStopPruningAllData:v8];
    }
  }
  else
  {
    uint64_t v9 = (void *)[Weak connection];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__SRSensorPruner_removeAllSamples__block_invoke_2;
    v13[3] = &unk_26452E528;
    objc_copyWeak(&v14, v4);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v10 = (void *)[v9 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __34__SRSensorPruner_removeAllSamples__block_invoke_62;
    v11[3] = &unk_26452E528;
    objc_copyWeak(&v12, v4);
    v11[4] = *(void *)(a1 + 32);
    [v10 removeAllSamplesForCurrentSensorWithReply:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }
}

uint64_t __34__SRSensorPruner_removeAllSamples__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void *)[objc_loadWeak((id *)(a1 + 40)) delegate];
  uint64_t v5 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [v4 sensorPrunerDidStopPruningAllData:*(void *)(a1 + 32)];
  }
  return result;
}

uint64_t __34__SRSensorPruner_removeAllSamples__block_invoke_62(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_loadWeak((id *)(a1 + 40)) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    return [v2 sensorPrunerDidStopPruningAllData:v4];
  }
  return result;
}

+ (void)removeAllSamplesForAllSensorsWithConnection:(id)a3 completionHandler:(id)a4
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__SRSensorPruner_removeAllSamplesForAllSensorsWithConnection_completionHandler___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a4;
  uint64_t v5 = (void *)[a3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__SRSensorPruner_removeAllSamplesForAllSensorsWithConnection_completionHandler___block_invoke_63;
  v6[3] = &unk_26452E1D0;
  v6[4] = a4;
  [v5 removeAllSamplesForAllSensorsWithReply:v6];
}

uint64_t __80__SRSensorPruner_removeAllSamplesForAllSensorsWithConnection_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRLogPruner;
  if (os_log_type_enabled((os_log_t)SRLogPruner, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __80__SRSensorPruner_removeAllSamplesForAllSensorsWithConnection_completionHandler___block_invoke_63(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)removeAllSamplesForAllSensorsWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void *)[a1 connectionToDaemon];
  objc_msgSend(v5, "setRemoteObjectInterface:", objc_msgSend(a1, "remoteInterface"));
  [v5 resume];

  [a1 removeAllSamplesForAllSensorsWithConnection:v5 completionHandler:a3];
}

- (SRSensorPrunerDelegate)delegate
{
  return (SRSensorPrunerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sensor
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSensor:(id)a3
{
}

- (NSDictionary)nextDatastoreFiles
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNextDatastoreFiles:(id)a3
{
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

- (SRDevice)device
{
  return (SRDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end