@interface RFSelfDiagExtensionHelper
- (BOOL)addAWDConfiguration:(int)a3;
- (BOOL)initMonitorChamber:(int)a3 ALSThreshold:(unsigned int)a4;
- (BOOL)isTestSupported:(int)a3;
- (BOOL)loadTestConfigFromUserDefaults;
- (BOOL)prepareSetupForTest;
- (BOOL)recoverBasebandState:(BOOL)a3;
- (BOOL)removeAWDConfiguration;
- (BOOL)resetBaseband:(BOOL)a3;
- (BOOL)setBasebandFTM;
- (BOOL)startBasebandRFSelfTest:(unsigned int)a3 TestCommand:(unsigned int)a4;
- (BOOL)startMonitorChamberOpen;
- (BOOL)updateEnclosedCheckRunningFlag:(BOOL)a3;
- (BOOL)waitForChamberClosed:(unsigned int)a3;
- (RFSelfDiagExtensionHelper)initWithDelegate:(id)a3;
- (RFSelfDiagExtensionHelperDelegate)delegate;
- (TestConfigFlag)testConfiguration;
- (id).cxx_construct;
- (int)fMonitoring;
- (int)fSensor;
- (unsigned)getBasebandResultWaitTime;
- (void)dealloc;
- (void)handleALSEnclosedEvent:(int)a3;
- (void)handleWifiAvailabilityEvent:(int)a3;
- (void)resetAll;
- (void)restoreSetup;
- (void)setDelegate:(id)a3;
- (void)setFMonitoring:(int)a3;
- (void)setFSensor:(int)a3;
- (void)setFactoryTest;
- (void)stopMonitorChamber;
@end

@implementation RFSelfDiagExtensionHelper

- (RFSelfDiagExtensionHelper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFSelfDiagExtensionHelper;
  v5 = [(RFSelfDiagExtensionHelper *)&v16 init];
  [v5 setDelegate:v4];
  dispatch_group_t v6 = dispatch_group_create();
  v7 = *((void *)v5 + 5);
  *((void *)v5 + 5) = v6;
  if (v7) {
    dispatch_release(v7);
  }
  v8 = *((void *)v5 + 6);
  *((void *)v5 + 6) = 0;
  if (v8)
  {
    dispatch_group_leave(v8);
    dispatch_release(v8);
  }
  v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = 0;

  BasebandRFDiagnostics::create((uint64_t *)&v15, v10);
  long long v11 = v15;
  long long v15 = 0uLL;
  v12 = (std::__shared_weak_count *)*((void *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v11;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  v13 = (std::__shared_weak_count *)*((void *)&v15 + 1);
  if (*((void *)&v15 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v15 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  *((_DWORD *)v5 + 14) = 0;
  v5[60] = 0;
  [v5 setFSensor:0, v15];

  return (RFSelfDiagExtensionHelper *)v5;
}

- (void)dealloc
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfDiagExtensionHelper dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)RFSelfDiagExtensionHelper;
  [(RFSelfDiagExtensionHelper *)&v4 dealloc];
}

- (void)resetAll
{
  fALSMonitor = self->fALSMonitor;
  if (fALSMonitor) {
    [(DiagExtALSDataMonitor *)fALSMonitor releaseALSClient];
  }
  fWifiScanner = self->fWifiScanner;
  if (fWifiScanner) {
    [(DiagExtWifiScanner *)fWifiScanner releaseWifiManagerClient];
  }
  ptr = self->fBasebandDiagnostics.__ptr_;
  if (ptr) {
    BasebandRFDiagnostics::resetAll(ptr);
  }
  dispatch_group_t v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "RFSelfDiagExtensionHelper reset", v7, 2u);
  }
}

- (void)setFactoryTest
{
  *((unsigned char *)&self->fGroupMonitorChamber.gr_gid + 4) = 1;
}

