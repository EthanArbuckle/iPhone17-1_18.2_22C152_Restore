@interface CDMClient
+ (BOOL)useXPC;
+ (id)defaultGraphNameForPlanner;
+ (id)graphNameForEmbedding;
+ (id)graphNameForNLU;
+ (id)graphNameForSsuInference;
+ (id)graphNamesForPlanner;
- (BOOL)areAssetsAvailable:(id)a3;
- (BOOL)daemonKilled;
- (BOOL)isLighthouseAPIEnabled;
- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4;
- (BOOL)successFromSetup;
- (CDMClient)init;
- (CDMClient)initWithDelegate:(id)a3;
- (CDMClient)initWithXPC:(BOOL)a3;
- (CDMClient)initWithXPCDelegate:(BOOL)a3 withDelegate:(id)a4;
- (id)errorFromSetup;
- (void)dealloc;
- (void)doHandleCommand:(id)a3 forCallback:(id)a4;
- (void)doServiceCenterInitWithConfig:(id)a3;
- (void)initProxyObject:(BOOL)a3 delegate:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processCDMNluRequest:(id)a3;
- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4;
- (void)processEmbeddingRequest:(id)a3 completionHandler:(id)a4;
- (void)processEmbeddingRequest:(id)a3 requestId:(id)a4 completionHandler:(id)a5;
- (void)processNLUPreprocessRequest:(id)a3 completionHandler:(id)a4;
- (void)processPlannerRequest:(id)a3 completionHandler:(id)a4;
- (void)processSsuInferenceRequest:(id)a3 completionHandler:(id)a4;
- (void)processText:(id)a3 completionHandler:(id)a4;
- (void)processText:(id)a3 requestConnectionId:(id)a4 completionHandler:(id)a5;
- (void)setDataDispatcherContext:(id)a3;
- (void)setup:(id)a3;
- (void)setup:(id)a3 completionHandler:(id)a4;
- (void)setupKVOForwarding;
- (void)setupNLUWithLocale:(id)a3 completionHandler:(id)a4;
- (void)setupSsuInference:(id)a3 serviceStateDirectory:(id)a4 completionHandler:(id)a5;
- (void)setupWithLocale:(id)a3 embeddingVersion:(id)a4 completionHandler:(id)a5;
- (void)setupWithLocale:(id)a3 forGraph:(id)a4 completionHandler:(id)a5;
- (void)sharedInitTasks;
- (void)waitForDataDispatcherCompletion;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMClient

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [v9 objectForKey:*MEMORY[0x263F081B8]];
  if ([v8 isEqualToString:@"successFromSetup"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = @"successFromSetup";
LABEL_7:
      [(CDMClient *)self setValue:v10 forKey:v11];
    }
  }
  else
  {
    if (![v8 isEqualToString:@"errorFromSetup"])
    {
      if ([v8 isEqualToString:@"daemonKilled"])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        [(CDMClient *)self setValue:v10 forKey:@"daemonKilled"];
        v12 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v13 = 136315394;
          v14 = "-[CDMClient observeValueForKeyPath:ofObject:change:context:]";
          __int16 v15 = 2112;
          id v16 = v10;
          _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Setting daemonKilled to: %@", (uint8_t *)&v13, 0x16u);
        }
      }
      else
      {
        v12 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136315394;
          v14 = "-[CDMClient observeValueForKeyPath:ofObject:change:context:]";
          __int16 v15 = 2112;
          id v16 = v8;
          _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Not expecting keyPath %@", (uint8_t *)&v13, 0x16u);
        }
      }

      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = @"errorFromSetup";
      goto LABEL_7;
    }
  }
LABEL_15:
}

