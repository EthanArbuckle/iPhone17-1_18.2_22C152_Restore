@interface DADeviceConnectionLocal
- (ASTSession)session;
- (BOOL)_shutdownForBatteryDisconnectWithUnsealCode:(unsigned int)a3;
- (BOOL)_shutdownToShelfLifeMode;
- (BOOL)isDisconnecting;
- (DAAssetUploader)assetUploader;
- (DADeviceConnectionConfigurator)configurator;
- (DADeviceConnectionDelegate)delegate;
- (DADeviceConnectionLocal)initWithState:(id)a3;
- (DADeviceState)state;
- (DASessionSettings)sessionSettings;
- (DAStrongDeviceIdentity)strongDeviceIdentity;
- (NSMutableDictionary)progressForTest;
- (NSMutableDictionary)sandboxExtensionHandles;
- (id)IMEI;
- (id)session:(id)a3 estimatedTimeRemainingForTest:(id)a4;
- (id)session:(id)a3 progressForTest:(id)a4;
- (int)mode;
- (unsigned)_unsealCodeFromParameters:(id)a3;
- (void)_session:(id)a3 didFinishSuiteWithName:(id)a4 skipped:(BOOL)a5;
- (void)_sessionDidPowerOff:(id)a3 forReboot:(BOOL)a4 withParameters:(id)a5;
- (void)_setNextBootForBootMode:(int64_t)a3;
- (void)_shutDownDeviceForReboot:(BOOL)a3;
- (void)archive;
- (void)end;
- (void)idle;
- (void)requestAsset:(id)a3 completionHandler:(id)a4;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)requestUploadAssets:(id)a3 completion:(id)a4;
- (void)session:(id)a3 cancelTest:(id)a4;
- (void)session:(id)a3 didCompleteTestSuite:(id)a4 description:(id)a5;
- (void)session:(id)a3 didEndWithError:(id)a4;
- (void)session:(id)a3 didFinishSendingResultForTest:(id)a4;
- (void)session:(id)a3 didPauseSendingResultForTest:(id)a4 error:(id)a5;
- (void)session:(id)a3 didPauseWithError:(id)a4;
- (void)session:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5;
- (void)session:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5;
- (void)session:(id)a3 didResumeSendingResultForTest:(id)a4;
- (void)session:(id)a3 didStartTestSuite:(id)a4 description:(id)a5;
- (void)session:(id)a3 didUpdateSettings:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 didUpdateTestSuiteImage:(id)a4;
- (void)session:(id)a3 didUpdateTestSuiteProgress:(id)a4;
- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4;
- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5;
- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6;
- (void)sessionDidCancelSuite:(id)a3;
- (void)sessionDidReboot:(id)a3 withParameters:(id)a4;
- (void)sessionDidResume:(id)a3;
- (void)sessionDidShutDown:(id)a3 withParameters:(id)a4;
- (void)sessionDidStart:(id)a3;
- (void)setAssetUploader:(id)a3;
- (void)setConfigurator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setProgressForTest:(id)a3;
- (void)setSandboxExtensionHandles:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)setStrongDeviceIdentity:(id)a3;
- (void)start;
@end

@implementation DADeviceConnectionLocal

