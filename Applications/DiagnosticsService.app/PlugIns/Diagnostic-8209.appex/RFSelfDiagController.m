@interface RFSelfDiagController
- (BOOL)fAlertTestComplete;
- (RFSelfDiagInputs)inputs;
- (unsigned)testCompleteAlertTime;
- (void)abortTesting:(int64_t)a3;
- (void)handleAWDMetricEvent:(id)a3;
- (void)handleChamberOpenEvent:(int)a3;
- (void)runRFSelfDiag;
- (void)setFAlertTestComplete:(BOOL)a3;
- (void)setInputs:(id)a3;
- (void)setTestCompleteAlertTime:(unsigned int)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)startAlertsTestComplete:(BOOL)a3;
- (void)stopAlertsTestComplete;
- (void)teardown;
@end

@implementation RFSelfDiagController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[RFSelfDiagController setInputs:](self, "setInputs:", a3, a4);
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(RFSelfDiagController *)self inputs];
    unsigned int v7 = [v6 command];
    v8 = [(RFSelfDiagController *)self inputs];
    unsigned int v9 = [v8 measureType];
    v10 = [(RFSelfDiagController *)self inputs];
    unsigned int v11 = [v10 detectChamberReadyWaitTime];
    v12 = [(RFSelfDiagController *)self inputs];
    v13[0] = 67109888;
    v13[1] = v7;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = [v12 detectChamberSensor];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Setup parameters: command(%d), measureType(%d), detectChamberReadyWaitTime(%dsec), detectChamberSensor(%x)", (uint8_t *)v13, 0x1Au);
  }
  [(RFSelfDiagController *)self setFinished:0];
}

- (void)abortTesting:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AA8];
      CFStringRef v5 = @"Failed to Start";
      goto LABEL_14;
    case 2:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AC0];
      CFStringRef v5 = @"Chamber is opened";
      goto LABEL_14;
    case 3:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AD8];
      CFStringRef v5 = @"Failed to add AWD configuration";
      goto LABEL_14;
    case 4:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AD8];
      CFStringRef v5 = @"Failed to register RF Self Test data event";
      goto LABEL_14;
    case 5:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AD8];
      CFStringRef v5 = @"Failed to set FactoryTest mode";
      goto LABEL_14;
    case 7:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AD8];
      CFStringRef v5 = @"Failed to start Baseband RF self test";
      goto LABEL_14;
    case 8:
      v6 = [(RFSelfDiagController *)self result];
      [v6 setStatusCode:&off_100010A90];

      unsigned int v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v8 = [(RFSelfDiagController *)self result];
      unsigned int v9 = [v8 statusCode];
      int v14 = 67109120;
      LODWORD(v15) = [v9 intValue];
      v10 = "[RFSelfTest] Received RF Self test result from baseband, statusCode=%d";
      unsigned int v11 = v7;
      uint32_t v12 = 8;
      goto LABEL_16;
    case 9:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010AF0];
      CFStringRef v5 = @"Failed to get test result from Baseband in time";
      goto LABEL_14;
    case 10:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010B08];
      CFStringRef v5 = @"Failed to recover baseband after test result received";
      goto LABEL_14;
    case 12:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010B20];
      CFStringRef v5 = @"Test not supported";
      goto LABEL_14;
    default:
      v4 = [(RFSelfDiagController *)self result];
      [v4 setStatusCode:&off_100010B38];
      CFStringRef v5 = @"Other failiure";
LABEL_14:

      v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v8 = [(RFSelfDiagController *)self result];
      unsigned int v9 = [v8 statusCode];
      int v14 = 138412546;
      CFStringRef v15 = v5;
      __int16 v16 = 1024;
      unsigned int v17 = [v9 intValue];
      v10 = "[RFSelfTest] Abort test with error: %@, statusCode=%d";
      unsigned int v11 = v13;
      uint32_t v12 = 18;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

      return;
  }
}