- (void)setupWithLocale:(id)a3 embeddingVersion:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = [v9 length];
  v12 = CDMOSLoggerForCategory(0);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      int v18 = 136315650;
      v19 = "-[CDMClient(Embedding) setupWithLocale:embeddingVersion:completionHandler:]";
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDM Embedding client graph setup, locale=%@, version=%@", (uint8_t *)&v18, 0x20u);
    }

    v14 = [CDMClientSetup alloc];
    __int16 v15 = +[CDMClient graphNameForEmbedding];
    id v16 = [(CDMClientSetup *)v14 initWithLocaleIdentifier:v8 embeddingVersion:v9 sandboxId:0 activeServiceGraph:v15];

    [(CDMClient *)self setup:v16 completionHandler:v10];
  }
  else
  {
    if (v13)
    {
      int v18 = 136315138;
      v19 = "-[CDMClient(Embedding) setupWithLocale:embeddingVersion:completionHandler:]";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDM Embedding client embedding version cannot be empty. Setup is failed.", (uint8_t *)&v18, 0xCu);
    }

    id v16 = [NSString stringWithFormat:@"CDM Embedding client embedding version cannot be empty. Setup is failed."];
    uint64_t v17 = [(CDMClientInterface *)self createNSError:v16 errorCode:1];
    v10[2](v10, v17);

    v10 = (void (**)(id, uint64_t))v17;
  }
}

- (void)setup:(id)a3 completionHandler:(id)a4
{
}

- (void)initProxyObject:(BOOL)a3 delegate:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v4)
  {
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      id v16 = "-[CDMClient initProxyObject:delegate:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Creating CDMXPCClient", (uint8_t *)&v15, 0xCu);
    }

    id v8 = [[CDMXPCClient alloc] initWithDelegate:v6];
    client = self->_client;
    self->_client = &v8->super;
  }
  else
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      id v16 = "-[CDMClient initProxyObject:delegate:]";
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Creating CDMFoundationClient", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
    client = [v11 bundleIdentifier];

    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      id v16 = "-[CDMClient initProxyObject:delegate:]";
      __int16 v17 = 2112;
      int v18 = client;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Calling bundle ID %@", (uint8_t *)&v15, 0x16u);
    }

    BOOL v13 = [[CDMFoundationClient alloc] initWithDelegate:v6 withCallingBundleId:client];
    v14 = self->_client;
    self->_client = &v13->super;
  }
}

+ (id)graphNameForEmbedding
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CDMClient)init
{
  return self;
}

- (void)sharedInitTasks
{
}

- (void)setupKVOForwarding
{
  [(CDMClientInterface *)self->_client addObserver:self forKeyPath:@"successFromSetup" options:1 context:0];
  [(CDMClientInterface *)self->_client addObserver:self forKeyPath:@"errorFromSetup" options:1 context:0];
  client = self->_client;
  [(CDMClientInterface *)client addObserver:self forKeyPath:@"daemonKilled" options:1 context:0];
}

+ (BOOL)useXPC
{
  return +[CDMFeatureFlags isCDMClientXPCEnabled];
}

- (void).cxx_destruct
{
}

- (BOOL)isLighthouseAPIEnabled
{
  return [(CDMClientInterface *)self->_client isLighthouseAPIEnabled];
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
}

- (void)doServiceCenterInitWithConfig:(id)a3
{
}

- (void)waitForDataDispatcherCompletion
{
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)processCDMNluRequest:(id)a3
{
}

- (void)warmupWithCompletionHandler:(id)a3
{
}

- (void)setup:(id)a3
{
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  v7 = self->_client;
  id v8 = a3;
  objc_sync_enter(v7);
  LOBYTE(a4) = [(CDMClientInterface *)self->_client registerWithAssetsDelegate:v8 withType:a4];

  objc_sync_exit(v7);
  return a4;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  return [(CDMClientInterface *)self->_client areAssetsAvailable:a3];
}

- (id)errorFromSetup
{
  return [(CDMClientInterface *)self->_client errorFromSetup];
}

- (BOOL)successFromSetup
{
  return [(CDMClientInterface *)self->_client successFromSetup];
}

- (BOOL)daemonKilled
{
  return [(CDMClientInterface *)self->_client daemonKilled];
}

- (void)dealloc
{
  v3 = self->_client;
  objc_sync_enter(v3);
  [(CDMClientInterface *)self->_client removeObserver:self forKeyPath:@"successFromSetup"];
  [(CDMClientInterface *)self->_client removeObserver:self forKeyPath:@"errorFromSetup"];
  [(CDMClientInterface *)self->_client removeObserver:self forKeyPath:@"daemonKilled"];
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CDMClient;
  [(CDMClient *)&v4 dealloc];
}

- (CDMClient)initWithXPC:(BOOL)a3
{
  BOOL v3 = a3;
  [(CDMClient *)self sharedInitTasks];
  [(CDMClient *)self initProxyObject:v3 delegate:0];
  [(CDMClient *)self setupKVOForwarding];
  return self;
}

