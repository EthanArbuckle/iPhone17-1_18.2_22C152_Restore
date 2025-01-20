@interface HMSymptomFixSession
+ (id)_createDeviceRepairSession;
+ (id)_createSymptomDisappearanceTimer;
+ (id)logCategory;
- (BOOL)hasSymptomDisappeared;
- (BOOL)isDeviceRepairSessionFinished;
- (HMFTimer)symptomDisappearanceTimer;
- (HMSymptom)symptom;
- (HMSymptomFixSession)init;
- (HMSymptomFixSession)initWithSymptom:(id)a3 deviceIdentifier:(id)a4 context:(id)a5;
- (HMSymptomFixSessionDelegate)delegate;
- (NSError)error;
- (NSString)logIdentifier;
- (NSUUID)deviceIdentifier;
- (SFDeviceRepairSession)deviceRepairSession;
- (UIViewController)presentingViewController;
- (_HMContext)context;
- (int64_t)state;
- (unsigned)deviceRepairFlags;
- (void)_startSymptomDisappearanceTimer;
- (void)_updateForDeviceSetupProgressEvent:(unsigned int)a3 error:(id)a4;
- (void)_updateState;
- (void)dealloc;
- (void)noteSymptomDisappeared;
- (void)setDelegate:(id)a3;
- (void)setDeviceRepairFlags:(unsigned int)a3;
- (void)setDeviceRepairSession:(id)a3;
- (void)setDeviceRepairSessionFinished:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHasSymptomDisappeared:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSymptomDisappearanceTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMSymptomFixSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_symptom, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_symptomDisappearanceTimer, 0);
  objc_storeStrong((id *)&self->_deviceRepairSession, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSymptomFixSession *)self symptomDisappearanceTimer];

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      [v4 timeInterval];
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Symptom still exists %fs after being fixed. Marking as finished with timeout error", (uint8_t *)&v12, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
    [(HMSymptomFixSession *)v7 setError:v11];

    [(HMSymptomFixSession *)v7 setSymptomDisappearanceTimer:0];
  }
}

- (void)_startSymptomDisappearanceTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() _createSymptomDisappearanceTimer];
  id v4 = (void *)MEMORY[0x19F3A64A0]([v3 setDelegate:self]);
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting timer for symptom disappearance: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 resume];
  [(HMSymptomFixSession *)v5 setSymptomDisappearanceTimer:v3];
}

- (void)_updateState
{
  v3 = [(HMSymptomFixSession *)self error];
  if (v3)
  {
  }
  else if (![(HMSymptomFixSession *)self isDeviceRepairSessionFinished] {
         || ![(HMSymptomFixSession *)self hasSymptomDisappeared])
  }
  {
    return;
  }

  [(HMSymptomFixSession *)self setState:2];
}

- (void)_updateForDeviceSetupProgressEvent:(unsigned int)a3 error:(id)a4
{
  [(HMSymptomFixSession *)self setError:a4];
  if (a3 == 30 || a3 == 20)
  {
    [(HMSymptomFixSession *)self setDeviceRepairSessionFinished:1];
    v6 = [(HMSymptomFixSession *)self error];

    if (!v6)
    {
      [(HMSymptomFixSession *)self _startSymptomDisappearanceTimer];
    }
  }
}

- (void)noteSymptomDisappeared
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that symptom has disappeared", (uint8_t *)&v7, 0xCu);
  }
  [(HMSymptomFixSession *)v4 setHasSymptomDisappeared:1];
  [(HMSymptomFixSession *)v4 setSymptomDisappearanceTimer:0];
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop symptom fix session", (uint8_t *)&v14, 0xCu);
  }
  unint64_t v7 = [(HMSymptomFixSession *)v4 state];
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
      __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
      v11 = v4;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = v13;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Not stopping symptom fix session because it is already finished", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [(HMSymptomFixSession *)v4 setError:v8];

    uint64_t v9 = [(HMSymptomFixSession *)v4 deviceRepairSession];
    [v9 invalidate];

    [(HMSymptomFixSession *)v4 setSymptomDisappearanceTimer:0];
  }
}