- (void)runRFSelfDiag
{
  if ([(RFSelfDiagExtensionHelper *)self->fDiagHelper loadTestConfigFromUserDefaults])
  {
    fDiagHelper = self->fDiagHelper;
    if (fDiagHelper)
    {
      [(RFSelfDiagExtensionHelper *)fDiagHelper testConfiguration];
      uint64_t v4 = DWORD1(v77);
    }
    else
    {
      uint64_t v4 = 0;
      long long v77 = 0u;
      long long v78 = 0u;
    }
    CFStringRef v5 = [(RFSelfDiagController *)self inputs];
    [v5 setDetectChamberSensor:v4];

    v6 = self->fDiagHelper;
    if (v6)
    {
      [(RFSelfDiagExtensionHelper *)v6 testConfiguration];
      uint64_t v7 = DWORD2(v75);
    }
    else
    {
      uint64_t v7 = 0;
      long long v75 = 0u;
      long long v76 = 0u;
    }
    v8 = [(RFSelfDiagController *)self inputs];
    [v8 setDetectChamberReadyWaitTime:v7];

    unsigned int v9 = self->fDiagHelper;
    if (v9)
    {
      [(RFSelfDiagExtensionHelper *)v9 testConfiguration];
      uint64_t v10 = HIDWORD(v73);
    }
    else
    {
      uint64_t v10 = 0;
      long long v73 = 0u;
      long long v74 = 0u;
    }
    unsigned int v11 = [(RFSelfDiagController *)self inputs];
    [v11 setDetectChamberReadyALSThreshold:v10];

    uint32_t v12 = self->fDiagHelper;
    if (v12)
    {
      [(RFSelfDiagExtensionHelper *)v12 testConfiguration];
      uint64_t v13 = v72;
    }
    else
    {
      uint64_t v13 = 0;
      long long v71 = 0u;
      long long v72 = 0u;
    }
    int v14 = [(RFSelfDiagController *)self inputs];
    [v14 setTestCompleteAlertTime:v13];

    CFStringRef v15 = self->fDiagHelper;
    if (v15)
    {
      [(RFSelfDiagExtensionHelper *)v15 testConfiguration];
      int v16 = BYTE4(v70);
    }
    else
    {
      int v16 = 0;
      long long v69 = 0u;
      long long v70 = 0u;
    }
    BOOL v17 = v16 != 0;
    __int16 v18 = [(RFSelfDiagController *)self inputs];
    [v18 setTestCompleteVibrationAlertEnabled:v17];

    unsigned int v19 = self->fDiagHelper;
    if (v19)
    {
      [(RFSelfDiagExtensionHelper *)v19 testConfiguration];
      int v20 = BYTE5(v68);
    }
    else
    {
      int v20 = 0;
      long long v67 = 0u;
      long long v68 = 0u;
    }
    BOOL v21 = v20 != 0;
    v22 = [(RFSelfDiagController *)self inputs];
    [v22 setTestCompleteChimeAlertEnabled:v21];

    v23 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Test parameters overrided", buf, 2u);
    }
  }
  v24 = [(RFSelfDiagController *)self inputs];
  -[RFSelfDiagController setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", [v24 testCompleteAlertTime]);

  v25 = self->fDiagHelper;
  v26 = [(RFSelfDiagController *)self inputs];
  LOBYTE(v25) = -[RFSelfDiagExtensionHelper isTestSupported:](v25, "isTestSupported:", [v26 command]);

  v27 = self;
  if ((v25 & 1) == 0)
  {
    uint64_t v29 = 12;
LABEL_39:
    [(RFSelfDiagController *)v27 abortTesting:v29];
    BOOL v39 = 0;
    goto LABEL_40;
  }
  v28 = [(RFSelfDiagController *)self inputs];
  if ([v28 command] == 1)
  {
  }
  else
  {
    v30 = [(RFSelfDiagController *)self inputs];
    unsigned int v31 = [v30 command];

    if (v31 != 3) {
      goto LABEL_28;
    }
  }
  [(RFSelfDiagExtensionHelper *)self->fDiagHelper setFactoryTest];
LABEL_28:
  v32 = [(RFSelfDiagController *)self inputs];
  if (![v32 detectChamberSensor])
  {

    if ([(RFSelfDiagExtensionHelper *)self->fDiagHelper prepareSetupForTest]) {
      goto LABEL_31;
    }
LABEL_38:
    v27 = self;
    uint64_t v29 = 1;
    goto LABEL_39;
  }
  v33 = self->fDiagHelper;
  v34 = [(RFSelfDiagController *)self inputs];
  id v35 = [v34 detectChamberSensor];
  v36 = [(RFSelfDiagController *)self inputs];
  LOBYTE(v33) = -[RFSelfDiagExtensionHelper initMonitorChamber:ALSThreshold:](v33, "initMonitorChamber:ALSThreshold:", v35, [v36 detectChamberReadyALSThreshold]);

  if ((v33 & 1) == 0
    || ![(RFSelfDiagExtensionHelper *)self->fDiagHelper prepareSetupForTest])
  {
    goto LABEL_38;
  }
LABEL_31:
  v37 = [(RFSelfDiagController *)self inputs];
  unsigned int v38 = [v37 detectChamberSensor];
  BOOL v39 = v38 != 0;

  v40 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  BOOL v41 = os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT);
  if (!v38)
  {
    if (!v41) {
      goto LABEL_53;
    }
    *(_WORD *)buf = 0;
    v48 = "[RFSelfTest] Skip to detect Chamber";
    goto LABEL_52;
  }
  if (v41)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Wait and confirm if Chamber is closed", buf, 2u);
  }
  v42 = [(RFSelfDiagController *)self inputs];
  if ([v42 detectChamberSensor])
  {
    v43 = self->fDiagHelper;
    v44 = [(RFSelfDiagController *)self inputs];
    LOBYTE(v43) = -[RFSelfDiagExtensionHelper waitForChamberClosed:](v43, "waitForChamberClosed:", [v44 detectChamberReadyWaitTime]);

    if ((v43 & 1) == 0)
    {
      v27 = self;
      uint64_t v29 = 2;
      goto LABEL_39;
    }
  }
  else
  {
  }
  v40 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v48 = "[RFSelfTest] Chamber is ready";
