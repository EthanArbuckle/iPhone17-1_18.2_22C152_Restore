@interface WHASetupMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)placeholderUI;
- (int)testMode;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)badPINCount;
- (void)_handleHomeButtonPressed;
- (void)_pairSetupTryPIN:(id)a3;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart;
- (void)chooseHome:(id)a3;
- (void)chooseRoom:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)logUsageDone:(int)a3;
- (void)logUsageStart:(int)a3;
- (void)setBadPINCount:(unsigned int)a3;
- (void)setPlaceholderUI:(BOOL)a3;
- (void)setTestMode:(int)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showDoneUI:(int)a3;
- (void)showDoneUI:(int)a3 error:(id)a4;
- (void)showHomePickerUI:(id)a3 defaultIndex:(int64_t)a4;
- (void)showProgressUI;
- (void)showRoomPickerUI:(id)a3 firstSuggestedIndex:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation WHASetupMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcRoomPicker, 0);
  objc_storeStrong((id *)&self->_vcHomePicker, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);

  objc_storeStrong((id *)&self->_setupSession, 0);
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setPlaceholderUI:(BOOL)a3
{
  self->_placeholderUI = a3;
}

- (BOOL)placeholderUI
{
  return self->_placeholderUI;
}

- (void)setBadPINCount:(unsigned int)a3
{
  self->_badPINCount = a3;
}

- (unsigned)badPINCount
{
  return self->_badPINCount;
}

- (void)_pairSetupTryPIN:(id)a3
{
  v7 = (__CFString *)a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize()))
  {
    int v4 = IsAppleInternalBuild();
    CFStringRef v5 = @"*";
    if (v4) {
      CFStringRef v5 = v7;
    }
    CFStringRef v6 = v5;
    LogPrintF();
  }
  -[SFDeviceSetupWHASession pairSetupTryPIN:](self->_setupSession, "pairSetupTryPIN:", v7, v6);
}

- (void)showProgressUI
{
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    int v4 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"ProgressUI"];
    CFStringRef v5 = self->_vcProgress;
    self->_vcProgress = v4;

    [(SVSBaseViewController *)self->_vcProgress setMainController:self];
    vcProgress = self->_vcProgress;
  }
  vcNav = self->_vcNav;

  sub_1001386A0(vcNav, vcProgress, 0);
}

- (void)chooseRoom:(id)a3
{
}

- (void)showRoomPickerUI:(id)a3 firstSuggestedIndex:(int64_t)a4
{
  id v9 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcRoomPicker = self->_vcRoomPicker;
  if (!vcRoomPicker)
  {
    v7 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"RoomPickerUI"];
    v8 = self->_vcRoomPicker;
    self->_vcRoomPicker = v7;

    [(SVSBaseViewController *)self->_vcRoomPicker setMainController:self];
    vcRoomPicker = self->_vcRoomPicker;
  }
  [(WHASetupRoomPickerViewController *)vcRoomPicker setRooms:v9];
  [(WHASetupRoomPickerViewController *)self->_vcRoomPicker setFirstSuggestedIndex:a4];
  sub_1001386A0(self->_vcNav, self->_vcRoomPicker, 0);
}

- (void)chooseHome:(id)a3
{
}

- (void)showHomePickerUI:(id)a3 defaultIndex:(int64_t)a4
{
  id v9 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcHomePicker = self->_vcHomePicker;
  if (!vcHomePicker)
  {
    v7 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"HomePickerUI"];
    v8 = self->_vcHomePicker;
    self->_vcHomePicker = v7;

    [(SVSBaseViewController *)self->_vcHomePicker setMainController:self];
    vcHomePicker = self->_vcHomePicker;
  }
  [(WHASetupHomePickerViewController *)vcHomePicker setHomes:v9];
  [(WHASetupHomePickerViewController *)self->_vcHomePicker setDefaultHomeIndex:a4];
  sub_1001386A0(self->_vcNav, self->_vcHomePicker, 0);
}