- (void)start
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(HMSymptomFixSession *)self state])
  {
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot start a session that has already been started" userInfo:0];
    objc_exception_throw(v28);
  }
  v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to start symptom fix session", buf, 0xCu);
  }
  unint64_t v7 = [(id)objc_opt_class() _createDeviceRepairSession];
  [(HMSymptomFixSession *)v4 setDeviceRepairSession:v7];

  id location = 0;
  p_id location = &location;
  uint64_t v33 = 0x2050000000;
  id v8 = (id)getSFDeviceClass_softClass;
  uint64_t v34 = getSFDeviceClass_softClass;
  if (!getSFDeviceClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSFDeviceClass_block_invoke;
    v36 = &unk_1E5943DD8;
    *(void *)v37 = &location;
    __getSFDeviceClass_block_invoke((uint64_t)buf);
    id v8 = p_location[3];
  }
  uint64_t v9 = (objc_class *)v8;
  _Block_object_dispose(&location, 8);
  id v10 = objc_alloc_init(v9);
  v11 = [(HMSymptomFixSession *)v4 deviceIdentifier];
  [v10 setIdentifier:v11];

  uint64_t v12 = [(HMSymptomFixSession *)v4 deviceRepairSession];
  [v12 setPeerDevice:v10];

  v13 = [(HMSymptomFixSession *)v4 presentingViewController];
  int v14 = [(HMSymptomFixSession *)v4 deviceRepairSession];
  [v14 setPresentingViewController:v13];

  uint64_t v15 = [(HMSymptomFixSession *)v4 deviceRepairFlags];
  uint64_t v16 = [(HMSymptomFixSession *)v4 deviceRepairSession];
  [v16 setRepairFlags:v15];

  objc_initWeak(&location, v4);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __28__HMSymptomFixSession_start__block_invoke;
  v29[3] = &unk_1E5943128;
  objc_copyWeak(&v30, &location);
  v17 = [(HMSymptomFixSession *)v4 deviceRepairSession];
  [v17 setProgressHandler:v29];

  v18 = (void *)MEMORY[0x19F3A64A0]();
  v19 = v4;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [(HMSymptomFixSession *)v19 deviceRepairSession];
    v23 = [(HMSymptomFixSession *)v19 symptom];
    v24 = [(HMSymptomFixSession *)v19 deviceIdentifier];
    v25 = [(HMSymptomFixSession *)v19 presentingViewController];
    unsigned int v26 = [(HMSymptomFixSession *)v19 deviceRepairFlags];
    *(_DWORD *)buf = 138544642;
    *(void *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v36 = v23;
    *(_WORD *)v37 = 2112;
    *(void *)&v37[2] = v24;
    __int16 v38 = 2112;
    v39 = v25;
    __int16 v40 = 1024;
    unsigned int v41 = v26;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Activating SFDeviceRepairSession %@ for symptom %@ with deviceIdentifier: %@ presentingViewController: %@ repairFlags: %d", buf, 0x3Au);
  }
  v27 = [(HMSymptomFixSession *)v19 deviceRepairSession];
  [v27 activate];

  [(HMSymptomFixSession *)v19 setState:1];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __28__HMSymptomFixSession_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = WeakRetained;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    v11 = (void *)v10;
    if ((int)a2 > 299)
    {
      if ((int)a2 > 799)
      {
        if ((int)a2 <= 999)
        {
          switch((int)a2)
          {
            case 900:
              uint64_t v12 = "SU-No-SetupScanAttempt";
              break;
            case 901:
              uint64_t v12 = "SU-No-SetupStatusUpdate";
              break;
            case 902:
              uint64_t v12 = "SU-No-SetupWipeWifi";
              break;
            case 903:
              uint64_t v12 = "SU-No-SetupCancelled";
              break;
            case 904:
              uint64_t v12 = "SU-No-SetupObliterate";
              break;
            case 905:
              uint64_t v12 = "SU-No-SetupCannotCancel";
              break;
            case 906:
              uint64_t v12 = "SysDrop AirDrop Event";
              break;
            case 907:
              uint64_t v12 = "SysDrop Sysdiagnose Event";
              break;
            case 908:
              uint64_t v12 = "SysDrop Cancel Event";
              break;
            case 909:
              uint64_t v12 = "File Transfer Progress Event";
              break;
            case 910:
              uint64_t v12 = "File Transfer Completed Event";
              break;
            case 911:
              uint64_t v12 = "iOSWiFiSetup";
              break;
            case 912:
              uint64_t v12 = "HKPrimaryResidentSSIDFetchStart";
              break;
            case 913:
              uint64_t v12 = "LoggingProfileTransfer";
              break;
            default:
              switch((int)a2)
              {
                case 800:
                  uint64_t v12 = "AuthAccountsStart";
                  break;
                case 803:
                  uint64_t v12 = "AuthAccountsiCloudProgress";
                  break;
                case 804:
                  uint64_t v12 = "AuthAccountsStoreProgress";
                  break;
                case 805:
                  uint64_t v12 = "AuthAccountsGameCenterProgress";
                  break;
                default:
                  goto LABEL_166;
              }
              break;
          }
          goto LABEL_173;
        }
        if ((int)a2 <= 1099)
        {
          if (a2 == 1000)
          {
            uint64_t v12 = "SecureIntentStart";
            goto LABEL_173;
          }
          if (a2 == 1001)
          {
            uint64_t v12 = "SecureIntentFinish";
            goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 1100)
        {
          uint64_t v12 = "OneTimeCodeDetected";
          goto LABEL_173;
        }
        if (a2 == 2000)
        {
          uint64_t v12 = "DependentStart";
          goto LABEL_173;
        }
        if (a2 != 2001) {
          goto LABEL_166;
        }
        uint64_t v12 = "DependentEnd";
      }
      else if ((int)a2 <= 519)
      {
        if ((int)a2 <= 410)
        {
          if ((int)a2 <= 399)
          {
            if (a2 == 300)
            {
              uint64_t v12 = "BackupProgress";
              goto LABEL_173;
            }
            if (a2 == 310)
            {
              uint64_t v12 = "SyncProgress";
              goto LABEL_173;
            }
            goto LABEL_166;
          }
          if (a2 == 400)
          {
            uint64_t v12 = "StopSetup";
            goto LABEL_173;
          }
          if (a2 == 401)
          {
            uint64_t v12 = "PINPair";
            goto LABEL_173;
          }
          if (a2 != 410) {
            goto LABEL_166;
          }
          uint64_t v12 = "MigrateStart";
        }
        else
        {
          if ((int)a2 > 430)
          {
            switch(a2)
            {
              case 0x1AF:
                uint64_t v12 = "eSimExternal2FAStop";
                goto LABEL_173;
              case 0x1F4:
                uint64_t v12 = "SiriWelcome";
                goto LABEL_173;
              case 0x1FE:
                uint64_t v12 = "SiriDialogA";
                goto LABEL_173;
            }
            goto LABEL_166;
          }
          if (a2 == 411)
          {
            uint64_t v12 = "MigrateStop";
            goto LABEL_173;
          }
          if (a2 == 420)
          {
            uint64_t v12 = "FileTransferReady";
            goto LABEL_173;
          }
          if (a2 != 430) {
            goto LABEL_166;
          }
          uint64_t v12 = "eSimExternal2FAStart";
        }
      }
      else if ((int)a2 > 559)
      {
        if ((int)a2 > 599)
        {
          switch(a2)
          {
            case 0x258:
              uint64_t v12 = "SiriSkipDemo";
              goto LABEL_173;
            case 0x2BC:
              uint64_t v12 = "StopSetupLEDs";
              goto LABEL_173;
            case 0x2C6:
              uint64_t v12 = "AudioPasscodeEnded";
              goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 560)
        {
          uint64_t v12 = "SiriDialogCMusic";
          goto LABEL_173;
        }
        if (a2 == 570)
        {
          uint64_t v12 = "SiriDialogCNews";
          goto LABEL_173;
        }
        if (a2 != 580) {
          goto LABEL_166;
        }
        uint64_t v12 = "SiriDialogCWeather";
      }
      else
      {
        if ((int)a2 > 549)
        {
          switch(a2)
          {
            case 0x226:
              uint64_t v12 = "SiriDialogBWeather";
              goto LABEL_173;
            case 0x22B:
              uint64_t v12 = "SiriDialogBClock";
              goto LABEL_173;
            case 0x22E:
              uint64_t v12 = "SiriDialogBMusic";
              goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 520)
        {
          uint64_t v12 = "SiriDialogBStart";
          goto LABEL_173;
        }
        if (a2 == 530)
        {
          uint64_t v12 = "SiriDialogBHome";
          goto LABEL_173;
        }
        if (a2 != 540) {
          goto LABEL_166;
        }
        uint64_t v12 = "SiriDialogBNews";
      }
    }
    else if ((int)a2 > 129)
    {
      if ((int)a2 > 249)
      {
        switch((int)a2)
        {
          case 260:
            uint64_t v12 = "TVLSStart";
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
            goto LABEL_166;
          case 264:
            uint64_t v12 = "TVLSFinish";
            break;
          case 270:
            uint64_t v12 = "TVLSEstimateStart";
            break;
          case 272:
            uint64_t v12 = "TVLSEstimateFinal";
            break;
          case 274:
            uint64_t v12 = "TVLSEstimateFailed";
            break;
          case 276:
            uint64_t v12 = "TVLSTryAgain";
            break;
          case 277:
            uint64_t v12 = "TVLSToneBegan";
            break;
          case 278:
            uint64_t v12 = "TVLCalStart";
            break;
          case 279:
            uint64_t v12 = "TVLCalStep";
            break;
          case 280:
            uint64_t v12 = "TVLCalFailed";
            break;
          case 281:
            uint64_t v12 = "TVLCalTryAgain";
            break;
          case 282:
            uint64_t v12 = "TVLCalFinal";
            break;
          default:
            if (a2 != 250) {
              goto LABEL_166;
            }
            uint64_t v12 = "ReportSuccess";
            break;
        }
        goto LABEL_173;
      }
      if ((int)a2 > 219)
      {
        switch((int)a2)
        {
          case 230:
            uint64_t v12 = "HomeKitStart";
            goto LABEL_173;
          case 231:
          case 232:
          case 233:
          case 235:
          case 237:
          case 238:
          case 239:
            goto LABEL_166;
          case 234:
            uint64_t v12 = "HomeKitSetupStart";
            goto LABEL_173;
          case 236:
            uint64_t v12 = "CDPSetupStart";
            goto LABEL_173;
          case 240:
            uint64_t v12 = "BuddyStarting";
            goto LABEL_173;
          case 241:
            uint64_t v12 = "BuddyProgress";
            goto LABEL_173;
          case 242:
            uint64_t v12 = "BuddyFinished";
            goto LABEL_173;
          default:
            if (a2 == 220)
            {
              uint64_t v12 = "iCloudStart";
            }
            else
            {
              if (a2 != 224) {
                goto LABEL_166;
              }
              uint64_t v12 = "AppleIDSetupStart";
            }
            break;
        }
        goto LABEL_173;
      }
      if ((int)a2 <= 149)
      {
        if (a2 == 130)
        {
          uint64_t v12 = "WiFiPoweredOff";
          goto LABEL_173;
        }
        if (a2 == 140)
        {
          uint64_t v12 = "RecognizeVoice";
          goto LABEL_173;
        }
        goto LABEL_166;
      }
      if (a2 == 150)
      {
        uint64_t v12 = "SiriForEveryone";
        goto LABEL_173;
      }
      if (a2 == 200)
      {
        uint64_t v12 = "WiFiStart";
        goto LABEL_173;
      }
      if (a2 != 210) {
        goto LABEL_166;
      }
      uint64_t v12 = "ActivationStart";
    }
    else if ((int)a2 > 79)
    {
      if ((int)a2 <= 119)
      {
        switch((int)a2)
        {
          case 'P':
            uint64_t v12 = "BasicConfigStart";
            break;
          case 'Z':
            uint64_t v12 = "BasicConfigFinish";
            break;
          case '\\':
            uint64_t v12 = "StepStart";
            break;
          case '^':
            uint64_t v12 = "StepFinish";
            break;
          case '_':
            uint64_t v12 = "PreFinish";
            break;
            uint64_t v12 = "SetupFinished";
            break;
          case 'a':
            uint64_t v12 = "SetupResumed";
            break;
          case 'b':
            uint64_t v12 = "SetupSuspend";
            break;
          case 'c':
            uint64_t v12 = "SetupPeerSWUpdate";
            break;
          case 'd':
            uint64_t v12 = "Finished";
            break;
          default:
            goto LABEL_166;
        }
        goto LABEL_173;
      }
      if (a2 == 120)
      {
        uint64_t v12 = "CheckingiCloud";
        goto LABEL_173;
      }
      if (a2 == 122)
      {
        uint64_t v12 = "CheckingAppleMusic";
        goto LABEL_173;
      }
      if (a2 != 124) {
        goto LABEL_166;
      }
      uint64_t v12 = "CheckingAccount";
    }
    else
    {
      if ((int)a2 <= 49)
      {
        if ((int)a2 > 29)
        {
          switch((int)a2)
          {
            case 30:
              uint64_t v12 = "Error";
              break;
            case 31:
              uint64_t v12 = "SessionStarted";
              break;
            case 32:
              uint64_t v12 = "SessionEnded";
              break;
            case 33:
              uint64_t v12 = "SessionSecured";
              break;
            case 35:
              uint64_t v12 = "ConnectStart";
              break;
            case 40:
              uint64_t v12 = "PreAuthStart";
              break;
            default:
              goto LABEL_166;
          }
          goto LABEL_173;
        }
        switch(a2)
        {
          case 0:
            uint64_t v12 = "Invalid";
            goto LABEL_173;
          case 0xA:
            uint64_t v12 = "Start";
            goto LABEL_173;
          case 0x14:
            uint64_t v12 = "Final";
            goto LABEL_173;
        }
LABEL_166:
        uint64_t v12 = "?";
        goto LABEL_173;
      }
      if ((int)a2 > 64)
      {
        if (a2 == 65)
        {
          uint64_t v12 = "SecurityAPCLoopStart";
          goto LABEL_173;
        }
        if (a2 == 70)
        {
          uint64_t v12 = "SecurityFinish";
          goto LABEL_173;
        }
        goto LABEL_166;
      }
      if (a2 == 50)
      {
        uint64_t v12 = "PreAuthFinish";
        goto LABEL_173;
      }
      if (a2 != 60) {
        goto LABEL_166;
      }
      uint64_t v12 = "SecurityStart";
    }
LABEL_173:
    int v14 = 138544130;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    v17 = v12;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Received new device repair session progress event: %s (%d) and info: %@", (uint8_t *)&v14, 0x26u);
  }
  v13 = [v5 objectForKeyedSubscript:@"eo"];
  [v8 _updateForDeviceSetupProgressEvent:a2 error:v13];
}

- (void)setSymptomDisappearanceTimer:(id)a3
{
  id v4 = (HMFTimer *)a3;
  os_unfair_lock_lock_with_options();
  symptomDisappearanceTimer = self->_symptomDisappearanceTimer;
  self->_symptomDisappearanceTimer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFTimer)symptomDisappearanceTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_symptomDisappearanceTimer;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHasSymptomDisappeared:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasSymptomDisappeared = a3;
  os_unfair_lock_unlock(p_lock);

  [(HMSymptomFixSession *)self _updateState];
}