LABEL_52:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
  }
LABEL_53:
  v49 = self->fDiagHelper;
  v50 = [(RFSelfDiagController *)self inputs];
  LOBYTE(v49) = -[RFSelfDiagExtensionHelper addAWDConfiguration:](v49, "addAWDConfiguration:", [v50 command]);

  if (v49)
  {
    v51 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Add AWD configuration", buf, 2u);
    }
    v52 = self->fDiagHelper;
    v53 = [(RFSelfDiagController *)self inputs];
    id v54 = [v53 measureType];
    v55 = [(RFSelfDiagController *)self inputs];
    LOBYTE(v52) = -[RFSelfDiagExtensionHelper startBasebandRFSelfTest:TestCommand:](v52, "startBasebandRFSelfTest:TestCommand:", v54, [v55 command]);

    if (v52)
    {
      unsigned int v56 = [(RFSelfDiagExtensionHelper *)self->fDiagHelper getBasebandResultWaitTime];
      v57 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v80) = v56;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v57, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Baseband starts RF Self test. Waiting (%dsec) for the result..", buf, 8u);
      }
      self->int64_t diagState = 6;
      v58 = [(RFSelfDiagController *)self inputs];
      unsigned int v59 = [v58 detectChamberSensor];

      if (v59) {
        [(RFSelfDiagExtensionHelper *)self->fDiagHelper startMonitorChamberOpen];
      }
      v60 = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
      self->fWaitForEvent = v60;
      dispatch_time_t v61 = dispatch_time(0, 1000000000 * v56);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)v60, v61)) {
        int64_t diagState = 9;
      }
      else {
        int64_t diagState = self->diagState;
      }
      [(RFSelfDiagController *)self abortTesting:diagState];
      [(RFSelfDiagExtensionHelper *)self->fDiagHelper stopMonitorChamber];
    }
    else
    {
      [(RFSelfDiagController *)self abortTesting:7];
    }
    v63 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
    {
      if ([(RFSelfDiagExtensionHelper *)self->fDiagHelper removeAWDConfiguration]) {
        v64 = "Success";
      }
      else {
        v64 = "Failed";
      }
      *(_DWORD *)buf = 136315138;
      v80 = v64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v63, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Remove AWD configuration: %s", buf, 0xCu);
    }
    v65 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEFAULT))
    {
      if ([(RFSelfDiagExtensionHelper *)self->fDiagHelper recoverBasebandState:self->diagState != 8])
      {
        v66 = "Success";
      }
      else
      {
        v66 = "Failed";
      }
      *(_DWORD *)buf = 136315138;
      v80 = v66;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v65, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Recover Baseband: %s", buf, 0xCu);
    }
  }
  else
  {
    [(RFSelfDiagController *)self abortTesting:3];
  }