- (BOOL)initMonitorChamber:(int)a3 ALSThreshold:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  self->fGroupMonitorChamber.gr_gid = 0;
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    v8 = [[DiagExtALSDataMonitor alloc] initWithDelegate:self];
    fALSMonitor = self->fALSMonitor;
    self->fALSMonitor = v8;

    v10 = self->fALSMonitor;
    if (v10)
    {
      unsigned int v6 = [(DiagExtALSDataMonitor *)v10 setupALSClient];
      [(DiagExtALSDataMonitor *)self->fALSMonitor setEnclosedLimit:v7];
    }
    else
    {
      unsigned int v6 = 0;
    }
    long long v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "Faiiled";
      if (v6) {
        v12 = "Success";
      }
      int v19 = 136315138;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "ALS Monitor initialzation: %s", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    unsigned int v6 = 1;
  }
  if ((v4 & 2) == 0
    || !v6
    || ((v13 = [[DiagExtWifiScanner alloc] initWithDelegate:self], fWifiScanner = self->fWifiScanner, self->fWifiScanner = v13, fWifiScanner, (v15 = self->fWifiScanner) == 0)? (unsigned int v6 = 0): (unsigned int v6 = [(DiagExtWifiScanner *)v15 setupWifiManagerClient]), v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler]))
  {
    if (!v6) {
      return 0;
    }
LABEL_21:
    [(RFSelfDiagExtensionHelper *)self setFSensor:v4];
    return 1;
  }
  v17 = "Faiiled";
  if (v6) {
    v17 = "Success";
  }
  int v19 = 136315138;
  v20 = v17;
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Wifi Scanner initialzation: %s", (uint8_t *)&v19, 0xCu);
  BOOL result = 0;
  if (v6) {
    goto LABEL_21;
  }
  return result;
}

- (BOOL)isTestSupported:(int)a3
{
  char isRFTestSupported = BasebandRFDiagnostics::isRFTestSupported();
  if ((isRFTestSupported & 1) == 0)
  {
    uint64_t v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "Test is not supported on this device", v6, 2u);
    }
  }
  return isRFTestSupported;
}

- (BOOL)prepareSetupForTest
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Prepare setup for testing", (uint8_t *)v11, 2u);
  }
  unsigned int v4 = +[CBSUtilities isCheckerBoardActive];
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  BOOL v6 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Testing started in CB: disable network reconnect", (uint8_t *)v11, 2u);
    }
    +[CBSUtilities disableNetworkReconnect];
  }
  else if (v6)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Testing started in SB", (uint8_t *)v11, 2u);
  }
  if ([(RFSelfDiagExtensionHelper *)self fSensor]
    && ([(RFSelfDiagExtensionHelper *)self fSensor] & 2) != 0)
  {
    unsigned int v7 = [(DiagExtWifiScanner *)self->fWifiScanner scanAndGetWifiAvailability:60];
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Wifi Availability Current state is %D", (uint8_t *)v11, 8u);
    }
    if (v7 != 2) {
      return 0;
    }
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Disable wifi auto-join", (uint8_t *)v11, 2u);
    }
    [(DiagExtWifiScanner *)self->fWifiScanner disableAutoJoin];
  }
  return 1;
}

- (void)restoreSetup
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Restore setup", buf, 2u);
  }
  if (([(RFSelfDiagExtensionHelper *)self fSensor] & 2) != 0 && self->fWifiScanner)
  {
    unsigned int v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "Enable wifi auto-join", v7, 2u);
    }
    [(DiagExtWifiScanner *)self->fWifiScanner enableAutoJoin];
  }
  if (+[CBSUtilities isCheckerBoardActive])
  {
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Enable CB network reconnect", v6, 2u);
    }
    +[CBSUtilities enableNetworkReconnect];
  }
}