- (void)showDoneUI:(int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v13 = a4;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = v4;
    id v12 = v13;
    LogPrintF();
  }
  [(SFDeviceSetupWHASession *)self->_setupSession invalidate];
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  vcDone = self->_vcDone;
  if (!vcDone)
  {
    if ((v4 - 301000) > 0xF) {
      CFStringRef v8 = @"DoneUI";
    }
    else {
      CFStringRef v8 = *(&off_1001A1C20 + (v4 - 301000));
    }
    id v9 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:v8];
    v10 = self->_vcDone;
    self->_vcDone = v9;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    vcDone = self->_vcDone;
  }
  [(WHASetupDoneViewController *)vcDone setStatus:v4];
  [(WHASetupDoneViewController *)self->_vcDone setError:v13];
  sub_1001386A0(self->_vcNav, self->_vcDone, 0);
  [(WHASetupMainController *)self logUsageDone:v4];
}

- (void)showDoneUI:(int)a3
{
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    [(WHASetupAuthViewController *)vcAuth showWithFlags:*(void *)&a3 throttleSeconds:*(void *)&a4];
  }
  else
  {
    if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"AuthUI"];
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    [(SVSBaseViewController *)self->_vcAuth setMainController:self];
    vcNav = self->_vcNav;
    id v9 = self->_vcAuth;
    sub_1001386A0(vcNav, v9, 0);
  }
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v6 = (const __CFString *)a4;
  CFStringRef v7 = v6;
  CFStringRef v14 = v6;
  if (dword_1001CD068 > 30) {
    goto LABEL_179;
  }
  if (dword_1001CD068 == -1)
  {
    CFStringRef v6 = (const __CFString *)_LogCategory_Initialize();
    CFStringRef v7 = v14;
    if (!v6) {
      goto LABEL_179;
    }
  }
  if ((int)v4 > 299)
  {
    if ((int)v4 > 799)
    {
      if ((int)v4 <= 999)
      {
        switch((int)v4)
        {
          case 900:
            CFStringRef v8 = "SU-No-SetupScanAttempt";
            break;
          case 901:
            CFStringRef v8 = "SU-No-SetupStatusUpdate";
            break;
          case 902:
            CFStringRef v8 = "SU-No-SetupWipeWifi";
            break;
          case 903:
            CFStringRef v8 = "SU-No-SetupCancelled";
            break;
          case 904:
            CFStringRef v8 = "SU-No-SetupObliterate";
            break;
          case 905:
            CFStringRef v8 = "SU-No-SetupCannotCancel";
            break;
          case 906:
            CFStringRef v8 = "SysDrop AirDrop Event";
            break;
          case 907:
            CFStringRef v8 = "SysDrop Sysdiagnose Event";
            break;
          case 908:
            CFStringRef v8 = "SysDrop Cancel Event";
            break;
          case 909:
            CFStringRef v8 = "File Transfer Progress Event";
            break;
          case 910:
            CFStringRef v8 = "File Transfer Completed Event";
            break;
          case 911:
            CFStringRef v8 = "iOSWiFiSetup";
            break;
          case 912:
            CFStringRef v8 = "HKPrimaryResidentSSIDFetchStart";
            break;
          case 913:
            CFStringRef v8 = "LoggingProfileTransfer";
            break;
          default:
            switch((int)v4)
            {
              case 800:
                CFStringRef v8 = "AuthAccountsStart";
                break;
              case 803:
                CFStringRef v8 = "AuthAccountsiCloudProgress";
                break;
              case 804:
                CFStringRef v8 = "AuthAccountsStoreProgress";
                break;
              case 805:
                CFStringRef v8 = "AuthAccountsGameCenterProgress";
                break;
              default:
                goto LABEL_169;
            }
            break;
        }
        goto LABEL_176;
      }
      if ((int)v4 <= 1099)
      {
        if (v4 == 1000)
        {
          CFStringRef v8 = "SecureIntentStart";
          goto LABEL_176;
        }
        if (v4 == 1001)
        {
          CFStringRef v8 = "SecureIntentFinish";
          goto LABEL_176;
        }
        goto LABEL_169;
      }
      if (v4 == 1100)
      {
        CFStringRef v8 = "OneTimeCodeDetected";
        goto LABEL_176;
      }
      if (v4 == 2000)
      {
        CFStringRef v8 = "DependentStart";
        goto LABEL_176;
      }
      if (v4 != 2001) {
        goto LABEL_169;
      }
      CFStringRef v8 = "DependentEnd";
    }
    else if ((int)v4 <= 519)
    {
      if ((int)v4 <= 410)
      {
        if ((int)v4 <= 399)
        {
          if (v4 == 300)
          {
            CFStringRef v8 = "BackupProgress";
            goto LABEL_176;
          }
          if (v4 == 310)
          {
            CFStringRef v8 = "SyncProgress";
            goto LABEL_176;
          }
          goto LABEL_169;
        }
        if (v4 == 400)
        {
          CFStringRef v8 = "StopSetup";
          goto LABEL_176;
        }
        if (v4 == 401)
        {
          CFStringRef v8 = "PINPair";
          goto LABEL_176;
        }
        if (v4 != 410) {
          goto LABEL_169;
        }
        CFStringRef v8 = "MigrateStart";
      }
      else
      {
        if ((int)v4 > 430)
        {
          switch(v4)
          {
            case 0x1AF:
              CFStringRef v8 = "eSimExternal2FAStop";
              goto LABEL_176;
            case 0x1F4:
              CFStringRef v8 = "SiriWelcome";
              goto LABEL_176;
            case 0x1FE:
              CFStringRef v8 = "SiriDialogA";
              goto LABEL_176;
          }
          goto LABEL_169;
        }
        if (v4 == 411)
        {
          CFStringRef v8 = "MigrateStop";
          goto LABEL_176;
        }
        if (v4 == 420)
        {
          CFStringRef v8 = "FileTransferReady";
          goto LABEL_176;
        }
        if (v4 != 430) {
          goto LABEL_169;
        }
        CFStringRef v8 = "eSimExternal2FAStart";
      }
    }
    else if ((int)v4 > 559)
    {
      if ((int)v4 > 599)
      {
        switch(v4)
        {
          case 0x258:
            CFStringRef v8 = "SiriSkipDemo";
            goto LABEL_176;
          case 0x2BC:
            CFStringRef v8 = "StopSetupLEDs";
            goto LABEL_176;
          case 0x2C6:
            CFStringRef v8 = "AudioPasscodeEnded";
            goto LABEL_176;
        }
        goto LABEL_169;
      }
      if (v4 == 560)
      {
        CFStringRef v8 = "SiriDialogCMusic";
        goto LABEL_176;
      }
      if (v4 == 570)
      {
        CFStringRef v8 = "SiriDialogCNews";
        goto LABEL_176;
      }
      if (v4 != 580) {
        goto LABEL_169;
      }
      CFStringRef v8 = "SiriDialogCWeather";
    }
    else
    {
      if ((int)v4 > 549)
      {
        switch(v4)
        {
          case 0x226:
            CFStringRef v8 = "SiriDialogBWeather";
            goto LABEL_176;
          case 0x22B:
            CFStringRef v8 = "SiriDialogBClock";
            goto LABEL_176;
          case 0x22E:
            CFStringRef v8 = "SiriDialogBMusic";
            goto LABEL_176;
        }
        goto LABEL_169;
      }
      if (v4 == 520)
      {
        CFStringRef v8 = "SiriDialogBStart";
        goto LABEL_176;
      }
      if (v4 == 530)
      {
        CFStringRef v8 = "SiriDialogBHome";
        goto LABEL_176;
      }
      if (v4 != 540) {
        goto LABEL_169;
      }
      CFStringRef v8 = "SiriDialogBNews";
    }
  }
  else if ((int)v4 > 129)
  {
    if ((int)v4 > 249)
    {
      switch((int)v4)
      {
        case 260:
          CFStringRef v8 = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          goto LABEL_169;
        case 264:
          CFStringRef v8 = "TVLSFinish";
          break;
        case 270:
          CFStringRef v8 = "TVLSEstimateStart";
          break;
        case 272:
          CFStringRef v8 = "TVLSEstimateFinal";
          break;
        case 274:
          CFStringRef v8 = "TVLSEstimateFailed";
          break;
        case 276:
          CFStringRef v8 = "TVLSTryAgain";
          break;
        case 277:
          CFStringRef v8 = "TVLSToneBegan";
          break;
        case 278:
          CFStringRef v8 = "TVLCalStart";
          break;
        case 279:
          CFStringRef v8 = "TVLCalStep";
          break;
        case 280:
          CFStringRef v8 = "TVLCalFailed";
          break;
        case 281:
          CFStringRef v8 = "TVLCalTryAgain";
          break;
        case 282:
          CFStringRef v8 = "TVLCalFinal";
          break;
        default:
          if (v4 != 250) {
            goto LABEL_169;
          }
          CFStringRef v8 = "ReportSuccess";
          break;
      }
      goto LABEL_176;
    }
    if ((int)v4 > 219)
    {
      switch((int)v4)
      {
        case 230:
          CFStringRef v8 = "HomeKitStart";
          goto LABEL_176;
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          goto LABEL_169;
        case 234:
          CFStringRef v8 = "HomeKitSetupStart";
          goto LABEL_176;
        case 236:
          CFStringRef v8 = "CDPSetupStart";
          goto LABEL_176;
        case 240:
          CFStringRef v8 = "BuddyStarting";
          goto LABEL_176;
        case 241:
          CFStringRef v8 = "BuddyProgress";
          goto LABEL_176;
        case 242:
          CFStringRef v8 = "BuddyFinished";
          goto LABEL_176;
        default:
          if (v4 == 220)
          {
            CFStringRef v8 = "iCloudStart";
          }
          else
          {
            if (v4 != 224) {
              goto LABEL_169;
            }
            CFStringRef v8 = "AppleIDSetupStart";
          }
          break;
      }
      goto LABEL_176;
    }
    if ((int)v4 <= 149)
    {
      if (v4 == 130)
      {
        CFStringRef v8 = "WiFiPoweredOff";
        goto LABEL_176;
      }
      if (v4 == 140)
      {
        CFStringRef v8 = "RecognizeVoice";
        goto LABEL_176;
      }
      goto LABEL_169;
    }
    if (v4 == 150)
    {
      CFStringRef v8 = "SiriForEveryone";
      goto LABEL_176;
    }
    if (v4 == 200)
    {
      CFStringRef v8 = "WiFiStart";
      goto LABEL_176;
    }
    if (v4 != 210) {
      goto LABEL_169;
    }
    CFStringRef v8 = "ActivationStart";
  }
  else if ((int)v4 > 79)
  {
    if ((int)v4 <= 119)
    {
      switch((int)v4)
      {
        case 'P':
          CFStringRef v8 = "BasicConfigStart";
          break;
        case 'Z':
          CFStringRef v8 = "BasicConfigFinish";
          break;
        case '\\':
          CFStringRef v8 = "StepStart";
          break;
        case '^':
          CFStringRef v8 = "StepFinish";
          break;
        case '_':
          CFStringRef v8 = "PreFinish";
          break;
          CFStringRef v8 = "SetupFinished";
          break;
        case 'a':
          CFStringRef v8 = "SetupResumed";
          break;
        case 'b':
          CFStringRef v8 = "SetupSuspend";
          break;
        case 'c':
          CFStringRef v8 = "SetupPeerSWUpdate";
          break;
        case 'd':
          CFStringRef v8 = "Finished";
          break;
        default:
          goto LABEL_169;
      }
      goto LABEL_176;
    }
    if (v4 == 120)
    {
      CFStringRef v8 = "CheckingiCloud";
      goto LABEL_176;
    }
    if (v4 == 122)
    {
      CFStringRef v8 = "CheckingAppleMusic";
      goto LABEL_176;
    }
    if (v4 != 124) {
      goto LABEL_169;
    }
    CFStringRef v8 = "CheckingAccount";
  }
  else
  {
    if ((int)v4 <= 49)
    {
      if ((int)v4 > 29)
      {
        switch((int)v4)
        {
          case 30:
            CFStringRef v8 = "Error";
            break;
          case 31:
            CFStringRef v8 = "SessionStarted";
            break;
          case 32:
            CFStringRef v8 = "SessionEnded";
            break;
          case 33:
            CFStringRef v8 = "SessionSecured";
            break;
          case 35:
            CFStringRef v8 = "ConnectStart";
            break;
          case 40:
            CFStringRef v8 = "PreAuthStart";
            break;
          default:
            goto LABEL_169;
        }
        goto LABEL_176;
      }
      switch(v4)
      {
        case 0:
          CFStringRef v8 = "Invalid";
          goto LABEL_176;
        case 0xA:
          CFStringRef v8 = "Start";
          goto LABEL_176;
        case 0x14:
          CFStringRef v8 = "Final";
          goto LABEL_176;
      }
LABEL_169:
      CFStringRef v8 = "?";
      goto LABEL_176;
    }
    if ((int)v4 > 64)
    {
      if (v4 == 65)
      {
        CFStringRef v8 = "SecurityAPCLoopStart";
        goto LABEL_176;
      }
      if (v4 == 70)
      {
        CFStringRef v8 = "SecurityFinish";
        goto LABEL_176;
      }
      goto LABEL_169;
    }
    if (v4 == 50)
    {
      CFStringRef v8 = "PreAuthFinish";
      goto LABEL_176;
    }
    if (v4 != 60) {
      goto LABEL_169;
    }
    CFStringRef v8 = "SecurityStart";
  }