LABEL_40:
  BOOL v45 = self->diagState != 2 && v39;
  [(RFSelfDiagController *)self startAlertsTestComplete:v45];
  if ([(RFSelfDiagController *)self fAlertTestComplete])
  {
    v46 = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
    self->fWaitForEvent = v46;
    dispatch_time_t v47 = dispatch_time(0, 1000000000 * [(RFSelfDiagController *)self testCompleteAlertTime]);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v46, v47)) {
      [(RFSelfDiagController *)self stopAlertsTestComplete];
    }
  }
  [(RFSelfDiagExtensionHelper *)self->fDiagHelper restoreSetup];
}

- (void)start
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(RFSelfDiagController *)self inputs];
    CFStringRef v5 = [v4 commandDescription];
    int v12 = 138412290;
    uint64_t v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Diag] started : %@ ==", (uint8_t *)&v12, 0xCu);
  }
  [(RFSelfDiagController *)self setFinished:0];
  v6 = [(RFSelfDiagController *)self inputs];
  unsigned int v7 = [v6 command];

  if (v7 > 3)
  {
    uint64_t v10 = [(RFSelfDiagController *)self result];
    [v10 setStatusCode:&off_100010B20];
  }
  else
  {
    self->int64_t diagState = 0;
    if (!self->fDiagHelper)
    {
      v8 = [[RFSelfDiagExtensionHelper alloc] initWithDelegate:self];
      fDiagHelper = self->fDiagHelper;
      self->fDiagHelper = v8;
    }
    [(RFSelfDiagController *)self runRFSelfDiag];
  }
  [(RFSelfDiagController *)self setFinished:1];
  unsigned int v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Diag] finished ==", (uint8_t *)&v12, 2u);
  }
  [(RFSelfDiagExtensionHelper *)self->fDiagHelper resetAll];
}

- (void)teardown
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] teardown called", v7, 2u);
  }
  int64_t diagState = self->diagState;
  if (diagState == 6 || diagState == 0) {
    self->int64_t diagState = 11;
  }
  if (self->fWaitForEvent)
  {
    if ([(RFSelfDiagController *)self fAlertTestComplete]) {
      [(RFSelfDiagController *)self stopAlertsTestComplete];
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
  }
  fDiagHelper = self->fDiagHelper;
  if (fDiagHelper)
  {
    [(RFSelfDiagExtensionHelper *)fDiagHelper stopMonitorChamber];
    [(RFSelfDiagExtensionHelper *)self->fDiagHelper restoreSetup];
    [(RFSelfDiagExtensionHelper *)self->fDiagHelper resetAll];
  }
}

- (void)handleChamberOpenEvent:(int)a3
{
  CFStringRef v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Chamber open detected with sensor(%d)", (uint8_t *)v6, 8u);
  }
  if (self->fWaitForEvent)
  {
    if ([(RFSelfDiagController *)self fAlertTestComplete])
    {
      [(RFSelfDiagController *)self stopAlertsTestComplete];
    }
    else
    {
      if (!self->fWaitForEvent) {
        return;
      }
      self->int64_t diagState = 2;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
  }
}