- (CDMClient)initWithXPCDelegate:(BOOL)a3 withDelegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CDMClient *)self sharedInitTasks];
  [(CDMClient *)self initProxyObject:v4 delegate:v6];
  [(CDMClient *)self setupKVOForwarding];

  return self;
}

- (CDMClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  [(CDMClient *)self sharedInitTasks];
  [(CDMClient *)self initProxyObject:+[CDMClient useXPC] delegate:v4];
  [(CDMClient *)self setupKVOForwarding];

  return self;
}

- (void)processPlannerRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, CDMPlannerGraphRequestCommand *))a4;
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = [v6 jsonTranscript];
    *(_DWORD *)buf = 136315394;
    v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s processPlannerRequest for %@", buf, 0x16u);
  }
  if ([(CDMClient *)self daemonKilled])
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    id v23 = @"assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.";
    v10 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"CDMXPCClientErrorDomain" code:0 userInfo:v10];

    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v7[2](v7, 0, v11);
  }
  else
  {
    uint64_t v11 = [[CDMPlannerGraphRequestCommand alloc] initWithPlannerRequest:v6];
    BOOL v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Created CDMPlannerGraphRequestCommand to pass into CDMPlannerServiceGraph, %@", buf, 0x16u);
    }

    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    int v18 = __62__CDMClient_Planner__processPlannerRequest_completionHandler___block_invoke;
    uint64_t v19 = &unk_2647A5238;
    __int16 v20 = self;
    id v21 = v7;
    v14 = _Block_copy(&v16);
    -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v11, v14, v16, v17, v18, v19);
  }
}

void __62__CDMClient_Planner__processPlannerRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s CDM Planner client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v6 localizedDescription];
      uint64_t v17 = [v16 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]_block_invoke";
      __int16 v20 = 2080;
      uint64_t v21 = v17;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      v10 = [v9 plannerResponse];
      uint64_t v11 = [v10 plannerResponse];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v12 = NSString;
      BOOL v13 = [v5 commandName];
      v14 = [v12 stringWithFormat:@"Expecting CDMGenericSendCommand, but got %@", v13];

      int v15 = [*(id *)(a1 + 32) createNSError:v14 errorCode:2];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)setupWithLocale:(id)a3 forGraph:(id)a4 completionHandler:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = +[CDMClient defaultGraphNameForPlanner];
  if (v13)
  {
    id v11 = v13;

    v10 = v11;
  }
  v12 = [[CDMClientSetup alloc] initWithLocaleIdentifier:v9 sandboxId:0 activeServiceGraph:v10];

  [(CDMClient *)self setup:v12 completionHandler:v8];
}

+ (id)graphNamesForPlanner
{
  v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = objc_msgSend(v2, "setWithObjects:", v4, 0);

  return v5;
}

+ (id)defaultGraphNameForPlanner
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)processNLUPreprocessRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CDMNLUPreprocessRequestCommand alloc] initWithNLURequest:v7];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __74__CDMClient_NLUPreprocess__processNLUPreprocessRequest_completionHandler___block_invoke;
  v14 = &unk_2647A5238;
  int v15 = self;
  id v16 = v6;
  id v9 = v6;
  v10 = _Block_copy(&v11);
  -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v8, v10, v11, v12, v13, v14, v15);
}

