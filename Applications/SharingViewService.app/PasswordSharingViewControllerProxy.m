@interface PasswordSharingViewControllerProxy
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)autoGrant;
- (BOOL)displayNameIsDevice;
- (BOOL)hotspot;
- (BOOL)touchDelayActive;
- (NSDate)clock;
- (NSString)peerDisplayName;
- (NSString)requestSSID;
- (int)shareState;
- (int)testMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_deviceDiscoveryEnsureStarted;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_handleDeviceNoLongerNeedsPassword;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart;
- (void)activateTouchDelayTimer;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)ensureStoppedWithDismiss:(BOOL)a3;
- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4;
- (void)handleButtonActions:(id)a3;
- (void)invalidateTouchDelayTimer;
- (void)setAutoGrant:(BOOL)a3;
- (void)setClock:(id)a3;
- (void)setDisplayNameIsDevice:(BOOL)a3;
- (void)setHotspot:(BOOL)a3;
- (void)setPeerDisplayName:(id)a3;
- (void)setRequestSSID:(id)a3;
- (void)setShareState:(int)a3;
- (void)setTestMode:(int)a3;
- (void)setTouchDelayActive:(BOOL)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5;
- (void)showDoneUI:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasswordSharingViewControllerProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_visibleClock, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_peerContactID, 0);
  objc_storeStrong((id *)&self->_passwordSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
}

- (void)setTouchDelayActive:(BOOL)a3
{
  self->_touchDelayActive = a3;
}