- (void)stopMonitorChamber
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring chamber", v7, 2u);
  }
  fWifiScanner = self->fWifiScanner;
  if (fWifiScanner) {
    [(DiagExtWifiScanner *)fWifiScanner stopMonitoring];
  }
  fALSMonitor = self->fALSMonitor;
  if (fALSMonitor) {
    [(DiagExtALSDataMonitor *)fALSMonitor stopMonitoring];
  }
  gr_passwd = self->fGroupMonitorChamber.gr_passwd;
  self->fGroupMonitorChamber.gr_passwd = 0;
  if (gr_passwd)
  {
    dispatch_group_leave((dispatch_group_t)gr_passwd);
    dispatch_release((dispatch_object_t)gr_passwd);
  }
  [(RFSelfDiagExtensionHelper *)self setFMonitoring:0];
}

- (BOOL)startMonitorChamberOpen
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Start monitoring chamber Opened", v8, 2u);
    unsigned int v6 = [(RFSelfDiagExtensionHelper *)self updateEnclosedCheckRunningFlag:0];
    BOOL result = 0;
    if (!v6) {
      return result;
    }
  }
  else
  {
    unsigned int v4 = [(RFSelfDiagExtensionHelper *)self updateEnclosedCheckRunningFlag:0];
    BOOL result = 0;
    if (!v4) {
      return result;
    }
  }
  [(RFSelfDiagExtensionHelper *)self setFMonitoring:1];
  if (([(RFSelfDiagExtensionHelper *)self fSensor] & 1) != 0
    && ![(DiagExtALSDataMonitor *)self->fALSMonitor startMonitoring])
  {
    goto LABEL_11;
  }
  if (([(RFSelfDiagExtensionHelper *)self fSensor] & 2) == 0) {
    return 1;
  }
  LODWORD(v7) = self->testConfig.override_detectChamberSensor;
  if ([(DiagExtWifiScanner *)self->fWifiScanner startMonitoring:(double)v7]) {
    return 1;
  }
LABEL_11:
  [(RFSelfDiagExtensionHelper *)self stopMonitorChamber];
  return 0;
}

- (BOOL)updateEnclosedCheckRunningFlag:(BOOL)a3
{
  BOOL v3 = a3;
  self->fGroupMonitorChamber.gid_t gr_gid = 0;
  if ([(RFSelfDiagExtensionHelper *)self fSensor])
  {
    unsigned int v5 = [(DiagExtALSDataMonitor *)self->fALSMonitor currentALSEnclosedState];
    unsigned int v6 = v5;
    if (v3) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    if (v5 != v7) {
      ++self->fGroupMonitorChamber.gr_gid;
    }
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      gid_t gr_gid = self->fGroupMonitorChamber.gr_gid;
      int v19 = 67109376;
      gid_t v20 = v6;
      __int16 v21 = 1024;
      LODWORD(v22) = gr_gid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ALS current=%d, monitoring flag=%d", (uint8_t *)&v19, 0xEu);
    }
  }
  if (([(RFSelfDiagExtensionHelper *)self fSensor] & 2) != 0)
  {
    unsigned int v10 = [(DiagExtWifiScanner *)self->fWifiScanner currentWifiAvailabilityState];
    unsigned int v11 = v10;
    if (v3) {
      int v12 = 1;
    }
    else {
      int v12 = 2;
    }
    if (v10 != v12) {
      self->fGroupMonitorChamber.gr_gid += 2;
    }
    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      gid_t v14 = self->fGroupMonitorChamber.gr_gid;
      int v19 = 67109376;
      gid_t v20 = v11;
      __int16 v21 = 1024;
      LODWORD(v22) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Reachability current=%d, monitoring flag=%d", (uint8_t *)&v19, 0xEu);
    }
  }
  long long v15 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = "Opened";
    gid_t v18 = self->fGroupMonitorChamber.gr_gid;
    if (v3) {
      v17 = "Closed";
    }
    int v19 = 67109378;
    gid_t v20 = v18;
    __int16 v21 = 2080;
    v22 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEBUG, "Update monitoring flag to 0x%x. target state=%s", (uint8_t *)&v19, 0x12u);
  }
  return self->fGroupMonitorChamber.gr_gid != 0;
}

