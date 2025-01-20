@interface LCFBiomeManager
- (BMSource)biomeSource;
- (BMStream)biomeStream;
- (BOOL)writeData:(id)a3;
- (id)init:(id)a3;
- (id)readData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5;
- (id)readDataWithTimestamp:(id)a3 endDate:(id)a4 reversed:(BOOL)a5;
- (id)readTimeStamps:(id)a3 endDate:(id)a4 reversed:(BOOL)a5;
- (void)setBiomeSource:(id)a3;
@end

@implementation LCFBiomeManager

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFBiomeManager;
  v6 = [(LCFBiomeManager *)&v9 init];
  if (v6)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_biomeStream, a3);
    biomeSource = v6->_biomeSource;
    v6->_biomeSource = 0;
  }
  return v6;
}

- (BOOL)writeData:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__LCFBiomeManager_writeData___block_invoke;
  block[3] = &unk_2653B0080;
  block[4] = self;
  if (onceTokenBiomeSource != -1) {
    dispatch_once(&onceTokenBiomeSource, block);
  }
  id v5 = self->_biomeSource;
  objc_sync_enter(v5);
  [(BMSource *)self->_biomeSource sendEvent:v4];
  objc_sync_exit(v5);

  return 1;
}

void __29__LCFBiomeManager_writeData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    v3 = LCFLogContextBiomeManager;
    if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_ERROR)) {
      __29__LCFBiomeManager_writeData___block_invoke_cold_1(v3);
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = [*(id *)(v2 + 8) source];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

- (id)readData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    [v8 timeIntervalSince1970];
    uint64_t v13 = v12;
    [v9 timeIntervalSince1970];
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    _os_log_impl(&dword_25459C000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v8 endDate:v9 maxEvents:-1 lastN:-1 reversed:v5];
  v16 = [(BMStream *)self->_biomeStream publisherWithOptions:v15];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__LCFBiomeManager_readData_endDate_reversed___block_invoke_52;
  v22[3] = &unk_2653B00C8;
  id v23 = v17;
  id v18 = v17;
  id v19 = (id)[v16 sinkWithCompletion:&__block_literal_global_1 receiveInput:v22];
  v20 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v18];

  return v20;
}

void __45__LCFBiomeManager_readData_endDate_reversed___block_invoke()
{
  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_25459C000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __45__LCFBiomeManager_readData_endDate_reversed___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 eventBody];
  [v2 addObject:v3];
}

- (id)readTimeStamps:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    [v8 timeIntervalSince1970];
    uint64_t v13 = v12;
    [v9 timeIntervalSince1970];
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    _os_log_impl(&dword_25459C000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v8 endDate:v9 maxEvents:-1 lastN:-1 reversed:v5];
  v16 = [(BMStream *)self->_biomeStream publisherWithOptions:v15];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke_57;
  v22[3] = &unk_2653B00C8;
  id v23 = v17;
  id v18 = v17;
  id v19 = (id)[v16 sinkWithCompletion:&__block_literal_global_56 receiveInput:v22];
  v20 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v18];

  return v20;
}

void __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke()
{
  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_25459C000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  [a2 timestamp];
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (id)readDataWithTimestamp:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    [v8 timeIntervalSince1970];
    uint64_t v13 = v12;
    [v9 timeIntervalSince1970];
    *(_DWORD *)buf = 134218240;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    _os_log_impl(&dword_25459C000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v8 endDate:v9 maxEvents:-1 lastN:-1 reversed:v5];
  v16 = [(BMStream *)self->_biomeStream publisherWithOptions:v15];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke_61;
  v21[3] = &unk_2653B00C8;
  id v18 = v17;
  id v22 = v18;
  id v19 = (id)[v16 sinkWithCompletion:&__block_literal_global_60 receiveInput:v21];

  return v18;
}

void __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke()
{
  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_25459C000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke_61(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  [v4 timestamp];
  BOOL v5 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v8[0] = v5;
  v6 = [v4 eventBody];

  v8[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v2 addObject:v7];
}

- (BMStream)biomeStream
{
  return self->_biomeStream;
}

- (BMSource)biomeSource
{
  return self->_biomeSource;
}

- (void)setBiomeSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSource, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
}

void __29__LCFBiomeManager_writeData___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25459C000, log, OS_LOG_TYPE_ERROR, "_biomeSource already exists.", v1, 2u);
}

@end