- (BOOL)touchDelayActive
{
  return self->_touchDelayActive;
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setShareState:(int)a3
{
  self->_shareState = a3;
}

- (int)shareState
{
  return self->_shareState;
}

- (void)setRequestSSID:(id)a3
{
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setDisplayNameIsDevice:(BOOL)a3
{
  self->_displayNameIsDevice = a3;
}

- (BOOL)displayNameIsDevice
{
  return self->_displayNameIsDevice;
}

- (void)setPeerDisplayName:(id)a3
{
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setHotspot:(BOOL)a3
{
  self->_hotspot = a3;
}

- (BOOL)hotspot
{
  return self->_hotspot;
}

- (void)setClock:(id)a3
{
}

- (NSDate)clock
{
  return self->_clock;
}

- (void)setAutoGrant:(BOOL)a3
{
  self->_autoGrant = a3;
}

- (BOOL)autoGrant
{
  return self->_autoGrant;
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(PasswordSharingViewControllerProxy *)self ensureStoppedWithDismiss:1 reason:4];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5
{
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (dword_1001CC5A8 <= 10)
  {
    id v10 = v6;
    if (dword_1001CC5A8 != -1 || (id v6 = (id)_LogCategory_Initialize(), v7 = v10, v6))
    {
      id v6 = (id)LogPrintF();
      id v7 = v10;
    }
  }
  if (a3 == 82)
  {
    self->_passwordSent = 1;
  }
  else if (a3 == 20)
  {
    id v11 = v7;
    CFErrorGetTypeID();
    v8 = CFDictionaryGetTypedValue();
    if (v8) {
      int v9 = 3;
    }
    else {
      int v9 = 4;
    }
    self->_shareState = v9;
    [(PasswordSharingViewControllerProxy *)self showDoneUI:NSErrorToOSStatus()];

    id v7 = v11;
  }

  _objc_release_x1(v6, v7);
}

- (void)_sessionStart
{
  id v3 = objc_alloc_init((Class)SFDevice);
  [v3 setContactIdentifier:self->_peerContactID];
  [v3 setIdentifier:self->_deviceIdentifier];
  [v3 setRequestSSID:self->_requestSSID];
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
  {
    id v14 = v3;
    LogPrintF();
  }
  int v17 = 0;
  self->_shareState = 1;
  CFStringGetTypeID();
  id v4 = CFDictionaryGetTypedValue();
  if (v17 && dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v17 && dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v6 = CFDictionaryGetTypedValue();
  if (v17 && dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v7 = +[NSDate date];
  clock = self->_clock;
  self->_clock = v7;

  [(SFPasswordSharingSession *)self->_passwordSession invalidate];
  int v9 = (SFPasswordSharingSession *)objc_alloc_init((Class)SFPasswordSharingSession);
  passwordSession = self->_passwordSession;
  self->_passwordSession = v9;

  [(SFPasswordSharingSession *)self->_passwordSession setDeviceName:v6];
  [(SFPasswordSharingSession *)self->_passwordSession setHashedEmail:v4];
  [(SFPasswordSharingSession *)self->_passwordSession setHashedPhone:v5];
  [(SFPasswordSharingSession *)self->_passwordSession setPeerDevice:v3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10010D2B8;
  v16[3] = &unk_1001A1B10;
  v16[4] = self;
  [(SFPasswordSharingSession *)self->_passwordSession setProgressHandler:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010D2C8;
  v15[3] = &unk_1001A1B60;
  v15[4] = self;
  [(SFPasswordSharingSession *)self->_passwordSession setPromptForPINHandler:v15];
  if (self->_hotspot)
  {
    CFStringGetTypeID();
    uint64_t v11 = CFDictionaryGetTypedValue();
    long long v12 = (void *)v11;
    if (v17 || !v11)
    {
      if (dword_1001CC5A8 <= 60 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [(SFPasswordSharingSession *)self->_passwordSession setHotspotPSK:v11];
    }
  }
  [(SFPasswordSharingSession *)self->_passwordSession activate];
  v13 = [(PasswordSharingViewControllerProxy *)self _remoteViewControllerProxy];
  [v13 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.WiFiPasswordSharing"];
}

- (void)_handleDeviceNoLongerNeedsPassword
{
  int shareState = self->_shareState;
  if (shareState != 1)
  {
    if (!shareState)
    {
      [(PasswordSharingViewControllerProxy *)self ensureStoppedWithDismiss:1 reason:22];
    }
    return;
  }
  if (self->_passwordSent)
  {
    self->_missingAck = 1;
LABEL_10:
    if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_14;
  }
  if (self->_missingAck) {
    goto LABEL_10;
  }
LABEL_14:
  if (self->_missingAck) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 4294896130;
  }

  [(PasswordSharingViewControllerProxy *)self showDoneUI:v4];
}

- (void)_deviceLost:(id)a3
{
  id v4 = a3;
  id v8 = [v4 bleDevice];
  id v5 = [v4 identifier];

  if (self->_deviceDiscovery) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && [v5 isEqual:self->_deviceIdentifier])
  {
    if (dword_1001CC5A8 <= 10 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [(PasswordSharingViewControllerProxy *)self _handleDeviceNoLongerNeedsPassword];
    }
    else
    {
      [(PasswordSharingViewControllerProxy *)self _handleDeviceNoLongerNeedsPassword];
    }
  }
}

- (void)_deviceFound:(id)a3
{
  id v11 = a3;
  id v4 = [v11 bleDevice];
  id v5 = [v11 identifier];
  BOOL v6 = v5;
  if (self->_deviceDiscovery) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && [v5 isEqual:self->_deviceIdentifier])
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    unsigned int v9 = [v6 isEqual:v8];

    if (v9)
    {
      if (dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1001CC5A8 <= 10 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
      {
        id v10 = v4;
        LogPrintF();
      }
      if (!objc_msgSend(v11, "needsSetup", v10)
        || [v11 deviceActionType] != 8)
      {
        if (dword_1001CC5A8 <= 10 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(PasswordSharingViewControllerProxy *)self _handleDeviceNoLongerNeedsPassword];
      }
    }
  }
}

- (void)_deviceDiscoveryEnsureStarted
{
  if (!self->_deviceDiscovery)
  {
    id v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:0xFFFFFFFFLL];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:16];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:40];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010D924;
    v9[3] = &unk_1001A1258;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10010D930;
    v8[3] = &unk_1001A1258;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10010D93C;
    v7[3] = &unk_1001A1280;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v7];
    id v5 = self->_deviceDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10010D948;
    v6[3] = &unk_1001A1A08;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)showDoneUI:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = v3;
    LogPrintF();
  }
  [(SFPasswordSharingSession *)self->_passwordSession invalidate];
  passwordSession = self->_passwordSession;
  self->_passwordSession = 0;

  [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

  if (!self->_vcDone)
  {
    BOOL v7 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"doneUI"];
    vcDone = self->_vcDone;
    self->_vcDone = v7;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    [(PasswordSharingDoneViewController *)self->_vcDone setUserInfo:self->super._userInfo];
  }
  [(NSDate *)self->_clock timeIntervalSinceNow];
  double v10 = v9;
  [(NSDate *)self->_clock timeIntervalSinceNow];
  if (v10 >= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = -v11;
  }
  BOOL v13 = CFPrefs_GetInt64() != 0;
  double v14 = -1.0;
  if (v13) {
    double v14 = v12;
  }
  [(PasswordSharingDoneViewController *)self->_vcDone setDuration:v14];
  [(PasswordSharingDoneViewController *)self->_vcDone setStatus:v3];
  sub_1001386A0(self->_vcNav, self->_vcDone, 0);
  v15 = [(PasswordSharingViewControllerProxy *)self _remoteViewControllerProxy];
  [v15 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.WiFiPasswordSharing"];

  v30[0] = @"_cat";
  v30[1] = @"_op";
  v31[0] = @"PasswordSharing";
  v31[1] = @"Done";
  v30[2] = @"durationMS";
  +[NSNumber numberWithInteger:(uint64_t)(v12 * 1000.0)];
  int v17 = v16 = v3;
  v31[2] = v17;
  v30[3] = @"errorCode";
  v18 = +[NSNumber numberWithInt:v16];
  v31[3] = v18;
  v30[4] = @"isHotspot";
  v19 = +[NSNumber numberWithBool:self->_hotspot];
  v31[4] = v19;
  v30[5] = @"missingAck";
  v20 = +[NSNumber numberWithBool:self->_missingAck];
  v31[5] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  SFDashboardLogJSON();

  v28[0] = @"durationMS";
  v22 = +[NSNumber numberWithInteger:(uint64_t)(v12 * 1000.0)];
  v29[0] = v22;
  v28[1] = @"errorCode";
  v23 = +[NSNumber numberWithInt:v16];
  v29[1] = v23;
  v28[2] = @"isHotspot";
  v24 = +[NSNumber numberWithBool:self->_hotspot];
  v29[2] = v24;
  v28[3] = @"missingAck";
  v25 = +[NSNumber numberWithBool:self->_missingAck];
  v29[3] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
  SFMetricsLog();
}

- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v19[0] = @"scanRate";
  uint64_t v7 = (uint64_t)[(SFDeviceDiscovery *)self->_deviceDiscovery scanRate];
  if (v7 > 19)
  {
    if (v7 > 39)
    {
      if (v7 == 40)
      {
        id v8 = "High";
        goto LABEL_22;
      }
      if (v7 == 50)
      {
        id v8 = "Aggressive";
        goto LABEL_22;
      }
    }
    else
    {
      if (v7 == 20)
      {
        id v8 = "Normal";
        goto LABEL_22;
      }
      if (v7 == 30)
      {
        id v8 = "HighNormal";
        goto LABEL_22;
      }
    }
LABEL_21:
    id v8 = "?";
  }
  else
  {
    id v8 = "Invalid";
    switch(v7)
    {
      case 0:
        break;
      case 1:
        id v8 = "BackgroundOld";
        break;
      case 2:
        id v8 = "NormalOld";
        break;
      case 3:
        id v8 = "HighOld";
        break;
      case 4:
        id v8 = "AggressiveOld";
        break;
      case 10:
        id v8 = "Background";
        break;
      default:
        goto LABEL_21;
    }
  }
LABEL_22:
  uint64_t v9 = +[NSString stringWithUTF8String:v8];
  double v10 = (void *)v9;
  CFStringRef v11 = @"?";
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  v19[1] = @"state";
  v20[0] = v11;
  v20[1] = @"Stop";
  double v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  SFPowerLogEvent();

  [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

  [(SFPasswordSharingSession *)self->_passwordSession invalidate];
  passwordSession = self->_passwordSession;
  self->_passwordSession = 0;

  [(PasswordSharingViewControllerProxy *)self invalidateTouchDelayTimer];
  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  if (v5) {
    [(PasswordSharingViewControllerProxy *)self dismiss:v4];
  }
}

- (void)ensureStoppedWithDismiss:(BOOL)a3
{
}

- (void)dismiss:(int)a3
{
  if (!self->_dismissed)
  {
    uint64_t v3 = *(void *)&a3;
    self->_dismissed = 1;
    if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = v3;
      LogPrintF();
    }
    [(PasswordSharingViewControllerProxy *)self _remoteViewControllerProxy];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010E548;
    v15[3] = &unk_1001A1BD8;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v5;
    [(PasswordSharingViewControllerProxy *)self dismissViewControllerAnimated:v3 != 19 completion:v15];
    [(NSDate *)self->_visibleClock timeIntervalSinceNow];
    double v7 = v6;
    [(NSDate *)self->_visibleClock timeIntervalSinceNow];
    if (v7 < 0.0) {
      double v8 = -v8;
    }
    uint64_t v9 = (uint64_t)(v8 * 1000.0);
    v17[0] = @"actionType";
    double v10 = +[NSNumber numberWithInt:v3];
    v18[0] = v10;
    v17[1] = @"shareState";
    CFStringRef v11 = +[NSNumber numberWithInt:self->_shareState];
    v18[1] = v11;
    v17[2] = @"durationMS";
    double v12 = +[NSNumber numberWithInteger:v9];
    v18[2] = v12;
    BOOL v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    SFMetricsLog();
  }
}

- (void)invalidateTouchDelayTimer
{
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer)
  {
    uint64_t v4 = touchDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_touchDelayTimer;
    self->_touchDelayTimer = 0;

    if (!self->_touchDelayTimer
      || dword_1001CC5A8 > 60
      || dword_1001CC5A8 == -1 && !_LogCategory_Initialize())
    {
      return;
    }
  }
  else if (dword_1001CC5A8 > 30 || dword_1001CC5A8 == -1 && !_LogCategory_Initialize())
  {
    return;
  }

  LogPrintF();
}

