@interface SpeedTestConfig
- (BOOL)inProgress;
- (SpeedTestConfig)init;
- (void)abort;
- (void)dealloc;
- (void)startDownloadTest:(id)a3;
@end

@implementation SpeedTestConfig

- (SpeedTestConfig)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)SpeedTestConfig;
  v2 = [(SpeedTestConfig *)&v19 init];
  v2->inProgress = 0;
  v3 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v3, OS_LOG_TYPE_INFO, "CellularThroughput: CellularTest init", buf, 2u);
  }

  NSLog(&cfstr_Cellularthroug.isa);
  v4 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Creating Configuration", buf, 2u);
  }

  v5 = [MEMORY[0x263F574A0] defaultConfigurationCellular];
  v6 = v5;
  if (!v5)
  {
    v16 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228C6D000, v16, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig is nil", buf, 2u);
    }

    NSLog(&cfstr_Cellularthroug_0.isa);
    goto LABEL_20;
  }
  [v5 setDownloadSize:50];
  v7 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [v6 downloadSize];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v8;
    _os_log_impl(&dword_228C6D000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.downloadSize: %lu", buf, 0xCu);
  }

  [v6 setStopAtFileSize:1];
  [v6 setTestDuration:30];
  v9 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v6 testDuration];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v10;
    _os_log_impl(&dword_228C6D000, v9, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.testDuration: %lu", buf, 0xCu);
  }

  [v6 setCollectWRMMetrics:1];
  [v6 setInterfaceType:0];
  v11 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = [v6 interfaceType];
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl(&dword_228C6D000, v11, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.interfaceType: %d", buf, 8u);
  }

  [v6 setClientName:@"CellularDataDiagnosticsSuite"];
  [v6 setLegacyMode:0];
  uint64_t v13 = [MEMORY[0x263F57498] performanceTestWithConfiguration:v6];
  performanceTest = v2->performanceTest;
  v2->performanceTest = (NPTPerformanceTest *)v13;

  if (!v2->performanceTest)
  {
    v17 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228C6D000, v17, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTest is nil", buf, 2u);
    }

LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = v2;
LABEL_21:

  return v15;
}

- (void)startDownloadTest:(id)a3
{
  v4 = (void (**)(id, __CFString *))a3;
  if (!self->performanceTest)
  {
    v5 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228C6D000, v5, OS_LOG_TYPE_INFO, "CellularThroughput: NPTPerformanceTest instance nil, bailing out", buf, 2u);
    }

    if (v4) {
      v4[2](v4, @"NO");
    }
  }
  if (self->inProgress)
  {
    v6 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228C6D000, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Download task already started", buf, 2u);
    }

    if (v4) {
      v4[2](v4, @"NO");
    }
  }
  self->inProgress = 1;
  v7 = (void *)MEMORY[0x22A6A9190]();
  unsigned int v8 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Call RPM Test", buf, 2u);
  }

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v10, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection starting", buf, 2u);
  }

  performanceTest = self->performanceTest;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke;
  v20[3] = &unk_2648543A0;
  int v12 = v9;
  uint64_t v21 = v12;
  [(NPTPerformanceTest *)performanceTest startMetadataCollectionWithCompletion:v20];
  uint64_t v13 = self->performanceTest;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke_12;
  v16[3] = &unk_264854418;
  v17 = v12;
  v18 = self;
  v14 = v4;
  objc_super v19 = v14;
  v15 = v12;
  [(NPTPerformanceTest *)v13 startDownloadWithCompletion:v16];
}

void __37__SpeedTestConfig_startDownloadTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v5 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_228C6D000, v5, OS_LOG_TYPE_INFO, "CellularThroughput: Error count in startMetadataCollectionWithCompletion: %{public}lu", buf, 0xCu);
  }

  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = DiagnosticsKitLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unsigned int v8 = [v4 objectAtIndexedSubscript:v6];
        *(_DWORD *)buf = 138543362;
        uint64_t v10 = (uint64_t)v8;
        _os_log_impl(&dword_228C6D000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Error in startMetadataCollectionWithCompletion: %{public}@", buf, 0xCu);
      }
      ++v6;
    }
    while ([v4 count] > v6);
  }
}

void __37__SpeedTestConfig_startDownloadTest___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Download task starting", buf, 2u);
  }

  unsigned int v8 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection arrived at semaphore", buf, 2u);
  }

  dispatch_semaphore_t v9 = *(NSObject **)(a1 + 32);
  dispatch_time_t v10 = dispatch_walltime(0, 10000000000);
  dispatch_semaphore_wait(v9, v10);
  uint64_t v11 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C6D000, v11, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection after semaphore wait", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) stopMetadataCollection];
  [*(id *)(*(void *)(a1 + 40) + 16) saveToAWD];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __37__SpeedTestConfig_startDownloadTest___block_invoke_16;
  v25 = &unk_2648543C8;
  uint64_t v26 = *(void *)(a1 + 40);
  AnalyticsSendEventLazy();
  int v12 = dispatch_queue_create("com.apple.wirelessdataanalytics.CellularDataDiagnosticsSuite", 0);
  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke_2;
  block[3] = &unk_2648543F0;
  id v18 = v6;
  id v19 = v5;
  id v14 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = v14;
  id v15 = v5;
  id v16 = v6;
  dispatch_after(v13, v12, block);
}

uint64_t __37__SpeedTestConfig_startDownloadTest___block_invoke_16(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) getTransformedDataForCoreAnalytics];
}

uint64_t __37__SpeedTestConfig_startDownloadTest___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_228C6D000, v2, OS_LOG_TYPE_INFO, "CellularThroughput: save results to AWD", (uint8_t *)&v10, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = DiagnosticsKitLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) localizedDescription];
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_228C6D000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task errored out: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      unsigned int v8 = *(uint64_t (**)(void))(result + 16);
LABEL_12:
      uint64_t result = v8();
    }
  }
  else
  {
    if (v5)
    {
      [*(id *)(a1 + 40) speed];
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_228C6D000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task completed, throughput %f Mbps", (uint8_t *)&v10, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      unsigned int v8 = *(uint64_t (**)(void))(result + 16);
      goto LABEL_12;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 8) = 0;
  return result;
}

- (void)abort
{
  self->inProgress = 0;
}

- (BOOL)inProgress
{
  return self->inProgress;
}

- (void)dealloc
{
  performanceTest = self->performanceTest;
  self->performanceTest = 0;

  v4.receiver = self;
  v4.super_class = (Class)SpeedTestConfig;
  [(SpeedTestConfig *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end