- (DADeviceConnectionLocal)initWithState:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DADeviceConnectionLocal;
  v6 = [(DADeviceConnectionLocal *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v7->_disconnecting = 0;
    [(DADeviceState *)v7->_state setPhase:0];
    v8 = objc_alloc_init(DAAssetUploader);
    assetUploader = v7->_assetUploader;
    v7->_assetUploader = v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    sandboxExtensionHandles = v7->_sandboxExtensionHandles;
    v7->_sandboxExtensionHandles = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    progressForTest = v7->_progressForTest;
    v7->_progressForTest = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (id)IMEI
{
  return 0;
}

- (DADeviceState)state
{
  return self->_state;
}

- (int)mode
{
  v3 = [(DADeviceConnectionLocal *)self configurator];

  if (!v3) {
    return 0;
  }
  v4 = [(DADeviceConnectionLocal *)self configurator];
  int v5 = [v4 mode];

  return v5;
}

- (void)start
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v15 = "-[DADeviceConnectionLocal start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v4 = [(DADeviceConnectionLocal *)self state];
  int v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100156940, &off_100156958, &off_100156970, 0);
  [v4 removeErrorCodes:v5];

  v6 = [(DADeviceConnectionLocal *)self state];
  [v6 setPhase:2];

  v7 = [(DADeviceConnectionLocal *)self session];

  if (!v7)
  {
    v8 = [(DADeviceConnectionLocal *)self state];
    v9 = [v8 serialNumber];
    uint64_t v10 = +[ASTIdentity identityWithSerialNumber:v9];
    v11 = +[ASTSession sessionWithIdentity:v10];
    [(DADeviceConnectionLocal *)self setSession:v11];

    uint64_t v12 = [(DADeviceConnectionLocal *)self session];
    [v12 setDelegate:self];
  }
  v13 = [(DADeviceConnectionLocal *)self session];
  [v13 startWithMode:[self mode]];
}

- (void)idle
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[DADeviceConnectionLocal idle]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(DADeviceConnectionLocal *)self session];
  [v4 idle];
}

- (void)end
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[DADeviceConnectionLocal end]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v6, 0xCu);
  }

  [(DADeviceConnectionLocal *)self setDisconnecting:1];
  v4 = [(DADeviceConnectionLocal *)self session];

  if (v4)
  {
    int v5 = [(DADeviceConnectionLocal *)self session];
    [v5 end];
  }
  else
  {
    int v5 = [(DADeviceConnectionLocal *)self state];
    [v5 setPhase:1];
  }
}

- (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[DADeviceConnectionLocal requestAsset:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v9 = [(DADeviceConnectionLocal *)self session];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A974;
  v11[3] = &unk_10014B2D8;
  id v12 = v6;
  id v10 = v6;
  [v9 requestAsset:v7 completionHandler:v11];
}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[DADeviceConnectionLocal requestUploadAssets:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v12, 0xCu);
  }

  v9 = [(DADeviceConnectionLocal *)self assetUploader];

  if (v9)
  {
    id v10 = [(DADeviceConnectionLocal *)self assetUploader];
    v11 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];
    [v10 uploadAssets:v6 wtihDeviceIdentity:v11 completion:v7];
  }
  else
  {
    id v10 = +[NSArray array];
    v11 = +[NSError errorWithDomain:DKErrorDomain code:-1008 userInfo:0];
    v7[2](v7, v10, v11);
  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[DADeviceConnectionLocal requestSuiteStart:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v9 = [(DADeviceConnectionLocal *)self session];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AC54;
  v11[3] = &unk_10014B300;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 requestSuiteStart:v7 completionHandler:v11];
}

- (void)sessionDidStart:(id)a3
{
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[DADeviceConnectionLocal sessionDidStart:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v6, 0xCu);
  }

  if (![(DADeviceConnectionLocal *)self isDisconnecting])
  {
    int v5 = [(DADeviceConnectionLocal *)self state];
    [v5 setPhase:4];
  }
}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[DADeviceConnectionLocal session:startTest:parameters:testResult:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  [v11 setStatusCode:&off_100156988];
  v13 = [v10 objectForKeyedSubscript:@"specifications"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v13 objectForKeyedSubscript:@"allowCellularSizeThreshold"];
      if (v14)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v16 = DiagnosticLogHandleForCategory();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if ((isKindOfClass & 1) == 0)
        {
          if (v17)
          {
            *(_DWORD *)buf = 138412290;
            v36 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Bad test specification value. Expected a number, got [%@]", buf, 0xCu);
          }

          [v11 setStatusCode:&off_1001569A0];
          int v18 = 0;
          goto LABEL_15;
        }
        if (v17)
        {
          *(_DWORD *)buf = 138412290;
          v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting cellular threshold to %@.", buf, 0xCu);
        }

        [v11 setAllowCellularSizeThreshold:v14];
      }
      int v18 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  int v18 = 1;
