@interface HAMenstrualAlgorithmsDayStreamProcessor
+ (unsigned)algorithmVersion;
- (HADayStreamProcessorServiceProtocol)remoteObjectProxy;
- (HAMenstrualAlgorithmsDayStreamProcessor)initWithConfig:(id)a3;
- (NSMutableArray)dayInputBuffer;
- (NSXPCConnection)connectionToService;
- (id)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 error:(id *)a4;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)dealloc;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)setConnectionToService:(id)a3;
- (void)setDayInputBuffer:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDayStreamProcessor

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v6 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self remoteObjectProxy];
  [v6 beginPhase:v5 onJulianDay:v4];
}

- (HAMenstrualAlgorithmsDayStreamProcessor)initWithConfig:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ha_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v28 = "-[HAMenstrualAlgorithmsDayStreamProcessor initWithConfig:]";
    _os_log_impl(&dword_22275A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessor;
  id v6 = [(HAMenstrualAlgorithmsDayStreamProcessor *)&v25 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:100];
    dayInputBuffer = v6->_dayInputBuffer;
    v6->_dayInputBuffer = (NSMutableArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.HealthAlgorithms.DayStreamProcessorService"];
    connectionToService = v6->_connectionToService;
    v6->_connectionToService = (NSXPCConnection *)v9;

    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4EC0F0];
    [(NSXPCConnection *)v6->_connectionToService setRemoteObjectInterface:v11];

    v12 = (void *)MEMORY[0x263EFFA08];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
    v14 = [v12 setWithArray:v13];

    v15 = [(NSXPCConnection *)v6->_connectionToService remoteObjectInterface];
    [v15 setClasses:v14 forSelector:sel_finishSessionWithMostRecentMenstrualFlowJulianDayUpdated_withReply_ argumentIndex:0 ofReply:1];

    objc_initWeak((id *)buf, v6);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke;
    v23[3] = &unk_264626A48;
    objc_copyWeak(&v24, (id *)buf);
    [(NSXPCConnection *)v6->_connectionToService setInvalidationHandler:v23];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_454;
    v21[3] = &unk_264626A48;
    objc_copyWeak(&v22, (id *)buf);
    [(NSXPCConnection *)v6->_connectionToService setInterruptionHandler:v21];
    [(NSXPCConnection *)v6->_connectionToService resume];
    uint64_t v16 = [(NSXPCConnection *)v6->_connectionToService remoteObjectProxy];
    remoteObjectProxy = v6->_remoteObjectProxy;
    v6->_remoteObjectProxy = (HADayStreamProcessorServiceProtocol *)v16;

    v18 = [(HAMenstrualAlgorithmsDayStreamProcessor *)v6 remoteObjectProxy];
    [v18 beginSessionWithConfig:v4];

    v19 = v6;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

- (HADayStreamProcessorServiceProtocol)remoteObjectProxy
{
  return (HADayStreamProcessorServiceProtocol *)objc_getProperty(self, a2, 24, 1);
}

+ (unsigned)algorithmVersion
{
  return 3;
}

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke(uint64_t a1)
{
  v2 = ha_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22275A000, v2, OS_LOG_TYPE_DEFAULT, "DayStreamProcessorService connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionToService:0];
}

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_454(uint64_t a1)
{
  v2 = ha_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_454_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained connectionToService];
  [v4 invalidate];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = ha_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = "-[HAMenstrualAlgorithmsDayStreamProcessor dealloc]";
    _os_log_impl(&dword_22275A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v4 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self connectionToService];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessor;
  [(HAMenstrualAlgorithmsDayStreamProcessor *)&v5 dealloc];
}

- (void)appendDay:(id)a3
{
  id v10 = a3;
  id v4 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  [v4 addObject:v10];

  objc_super v5 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  uint64_t v6 = [v5 count];

  if (v6 == 100)
  {
    uint64_t v7 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self remoteObjectProxy];
    uint64_t v8 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v7 appendDays:v8];

    uint64_t v9 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v9 removeAllObjects];
  }
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v6 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self remoteObjectProxy];
  [v6 endPhase:v5 onJulianDay:v4];
}

- (id)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = ha_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[HAMenstrualAlgorithmsDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDa"
                                    "yUpdated:error:]";
    _os_log_impl(&dword_22275A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v8 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  BOOL v9 = [v8 count] == 0;

  if (!v9)
  {
    id v10 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self remoteObjectProxy];
    v11 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v10 appendDays:v11];

    v12 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v12 removeAllObjects];
  }
  v13 = [(HAMenstrualAlgorithmsDayStreamProcessor *)self connectionToService];
  v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  objc_super v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_458;
  v21[3] = &unk_264626A90;
  void v21[4] = &buf;
  [v14 finishSessionWithMostRecentMenstrualFlowJulianDayUpdated:v5 withReply:v21];
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    v15 = ha_get_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[HAMenstrualAlgorithmsDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDayUpdated:error:]();
    }

    if (a4)
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = [v17 bundleIdentifier];
      *a4 = [v16 errorWithDomain:v18 code:-1 userInfo:0];
    }
  }
  id v19 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v19;
}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = ha_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_458(uint64_t a1, void *a2)
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

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_454_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22275A000, v0, OS_LOG_TYPE_ERROR, "DayStreamProcessorService connection interrupted", v1, 2u);
}

- (void)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_22275A000, v0, OS_LOG_TYPE_FAULT, "failed to retrieve day stream processor analysis", v1, 2u);
}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22275A000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end