- (BOOL)waitForChamberClosed:(unsigned int)a3
{
  unsigned int v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109376;
    unsigned int v21 = a3;
    __int16 v22 = 1024;
    unsigned int v23 = [(RFSelfDiagExtensionHelper *)self fSensor];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Waiting for Chamber Clossed: waitTime=%d, sensor=%d", (uint8_t *)&v20, 0xEu);
  }
  if (![(RFSelfDiagExtensionHelper *)self updateEnclosedCheckRunningFlag:1]) {
    return 1;
  }
  [(RFSelfDiagExtensionHelper *)self setFMonitoring:2];
  gid_t gr_gid = self->fGroupMonitorChamber.gr_gid;
  if (gr_gid)
  {
    if (![(DiagExtALSDataMonitor *)self->fALSMonitor startMonitoring]) {
      goto LABEL_13;
    }
    gid_t gr_gid = self->fGroupMonitorChamber.gr_gid;
  }
  if ((gr_gid & 2) == 0
    || (LODWORD(v6) = self->testConfig.override_detectChamberSensor,
        [(DiagExtWifiScanner *)self->fWifiScanner startMonitoring:(double)v6]))
  {
    if (!self->fGroupMonitorChamber.gr_passwd)
    {
      gr_name = self->fGroupMonitorChamber.gr_name;
      if (gr_name)
      {
        dispatch_retain((dispatch_object_t)self->fGroupMonitorChamber.gr_name);
        dispatch_group_enter((dispatch_group_t)gr_name);
        gr_passwd = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = gr_name;
        if (gr_passwd)
        {
          dispatch_group_leave((dispatch_group_t)gr_passwd);
          dispatch_release((dispatch_object_t)gr_passwd);
        }
      }
      else
      {
        self->fGroupMonitorChamber.gr_passwd = 0;
      }
    }
    int64_t v8 = 1000000000 * a3;
    v9 = self->fGroupMonitorChamber.gr_name;
    dispatch_time_t v10 = dispatch_time(0, v8);
    if (dispatch_group_wait((dispatch_group_t)v9, v10))
    {
      unsigned int v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        gid_t v19 = self->fGroupMonitorChamber.gr_gid;
        int v20 = 67109120;
        unsigned int v21 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Chamber is still Open: MonitoringFlag=%d", (uint8_t *)&v20, 8u);
      }
    }
    else
    {
      BOOL v16 = self->fGroupMonitorChamber.gr_gid == 0;
      v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      BOOL v18 = os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Chamber is ready", (uint8_t *)&v20, 2u);
        }
        BOOL v12 = 1;
        goto LABEL_14;
      }
      if (v18)
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Chamber monitor stopped", (uint8_t *)&v20, 2u);
      }
    }
  }
LABEL_13:
  BOOL v12 = 0;
LABEL_14:
  [(RFSelfDiagExtensionHelper *)self stopMonitorChamber];
  return v12;
}

- (void)handleALSEnclosedEvent:(int)a3
{
  unsigned int v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    gid_t gr_gid = self->fGroupMonitorChamber.gr_gid;
    v16[0] = 67109376;
    v16[1] = a3;
    __int16 v17 = 1024;
    gid_t v18 = gr_gid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received ALS event w/ state=%d, monitoring flag=%d", (uint8_t *)v16, 0xEu);
  }
  if ([(RFSelfDiagExtensionHelper *)self fMonitoring] && (self->fGroupMonitorChamber.gr_gid & 1) != 0)
  {
    unsigned int v7 = [(RFSelfDiagExtensionHelper *)self fMonitoring];
    if (a3 == 1 && v7 == 2)
    {
      gr_passwd = self->fGroupMonitorChamber.gr_passwd;
      gid_t v9 = self->fGroupMonitorChamber.gr_gid - 1;
      self->fGroupMonitorChamber.gid_t gr_gid = v9;
      if (v9)
      {
        if (gr_passwd)
        {
          dispatch_time_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v16[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Wait for other sensor to declare Chamber Closed", (uint8_t *)v16, 2u);
          }
        }
      }
      else if (gr_passwd)
      {
        gid_t v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Chamber closed. Stop monitoring", (uint8_t *)v16, 2u);
        }
        long long v15 = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = 0;
        if (v15)
        {
          dispatch_group_leave((dispatch_group_t)v15);
          dispatch_release((dispatch_object_t)v15);
        }
      }
    }
    else
    {
      unsigned int v11 = [(RFSelfDiagExtensionHelper *)self fMonitoring];
      if (a3 == 2 && v11 == 1)
      {
        BOOL v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Chamber opened. Stop monitoring", (uint8_t *)v16, 2u);
        }
        --self->fGroupMonitorChamber.gr_gid;
        v13 = [(RFSelfDiagExtensionHelper *)self delegate];
        [v13 handleChamberOpenEvent:1];
      }
    }
  }
}