LABEL_16:
  unsigned int v19 = [(DADeviceConnectionLocal *)self isDisconnecting];
  if (!v18 || v19)
  {
    id v22 = [(DADeviceConnectionLocal *)self session];
    [v22 sendTestResult:v11 error:0];
  }
  else
  {
    v20 = +[NSDate date];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_10000B198;
    v30 = &unk_10014B328;
    v31 = self;
    id v21 = v9;
    id v32 = v21;
    id v33 = v11;
    id v34 = v20;
    id v22 = v20;
    v23 = objc_retainBlock(&v27);
    v24 = objc_opt_new();
    [v24 setTestID:v21, v27, v28, v29, v30, v31];
    v25 = +[DKDiagnosticParameters diagnosticParametersWithDictionary:v10];
    [v24 setParameters:v25];

    [v24 setCompletion:v23];
    v26 = [(DADeviceConnectionLocal *)self delegate];
    [v26 deviceConnection:self didRecieveCommand:v24];
  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v17 = "-[DADeviceConnectionLocal session:didEndWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v9 = [(DADeviceConnectionLocal *)self state];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B6B4;
  v12[3] = &unk_10014B350;
  id v13 = v7;
  v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 transactionWithBlock:v12];

  [(DADeviceConnectionLocal *)self setDisconnecting:0];
  [(DADeviceConnectionLocal *)self setStrongDeviceIdentity:0];
}

- (void)session:(id)a3 didStartTestSuite:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v17 = "-[DADeviceConnectionLocal session:didStartTestSuite:description:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v10 = [(DADeviceConnectionLocal *)self state];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B994;
  v13[3] = &unk_10014B378;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 transactionWithBlock:v13];
}

- (void)session:(id)a3 didCompleteTestSuite:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[DADeviceConnectionLocal session:didCompleteTestSuite:description:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v10, 0xCu);
  }

  [(DADeviceConnectionLocal *)self _session:v8 didFinishSuiteWithName:v7 skipped:0];
}

- (void)sessionDidCancelSuite:(id)a3
{
  id v4 = a3;
  int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[DADeviceConnectionLocal sessionDidCancelSuite:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(DADeviceConnectionLocal *)self state];
  id v7 = [v6 suiteName];
  [(DADeviceConnectionLocal *)self _session:v4 didFinishSuiteWithName:v7 skipped:1];
}

- (void)_session:(id)a3 didFinishSuiteWithName:(id)a4 skipped:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = "-[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  if (![(DADeviceConnectionLocal *)self isDisconnecting])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000BEB0;
    v26[3] = &unk_10014B3C8;
    v26[4] = self;
    id v11 = objc_retainBlock(v26);
    if ([v8 shouldShowResults]
      && ([(DADeviceConnectionLocal *)self state],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 diagnosticEventID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      id v14 = [(DADeviceConnectionLocal *)self session];
      id v15 = [(DADeviceConnectionLocal *)self state];
      v16 = [v15 diagnosticEventID];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000C0CC;
      v22[3] = &unk_10014B3F0;
      v24 = v11;
      id v23 = v9;
      BOOL v25 = v5;
      [v14 requestSuiteSummary:v16 completionHandler:v22];

      BOOL v17 = v24;
    }
    else
    {
      int v18 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping requesting suite summary", buf, 2u);
      }

      unsigned int v19 = [DAHistoryEntry alloc];
      BOOL v17 = [(DADeviceConnectionLocal *)self state];
      v20 = [v17 suiteName];
      id v21 = [(DAHistoryEntry *)v19 initWithTestSuiteName:v20 skipped:v5];
      ((void (*)(void *, DAHistoryEntry *, void))v11[2])(v11, v21, 0);
    }
  }
}