- (BOOL)hasSymptomDisappeared
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasSymptomDisappeared;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDeviceRepairFlags:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_deviceRepairFlags = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)deviceRepairFlags
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_deviceRepairFlags;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setDeviceRepairSessionFinished:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_deviceRepairSessionFinished = a3;
  os_unfair_lock_unlock(p_lock);

  [(HMSymptomFixSession *)self _updateState];
}

- (BOOL)isDeviceRepairSessionFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_deviceRepairSessionFinished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDeviceRepairSession:(id)a3
{
  id v4 = (SFDeviceRepairSession *)a3;
  os_unfair_lock_lock_with_options();
  deviceRepairSession = self->_deviceRepairSession;
  self->_deviceRepairSession = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (SFDeviceRepairSession)deviceRepairSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deviceRepairSession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);

  [(HMSymptomFixSession *)self _updateState];
}

- (NSError)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_error;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMSymptomFixSessionDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMSymptomFixSessionDelegate *)WeakRetained;
}

- (void)setState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(HMSymptomFixSession *)self state] != a3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    unint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = [(HMSymptomFixSession *)v6 state];
      __int16 v19 = 2048;
      int64_t v20 = a3;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating state from %ld to %ld", buf, 0x20u);
    }
    os_unfair_lock_lock_with_options();
    v6->_state = a3;
    os_unfair_lock_unlock(&v6->_lock);
    uint64_t v9 = [(HMSymptomFixSession *)v6 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(HMSymptomFixSession *)v6 context];
      v11 = [v10 delegateCaller];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __32__HMSymptomFixSession_setState___block_invoke;
      v12[3] = &unk_1E5945628;
      id v13 = v9;
      int v14 = v6;
      [v11 invokeBlock:v12];
    }
  }
}