- (void)handleWifiAvailabilityEvent:(int)a3
{
  unsigned int v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    gid_t gr_gid = self->fGroupMonitorChamber.gr_gid;
    v15[0] = 67109376;
    v15[1] = a3;
    __int16 v16 = 1024;
    gid_t v17 = gr_gid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received wifi availability event w/ state=%d, monitoring flag=%d", (uint8_t *)v15, 0xEu);
  }
  if ([(RFSelfDiagExtensionHelper *)self fMonitoring] && (self->fGroupMonitorChamber.gr_gid & 2) != 0)
  {
    unsigned int v7 = [(RFSelfDiagExtensionHelper *)self fMonitoring];
    if (a3 == 1 && v7 == 2)
    {
      gr_passwd = self->fGroupMonitorChamber.gr_passwd;
      gid_t v9 = self->fGroupMonitorChamber.gr_gid - 2;
      self->fGroupMonitorChamber.gid_t gr_gid = v9;
      if (v9)
      {
        if (gr_passwd)
        {
          dispatch_time_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v15[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Wait for other sensor to detect Chamber Closed", (uint8_t *)v15, 2u);
          }
        }
      }
      else if (gr_passwd)
      {
        v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Chamber closed. Stop monitoring", (uint8_t *)v15, 2u);
        }
        gid_t v14 = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = 0;
        if (v14)
        {
          dispatch_group_leave((dispatch_group_t)v14);
          dispatch_release((dispatch_object_t)v14);
        }
      }
    }
    else
    {
      unsigned int v11 = [(RFSelfDiagExtensionHelper *)self fMonitoring];
      if (a3 == 2 && v11 == 1)
      {
        self->fGroupMonitorChamber.gr_gid -= 2;
        BOOL v12 = [(RFSelfDiagExtensionHelper *)self delegate];
        [v12 handleChamberOpenEvent:2];
      }
    }
  }
}