- (void)handleAWDMetricEvent:(id)a3
{
  id v4 = a3;
  if (self->fWaitForEvent)
  {
    CFStringRef v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v15 = [v4 length];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] AWD Metric received! size=%lu ", buf, 0xCu);
    }
    v6 = [v4 base64EncodedStringWithOptions:0];
    CFStringRef v12 = @"RFSelfDiagBasebandTestData";
    uint64_t v13 = v6;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v8 = [(RFSelfDiagController *)self result];
    [v8 setData:v7];

    self->int64_t diagState = 8;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
    unsigned int v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(RFSelfDiagController *)self result];
      unsigned int v11 = [v10 data];
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "%@ ", buf, 0xCu);
    }
  }
}

- (void)startAlertsTestComplete:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = [(RFSelfDiagController *)self inputs];
  if ([v5 testCompleteVibrationAlertEnabled])
  {

LABEL_4:
    [(RFSelfDiagExtensionHelper *)self->fDiagHelper stopMonitorChamber];
    if (!v3 || ![(RFSelfDiagExtensionHelper *)self->fDiagHelper startMonitorChamberOpen])
    {
      [(RFSelfDiagController *)self setTestCompleteAlertTime:5];
      v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 67109120;
        v21[1] = [(RFSelfDiagController *)self testCompleteAlertTime];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Failed to start monitoring chamber. Keep alert for %dsec", (uint8_t *)v21, 8u);
      }
    }
    unsigned int v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"RFSelfTestCompleteAlertsNotification" object:0];

    uint64_t v10 = [(RFSelfDiagController *)self inputs];
    unsigned int v11 = [v10 testCompleteVibrationAlertEnabled];

    if (v11)
    {
      CFStringRef v12 = +[NSNumber numberWithBool:1];
      uint64_t v13 = +[NSDictionary dictionaryWithObject:v12 forKey:kAudioServicesPlaySystemSoundOptionLoopKey];

      AudioServicesPlaySystemSoundWithOptions();
      [(RFSelfDiagController *)self setFAlertTestComplete:1];
      int v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Start Vibration alert started", (uint8_t *)v21, 2u);
      }
    }
    id v15 = [(RFSelfDiagController *)self inputs];
    unsigned int v16 = [v15 testCompleteChimeAlertEnabled];

    if (v16)
    {
      BOOL v17 = +[NSNumber numberWithBool:1];
      __int16 v18 = +[NSDictionary dictionaryWithObject:v17 forKey:kAudioServicesPlaySystemSoundOptionLoopKey];

      AudioServicesPlaySystemSoundWithOptions();
      [(RFSelfDiagController *)self setFAlertTestComplete:1];
      unsigned int v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Start Sound alert started", (uint8_t *)v21, 2u);
      }
    }
    return;
  }
  v6 = [(RFSelfDiagController *)self inputs];
  unsigned __int8 v7 = [v6 testCompleteChimeAlertEnabled];

  if (v7) {
    goto LABEL_4;
  }
  int v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Alert not enabled", (uint8_t *)v21, 2u);
  }
}

- (void)stopAlertsTestComplete
{
  BOOL v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Stop alert", v8, 2u);
  }
  id v4 = [(RFSelfDiagController *)self inputs];
  unsigned int v5 = [v4 testCompleteVibrationAlertEnabled];

  if (v5) {
    AudioServicesStopSystemSound();
  }
  v6 = [(RFSelfDiagController *)self inputs];
  unsigned int v7 = [v6 testCompleteChimeAlertEnabled];

  if (v7) {
    AudioServicesStopSystemSound();
  }
  [(RFSelfDiagController *)self setFAlertTestComplete:0];
  [(RFSelfDiagExtensionHelper *)self->fDiagHelper stopMonitorChamber];
}

- (RFSelfDiagInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (BOOL)fAlertTestComplete
{
  return self->_fAlertTestComplete;
}

- (void)setFAlertTestComplete:(BOOL)a3
{
  self->_fAlertTestComplete = a3;
}

- (unsigned)testCompleteAlertTime
{
  return self->_testCompleteAlertTime;
}

- (void)setTestCompleteAlertTime:(unsigned int)a3
{
  self->_testCompleteAlertTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->fDiagHelper, 0);
}

@end