- (void)session:(id)a3 didUpdateTestSuiteProgress:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteProgress:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v8, 0xCu);
  }

  if (![(DADeviceConnectionLocal *)self isDisconnecting])
  {
    id v7 = [(DADeviceConnectionLocal *)self state];
    [v7 setProgress:v5];
  }
}

- (void)session:(id)a3 didUpdateTestSuiteImage:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteImage:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(DADeviceConnectionLocal *)self state];
  [v7 setTestSuiteImageData:v5];
}

- (id)session:(id)a3 progressForTest:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[DADeviceConnectionLocal session:progressForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v14, 0xCu);
  }

  id v7 = [(DADeviceConnectionLocal *)self progressForTest];
  int v8 = [v7 objectForKeyedSubscript:v5];

  if (v8 && ([v8 isIndeterminate] & 1) == 0)
  {
    int v10 = [v8 fractionCompleted];
    [v10 doubleValue];
    id v9 = +[NSNumber numberWithDouble:v11 * 100.0];
  }
  else
  {
    id v9 = 0;
  }
  id v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[DADeviceConnectionLocal session:progressForTest:]";
    __int16 v16 = 2112;
    BOOL v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s progress is: %@", (uint8_t *)&v14, 0x16u);
  }

  return v9;
}

- (id)session:(id)a3 estimatedTimeRemainingForTest:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[DADeviceConnectionLocal session:estimatedTimeRemainingForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [(DADeviceConnectionLocal *)self progressForTest];
  int v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    id v9 = [v8 estimatedTimeRemaining];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)session:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(DADeviceConnectionLocal *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(DADeviceConnectionLocal *)self delegate];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000C784;
    v13[3] = &unk_10014B440;
    id v14 = v7;
    id v15 = self;
    id v16 = v8;
    [v11 deviceConnection:self didRequestSuiteRunWithDestinations:v14 confirmation:v13];
  }
  else
  {
    id v12 = [(DADeviceConnectionLocal *)self state];
    [v12 setSuitesAvailable:&__NSArray0__struct];

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)session:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, void *, void))a5;
  id v8 = [(DADeviceConnectionLocal *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(DADeviceConnectionLocal *)self delegate];
    [v10 deviceConnection:self didRequestInstructionalPrompt:v11 withConfirmation:v7];
  }
  else
  {
    char v10 = [v11 identifier];
    v7[2](v7, v10, 0);
  }
}

- (void)session:(id)a3 cancelTest:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    char v10 = "-[DADeviceConnectionLocal session:cancelTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  id v7 = objc_opt_new();
  [v7 setTestID:v5];

  id v8 = [(DADeviceConnectionLocal *)self delegate];
  [v8 deviceConnection:self didRecieveCommand:v7];
}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v19 = "-[DADeviceConnectionLocal session:profile:filteredByComponents:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v12 = [(DADeviceConnectionLocal *)self state];
  [v12 setPhase:3];

  id v13 = objc_opt_new();
  [v13 setComponents:v9];

  [v13 setProfile:v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000CC3C;
  v16[3] = &unk_10014B468;
  id v17 = v8;
  id v14 = v8;
  [v13 setCompletion:v16];
  id v15 = [(DADeviceConnectionLocal *)self delegate];
  [v15 deviceConnection:self didRecieveCommand:v13];
}

- (void)session:(id)a3 didPauseWithError:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[DADeviceConnectionLocal session:didPauseWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  if ([v5 code] == (id)-1004)
  {
    id v7 = [(DADeviceConnectionLocal *)self state];
    id v8 = [v5 userInfo];
    [v7 addErrorCode:3 userInfo:v8];
  }
}

- (void)sessionDidResume:(id)a3
{
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[DADeviceConnectionLocal sessionDidResume:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(DADeviceConnectionLocal *)self state];
  [v5 removeErrorCode:3];
}