- (BOOL)addAWDConfiguration:(int)a3
{
  unsigned int v5 = +[NSBundle bundleWithIdentifier:@"com.apple.DiagnosticsService.Diagnostic-8209"];
  unint64_t v6 = [v5 bundleURL];

  int RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType)
  {
    if (RadioType != 1)
    {
      __int16 v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v21 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Failed to get awd deviceconfig: unknown baseband", v21, 2u);
      }
      goto LABEL_15;
    }
    if ((a3 & 0xFFFFFFFE) == 2) {
      CFStringRef v8 = @"mav-desense-rf-self-test-result.deviceconfig";
    }
    else {
      CFStringRef v8 = @"mav-rf-self-test-result.deviceconfig";
    }
  }
  else
  {
    CFStringRef v8 = @"ice-rf-self-test-result.deviceconfig";
  }
  gid_t v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:0];
  dispatch_time_t v10 = v9;
  if (v9)
  {
    unsigned int v11 = [v9 path];
    id v12 = [objc_alloc((Class)NSData) initWithContentsOfFile:v11];
    id v13 = [v12 length];
    unint64_t v14 = (unint64_t)v13;
    if (v13)
    {
      long long v15 = (char *)operator new[]((size_t)v13);
      [v12 getBytes:v15 length:v14];
      BasebandDiagnostics::removeAWDConfig((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
      if (BasebandDiagnostics::addAWDConfigPayload((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_, v15, v14))
      {
        v22[0] = off_100010470;
        v22[1] = self;
        unsigned int v23 = v22;
        BasebandDiagnostics::registerAWDMetricHandler();
        if (v23 == v22)
        {
          (*(void (**)(void *))(v22[0] + 32))(v22);
        }
        else if (v23)
        {
          (*(void (**)(void))(*v23 + 40))();
        }
        BOOL v17 = 1;
        goto LABEL_23;
      }
      gid_t v18 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      BOOL v17 = 0;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v21 = 0;
        gid_t v19 = "Failed to add AWD config to Baseband";
        goto LABEL_20;
      }
    }
    else
    {
      gid_t v18 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      BOOL v17 = 0;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v21 = 0;
        gid_t v19 = "Failed to read AWD Config file";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
        BOOL v17 = 0;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_15:
  BOOL v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)removeAWDConfiguration
{
  return BasebandDiagnostics::removeAWDConfig((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
}

- (BOOL)startBasebandRFSelfTest:(unsigned int)a3 TestCommand:(unsigned int)a4
{
  int RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType != 1)
  {
    if (!RadioType)
    {
      int started = BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(self->fBasebandDiagnostics.__ptr_);
      goto LABEL_7;
    }
    gid_t v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to start: unknown baseband", (uint8_t *)&v14, 2u);
    }
    int v7 = 9;
    CFStringRef v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
      return v7 == 0;
    }
LABEL_20:
    uint64_t v12 = BasebandRFDiagnostics::asString();
    int v14 = 136315138;
    uint64_t v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Start RF Self Test:  %s", (uint8_t *)&v14, 0xCu);
    return v7 == 0;
  }
  if (!*((unsigned char *)&self->fGroupMonitorChamber.gr_gid + 4))
  {
    int v7 = BasebandRFDiagnostics::setBasebandRFSelfTestTicket(self->fBasebandDiagnostics.__ptr_);
    unsigned int v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = BasebandRFDiagnostics::asString();
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Set RF Self Test Ticket: %s", (uint8_t *)&v14, 0xCu);
      if (!v7) {
        goto LABEL_5;
      }
    }
    else if (!v7)
    {
      goto LABEL_5;
    }
    CFStringRef v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
      return v7 == 0;
    }
    goto LABEL_20;
  }
LABEL_5:
  if ([(RFSelfDiagExtensionHelper *)self setBasebandFTM])
  {
    int started = BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode();
LABEL_7:
    int v7 = started;
    CFStringRef v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
      return v7 == 0;
    }
    goto LABEL_20;
  }
  dispatch_time_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Failed to set to FTM", (uint8_t *)&v14, 2u);
  }
  int v7 = 8;
  CFStringRef v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_20;
  }
  return v7 == 0;
}

- (BOOL)setBasebandFTM
{
  return BasebandDiagnostics::updateBasebandOperatingMode();
}

- (unsigned)getBasebandResultWaitTime
{
  unsigned int result = BasebandRFDiagnostics::getBasebandEstimatedTestTime(self->fBasebandDiagnostics.__ptr_);
  if (!result) {
    return *(_DWORD *)&self->testConfig.overrideTestConfigEnable;
  }
  return result;
}

- (BOOL)resetBaseband:(BOOL)a3
{
  __p = (char *)operator new(0x40uLL);
  strcpy(__p, "RF Self Test: RFSelfDiag extension triggers baseband reset");
  char v3 = BasebandDiagnostics::resetBaseband();
  operator delete(__p);
  return v3;
}

