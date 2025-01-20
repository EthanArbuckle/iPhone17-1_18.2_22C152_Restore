@interface GAXTouchIDManager
- (AXAccessQueueTimer)touchIDActiveTimer;
- (BOOL)_deviceHasBiometrics;
- (BOOL)_loadBiometricKit;
- (BOOL)isTouchIDCurrentlyActive;
- (BiometricKit)biometricKit;
- (GAXTouchIDManager)init;
- (GAXTouchIDManagerDelegate)delegate;
- (void)_updateTouchIDActivationStatus:(BOOL)a3;
- (void)brieflyListenForTouchIDAttempts;
- (void)cancelListeningForTouchIDAttempts;
- (void)dealloc;
- (void)homeButtonPressed;
- (void)matchResult:(id)a3;
- (void)setBiometricKit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTouchIDActiveTimer:(id)a3;
- (void)setTouchIDCurrentlyActive:(BOOL)a3;
- (void)statusMessage:(unsigned int)a3;
@end

@implementation GAXTouchIDManager

- (BOOL)_deviceHasBiometrics
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return AXDeviceHasPearl();
}

- (GAXTouchIDManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)GAXTouchIDManager;
  v2 = [(GAXTouchIDManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    if ([(GAXTouchIDManager *)v2 _deviceHasBiometrics])
    {
      if ([(GAXTouchIDManager *)v3 _loadBiometricKit])
      {
        v4 = [(id)AXSafeClassFromString() manager];
        [(GAXTouchIDManager *)v3 setBiometricKit:v4];

        v5 = GAXLogCommon();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = [(GAXTouchIDManager *)v3 biometricKit];
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Created biometric kit manager: %@", buf, 0xCu);
        }
        v7 = [(GAXTouchIDManager *)v3 biometricKit];
        [v7 setDelegate:v3];

        id v8 = objc_alloc((Class)AXAccessQueueTimer);
        v9 = +[AXAccessQueue mainAccessQueue];
        v10 = [v8 initWithTargetAccessQueue:v9];

        [v10 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
        [(GAXTouchIDManager *)v3 setTouchIDActiveTimer:v10];
      }
      else
      {
        v10 = GAXLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_37B94(v10);
        }
      }
    }
    else
    {
      v10 = GAXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "No biometrics capabilites.", buf, 2u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Removed biometric kit manager delegate.", buf, 2u);
  }

  v4 = [(GAXTouchIDManager *)self biometricKit];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)GAXTouchIDManager;
  [(GAXTouchIDManager *)&v5 dealloc];
}

- (BOOL)_loadBiometricKit
{
  if (qword_6E7F8 != -1) {
    dispatch_once(&qword_6E7F8, &stru_5D868);
  }
  return qword_6E7F0 != 0;
}

- (void)brieflyListenForTouchIDAttempts
{
  v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Briefly listen for Touch ID attempts.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1E8A8;
  block[3] = &unk_5CD28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cancelListeningForTouchIDAttempts
{
  v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Cancel listening for Touch ID attempts.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EA74;
  block[3] = &unk_5CD28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateTouchIDActivationStatus:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(GAXTouchIDManager *)self isTouchIDCurrentlyActive];
  v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 guidedAccessAllowsUnlockWithTouchID];

  id v8 = GAXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109632;
    v16[1] = v5;
    __int16 v17 = 1024;
    BOOL v18 = v3;
    __int16 v19 = 1024;
    unsigned int v20 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Touch ID was active: %i should make active: %i is enabled for GAX: %i", (uint8_t *)v16, 0x14u);
  }

  int v9 = v7 ^ 1;
  if ((v5 | !v3) & 1) != 0 || (v9)
  {
    if ((v5 & (!v3 | v9)) != 1) {
      return;
    }
    v13 = [(GAXTouchIDManager *)self biometricKit];
    [v13 cancel];

    v14 = self;
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  v10 = [(GAXTouchIDManager *)self biometricKit];
  id v11 = [v10 match:0];

  if (!v11)
  {
    v14 = self;
    uint64_t v15 = 1;
LABEL_12:
    [(GAXTouchIDManager *)v14 setTouchIDCurrentlyActive:v15];
    return;
  }
  objc_super v12 = GAXLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_37BD8((uint64_t)v11, v12);
  }
}