void __74__CDMClient_NLUPreprocess__processNLUPreprocessRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      int v15 = "-[CDMClient(NLUPreprocess) processNLUPreprocessRequest:completionHandler:]_block_invoke";
      __int16 v16 = 2080;
      uint64_t v17 = [v13 UTF8String];
      _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v5 preprocessingWrapper];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    }
    else
    {
      v10 = NSString;
      uint64_t v11 = [v5 commandName];
      id v9 = [v10 stringWithFormat:@"Expecting CDMNLUPreprocessResponseCommand, but got %@", v11];

      uint64_t v12 = [*(id *)(a1 + 32) createNSError:v9 errorCode:2];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)processText:(id)a3 requestConnectionId:(id)a4 completionHandler:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263F71CA0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v27 = objc_alloc_init(v7);
  [v27 setUtterance:v10];

  [v27 setProbability:0.0];
  uint64_t v11 = (void *)MEMORY[0x263F71F48];
  id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v13 = [v11 convertFromUUID:v12];
  [v27 setIdA:v13];

  v14 = [MEMORY[0x263EFF980] array];
  [v14 addObject:v27];
  id v15 = objc_alloc_init(MEMORY[0x263F71D70]);
  [v15 setAsrOutputs:v14];
  id v16 = objc_alloc_init(MEMORY[0x263F71D18]);
  uint64_t v17 = NSString;
  uint64_t v18 = [MEMORY[0x263F08C38] UUID];
  uint64_t v19 = [v18 UUIDString];
  __int16 v20 = [v17 stringWithFormat:@"%@:0", v19];
  [v16 setIdA:v20];

  [v16 setConnectionId:v9];
  uint64_t v21 = (void *)MEMORY[0x263F71F48];
  id v22 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v23 = [v21 convertFromUUID:v22];
  [v16 setNluRequestId:v23];

  id v24 = objc_alloc_init(MEMORY[0x263F71CA8]);
  [v24 setRequestId:v16];
  [v24 setCurrentTurnInput:v15];
  v25 = [[CDMNluRequest alloc] initWithObjcProto:v24];
  [(CDMClient *)self processCDMNluRequest:v25 completionHandler:v8];
}

- (void)processText:(id)a3 completionHandler:(id)a4
{
}

- (void)setupNLUWithLocale:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    id v13 = "-[CDMClient(NLU) setupNLUWithLocale:completionHandler:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s CDM NLU client graph setup, locale=%@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [CDMClientSetup alloc];
  id v10 = +[CDMClient graphNameForNLU];
  uint64_t v11 = [(CDMClientSetup *)v9 initWithLocaleIdentifier:v6 sandboxId:0 activeServiceGraph:v10];

  [(CDMClient *)self setup:v11 completionHandler:v7];
}

+ (id)graphNameForNLU
{
  return @"CDMNLUServiceGraph";
}

- (void)processEmbeddingRequest:(id)a3 requestId:(id)a4 completionHandler:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, CDMEmbeddingGraphRequestCommand *))a5;
  if ([(CDMClient *)self daemonKilled])
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = @"assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.";
    int v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v13 = [v11 errorWithDomain:@"CDMXPCClientErrorDomain" code:0 userInfo:v12];

    __int16 v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]";
      __int16 v25 = 2112;
      __int16 v26 = v13;
      _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    id v13 = [[CDMEmbeddingGraphRequestCommand alloc] initWithText:v8 requestId:v9];
    id v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]";
      __int16 v25 = 2112;
      __int16 v26 = v13;
      _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created CDMEmbeddingGraphRequestCommand to pass into CDMEmbeddingGraph, %@", buf, 0x16u);
    }

    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __76__CDMClient_Embedding__processEmbeddingRequest_requestId_completionHandler___block_invoke;
    __int16 v20 = &unk_2647A5238;
    uint64_t v21 = self;
    id v22 = v10;
    uint64_t v16 = _Block_copy(&v17);
    -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v13, v16, v17, v18, v19, v20);
  }
}

