@interface HAMenstrualAlgorithmsHistoricalAnalyzer
+ (unsigned)algorithmVersion;
- (HAHistoricalAnalyzerServiceProtocol)remoteObjectProxy;
- (HAMenstrualAlgorithmsHistoricalAnalyzer)init;
- (NSMutableArray)dayInputBuffer;
- (NSXPCConnection)connectionToService;
- (id)analyzeWithError:(id *)a3;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)dealloc;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)setConnectionToService:(id)a3;
- (void)setDayInputBuffer:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
@end

@implementation HAMenstrualAlgorithmsHistoricalAnalyzer

- (HAMenstrualAlgorithmsHistoricalAnalyzer)init
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = ha_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v29 = "-[HAMenstrualAlgorithmsHistoricalAnalyzer init]";
    _os_log_impl(&dword_22275A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v26.receiver = self;
  v26.super_class = (Class)HAMenstrualAlgorithmsHistoricalAnalyzer;
  v4 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)&v26 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:100];
    dayInputBuffer = v4->_dayInputBuffer;
    v4->_dayInputBuffer = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.HealthAlgorithms.HistoricalAnalyzerService"];
    connectionToService = v4->_connectionToService;
    v4->_connectionToService = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4EC150];
    [(NSXPCConnection *)v4->_connectionToService setRemoteObjectInterface:v9];

    v10 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v12 = [v10 setWithArray:v11];

    v13 = [(NSXPCConnection *)v4->_connectionToService remoteObjectInterface];
    [v13 setClasses:v12 forSelector:sel_finishSessionWithReply_ argumentIndex:0 ofReply:1];

    objc_initWeak((id *)buf, v4);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke;
    v24[3] = &unk_264626A48;
    objc_copyWeak(&v25, (id *)buf);
    [(NSXPCConnection *)v4->_connectionToService setInvalidationHandler:v24];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_557;
    v22 = &unk_264626A48;
    objc_copyWeak(&v23, (id *)buf);
    [(NSXPCConnection *)v4->_connectionToService setInterruptionHandler:&v19];
    [(NSXPCConnection *)v4->_connectionToService resume];
    uint64_t v14 = [(NSXPCConnection *)v4->_connectionToService remoteObjectProxy];
    remoteObjectProxy = v4->_remoteObjectProxy;
    v4->_remoteObjectProxy = (HAHistoricalAnalyzerServiceProtocol *)v14;

    v16 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)v4 remoteObjectProxy];
    [v16 beginSession];

    v17 = v4;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  return v4;
}

- (HAHistoricalAnalyzerServiceProtocol)remoteObjectProxy
{
  return (HAHistoricalAnalyzerServiceProtocol *)objc_getProperty(self, a2, 24, 1);
}

+ (unsigned)algorithmVersion
{
  return 3;
}

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke(uint64_t a1)
{
  v2 = ha_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22275A000, v2, OS_LOG_TYPE_DEFAULT, "HistoricalAnalyzerService connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionToService:0];
}

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_557(uint64_t a1)
{
  v2 = ha_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_557_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained connectionToService];
  [v4 invalidate];
}

- (void)dealloc
{
  v3 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self connectionToService];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HAMenstrualAlgorithmsHistoricalAnalyzer;
  [(HAMenstrualAlgorithmsHistoricalAnalyzer *)&v4 dealloc];
}

- (void)appendDay:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  [v4 addObject:v10];

  uint64_t v5 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  uint64_t v6 = [v5 count];

  if (v6 == 100)
  {
    uint64_t v7 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self remoteObjectProxy];
    v8 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
    [v7 appendDays:v8];

    v9 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
    [v9 removeAllObjects];
  }
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v6 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self remoteObjectProxy];
  [v6 beginPhase:v5 onJulianDay:v4];
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v6 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self remoteObjectProxy];
  [v6 endPhase:v5 onJulianDay:v4];
}

- (id)analyzeWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = ha_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[HAMenstrualAlgorithmsHistoricalAnalyzer analyzeWithError:]";
    _os_log_impl(&dword_22275A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  id v6 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  BOOL v7 = [v6 count] == 0;

  if (!v7)
  {
    v8 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self remoteObjectProxy];
    v9 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
    [v8 appendDays:v9];

    id v10 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
    [v10 removeAllObjects];
  }
  v11 = [(HAMenstrualAlgorithmsHistoricalAnalyzer *)self connectionToService];
  v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_559];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke_560;
  v19[3] = &unk_264626AB8;
  v19[4] = &buf;
  [v12 finishSessionWithReply:v19];
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    v13 = ha_get_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[HAMenstrualAlgorithmsHistoricalAnalyzer analyzeWithError:]();
    }

    if (a3)
    {
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 bundleIdentifier];
      *a3 = [v14 errorWithDomain:v16 code:-1 userInfo:0];
    }
  }
  id v17 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v17;
}

void __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = ha_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke_560(uint64_t a1, void *a2)
{
}

- (NSMutableArray)dayInputBuffer
{
  return self->_dayInputBuffer;
}

- (void)setDayInputBuffer:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_dayInputBuffer, 0);
}

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_557_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22275A000, v0, OS_LOG_TYPE_ERROR, "HistoricalAnalyzerService connection interrupted", v1, 2u);
}

- (void)analyzeWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_22275A000, v0, OS_LOG_TYPE_FAULT, "failed to retrieve cycles from historical analyzer", v1, 2u);
}

@end