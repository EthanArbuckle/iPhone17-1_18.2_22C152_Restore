@interface DiagExtWifiScanner
- (BOOL)fIsScanning;
- (BOOL)fScanRepeatRequired;
- (BOOL)isMonitoring;
- (BOOL)setupWifiManagerClient;
- (BOOL)startMonitoring:(double)a3;
- (BOOL)startWiFiNetworkScan;
- (DiagExtWifiScanner)initWithDelegate:(id)a3;
- (DiagExtWifiScannerDelegate)delegate;
- (__CFRunLoop)fServerRunLoopRef;
- (dispatch_semaphore_s)fWaitForResult;
- (double)fScanIntervalInSec;
- (int)fAvailabilityState;
- (int)scanAndGetWifiAvailability:(unsigned int)a3;
- (void)dealloc;
- (void)disableAutoJoin;
- (void)enableAutoJoin;
- (void)releaseWifiManagerClient;
- (void)setDelegate:(id)a3;
- (void)setFAvailabilityState:(int)a3;
- (void)setFIsScanning:(BOOL)a3;
- (void)setFScanIntervalInSec:(double)a3;
- (void)setFScanRepeatRequired:(BOOL)a3;
- (void)setFServerRunLoopRef:(__CFRunLoop *)a3;
- (void)setFWaitForResult:(dispatch_semaphore_s *)a3;
- (void)setTimeForNextScan;
- (void)startRunLoop_sync;
- (void)stopMonitoring;
- (void)stopWiFiNetworkScan;
- (void)wifiScanCompleted:(__CFArray *)a3 withError:(int)a4;
@end

@implementation DiagExtWifiScanner

- (DiagExtWifiScanner)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DiagExtWifiScanner;
  id v3 = a3;
  v4 = [(DiagExtWifiScanner *)&v6 init];
  -[DiagExtWifiScanner setDelegate:](v4, "setDelegate:", v3, v6.receiver, v6.super_class);

  [(DiagExtWifiScanner *)v4 setFWaitForResult:0];
  [(DiagExtWifiScanner *)v4 setFAvailabilityState:0];
  v4->fWifiManagerRef = 0;
  v4->fWifiDeviceRef = 0;
  v4->fIsMonitoring = 0;
  [(DiagExtWifiScanner *)v4 startRunLoop_sync];
  return v4;
}

- (void)startRunLoop_sync
{
  [(DiagExtWifiScanner *)self setFWaitForResult:dispatch_semaphore_create(0)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008DAC;
  v6[3] = &unk_1000104F8;
  v6[4] = self;
  id v3 = objc_retainBlock(v6);
  v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Create Runloop", v5, 2u);
  }
  pthread_create(&self->fServerRunLoopThread, 0, (void *(__cdecl *)(void *))sub_100008E00, v3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(DiagExtWifiScanner *)self fWaitForResult], 0xFFFFFFFFFFFFFFFFLL);
}

- (void)dealloc
{
  id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)DiagExtWifiScanner;
  [(DiagExtWifiScanner *)&v4 dealloc];
}

