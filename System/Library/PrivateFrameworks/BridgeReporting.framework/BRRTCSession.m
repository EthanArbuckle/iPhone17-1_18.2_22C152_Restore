@interface BRRTCSession
+ (id)_parentRTCReportingSession:(id)a3;
+ (id)reportingSession;
+ (void)startRTCReportingSessionWithConfiguration:(id)a3 andComplection:(id)a4;
@end

@implementation BRRTCSession

+ (id)reportingSession
{
  if (reportingSession_onceToken != -1) {
    dispatch_once(&reportingSession_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)BRRTCSessionSharedInstance;

  return v2;
}

uint64_t __32__BRRTCSession_reportingSession__block_invoke()
{
  BRRTCSessionSharedInstance = objc_alloc_init(BRRTCSession);

  return MEMORY[0x270F9A758]();
}

+ (void)startRTCReportingSessionWithConfiguration:(id)a3 andComplection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_utilityQueue_onceToken != -1) {
    dispatch_once(&_utilityQueue_onceToken, &__block_literal_global_15);
  }
  v7 = _utilityQueue_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__BRRTCSession_startRTCReportingSessionWithConfiguration_andComplection___block_invoke;
  v10[3] = &unk_2647638B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __73__BRRTCSession_startRTCReportingSessionWithConfiguration_andComplection___block_invoke(uint64_t a1)
{
  v2 = +[BRRTCSession _parentRTCReportingSession:*(void *)(a1 + 32)];
  if (v2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __73__BRRTCSession_startRTCReportingSessionWithConfiguration_andComplection___block_invoke_2;
    v4[3] = &unk_264763890;
    id v6 = *(id *)(a1 + 40);
    id v5 = v2;
    [v5 startConfigurationWithCompletionHandler:v4];
  }
  else
  {
    v3 = [MEMORY[0x263F087E8] errorWithDomain:@"BRReportingErrorDomain" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __73__BRRTCSession_startRTCReportingSessionWithConfiguration_andComplection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    v3 = br_metriccollection_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "+[BRRTCSession startRTCReportingSessionWithConfiguration:andComplection:]_block_invoke_2";
      __int16 v7 = 2112;
      uint64_t v8 = 0;
      _os_log_impl(&dword_225AD1000, v3, OS_LOG_TYPE_DEFAULT, "%s backends is nil, we will attempt to submit anyway %@", (uint8_t *)&v5, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_parentRTCReportingSession:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F62A68];
  v17[0] = *MEMORY[0x263F62A60];
  v17[1] = v3;
  v18[0] = &unk_26D9304D8;
  v18[1] = &unk_26D9304F0;
  uint64_t v4 = *MEMORY[0x263F62A40];
  v17[2] = *MEMORY[0x263F62AA8];
  v17[3] = v4;
  v18[2] = &unk_26D9304F0;
  v18[3] = MEMORY[0x263EFFA88];
  int v5 = NSDictionary;
  id v6 = a3;
  __int16 v7 = [v5 dictionaryWithObjects:v18 forKeys:v17 count:4];
  uint64_t v8 = *MEMORY[0x263F62AC8];
  v15[0] = *MEMORY[0x263F62AB8];
  v15[1] = v8;
  v16[0] = @"SetupAndPairing";
  v16[1] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v10 = objc_alloc(MEMORY[0x263F62A08]);

  id v11 = (void *)[v10 initWithSessionInfo:v7 userInfo:v9 frameworksToCheck:MEMORY[0x263EFFA68]];
  if (v11)
  {
    id v12 = br_metriccollection_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_225AD1000, v12, OS_LOG_TYPE_DEFAULT, "RTC session instance created", v14, 2u);
    }
  }

  return v11;
}

@end