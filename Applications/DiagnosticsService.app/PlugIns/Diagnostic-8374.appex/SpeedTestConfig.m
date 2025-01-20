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
  v19.receiver = self;
  v19.super_class = (Class)SpeedTestConfig;
  v2 = [(SpeedTestConfig *)&v19 init];
  v2->inProgress = 0;
  v3 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CellularThroughput: CellularTest init", buf, 2u);
  }

  NSLog(@"CellularThroughput: CellularTest init");
  v4 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Creating Configuration", buf, 2u);
  }

  v5 = +[NPTPerformanceTestConfiguration defaultConfigurationCellular];
  v6 = v5;
  if (!v5)
  {
    v16 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig is nil", buf, 2u);
    }

    NSLog(@"CellularThroughput: performanceTestWithConfig is nil");
    goto LABEL_20;
  }
  [v5 setDownloadSize:50];
  v7 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [v6 downloadSize];
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.downloadSize: %lu", buf, 0xCu);
  }

  [v6 setStopAtFileSize:1];
  [v6 setTestDuration:30];
  v9 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 testDuration];
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = (unint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.testDuration: %lu", buf, 0xCu);
  }

  [v6 setCollectWRMMetrics:1];
  [v6 setInterfaceType:0];
  v11 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = [v6 interfaceType];
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.interfaceType: %d", buf, 8u);
  }

  [v6 setClientName:@"CellularDataDiagnosticsSuite"];
  [v6 setLegacyMode:0];
  uint64_t v13 = +[NPTPerformanceTest performanceTestWithConfiguration:v6];
  performanceTest = v2->performanceTest;
  v2->performanceTest = (NPTPerformanceTest *)v13;

  if (!v2->performanceTest)
  {
    v17 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTest is nil", buf, 2u);
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
  v4 = (void (**)(id, const __CFString *))a3;
  if (!self->performanceTest)
  {
    v5 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CellularThroughput: NPTPerformanceTest instance nil, bailing out", buf, 2u);
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
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Download task already started", buf, 2u);
    }

    if (v4) {
      v4[2](v4, @"NO");
    }
  }
  self->inProgress = 1;
  unsigned int v8 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Call RPM Test", buf, 2u);
  }

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection starting", buf, 2u);
  }

  performanceTest = self->performanceTest;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000027C4;
  v20[3] = &unk_100004138;
  unsigned int v12 = v9;
  unint64_t v21 = v12;
  [(NPTPerformanceTest *)performanceTest startMetadataCollectionWithCompletion:v20];
  uint64_t v13 = self->performanceTest;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100002938;
  v16[3] = &unk_1000041B0;
  v17 = v12;
  v18 = self;
  v14 = v4;
  objc_super v19 = v14;
  v15 = v12;
  [(NPTPerformanceTest *)v13 startDownloadWithCompletion:v16];
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