void __76__CDMClient_Embedding__processEmbeddingRequest_requestId_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v5;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s CDM Embedding client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v6 localizedDescription];
      uint64_t v27 = [v26 UTF8String];
      *(_DWORD *)buf = 136315394;
      v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
      __int16 v30 = 2080;
      uint64_t v31 = v27;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      id v10 = [v9 embeddingResponse];
      uint64_t v11 = [v10 embeddingProtoResponseCommand];
      int v12 = [v11 response];

      id v13 = objc_alloc_init(MEMORY[0x263F71D48]);
      if (([v12 hasSubwordTokenChain] & 1) == 0)
      {
        __int16 v14 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: CDMEmbeddingGraphResponseCommand output from graph doesn't have SIRINLUINTERNALSubwordTokenChain subwordTokenChain?", buf, 0xCu);
        }
      }
      id v15 = [v12 subwordTokenChain];
      [v13 setSubwordTokenChain:v15];

      uint64_t v16 = [v12 subwordEmbeddingTensorOutputs];
      uint64_t v17 = [v16 count];

      if (!v17)
      {
        uint64_t v18 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: CDMEmbeddingGraphResponseCommand output from graph doesn't have any NSMutableArray<SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *> *_subwordEmbeddingTensorOutputs?", buf, 0xCu);
        }
      }
      uint64_t v19 = [v12 subwordEmbeddingTensorOutputs];
      unint64_t v20 = [v19 count];

      if (v20 >= 2)
      {
        uint64_t v21 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Did not expect CDMEmbeddingGraphResponseCommand output from graph to include more than 1 NSMutableArray<SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *> *_subwordEmbeddingTensorOutputs. But it's OK, will only propagate the firstObject", buf, 0xCu);
        }
      }
      id v22 = [v12 subwordEmbeddingTensorOutputs];
      id v23 = [v22 firstObject];
      [v13 setSubwordTokenEmbedding:v23];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v24 = NSString;
      __int16 v25 = [v5 commandName];
      id v9 = [v24 stringWithFormat:@"Expecting CDMGenericSendCommand, but got %@", v25];

      id v10 = [*(id *)(a1 + 32) createNSError:v9 errorCode:2];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)processEmbeddingRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)processSsuInferenceRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CDMSsuInferenceGraphRequestCommand alloc] initWithSsuRequest:v7];

  id v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]";
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Create CDMSsuInferenceGraphRequestCommand to pass into CDMSsuInferenceServiceGraph, %@", buf, 0x16u);
  }

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __72__CDMClient_SsuInference__processSsuInferenceRequest_completionHandler___block_invoke;
  id v15 = &unk_2647A5238;
  uint64_t v16 = self;
  id v17 = v6;
  id v10 = v6;
  uint64_t v11 = _Block_copy(&v12);
  -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v8, v11, v12, v13, v14, v15, v16);
}

void __72__CDMClient_SsuInference__processSsuInferenceRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s CDM SSU Inference client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v6 localizedDescription];
      uint64_t v17 = [v16 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
      __int16 v20 = 2080;
      uint64_t v21 = v17;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      id v10 = [v9 ssuInferenceResponse];
      uint64_t v11 = [v10 ssuResponse];
      if (v11)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        __int16 v14 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
          _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CDMSsuInferenceGraphResponseCommand output from graph doesn't have SIRINLUEXTERNALSSU_INFERENCESsuInferenceResponse ssuResponse.", buf, 0xCu);
        }

        id v15 = [*(id *)(a1 + 32) createNSError:@"Received an empty response from CDMSsuInferenceServiceGraph" errorCode:2];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      uint64_t v12 = NSString;
      uint64_t v13 = [v5 commandName];
      id v9 = [v12 stringWithFormat:@"Expecting CDMGenericSendCommand, but got %@", v13];

      id v10 = [*(id *)(a1 + 32) createNSError:v9 errorCode:2];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)setupSsuInference:(id)a3 serviceStateDirectory:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = [v9 stringByAppendingPathComponent:@"CDMSiriVocabularySpanMatchService"];
    uint64_t v12 = [v11 stringByAppendingPathComponent:@"sandbox_id"];

    uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      id v23 = 0;
      id v15 = [NSString stringWithContentsOfFile:v12 encoding:4 error:&v23];
      id v16 = (CDMClientSetup *)v23;
      if (v16)
      {
        uint64_t v17 = v16;
        v10[2](v10, v16);
        goto LABEL_11;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  id v18 = objc_alloc(MEMORY[0x263EFF960]);
  uint64_t v19 = [v8 locale];
  uint64_t v12 = (void *)[v18 initWithLocaleIdentifier:v19];

  __int16 v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[CDMClient(SsuInference) setupSsuInference:serviceStateDirectory:completionHandler:]";
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s CDM SSU Inference client graph setup, locale=%@", buf, 0x16u);
  }

  uint64_t v21 = [CDMClientSetup alloc];
  __int16 v22 = +[CDMClient graphNameForSsuInference];
  uint64_t v17 = [(CDMClientSetup *)v21 initWithLocaleIdentifier:v12 sandboxId:v15 activeServiceGraph:v22 assetDirPath:0 overrideSiriVocabSpans:0 serviceStateDirectory:v9];

  [(CDMClient *)self setup:v17 completionHandler:v10];
LABEL_11:
}

+ (id)graphNameForSsuInference
{
  return @"CDMSsuInferenceServiceGraph";
}

@end