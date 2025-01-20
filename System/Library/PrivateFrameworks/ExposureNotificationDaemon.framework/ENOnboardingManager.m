@interface ENOnboardingManager
- (BOOL)_isInLostMode;
- (BOOL)isCaptureSessionRunning;
- (BOOL)isDeviceUnlocked;
- (BOOL)isIdealTimeForBuddy;
- (BOOL)pendingBuddyOnboarding;
- (CXCallObserver)callObserver;
- (ENOnboardingManager)init;
- (ENOnboardingManagerDelegate)delegate;
- (void)_cameraIrisStateChangedWithToken:(int)a3;
- (void)_deviceLockStateChangedWithToken:(int)a3;
- (void)_observeCameraIrisNotifications;
- (void)dealloc;
- (void)setCallObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsCaptureSessionRunning:(BOOL)a3;
- (void)setPendingBuddyOnboarding:(BOOL)a3;
- (void)setShouldObserveDeviceUnlocks:(BOOL)a3;
@end

@implementation ENOnboardingManager

void __54__ENOnboardingManager__observeCameraIrisNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraIrisStateChangedWithToken:a2];
}

- (void)_cameraIrisStateChangedWithToken:(int)a3
{
  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  [(ENOnboardingManager *)self setIsCaptureSessionRunning:state64 == 1];
}

- (void)setIsCaptureSessionRunning:(BOOL)a3
{
  self->_isCaptureSessionRunning = a3;
}

- (ENOnboardingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENOnboardingManager;
  v2 = [(ENOnboardingManager *)&v6 init];
  if (v2)
  {
    v3 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F191A0]);
    callObserver = v2->_callObserver;
    v2->_callObserver = v3;

    v2->_pendingBuddyOnboarding = 0;
    [(ENOnboardingManager *)v2 _observeCameraIrisNotifications];
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_cameraIrisFrontNotifyToken);
  notify_cancel(self->_cameraIrisBackNotifyToken);
  notify_cancel(self->_cameraIrisBackTeleNotifyToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ENOnboardingManager;
  [(ENOnboardingManager *)&v4 dealloc];
}

- (BOOL)isIdealTimeForBuddy
{
  if ([(ENOnboardingManager *)self _isInLostMode]) {
    return 0;
  }
  if ([(ENOnboardingManager *)self isCaptureSessionRunning]) {
    return 0;
  }
  v3 = [(ENOnboardingManager *)self callObserver];
  objc_super v4 = [v3 calls];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 0;
  }
  if (ENIsTestContext_onceToken != -1) {
    dispatch_once(&ENIsTestContext_onceToken, &__block_literal_global_6);
  }
  return ENIsTestContext__isTestingContext || (BYSetupAssistantNeedsToRun() & 1) == 0;
}

- (BOOL)isDeviceUnlocked
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v2 = SBSGetScreenLockStatus();
  v7 = @"ExtendedDeviceLockState";
  v8[0] = MEMORY[0x1E4F1CC40];
  [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v3 = MKBGetDeviceLockState();
  return v3 != 6 && (v3 - 3) < 0xFFFFFFFE && v2 == 0;
}

- (void)setShouldObserveDeviceUnlocks:(BOOL)a3
{
  if (a3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__ENOnboardingManager_setShouldObserveDeviceUnlocks___block_invoke;
    v10[3] = &unk_1E69AE4D8;
    objc_copyWeak(&v11, &location);
    objc_super v4 = (void *)MEMORY[0x1D9439FF0](v10);
    int screenLockNotifyToken = self->_screenLockNotifyToken;
    p_int screenLockNotifyToken = &self->_screenLockNotifyToken;
    if (notify_is_valid_token(screenLockNotifyToken))
    {
      if (gLogCategory_ENOnboardingManager > 30
        || gLogCategory_ENOnboardingManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_23;
      }
    }
    else
    {
      v7 = (const char *)*MEMORY[0x1E4FA77C0];
      v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      LODWORD(v7) = notify_register_dispatch(v7, p_screenLockNotifyToken, v8, v4);

      if (v7)
      {
        if (gLogCategory_ENOnboardingManager <= 90
          && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        int *p_screenLockNotifyToken = -1;
        goto LABEL_23;
      }
      if (gLogCategory_ENOnboardingManager > 30
        || gLogCategory_ENOnboardingManager == -1 && !_LogCategory_Initialize())
      {
LABEL_23:

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
        return;
      }
    }
    LogPrintF_safe();
    goto LABEL_23;
  }
  if (self->_screenLockNotifyToken != -1)
  {
    if (gLogCategory_ENOnboardingManager <= 30
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    notify_cancel(self->_screenLockNotifyToken);
    self->_int screenLockNotifyToken = -1;
  }
}

void __53__ENOnboardingManager_setShouldObserveDeviceUnlocks___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceLockStateChangedWithToken:a2];
}

- (BOOL)_isInLostMode
{
  int v2 = [MEMORY[0x1E4F61A40] sharedInstance];
  if ([v2 lostModeIsActive]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isManagedLostModeActive];
  }

  return v3;
}

- (void)_deviceLockStateChangedWithToken:(int)a3
{
  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  objc_super v4 = [(ENOnboardingManager *)self delegate];
  if (state64 || ![(ENOnboardingManager *)self isDeviceUnlocked])
  {
    if (!CFPrefs_GetInt64())
    {
      if (gLogCategory_ENOnboardingManager <= 30
        && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      self->_pendingBuddyOnboarding = 1;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ENOnboardingManager__deviceLockStateChangedWithToken___block_invoke;
    block[3] = &unk_1E69ACBE0;
    id v6 = v4;
    v7 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__ENOnboardingManager__deviceLockStateChangedWithToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) onboardingManagerDidObserveDeviceUnlock:*(void *)(a1 + 40)];
}

- (void)_observeCameraIrisNotifications
{
  id location = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ENOnboardingManager__observeCameraIrisNotifications__block_invoke;
  v9[3] = &unk_1E69AE4D8;
  objc_copyWeak(&v10, &location);
  char v3 = (void *)MEMORY[0x1D9439FF0](v9);
  objc_super v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  LODWORD(v4) = notify_register_dispatch("com.apple.isp.frontcamerapower", &self->_cameraIrisFrontNotifyToken, v4, v3);

  if (v4)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_cameraIrisFrontNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30 {
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  uint32_t v6 = notify_register_dispatch("com.apple.isp.backcamerapower", &self->_cameraIrisBackNotifyToken, MEMORY[0x1E4F14428], v3);

  if (v6)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_cameraIrisBackNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30 {
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  p_cameraIrisBackTeleNotifyToken = &self->_cameraIrisBackTeleNotifyToken;
  uint32_t v8 = notify_register_dispatch("com.apple.isp.backtelecamerapower", p_cameraIrisBackTeleNotifyToken, MEMORY[0x1E4F14428], v3);

  if (v8)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    int *p_cameraIrisBackTeleNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30 {
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (ENOnboardingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENOnboardingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pendingBuddyOnboarding
{
  return self->_pendingBuddyOnboarding;
}

- (void)setPendingBuddyOnboarding:(BOOL)a3
{
  self->_pendingBuddyOnboarding = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (BOOL)isCaptureSessionRunning
{
  return self->_isCaptureSessionRunning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end