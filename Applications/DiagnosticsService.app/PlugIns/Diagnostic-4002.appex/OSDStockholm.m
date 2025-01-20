@interface OSDStockholm
- (BOOL)isNfcDisabledByProfile;
- (BOOL)overrideNfcEnabledState;
- (BOOL)startCardEmulationWithTimeout:(double)a3;
- (BOOL)updateUserNfcEnabledState;
- (BOOL)userNfcEnabledStateCaptured;
- (NFContactlessSession)contactlessSession;
- (NFSession)sessionController;
- (OSDStockholm)init;
- (OSDStockholm)initWithDelegate:(id)a3;
- (OSDStockholmDelegate)delegate;
- (id)_appletAID;
- (id)serialNumber;
- (id)serverRegistrationInfo;
- (int64_t)userNfcEnabledState;
- (void)contactlessSession:(id)a3 didDetectField:(BOOL)a4;
- (void)contactlessSession:(id)a3 didSelectApplet:(id)a4;
- (void)contactlessSessionDidEndUnexpectedly:(id)a3;
- (void)dealloc;
- (void)restoreNfcEnabledState;
- (void)setContactlessSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionController:(id)a3;
- (void)setUserNfcEnabledState:(int64_t)a3;
- (void)setUserNfcEnabledStateCaptured:(BOOL)a3;
- (void)stopCardEmulation:(double)a3;
@end

@implementation OSDStockholm

- (OSDStockholm)init
{
  return [(OSDStockholm *)self initWithDelegate:0];
}

- (OSDStockholm)initWithDelegate:(id)a3
{
  id v4 = a3;
  +[DASoftLinking isNearFieldFrameworkAvailable];
  v11.receiver = self;
  v11.super_class = (Class)OSDStockholm;
  v5 = [(OSDStockholm *)&v11 init];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    start_timeout_sema = v5->_start_timeout_sema;
    v5->_start_timeout_sema = (OS_dispatch_semaphore *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    end_timeout_sema = v5->_end_timeout_sema;
    v5->_end_timeout_sema = (OS_dispatch_semaphore *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(OSDStockholm *)self contactlessSession];

  if (v3)
  {
    id v4 = [(OSDStockholm *)self contactlessSession];
    [v4 endSession];
  }
  v5.receiver = self;
  v5.super_class = (Class)OSDStockholm;
  [(OSDStockholm *)&v5 dealloc];
}

- (BOOL)startCardEmulationWithTimeout:(double)a3
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  objc_super v5 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFHardwareManager"] sharedHardwareManager];
  unsigned int v6 = [v5 getHwSupport];
  if (v6 == 4)
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000057B8(v7);
    }
LABEL_4:

    BOOL v8 = 0;
    goto LABEL_22;
  }
  v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Hardware state : %u", (uint8_t *)&buf, 8u);
  }

  if (v6 != 2)
  {
    unsigned int v10 = 0;
    do
    {
      +[NSThread sleepForTimeInterval:0.100000001];
      unsigned int v11 = [v5 getHwSupport];
      if (v11 == 2) {
        break;
      }
    }
    while (v10++ < 9);
    if (v11 != 2)
    {
      v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000586C(v7, v13, v14, v15, v16, v17, v18, v19);
      }
      goto LABEL_4;
    }
  }
  objc_initWeak(&buf, self);
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_100004424;
  v28 = &unk_100008210;
  objc_copyWeak(&v30, &buf);
  v29 = &v31;
  v20 = [v5 startContactlessSession:&v25];
  -[OSDStockholm setSessionController:](self, "setSessionController:", v20, v25, v26, v27, v28);

  start_timeout_sema = self->_start_timeout_sema;
  dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_semaphore_wait(start_timeout_sema, v22))
  {
    v23 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100005838();
    }

    BOOL v8 = 0;
    *((unsigned char *)v32 + 24) = 0;
  }
  else
  {
    BOOL v8 = *((unsigned char *)v32 + 24) != 0;
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&buf);
LABEL_22:

  _Block_object_dispose(&v31, 8);
  return v8;
}