uint64_t __32__HMSymptomFixSession_setState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 state];

  return [v1 fixSession:v2 didChangeState:v3];
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)dealloc
{
  [(SFDeviceRepairSession *)self->_deviceRepairSession invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HMSymptomFixSession;
  [(HMSymptomFixSession *)&v3 dealloc];
}

- (HMSymptomFixSession)initWithSymptom:(id)a3 deviceIdentifier:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMSymptomFixSession;
  uint64_t v12 = [(HMSymptomFixSession *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_symptom, a3);
    objc_storeStrong((id *)&v13->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v13->_int64_t state = 0;
    uint64_t v14 = [NSString stringWithFormat:@"%@/%@", v13->_symptom, v13->_deviceIdentifier];
    logIdentifier = v13->_logIdentifier;
    v13->_logIdentifier = (NSString *)v14;
  }
  return v13;
}

- (HMSymptomFixSession)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_39540 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_39540, &__block_literal_global_39541);
  }
  v2 = (void *)logCategory__hmf_once_v25_39542;

  return v2;
}

uint64_t __34__HMSymptomFixSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_39542;
  logCategory__hmf_once_v25_39542 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_createSymptomDisappearanceTimer
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v3 = [v2 preferenceForKey:@"symptomDisappearanceTimeout"];

  id v4 = [v3 numberValue];
  if (v4)
  {
    id v5 = [v3 numberValue];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 30.0;
  }

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v7];

  return v8;
}

+ (id)_createDeviceRepairSession
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getSFDeviceRepairSessionClass_softClass;
  uint64_t v10 = getSFDeviceRepairSessionClass_softClass;
  if (!getSFDeviceRepairSessionClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSFDeviceRepairSessionClass_block_invoke;
    v6[3] = &unk_1E5943DD8;
    v6[4] = &v7;
    __getSFDeviceRepairSessionClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);

  return v4;
}

@end