- (BOOL)setupWifiManagerClient
{
  if (self->fWifiManagerRef) {
    goto LABEL_4;
  }
  self->fWifiManagerRef = (__WiFiManagerClient *)WiFiManagerClientCreate();
  id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    if (self->fWifiManagerRef) {
      v10 = "Success";
    }
    else {
      v10 = "Failed";
    }
    int v11 = 136315138;
    v12 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: setup manager client %s", (uint8_t *)&v11, 0xCu);
    if (!self->fWifiManagerRef) {
      goto LABEL_5;
    }
LABEL_4:
    if (self->fWifiDeviceRef) {
      goto LABEL_5;
    }
    objc_super v6 = (void *)WiFiManagerClientCopyDevices();
    if ([v6 count])
    {
      objc_super v4 = [v6 objectAtIndexedSubscript:0];

      if (v4)
      {
        self->fWifiDeviceRef = v4;
        CFRetain(v4);
        [(DiagExtWifiScanner *)self fServerRunLoopRef];
        WiFiManagerClientScheduleWithRunLoop();
        Current = CFRunLoopGetCurrent();
        CFRunLoopWakeUp(Current);
        LOBYTE(v4) = 1;
        v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
    }
    else
    {
      objc_super v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: No device available", (uint8_t *)&v11, 2u);
        LOBYTE(v4) = 0;
        v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      LOBYTE(v4) = 0;
    }
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      return (char)v4;
    }
LABEL_14:
    if (self->fWifiDeviceRef) {
      v9 = "Success";
    }
    else {
      v9 = "Failed";
    }
    int v11 = 136315138;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: setup device client %s", (uint8_t *)&v11, 0xCu);
    goto LABEL_18;
  }
  if (self->fWifiManagerRef) {
    goto LABEL_4;
  }
LABEL_5:
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (void)releaseWifiManagerClient
{
  if (self->fWifiManagerRef)
  {
    [(DiagExtWifiScanner *)self fServerRunLoopRef];
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->fWifiManagerRef);
    self->fWifiManagerRef = 0;
    id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: release manager client", buf, 2u);
    }
  }
  fWifiDeviceRef = self->fWifiDeviceRef;
  if (fWifiDeviceRef)
  {
    CFRelease(fWifiDeviceRef);
    self->fWifiDeviceRef = 0;
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: release device client", v6, 2u);
    }
  }
}

- (void)setTimeForNextScan
{
  if ([(DiagExtWifiScanner *)self fIsScanning])
  {
    id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Device is already scanning for networks", v5, 2u);
    }
  }
  else
  {
    fScanTimer = self->fScanTimer;
    if (fScanTimer) {
      [(NSTimer *)fScanTimer invalidate];
    }
    [(DiagExtWifiScanner *)self fScanIntervalInSec];
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "startWiFiNetworkScan", 0, 0);
    self->fScanTimer = (NSTimer *)objc_claimAutoreleasedReturnValue();
    _objc_release_x1();
  }
}

- (int)scanAndGetWifiAvailability:(unsigned int)a3
{
  if (self->fIsMonitoring)
  {
    return [(DiagExtWifiScanner *)self fAvailabilityState];
  }
  else
  {
    [(DiagExtWifiScanner *)self setFScanRepeatRequired:0];
    if ([(DiagExtWifiScanner *)self startWiFiNetworkScan])
    {
      [(DiagExtWifiScanner *)self setFWaitForResult:dispatch_semaphore_create(0)];
      objc_super v6 = [(DiagExtWifiScanner *)self fWaitForResult];
      dispatch_time_t v7 = dispatch_time(0, 1000000000 * a3);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)v6, v7))
      {
        [(DiagExtWifiScanner *)self stopWiFiNetworkScan];
        v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        int v9 = 0;
        if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Failed to get wifi scan reseult in time", v11, 2u);
          int v9 = 0;
        }
      }
      else
      {
        int v9 = [(DiagExtWifiScanner *)self fAvailabilityState];
      }
      [(DiagExtWifiScanner *)self setFWaitForResult:0];
      return v9;
    }
    else
    {
      v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Failed to start", buf, 2u);
      }
      return 0;
    }
  }
}

- (BOOL)startMonitoring:(double)a3
{
  BOOL fIsMonitoring = self->fIsMonitoring;
  objc_super v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  BOOL v7 = os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT);
  if (fIsMonitoring)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: already running", (uint8_t *)&v10, 2u);
    }
    return 1;
  }
  else
  {
    if (v7)
    {
      int v10 = 134217984;
      double v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Start monitoring w/ scan interval=%lf", (uint8_t *)&v10, 0xCu);
    }
    [(DiagExtWifiScanner *)self setFScanIntervalInSec:a3];
    BOOL v8 = 1;
    [(DiagExtWifiScanner *)self setFScanRepeatRequired:1];
    if ([(DiagExtWifiScanner *)self startWiFiNetworkScan]) {
      self->BOOL fIsMonitoring = 1;
    }
    else {
      return 0;
    }
  }
  return v8;
}