- (void)activateTouchDelayTimer
{
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_touchDelayActive)
  {
    if (dword_1001CC5A8 > 30 || dword_1001CC5A8 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_18;
  }
  if (self->_touchDelayTimer)
  {
    if (dword_1001CC5A8 > 60 || dword_1001CC5A8 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_18;
  }
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = v3;

  id v5 = self->_touchDelayTimer;
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    double v7 = self->_touchDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10010E904;
    handler[3] = &unk_1001A1BD8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_touchDelayTimer);
    return;
  }
  if (dword_1001CC5A8 <= 60 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize()))
  {
LABEL_18:
    LogPrintF();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PasswordSharingViewControllerProxy *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.WiFiPasswordSharing"];

  if (!self->_dismissed)
  {
    if (dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(PasswordSharingViewControllerProxy *)self dismiss:21];
  }
  [(PasswordSharingViewControllerProxy *)self ensureStoppedWithDismiss:0];
  v6.receiver = self;
  v6.super_class = (Class)PasswordSharingViewControllerProxy;
  [(SVSBaseMainController *)&v6 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PasswordSharingViewControllerProxy;
  [(PasswordSharingViewControllerProxy *)&v15 viewDidAppear:a3];
  uint64_t v4 = +[NSDate date];
  visibleClock = self->_visibleClock;
  self->_visibleClock = v4;

  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_super v6 = +[UIStoryboard storyboardWithName:@"PasswordSharing" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v6;

  double v8 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v8;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  double v10 = +[UIDevice currentDevice];
  unint64_t v11 = (unint64_t)[v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  double v12 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  BOOL v13 = [v12 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v13;

  [(PasswordSharingStartViewController *)self->_vcStart setDisplayNameIsDevice:self->_displayNameIsDevice];
  [(PasswordSharingStartViewController *)self->_vcStart setPeerDisplayName:self->_peerDisplayName];
  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(PasswordSharingStartViewController *)self->_vcStart setUserInfo:self->super._userInfo];
  [(PasswordSharingViewControllerProxy *)self presentViewController:self->_vcNav animated:1 completion:0];
  [(PasswordSharingViewControllerProxy *)self activateTouchDelayTimer];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_queue_t v6 = dispatch_queue_create("clientQueue", 0);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10010F154;
  v39 = sub_10010F164;
  id v40 = 0;
  int v34 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v29.receiver = self;
  v29.super_class = (Class)PasswordSharingViewControllerProxy;
  [(PasswordSharingViewControllerProxy *)&v29 viewWillAppear:v4];
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t deviceIdentifier = 16;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  peerContactID = self->_peerContactID;
  self->_peerContactID = v9;

  CFStringGetTypeID();
  unint64_t v11 = CFDictionaryGetTypedValue();
  int v12 = v34;
  if (!v34)
  {
    int v17 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v11];
    uint64_t deviceIdentifier = (uint64_t)self->_deviceIdentifier;
    self->_uint64_t deviceIdentifier = v17;
    goto LABEL_14;
  }
  if (dword_1001CC5A8 <= 60)
  {
    if (dword_1001CC5A8 != -1) {
      goto LABEL_8;
    }
    if (!_LogCategory_Initialize()) {
      goto LABEL_15;
    }
    int v12 = v34;
    if (v34)
    {
LABEL_8:
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      uint64_t v13 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t deviceIdentifier = v13;
      CFStringRef v14 = @"?";
      if (v13) {
        CFStringRef v14 = (const __CFString *)v13;
      }
      CFStringRef v42 = v14;
      BOOL v3 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      objc_super v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:v3];
      char v16 = 0;
    }
    else
    {
      objc_super v15 = 0;
      char v16 = 1;
    }
    v24 = v15;
    LogPrintF();
    if ((v16 & 1) == 0)
    {

LABEL_14:
    }
  }
LABEL_15:
  id v18 = objc_alloc_init((Class)SFClient);
  [v18 setDispatchQueue:v6];
  v19 = self->_peerContactID;
  v20 = self->_deviceIdentifier;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10010F16C;
  v25[3] = &unk_1001A1000;
  uint64_t v27 = &v35;
  v28 = &v30;
  v21 = v7;
  v26 = v21;
  [v18 displayStringForContactIdentifier:v19 deviceIdentifier:v20 completion:v25];

  dispatch_time_t v22 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v21, v22);
  [v18 invalidate];
  if (!v36[5] && dword_1001CC5A8 <= 60 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_peerDisplayName, (id)v36[5]);
  char v23 = *((unsigned char *)v31 + 24);
  if (self->_testMode == 6) {
    char v23 = 1;
  }
  self->_displayNameIsDevice = v23;
  [(PasswordSharingViewControllerProxy *)self _deviceDiscoveryEnsureStarted];
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v35, 8);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PasswordSharingViewControllerProxy *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  BOOL v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  dispatch_queue_t v6 = (void (**)(void))a4;
  dispatch_semaphore_t v7 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v9 = 1;
  self->_touchDelayActive = 1;
  CFStringGetTypeID();
  double v10 = CFDictionaryGetTypedValue();
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000001"]) {
    goto LABEL_18;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000002"])
  {
    int v9 = 2;
LABEL_18:
    self->_testMode = v9;
    goto LABEL_19;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000003"])
  {
    int v9 = 3;
    goto LABEL_18;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000004"])
  {
    int v9 = 4;
    goto LABEL_18;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000005"])
  {
    int v9 = 5;
    goto LABEL_18;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000006"])
  {
    int v9 = 6;
    goto LABEL_18;
  }
  if ([v10 isEqual:@"00000000-0000-0000-0000-000000000007"])
  {
    int v9 = 7;
    goto LABEL_18;
  }
LABEL_19:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  unint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v11 && dword_1001CC5A8 <= 60 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  requestSSID = self->_requestSSID;
  self->_requestSSID = v11;
  uint64_t v13 = v11;

  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64) {
    self->_hotspot = 1;
  }
  if ((self->_testMode & 0xFFFFFFFE) == 4) {
    self->_hotspot = 1;
  }
  BOOL v15 = CFPrefs_GetInt64() != 0;
  if (!IsAppleInternalBuild()) {
    BOOL v15 = 0;
  }
  if (self->_autoGrant != v15)
  {
    if (dword_1001CC5A8 <= 40 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_autoGrant = v15;
  }
  if (v6) {
    v6[2](v6);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end