- (void)matchResult:(id)a3
{
  unsigned int v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3 != 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Biometric match result with identity: %i", (uint8_t *)v7, 8u);
  }

  v6 = [(GAXTouchIDManager *)self delegate];
  [v6 touchIDManager:self attemptWasSuccessful:a3 != 0];

  [(GAXTouchIDManager *)self cancelListeningForTouchIDAttempts];
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case '2':
      v4 = GAXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        unsigned int v5 = "Got biometric event: kBiometricKitStatusMaxTempateCount";
        goto LABEL_71;
      }
      goto LABEL_72;
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ':':
    case ';':
    case '<':
    case '=':
    case '>':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'b':
    case 'c':
      goto LABEL_7;
    case '?':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOn";
      goto LABEL_71;
    case '@':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOff";
      goto LABEL_71;
    case 'A':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusEnrollmentComplete";
      goto LABEL_71;
    case 'B':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusEnrollmentCancelled";
      goto LABEL_71;
    case 'C':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusEnrollmentFailed";
      goto LABEL_71;
    case 'D':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusEnrollmentTimeout";
      goto LABEL_71;
    case 'E':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusUnknownError";
      goto LABEL_71;
    case 'F':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusImageRejected";
      goto LABEL_71;
    case 'G':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusNoCalibration";
      goto LABEL_71;
    case 'H':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitImageForProcessing";
      goto LABEL_71;
    case 'I':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusTemplateListUpdated";
      goto LABEL_71;
    case 'J':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusRequestFingerOff";
      goto LABEL_71;
    case 'K':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusAutoMatchingStarted";
      goto LABEL_71;
    case 'L':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusAutoMatchingStopped";
      goto LABEL_71;
    case 'M':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusCaptureRestart";
      goto LABEL_71;
    case 'N':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusScanTooShort";
      goto LABEL_71;
    case 'O':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusAutoMatchingStartByHomeButton";
      goto LABEL_71;
    case 'P':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusMatchingCancelled";
      goto LABEL_71;
    case 'Q':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOnBeforeFirstPasscodeUnlock";
      goto LABEL_71;
    case 'R':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOnInPasscodeLockout";
      goto LABEL_71;
    case 'S':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOnInBioLockout";
      goto LABEL_71;
    case 'T':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusESDRecovery";
      goto LABEL_71;
    case 'U':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusImageRejectedUnknown";
      goto LABEL_71;
    case 'V':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusImageRejectedBadBlocks";
      goto LABEL_71;
    case 'W':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusImageRejectedChFPN";
      goto LABEL_71;
    case 'X':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusImageRejectedCaFPN";
      goto LABEL_71;
    case 'Y':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusSensorOperationModeIdle";
      goto LABEL_71;
    case 'Z':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusSensorOperationModeCapture";
      goto LABEL_71;
    case '[':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusSensorOperationModePause";
      goto LABEL_71;
    case '\\':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusFingerOnTokenExpired";
      goto LABEL_71;
    case 'd':
      v4 = GAXLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      LOWORD(v7) = 0;
      unsigned int v5 = "Got biometric event: kBiometricKitStatusBaseOffset";
      goto LABEL_71;
    default:
      if (a3)
      {
LABEL_7:
        v4 = GAXLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v6 = +[NSNumber numberWithUnsignedInt:v3];
          int v7 = 138543362;
          id v8 = v6;
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Got biometric unknown event: %{public}@", (uint8_t *)&v7, 0xCu);
        }
      }
      else
      {
        v4 = GAXLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v7) = 0;
          unsigned int v5 = "Got biometric event: kBiometricKitStatusNoEnrollees";
LABEL_71:
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 2u);
        }
      }
LABEL_72:

      return;
  }
}

- (void)homeButtonPressed
{
  v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Mesa did indicate that home button was pressed", v3, 2u);
  }
}

- (GAXTouchIDManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXTouchIDManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BiometricKit)biometricKit
{
  return self->_biometricKit;
}

- (void)setBiometricKit:(id)a3
{
}

- (AXAccessQueueTimer)touchIDActiveTimer
{
  return self->_touchIDActiveTimer;
}

- (void)setTouchIDActiveTimer:(id)a3
{
}

- (BOOL)isTouchIDCurrentlyActive
{
  return self->_touchIDCurrentlyActive;
}

- (void)setTouchIDCurrentlyActive:(BOOL)a3
{
  self->_touchIDCurrentlyActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDActiveTimer, 0);
  objc_storeStrong((id *)&self->_biometricKit, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end