- (BOOL)recoverBasebandState:(BOOL)a3
{
  int RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType == 1)
  {
    if (!a3)
    {
      unint64_t v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        int updated = BasebandDiagnostics::updateBasebandOperatingMode();
        CFStringRef v8 = "Failed";
        if (updated) {
          CFStringRef v8 = "Success";
        }
        *(_DWORD *)__p = 136315138;
        *(void *)&__p[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Set to baseband online: %s", __p, 0xCu);
      }
      gid_t v9 = dispatch_semaphore_create(0);
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v9, v10))
      {
        unsigned int v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__p = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Trigger reset baseband", __p, 2u);
        }
      }
    }
    goto LABEL_14;
  }
  if (!RadioType)
  {
    unsigned int v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Trigger reset baseband", __p, 2u);
    }
LABEL_14:
    *(void *)__p = operator new(0x40uLL);
    *(_OWORD *)&__p[8] = xmmword_10000D360;
    strcpy(*(char **)__p, "RF Self Test: RFSelfDiag extension triggers baseband reset");
    char v12 = BasebandDiagnostics::resetBaseband();
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    return v12;
  }
  id v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "Failed to recover baseband: unknown baseband", __p, 2u);
  }
  return 0;
}

- (BOOL)loadTestConfigFromUserDefaults
{
  *(void *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D370;
  strcpy(*(char **)__p, "overrideTestConfigEnable");
  LOBYTE(self->fGroupMonitorChamber.gr_mem) = BasebandDiagnostics::readIntegerFromUserDefaults() != 0;
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  *(void *)__p = operator new(0x20uLL);
  strcpy(*(char **)__p, "override_detectChamberReady");
  int IntegerFromUserDefaults = BasebandDiagnostics::readIntegerFromUserDefaults();
  operator delete(*(void **)__p);
  HIDWORD(self->fGroupMonitorChamber.gr_mem) = IntegerFromUserDefaults & ~(IntegerFromUserDefaults >> 31);
  *(void *)__p = operator new(0x20uLL);
  strcpy(*(char **)__p, "override_closeChamberCountdown");
  int v4 = BasebandDiagnostics::readIntegerFromUserDefaults();
  operator delete(*(void **)__p);
  if (v4 >= 1) {
    int v5 = v4;
  }
  else {
    int v5 = 120;
  }
  LODWORD(self->fSessionMonitorChamber.fObj.fObj) = v5;
  strcpy(__p, "override_ALSThreshold");
  int v6 = BasebandDiagnostics::readIntegerFromUserDefaults();
  if (v6 >= 1) {
    int v7 = v6;
  }
  else {
    int v7 = 4;
  }
  HIDWORD(self->fSessionMonitorChamber.fObj.fObj) = v7;
  *(void *)__p = operator new(0x20uLL);
  strcpy(*(char **)__p, "override_testCompleteAlertTime");
  int v8 = BasebandDiagnostics::readIntegerFromUserDefaults();
  operator delete(*(void **)__p);
  if (v8 >= 1) {
    int v9 = v8;
  }
  else {
    int v9 = 300;
  }
  self->int fEnclosedCheckRunningFlag = v9;
  *(void *)__p = operator new(0x19uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D3A0;
  strcpy(*(char **)__p, "override_vibrationAlert");
  self->BOOL fFactoryTestEnabled = BasebandDiagnostics::readIntegerFromUserDefaults() != 0;
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  __p[23] = 19;
  strcpy(__p, "override_chimeAlert");
  *(&self->fFactoryTestEnabled + 1) = BasebandDiagnostics::readIntegerFromUserDefaults() != 0;
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  dispatch_time_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    int gr_mem_low = LOBYTE(self->fGroupMonitorChamber.gr_mem);
    *(_DWORD *)__p = 67109120;
    *(_DWORD *)&__p[4] = gr_mem_low;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Test config: overrides test config enabled = %d", __p, 8u);
  }
  if (LOBYTE(self->fGroupMonitorChamber.gr_mem))
  {
    char v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int gr_mem_high = HIDWORD(self->fGroupMonitorChamber.gr_mem);
      int fObj = (int)self->fSessionMonitorChamber.fObj.fObj;
      int fObj_high = HIDWORD(self->fSessionMonitorChamber.fObj.fObj);
      int fEnclosedCheckRunningFlag = self->fEnclosedCheckRunningFlag;
      BOOL fFactoryTestEnabled = self->fFactoryTestEnabled;
      int v18 = *((unsigned __int8 *)&self->fFactoryTestEnabled + 1);
      *(_DWORD *)__p = 67110400;
      *(_DWORD *)&__p[4] = gr_mem_high;
      *(_WORD *)&__p[8] = 1024;
      *(_DWORD *)&__p[10] = fObj;
      *(_WORD *)&__p[14] = 1024;
      *(_DWORD *)&__p[16] = fObj_high;
      *(_WORD *)&__p[20] = 1024;
      *(_DWORD *)&__p[22] = fEnclosedCheckRunningFlag;
      __int16 v28 = 1024;
      BOOL v29 = fFactoryTestEnabled;
      __int16 v30 = 1024;
      int v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "\tdetectChamberReady=%d, closeChamberCountdown=%d, ALSThreshold=%d, testCompleteAlertTime=%d, vibrationAlert=%d, chimeAlert=%d", __p, 0x26u);
    }
  }
  strcpy(__p, "basebandResultWaitTime");
  __p[23] = 22;
  int v19 = BasebandDiagnostics::readIntegerFromUserDefaults();
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (v19 >= 1) {
    int v20 = v19;
  }
  else {
    int v20 = 120;
  }
  *(_DWORD *)&self->testConfig.overrideTestConfigEnable = v20;
  __p[23] = 16;
  strcpy(__p, "wifiScanInterval");
  int v21 = BasebandDiagnostics::readIntegerFromUserDefaults();
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (v21 >= 1) {
    unsigned int v22 = v21;
  }
  else {
    unsigned int v22 = 8;
  }
  self->testConfig.unsigned int override_detectChamberSensor = v22;
  unsigned int v23 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = *(_DWORD *)&self->testConfig.overrideTestConfigEnable;
    unsigned int override_detectChamberSensor = self->testConfig.override_detectChamberSensor;
    *(_DWORD *)__p = 67109376;
    *(_DWORD *)&__p[4] = v24;
    *(_WORD *)&__p[8] = 1024;
    *(_DWORD *)&__p[10] = override_detectChamberSensor;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Test config: basebandResultWaitTime=%d, wifiScanInterval=%d", __p, 0xEu);
  }
  return (BOOL)self->fGroupMonitorChamber.gr_mem;
}