- (void)session:(id)a3 didPauseSendingResultForTest:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[DADeviceConnectionLocal session:didPauseSendingResultForTest:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v12, 0xCu);
  }

  id v8 = [v6 code];
  int v9 = [(DADeviceConnectionLocal *)self state];
  id v10 = [v6 userInfo];
  if (v8 == (id)-1003) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 3;
  }
  [v9 addErrorCode:v11 userInfo:v10];
}

- (void)session:(id)a3 didResumeSendingResultForTest:(id)a4
{
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[DADeviceConnectionLocal session:didResumeSendingResultForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v6 = [(DADeviceConnectionLocal *)self state];
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100156A30, &off_100156A48, 0);
  [v6 removeErrorCodes:v7];
}

- (void)session:(id)a3 didFinishSendingResultForTest:(id)a4
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[DADeviceConnectionLocal session:didFinishSendingResultForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(DADeviceConnectionLocal *)self sandboxExtensionHandles];
  id v8 = [v7 objectForKey:v5];

  +[DKSandboxExtension releaseSandboxExtensionsWithHandles:v8];
  int v9 = [(DADeviceConnectionLocal *)self sandboxExtensionHandles];
  [v9 removeObjectForKey:v5];

  [(DADeviceConnectionLocal *)self didFinishSendingResultForTest:v5];
}

- (void)session:(id)a3 didUpdateSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(id, void *, void))a5;
  id v10 = a4;
  uint64_t v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[DADeviceConnectionLocal session:didUpdateSettings:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v20, 0xCu);
  }

  int v12 = +[DASessionSettings sessionSettingsWithDictionary:v10];

  id v13 = [(DADeviceConnectionLocal *)self state];
  id v14 = [v13 sessionSettings];
  unsigned __int8 v15 = [v14 isEqual:v12];

  if ((v15 & 1) == 0)
  {
    id v16 = [(DADeviceConnectionLocal *)self state];
    [v16 setSessionSettings:v12];

    [v8 setAllowCellularSizeThreshold:[v12 allowCellularSizeThreshold]];
  }
  id v17 = [(DADeviceConnectionLocal *)self state];
  int v18 = [v17 sessionSettings];
  unsigned int v19 = [v18 dictionary];
  v9[2](v9, v19, 0);
}

- (void)sessionDidReboot:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[DADeviceConnectionLocal sessionDidReboot:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  [(DADeviceConnectionLocal *)self _sessionDidPowerOff:v7 forReboot:1 withParameters:v6];
}

- (void)sessionDidShutDown:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[DADeviceConnectionLocal sessionDidShutDown:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  [(DADeviceConnectionLocal *)self _sessionDidPowerOff:v7 forReboot:0 withParameters:v6];
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v18 = "-[DADeviceConnectionLocal session:generateAuthInfoWithNonce:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  int v9 = (void *)CFPreferencesCopyAppValue(@"StrongDeviceIdentity", @"com.apple.AppleServiceToolkit");
  id v10 = v9;
  if (v9 && ![v9 BOOLValue])
  {
    id v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Strong device identity is OFF.", buf, 2u);
    }

    [v6 sendAuthInfoResult:0 error:0];
  }
  else
  {
    uint64_t v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Strong device identity is ON.", buf, 2u);
    }

    int v12 = objc_opt_new();
    [(DADeviceConnectionLocal *)self setStrongDeviceIdentity:v12];

    id v13 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000D734;
    v15[3] = &unk_10014B490;
    id v16 = v6;
    [v13 generateAuthInfoWithNonce:v7 completion:v15];
  }
}

- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  int v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v15 = "-[DADeviceConnectionLocal session:signPayload:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v10 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];

  if (v10)
  {
    uint64_t v11 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];
    id v13 = 0;
    int v12 = [v11 signPayload:v7 error:&v13];
    id v10 = v13;
  }
  else
  {
    int v12 = 0;
  }
  v8[2](v8, v12, v10);
}

- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  int v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v15 = "-[DADeviceConnectionLocal session:signFile:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v10 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];

  if (v10)
  {
    uint64_t v11 = [(DADeviceConnectionLocal *)self strongDeviceIdentity];
    id v13 = 0;
    int v12 = [v11 signFile:v7 error:&v13];
    id v10 = v13;
  }
  else
  {
    int v12 = 0;
  }
  v8[2](v8, v12, v10);
}

- (void)_sessionDidPowerOff:(id)a3 forReboot:(BOOL)a4 withParameters:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v15, 0xCu);
  }

  if (+[CBSUtilities isCheckerBoardActive])
  {
    int v9 = [(DADeviceConnectionLocal *)self session];
    [v9 archive];
  }
  id v10 = [v7 objectForKeyedSubscript:@"bootMode"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v11 = (uint64_t)[v10 integerValue];
  }
  else {
    uint64_t v11 = 2;
  }
  [(DADeviceConnectionLocal *)self _setNextBootForBootMode:v11];
  if ([v10 integerValue] == (id)3)
  {
    int v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting battery disconnect shutdown sequence.", (uint8_t *)&v15, 2u);
    }

    uint64_t v13 = [(DADeviceConnectionLocal *)self _unsealCodeFromParameters:v7];
    +[NSThread sleepForTimeInterval:5.0];
    if ([(DADeviceConnectionLocal *)self _shutdownForBatteryDisconnectWithUnsealCode:v13])
    {
      goto LABEL_19;
    }
LABEL_18:
    [(DADeviceConnectionLocal *)self _shutDownDeviceForReboot:v5];
    goto LABEL_19;
  }
  if ([v10 integerValue] != (id)4) {
    goto LABEL_18;
  }
  id v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting entry into Shelf Life Mode.", (uint8_t *)&v15, 2u);
  }

  +[NSThread sleepForTimeInterval:5.0];
  if (![(DADeviceConnectionLocal *)self _shutdownToShelfLifeMode]) {
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_setNextBootForBootMode:(int64_t)a3
{
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    int64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting next boot to %ld", (uint8_t *)&v12, 0xCu);
  }

  switch(a3)
  {
    case 0:
    case 3:
    case 4:
      BOOL v5 = +[DANvramUtil sharedInstance];
      [v5 clearNextBootCheckerBoardPersistent];
      break;
    case 1:
      BOOL v5 = +[DANvramUtil sharedInstance];
      [v5 setNextBootRecovery];
      break;
    case 2:
      BOOL v5 = +[DANvramUtil sharedInstance];
      [v5 setNextBootCheckerBoard];
      break;
    case 5:
      BOOL v5 = +[DANvramUtil sharedInstance];
      [v5 setNextBootCheckerBoardPersistent];
      break;
    default:
      BOOL v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10010166C(a3, v5, v6, v7, v8, v9, v10, v11);
      }
      break;
  }
}

- (void)_shutDownDeviceForReboot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Diagnostics is rebooting this device", v7, 2u);
  }

  id v5 = objc_alloc_init((Class)FBSSystemService);
  id v6 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"Rebooting for Diagnostics"];
  [v6 setRebootType:v3];
  [v5 shutdownWithOptions:v6];
}

- (unsigned)_unsealCodeFromParameters:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"unsealCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 0;
    id v5 = +[NSScanner scannerWithString:v4];
    if ([v5 scanHexInt:&v7])
    {
      LODWORD(v3) = v7;
    }
    else
    {
      BOOL v3 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1001016D8();
      }
    }
  }

  return v3;
}