LABEL_176:
  CFStringRef v9 = &stru_1001A1DC0;
  if (v7) {
    CFStringRef v9 = v7;
  }
  id v12 = v8;
  CFStringRef v13 = v9;
  CFStringRef v6 = (const __CFString *)LogPrintF();
  CFStringRef v7 = v14;
LABEL_179:
  if (!self->_setupSession) {
    goto LABEL_199;
  }
  if ((int)v4 <= 199)
  {
    switch(v4)
    {
      case 0x14:
        if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        -[WHASetupMainController showDoneUI:](self, "showDoneUI:", 0, v12, v13);
        uint64_t v11 = [(WHASetupMainController *)self _remoteViewControllerProxy];
        [v11 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.WHASetup"];

        break;
      case 0x1E:
        CFErrorGetTypeID();
        v10 = CFDictionaryGetTypedValue();
        if (dword_1001CD068 <= 60 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(WHASetupMainController *)self showDoneUI:NSErrorToOSStatus() error:v10];

        break;
      case 0x46:
        CFStringRef v6 = (const __CFString *)[(WHASetupMainController *)self showProgressUI];
        break;
      default:
        goto LABEL_199;
    }
    goto LABEL_198;
  }
  if ((v4 - 200) <= 0x1E && ((1 << (v4 + 56)) & 0x40100401) != 0)
  {
    CFStringRef v6 = (const __CFString *)[(WHASetupProgressViewController *)self->_vcProgress handleProgressEvent:v4];
LABEL_198:
    CFStringRef v7 = v14;
  }
LABEL_199:

  _objc_release_x1(v6, v7);
}