- (TestConfigFlag)testConfiguration
{
  long long v3 = *(_OWORD *)&self[2].override_testCompleteAlertTime;
  *(_OWORD *)&retstr->overrideTestConfigEnable = *(_OWORD *)&self[2].overrideTestConfigEnable;
  *(_OWORD *)&retstr->override_testCompleteAlertTime = v3;
  return self;
}

- (RFSelfDiagExtensionHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->testConfig.override_testCompleteAlertTime);

  return (RFSelfDiagExtensionHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)fMonitoring
{
  return self->testConfig.override_detectChamberReadyWaitTime;
}

- (void)setFMonitoring:(int)a3
{
  self->testConfig.override_detectChamberReadyWaitTime = a3;
}

- (int)fSensor
{
  return self->testConfig.override_detectChamberReadyALSThreshold;
}

- (void)setFSensor:(int)a3
{
  self->testConfig.override_detectChamberReadyALSThreshold = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->testConfig.override_testCompleteAlertTime);
  gr_passwd = self->fGroupMonitorChamber.gr_passwd;
  if (gr_passwd)
  {
    dispatch_group_leave((dispatch_group_t)gr_passwd);
    int v4 = self->fGroupMonitorChamber.gr_passwd;
    if (v4) {
      dispatch_release((dispatch_object_t)v4);
    }
  }
  gr_name = self->fGroupMonitorChamber.gr_name;
  if (gr_name) {
    dispatch_release((dispatch_object_t)gr_name);
  }
  objc_storeStrong((id *)&self->fWifiScanner, 0);
  objc_storeStrong((id *)&self->fALSMonitor, 0);
  cntrl = self->fBasebandDiagnostics.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end