- (BOOL)_shutdownForBatteryDisconnectWithUnsealCode:(unsigned int)a3
{
  id v4 = objc_alloc_init((Class)DSAppleSMCDevice);
  [v4 openAppleSMC:0];
  unsigned __int16 v26 = HIWORD(a3);
  __int16 v27 = a3;
  unsigned int v5 = [v4 writeDataFor:@"GCCM" value:&v27 size:2];
  id v6 = DiagnosticLogHandleForCategory();
  int v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100101740();
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Low bytes of unseal code successfully written to SMC", buf, 2u);
  }

  unsigned __int8 v8 = [v4 writeDataFor:@"GCRW" value:&v26 size:2];
  uint64_t v9 = DiagnosticLogHandleForCategory();
  int v7 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100101740();
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "High bytes of unseal code successfully written to SMC, %#x", buf, 8u);
  }

  __int16 v25 = 0;
  if (([v4 writeDataFor:@"GCCM" value:&v25 size:2] & 1) == 0)
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10010170C();
    }
    goto LABEL_47;
  }
  unsigned __int16 v24 = 0;
  uint64_t v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Status read control register written low bytes to SMC", buf, 2u);
  }

  unsigned int v11 = [v4 readDataFor:@"GCRW" value:&v24 size:2];
  int v12 = DiagnosticLogHandleForCategory();
  int v7 = v12;
  if (!v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
LABEL_36:
    sub_10010170C();
    goto LABEL_47;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully read from status high bytes register address: %#x", buf, 8u);
  }

  if ((v24 & 0x2000) != 0)
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Control assignment failed, register value: %#x", buf, 8u);
    }
    goto LABEL_47;
  }
  unsigned __int16 v24 = 23;
  if (![v4 writeDataFor:@"GCCM" value:&v24 size:2])
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    goto LABEL_36;
  }
  unsigned __int16 v23 = 0;
  int64_t v13 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "First read control register low bytes written to SMC", buf, 2u);
  }

  unsigned int v14 = [v4 readDataFor:@"GCRW" value:&v23 size:2];
  int v15 = DiagnosticLogHandleForCategory();
  int v7 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_42:
    }
      sub_10010170C();
LABEL_47:

    BOOL v20 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = v23;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully read from first control register high bytes address: %#x", buf, 8u);
  }

  unsigned __int16 v23 = 32;
  if (![v4 writeDataFor:@"GCCM" value:&v23 size:2])
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    goto LABEL_42;
  }
  unsigned __int16 v22 = 0;
  id v16 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Second read control register low bytes written to SMC", buf, 2u);
  }

  unsigned int v17 = [v4 readDataFor:@"GCRW" value:&v22 size:2];
  int v18 = DiagnosticLogHandleForCategory();
  int v7 = v18;
  if (!v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10010170C();
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully read from second control register high bytes value: %#x", buf, 8u);
  }

  unsigned int v19 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Battery Disconnect shutdown successfully initiated.", buf, 2u);
  }

  BOOL v20 = 1;
LABEL_48:

  return v20;
}

- (BOOL)_shutdownToShelfLifeMode
{
  id v3 = objc_alloc_init((Class)DSAppleSMCDevice);
  [v3 openAppleSMC:0];
  if (![v3 writeValueFor:@"BCSL" andValue:&off_100156A60])
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  [v3 readValueFor:@"BCSL"];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 != 2)
  {
    int v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      sub_100101774();
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }
  [(DADeviceConnectionLocal *)self _shutDownDeviceForReboot:0];
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)archive
{
  id v2 = [(DADeviceConnectionLocal *)self session];
  [v2 archive];
}

- (DADeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)progressForTest
{
  return self->_progressForTest;
}

- (void)setProgressForTest:(id)a3
{
}

- (DADeviceConnectionConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
}

- (ASTSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
}

- (DAStrongDeviceIdentity)strongDeviceIdentity
{
  return self->_strongDeviceIdentity;
}

- (void)setStrongDeviceIdentity:(id)a3
{
}

- (DAAssetUploader)assetUploader
{
  return self->_assetUploader;
}

- (void)setAssetUploader:(id)a3
{
}

- (NSMutableDictionary)sandboxExtensionHandles
{
  return self->_sandboxExtensionHandles;
}

- (void)setSandboxExtensionHandles:(id)a3
{
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_assetUploader, 0);
  objc_storeStrong((id *)&self->_strongDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_progressForTest, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_state, 0);
}

@end