- (void)stopCardEmulation:(double)a3
{
  objc_initWeak(&location, self);
  objc_super v5 = dispatch_get_global_queue(25, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000046AC;
  v6[3] = &unk_100008260;
  objc_copyWeak(v7, &location);
  v6[4] = self;
  v7[1] = *(id *)&a3;
  dispatch_sync(v5, v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (id)serverRegistrationInfo
{
  v2 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFRemoteAdminManager"] sharedRemoteAdminManager];
  v3 = [v2 registrationInfo];

  return v3;
}

- (id)serialNumber
{
  v2 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFSecureElement"] embeddedSecureElement];
  v3 = [v2 serialNumber];

  return v3;
}

- (BOOL)isNfcDisabledByProfile
{
  if (![(OSDStockholm *)self userNfcEnabledStateCaptured]) {
    [(OSDStockholm *)self updateUserNfcEnabledState];
  }
  return [(OSDStockholm *)self userNfcEnabledState] == -1;
}

- (BOOL)overrideNfcEnabledState
{
  if (![(OSDStockholm *)self userNfcEnabledStateCaptured])
  {
    [(OSDStockholm *)self updateUserNfcEnabledState];
    if (![(OSDStockholm *)self userNfcEnabledStateCaptured])
    {
      id v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100005AD0();
      }
      goto LABEL_9;
    }
  }
  v3 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFHardwareManager"] sharedHardwareManager];
  id v4 = v3;
  if (!v3)
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  objc_super v5 = [v3 setRadioEnabledSetting:1];
  unsigned int v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v5 == 0;
    __int16 v10 = 2112;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC radio state overridden: %d with error: %@", (uint8_t *)v9, 0x12u);
  }

  BOOL v7 = v5 == 0;
LABEL_10:

  return v7;
}

- (void)restoreNfcEnabledState
{
  if ([(OSDStockholm *)self userNfcEnabledStateCaptured])
  {
    v3 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFHardwareManager"] sharedHardwareManager];
    if (v3)
    {
      id v4 = [v3 setRadioEnabledSetting:(id)[(OSDStockholm *)self userNfcEnabledState] == (id)1];
      objc_super v5 = DiagnosticLogHandleForCategory();
      unsigned int v6 = v5;
      if (v4)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100005B04(self, (uint64_t)v4, v6);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        int64_t v8 = [(OSDStockholm *)self userNfcEnabledState];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC radio enabled state restored to %ld", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User NFC state was not captured. Not altering state", (uint8_t *)&v7, 2u);
    }
  }
}

- (BOOL)updateUserNfcEnabledState
{
  v3 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFHardwareManager"] sharedHardwareManager];
  id v4 = v3;
  if (v3)
  {
    uint64_t v16 = 0;
    objc_super v5 = [v3 getRadioEnabledState:&v16];
    BOOL v6 = v5 == 0;
    if (v5)
    {
      int v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005BA0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      [(OSDStockholm *)self setUserNfcEnabledState:v16];
      [(OSDStockholm *)self setUserNfcEnabledStateCaptured:1];
      int v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v14 = [(OSDStockholm *)self userNfcEnabledState];
        *(_DWORD *)id buf = 134217984;
        int64_t v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully backed up original NFC radio state %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_appletAID
{
  v2 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFSecureElement"] embeddedSecureElement];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 hwType];
    int v5 = v4 - 1;
    if (v4 - 1) < 5 && ((0x1Du >> v5))
    {
      CFStringRef v14 = *(&off_100008280 + v5);
      goto LABEL_11;
    }
    BOOL v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005C40((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005C0C();
    }
  }
  CFStringRef v14 = &stru_1000084A8;
LABEL_11:

  return (id)v14;
}

- (void)contactlessSession:(id)a3 didDetectField:(BOOL)a4
{
  BOOL v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [(OSDStockholm *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 osdStockholmDidDetectField];
  }
}

- (void)contactlessSessionDidEndUnexpectedly:(id)a3
{
  int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(OSDStockholm *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 osdStockholmDidEndUnexpectedly];
  }
}

- (void)contactlessSession:(id)a3 didSelectApplet:(id)a4
{
  id v6 = a4;
  uint64_t v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    int v9 = [v6 identifier];
    int v13 = 138412546;
    CFStringRef v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(OSDStockholm *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v6 identifier];
    unsigned int v12 = [v11 isEqualToString:@"D27600008554657374010101"];

    if (v12) {
      [v10 osdStockholmDidSelectEchoApplet];
    }
  }
}

- (OSDStockholmDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OSDStockholmDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFSession)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
}

- (NFContactlessSession)contactlessSession
{
  return self->_contactlessSession;
}

- (void)setContactlessSession:(id)a3
{
}

- (int64_t)userNfcEnabledState
{
  return self->_userNfcEnabledState;
}

- (void)setUserNfcEnabledState:(int64_t)a3
{
  self->_userNfcEnabledState = a3;
}

- (BOOL)userNfcEnabledStateCaptured
{
  return self->_userNfcEnabledStateCaptured;
}

- (void)setUserNfcEnabledStateCaptured:(BOOL)a3
{
  self->_userNfcEnabledStateCaptured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactlessSession, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_end_timeout_sema, 0);

  objc_storeStrong((id *)&self->_start_timeout_sema, 0);
}

@end