- (void)stopMonitoring
{
  id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Stop monitoring", v4, 2u);
  }
  [(DiagExtWifiScanner *)self stopWiFiNetworkScan];
  self->BOOL fIsMonitoring = 0;
}

- (void)stopWiFiNetworkScan
{
  id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Stop wifi scanning", v5, 2u);
  }
  if (self->fWifiDeviceRef) {
    WiFiDeviceClientScanCancel();
  }
  fScanTimer = self->fScanTimer;
  if (fScanTimer) {
    [(NSTimer *)fScanTimer invalidate];
  }
  [(DiagExtWifiScanner *)self setFIsScanning:0];
}

- (void)wifiScanCompleted:(__CFArray *)a3 withError:(int)a4
{
  if (a4)
  {
    objc_super v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = a4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan finished with error 0x%x", buf, 8u);
      [(DiagExtWifiScanner *)self setFIsScanning:0];
      if ([(DiagExtWifiScanner *)self fScanRepeatRequired]) {
        goto LABEL_26;
      }
    }
    else
    {
      [(DiagExtWifiScanner *)self setFIsScanning:0];
      if ([(DiagExtWifiScanner *)self fScanRepeatRequired]) {
        goto LABEL_26;
      }
    }
LABEL_4:
    if (![(DiagExtWifiScanner *)self fWaitForResult]) {
      return;
    }
    goto LABEL_5;
  }
  int Count = CFArrayGetCount(a3);
  if (Count < 1)
  {
    int v11 = 0;
    goto LABEL_22;
  }
  CFIndex v10 = 0;
  int v11 = 0;
  if (Count <= 1uLL) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = Count;
  }
  *(void *)&long long v9 = 138412290;
  long long v20 = v9;
  do
  {
    while (1)
    {
      CFArrayGetValueAtIndex(a3, v10);
      v14 = WiFiNetworkGetSSID();
      v15 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
        break;
      }
      id v16 = v14;
      if (![v16 length]) {
        goto LABEL_15;
      }
LABEL_12:
      unsigned int v13 = [v16 isEqualToString:@" "] ^ 1;

      v11 += v13;
      if (v12 == ++v10) {
        goto LABEL_19;
      }
    }
    *(_DWORD *)buf = v20;
    v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEBUG, "\tSSID=%@", buf, 0xCu);
    id v16 = v14;
    if ([v16 length]) {
      goto LABEL_12;
    }
LABEL_15:

    ++v10;
  }
  while (v12 != v10);
LABEL_19:
  if (v11 > 0)
  {
    uint64_t v17 = 2;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v17 = 1;
LABEL_23:
  -[DiagExtWifiScanner setFAvailabilityState:](self, "setFAvailabilityState:", v17, v20);
  v18 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Scan finished and report %d networks", buf, 8u);
  }
  v19 = [(DiagExtWifiScanner *)self delegate];
  [v19 handleWifiAvailabilityEvent:[self fAvailabilityState]];

  [(DiagExtWifiScanner *)self setFIsScanning:0];
  if (![(DiagExtWifiScanner *)self fScanRepeatRequired]) {
    goto LABEL_4;
  }
LABEL_26:
  [(DiagExtWifiScanner *)self setTimeForNextScan];
  if ([(DiagExtWifiScanner *)self fWaitForResult]) {
LABEL_5:
  }
    dispatch_semaphore_signal((dispatch_semaphore_t)[(DiagExtWifiScanner *)self fWaitForResult]);
}