- (void)_sessionStart
{
  CFStringGetTypeID();
  v3 = CFDictionaryGetTypedValue();
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
    if (v4)
    {
      id v5 = objc_alloc_init((Class)SFDevice);
      [v5 setIdentifier:v4];
      [(SFDeviceSetupWHASession *)self->_setupSession invalidate];
      CFStringRef v6 = (SFDeviceSetupWHASession *)objc_alloc_init((Class)SFDeviceSetupWHASession);
      setupSession = self->_setupSession;
      self->_setupSession = v6;

      [(SFDeviceSetupWHASession *)self->_setupSession setPeerDevice:v5];
      [(SFDeviceSetupWHASession *)self->_setupSession setPresentingViewController:self->_vcStart];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001402A8;
      v12[3] = &unk_1001A1B10;
      v12[4] = self;
      [(SFDeviceSetupWHASession *)self->_setupSession setProgressHandler:v12];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001402B8;
      v11[3] = &unk_1001A1B38;
      v11[4] = self;
      [(SFDeviceSetupWHASession *)self->_setupSession setPromptForHomeHandler:v11];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100140374;
      v10[3] = &unk_1001A1B60;
      v10[4] = self;
      [(SFDeviceSetupWHASession *)self->_setupSession setPromptForPINHandler:v10];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10014041C;
      v9[3] = &unk_1001A1B38;
      v9[4] = self;
      [(SFDeviceSetupWHASession *)self->_setupSession setPromptForRoomHandler:v9];
      [(SFDeviceSetupWHASession *)self->_setupSession activate];
      [(WHASetupMainController *)self logUsageStart:9];
      CFStringRef v8 = [(WHASetupMainController *)self _remoteViewControllerProxy];
      [v8 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.WHASetup"];
    }
    else if (dword_1001CD068 <= 90 && (dword_1001CD068 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_1001CD068 <= 90 && (dword_1001CD068 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)logUsageDone:(int)a3
{
  if (!self->_loggedUsageDone)
  {
    uint64_t v3 = *(void *)&a3;
    self->_loggedUsageDone = 1;
    CFStringGetTypeID();
    uint64_t v5 = CFDictionaryGetTypedValue();
    if (v5) {
      CFStringRef v6 = (__CFString *)v5;
    }
    else {
      CFStringRef v6 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v8 = UpTicksToMilliseconds();
    v14[0] = @"_cat";
    v14[1] = @"_op";
    v15[0] = @"WHASetup";
    v15[1] = @"Done";
    v15[2] = v6;
    v14[2] = @"sid";
    v14[3] = @"rssi";
    CFStringRef v9 = +[NSNumber numberWithInt:Int64Ranged];
    v15[3] = v9;
    v14[4] = @"error";
    v10 = +[NSNumber numberWithInt:v3];
    v15[4] = v10;
    v14[5] = @"ms";
    uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:v8];
    v15[5] = v11;
    v14[6] = @"badPIN";
    id v12 = +[NSNumber numberWithUnsignedInt:self->_badPINCount];
    v15[6] = v12;
    CFStringRef v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
    SFDashboardLogJSON();

    if (dword_1001CD068 <= 50 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)logUsageStart:(int)a3
{
  if (!self->_loggedUsageStart)
  {
    uint64_t v3 = *(void *)&a3;
    self->_loggedUsageStart = 1;
    CFStringGetTypeID();
    uint64_t v4 = CFDictionaryGetTypedValue();
    if (v4) {
      uint64_t v5 = (__CFString *)v4;
    }
    else {
      uint64_t v5 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v7 = UpTicksToMilliseconds();
    v12[0] = @"_cat";
    v12[1] = @"_op";
    v13[0] = @"WHASetup";
    v13[1] = @"Start";
    v13[2] = v5;
    v12[2] = @"sid";
    v12[3] = @"rssi";
    uint64_t v8 = +[NSNumber numberWithInt:Int64Ranged];
    v13[3] = v8;
    v12[4] = @"action";
    CFStringRef v9 = +[NSNumber numberWithInt:v3];
    v13[4] = v9;
    void v12[5] = @"ms";
    v10 = +[NSNumber numberWithUnsignedLongLong:v7];
    v13[5] = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
    SFDashboardLogJSON();

    if (dword_1001CD068 <= 50 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_handleHomeButtonPressed
{
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_homePressed || MKBGetDeviceLockState() - 1 > 1)
  {
    [(WHASetupMainController *)self dismiss:4];
  }
  else
  {
    if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_homePressed = 1;
  }
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * i) events] & 0x10) != 0)
        {
          if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(WHASetupMainController *)self _handleHomeButtonPressed];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    [(WHASetupMainController *)self logUsageStart:v4];
    uint64_t v7 = [(WHASetupMainController *)self _remoteViewControllerProxy];
    uint64_t v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100140D18;
      v10[3] = &unk_1001A1AE8;
      id v12 = v6;
      id v11 = v8;
      [(SVSCommonNavController *)vcNav dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      [v7 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [(WHASetupMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.WHASetup"];

  if (!self->_dismissed)
  {
    if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(WHASetupMainController *)self dismiss:21];
  }
  int dismissNotifyToken = self->_dismissNotifyToken;
  if (dismissNotifyToken != -1)
  {
    notify_cancel(dismissNotifyToken);
    self->_int dismissNotifyToken = -1;
  }
  [(SFDeviceSetupWHASession *)self->_setupSession invalidate];
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcProgress setMainController:0];
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  [(SVSBaseViewController *)self->_vcHomePicker setMainController:0];
  vcHomePicker = self->_vcHomePicker;
  self->_vcHomePicker = 0;

  [(SVSBaseViewController *)self->_vcRoomPicker setMainController:0];
  vcRoomPicker = self->_vcRoomPicker;
  self->_vcRoomPicker = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v16.receiver = self;
  v16.super_class = (Class)WHASetupMainController;
  [(SVSBaseMainController *)&v16 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v19 = 0;
  v18.receiver = self;
  v18.super_class = (Class)WHASetupMainController;
  [(WHASetupMainController *)&v18 viewDidAppear:v3];
  self->_viewAppearedTicks = mach_absolute_time();
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v19) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = Int64 == 0;
  }
  BOOL v7 = !v6;
  self->_placeholderUI = v7;
  uint64_t v8 = +[UIStoryboard storyboardWithName:@"WHASetup" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v8;

  long long v10 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v10;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  id v12 = +[UIDevice currentDevice];
  unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  CFStringRef v14 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  v15 = [v14 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v15;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(WHASetupMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100141210;
  v17[3] = &unk_1001A1AC0;
  v17[4] = self;
  notify_register_dispatch("com.apple.sharing.ProxCard.dismiss", &self->_dismissNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v17);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(WHASetupMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  uint64_t v4 = +[UIDevice currentDevice];
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
  id v12 = (void (**)(void))a4;
  self->_int dismissNotifyToken = -1;
  BOOL v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000001"])
  {
    int v9 = 1;
LABEL_25:
    long long v10 = v12;
LABEL_26:
    self->_testMode = v9;
    goto LABEL_27;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000002"])
  {
    int v9 = 2;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000003"])
  {
    int v9 = 3;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000004"])
  {
    int v9 = 4;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000005"])
  {
    int v9 = 5;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000006"])
  {
    int v9 = 6;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000007"])
  {
    int v9 = 7;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000008"])
  {
    int v9 = 8;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000009"])
  {
    int v9 = 9;
    goto LABEL_25;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-00000000000A"])
  {
    int v9 = 10;
    goto LABEL_25;
  }
  unsigned int v11 = [v8 isEqual:@"00000000-0000-0000-0000-00000000000B"];
  long long v10 = v12;
  if (v11)
  {
    int v9 = 11;
    goto LABEL_26;
  }
LABEL_27:
  if (v10) {
    v12[2](v12);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end