- (BOOL)startWiFiNetworkScan
{
  if ([(DiagExtWifiScanner *)self fIsScanning])
  {
    id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Scanning already in progress", (uint8_t *)&v23, 2u);
    }
    return 1;
  }
  if (!self->fWifiDeviceRef)
  {
    v22 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: no client", (uint8_t *)&v23, 2u);
    }
    return 0;
  }
  +[NSDictionary dictionary];
  int v6 = WiFiDeviceClientScanAsync();
  if (v6)
  {
    int v7 = v6;
    BOOL v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v23 = 67109120;
      int v24 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v23, 8u);
    }
    +[NSThread sleepForTimeInterval:2.0];
    +[NSDictionary dictionary];
    int v9 = WiFiDeviceClientScanAsync();
    if (v9)
    {
      int v10 = v9;
      int v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        int v23 = 67109120;
        int v24 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v23, 8u);
      }
      +[NSThread sleepForTimeInterval:2.0];
      +[NSDictionary dictionary];
      int v12 = WiFiDeviceClientScanAsync();
      if (v12)
      {
        int v13 = v12;
        v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        {
          int v23 = 67109120;
          int v24 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v23, 8u);
        }
        +[NSThread sleepForTimeInterval:2.0];
        +[NSDictionary dictionary];
        int v15 = WiFiDeviceClientScanAsync();
        if (v15)
        {
          int v16 = v15;
          uint64_t v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
          {
            int v23 = 67109120;
            int v24 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v23, 8u);
          }
          +[NSThread sleepForTimeInterval:2.0];
          +[NSDictionary dictionary];
          int v18 = WiFiDeviceClientScanAsync();
          if (v18)
          {
            int v19 = v18;
            long long v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
            if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
            {
              int v23 = 67109120;
              int v24 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v23, 8u);
            }
            +[NSThread sleepForTimeInterval:2.0];
            return 0;
          }
        }
      }
    }
  }
  v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Start wifi scanning", (uint8_t *)&v23, 2u);
  }
  BOOL v4 = 1;
  [(DiagExtWifiScanner *)self setFIsScanning:1];
  return v4;
}

- (BOOL)isMonitoring
{
  return self->fIsMonitoring;
}

- (void)disableAutoJoin
{
  fWifiManagerRef = self->fWifiManagerRef;
  if (fWifiManagerRef) {
    _WiFiManagerClientDisable(fWifiManagerRef, a2);
  }
}

- (void)enableAutoJoin
{
  fWifiManagerRef = self->fWifiManagerRef;
  if (fWifiManagerRef) {
    _WiFiManagerClientEnable(fWifiManagerRef, a2);
  }
}

- (DiagExtWifiScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DiagExtWifiScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)fAvailabilityState
{
  return self->_fAvailabilityState;
}

- (void)setFAvailabilityState:(int)a3
{
  self->_fAvailabilityState = a3;
}

- (BOOL)fIsScanning
{
  return self->_fIsScanning;
}

- (void)setFIsScanning:(BOOL)a3
{
  self->_fIsScanning = a3;
}

- (BOOL)fScanRepeatRequired
{
  return self->_fScanRepeatRequired;
}

- (void)setFScanRepeatRequired:(BOOL)a3
{
  self->_fScanRepeatRequired = a3;
}

- (double)fScanIntervalInSec
{
  return self->_fScanIntervalInSec;
}

- (void)setFScanIntervalInSec:(double)a3
{
  self->_fScanIntervalInSec = a3;
}

- (dispatch_semaphore_s)fWaitForResult
{
  return self->_fWaitForResult;
}

- (void)setFWaitForResult:(dispatch_semaphore_s *)a3
{
  self->_fWaitForResult = a3;
}

- (__CFRunLoop)fServerRunLoopRef
{
  return self->_fServerRunLoopRef;
}

- (void)setFServerRunLoopRef:(__CFRunLoop *)a3
{
  self->_fServerRunLoopRef = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->fScanTimer, 0);
}

@end