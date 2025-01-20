@interface MPVolumeHardwareButtonController
+ (MPVolumeHardwareButtonController)sharedController;
- (MPVolumeControllerDataSource)activeDataSource;
- (double)_calculateButtonRepeatDelay;
- (id)_init;
- (void)_applicationDidBecomeActiveNotification;
- (void)_applicationWillResignActiveNotification;
- (void)_changeVolumeBy:(double)a3;
- (void)_commitVolumeChange;
- (void)_registerForButtonNotificationsIfNeeded;
- (void)_unregisterForButtonNotificationsIfNeeded;
- (void)_volumeDownButtonTouchDown:(id)a3;
- (void)_volumeDownButtonTouchUp:(id)a3;
- (void)_volumeUpButtonTouchDown:(id)a3;
- (void)_volumeUpButtonTouchUp:(id)a3;
- (void)cancelVolumeEvent;
- (void)decreaseVolume;
- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4;
- (void)handleVolumeDownButton;
- (void)handleVolumeUpButton;
- (void)increaseVolume;
- (void)setActiveDataSource:(id)a3;
@end

@implementation MPVolumeHardwareButtonController

void __52__MPVolumeHardwareButtonController_sharedController__block_invoke()
{
  id v0 = [[MPVolumeHardwareButtonController alloc] _init];
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)MPVolumeHardwareButtonController;
  v2 = [(MPVolumeHardwareButtonController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__applicationDidBecomeActiveNotification name:*MEMORY[0x1E4FB2628] object:0];
    [v3 addObserver:v2 selector:sel__applicationWillResignActiveNotification name:*MEMORY[0x1E4FB2738] object:0];
  }
  return v2;
}

- (void)_applicationDidBecomeActiveNotification
{
  activeDataSource = self->_activeDataSource;
  if (activeDataSource
    && [(MPVolumeControllerDataSource *)activeDataSource applicationShouldOverrideHardwareVolumeBehavior])
  {
    [(MPVolumeHardwareButtonController *)self _registerForButtonNotificationsIfNeeded];
  }
  else
  {
    [(MPVolumeHardwareButtonController *)self _unregisterForButtonNotificationsIfNeeded];
  }
}

- (void)setActiveDataSource:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (MPVolumeControllerDataSource *)a3;
  p_activeDataSource = (id *)&self->_activeDataSource;
  if (self->_activeDataSource != v5)
  {
    objc_storeStrong((id *)&self->_activeDataSource, a3);
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Volume dataSource changed to: %{public}@", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [(MPVolumeHardwareButtonController *)self cancelVolumeEvent];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__MPVolumeHardwareButtonController_setActiveDataSource___block_invoke;
      block[3] = &unk_1E57F9EA8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    if (*p_activeDataSource
      && [*p_activeDataSource applicationShouldOverrideHardwareVolumeBehavior])
    {
      [(MPVolumeHardwareButtonController *)self _registerForButtonNotificationsIfNeeded];
    }
    else
    {
      [(MPVolumeHardwareButtonController *)self _unregisterForButtonNotificationsIfNeeded];
    }
    [(MPVolumeControllerDataSource *)self->_activeDataSource reload];
    [(MPVolumeControllerDataSource *)self->_activeDataSource volume];
    self->_pendingVolumeChange = v8;
  }
}

- (void)_registerForButtonNotificationsIfNeeded
{
  if (!self->_didRegisterForButtonNotifications)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__volumeUpButtonTouchDown_ name:*MEMORY[0x1E4FB3190] object:0];
    [v4 addObserver:self selector:sel__volumeUpButtonTouchUp_ name:*MEMORY[0x1E4FB3198] object:0];
    [v4 addObserver:self selector:sel__volumeDownButtonTouchDown_ name:*MEMORY[0x1E4FB3180] object:0];
    [v4 addObserver:self selector:sel__volumeDownButtonTouchUp_ name:*MEMORY[0x1E4FB3188] object:0];
    v3 = MPUIApplication();
    [v3 setWantsVolumeButtonEvents:1];

    self->_didRegisterForButtonNotifications = 1;
  }
}

- (void)cancelVolumeEvent
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  v3 = (void *)MEMORY[0x1E4FBA8A8];

  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
}

+ (MPVolumeHardwareButtonController)sharedController
{
  if (sharedController_onceToken_26971 != -1) {
    dispatch_once(&sharedController_onceToken_26971, &__block_literal_global_26972);
  }
  v2 = (void *)sharedController_controller;

  return (MPVolumeHardwareButtonController *)v2;
}

- (void)_unregisterForButtonNotificationsIfNeeded
{
  if (self->_didRegisterForButtonNotifications)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB3190] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB3198] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB3180] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB3188] object:0];
    v3 = MPUIApplication();
    [v3 setWantsVolumeButtonEvents:0];

    self->_didRegisterForButtonNotifications = 0;
  }
}

- (void).cxx_destruct
{
}

- (MPVolumeControllerDataSource)activeDataSource
{
  return self->_activeDataSource;
}

- (void)_applicationWillResignActiveNotification
{
  [(MPVolumeHardwareButtonController *)self _unregisterForButtonNotificationsIfNeeded];

  [(MPVolumeHardwareButtonController *)self cancelVolumeEvent];
}

- (void)_volumeDownButtonTouchUp:(id)a3
{
}

- (void)_volumeDownButtonTouchDown:(id)a3
{
}

- (void)_volumeUpButtonTouchUp:(id)a3
{
}

- (void)_volumeUpButtonTouchDown:(id)a3
{
}

- (void)handleVolumeUpButton
{
  [(MPVolumeControllerDataSource *)self->_activeDataSource volume];
  self->_pendingVolumeChange = v3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
  self->_debounceVolumeRepeat = 1;

  [(MPVolumeHardwareButtonController *)self increaseVolume];
}

- (void)handleVolumeDownButton
{
  [(MPVolumeControllerDataSource *)self->_activeDataSource volume];
  self->_pendingVolumeChange = v3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  self->_debounceVolumeRepeat = 1;

  [(MPVolumeHardwareButtonController *)self decreaseVolume];
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v8 = @"unknown";
    if (a3 == 102) {
      float v8 = @"VOL+";
    }
    if (a3 == 103) {
      float v8 = @"VOL-";
    }
    v9 = v8;
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Received hardware volume event: %{public}@, pressed: %{BOOL}u", (uint8_t *)&v10, 0x12u);
  }
  if (a3 == 102)
  {
    if (v4)
    {
      [(MPVolumeHardwareButtonController *)self handleVolumeUpButton];
      return;
    }
  }
  else
  {
    if (a3 != 103) {
      return;
    }
    if (v4)
    {
      [(MPVolumeHardwareButtonController *)self handleVolumeDownButton];
      return;
    }
  }
  [(MPVolumeHardwareButtonController *)self cancelVolumeEvent];
}

- (void)decreaseVolume
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
  [(MPVolumeHardwareButtonController *)self _changeVolumeBy:-0.0625];
  [(MPVolumeHardwareButtonController *)self _calculateButtonRepeatDelay];
  double v4 = v3;
  v6[0] = *MEMORY[0x1E4F1C4B0];
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MPVolumeHardwareButtonController *)self performSelector:sel_decreaseVolume withObject:0 afterDelay:v5 inModes:v4];

  self->_debounceVolumeRepeat = 0;
}

- (void)increaseVolume
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  [(MPVolumeHardwareButtonController *)self _changeVolumeBy:0.0625];
  [(MPVolumeHardwareButtonController *)self _calculateButtonRepeatDelay];
  double v4 = v3;
  v6[0] = *MEMORY[0x1E4F1C4B0];
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MPVolumeHardwareButtonController *)self performSelector:sel_increaseVolume withObject:0 afterDelay:v5 inModes:v4];

  self->_debounceVolumeRepeat = 0;
}

- (double)_calculateButtonRepeatDelay
{
  return dbl_195689870[!self->_debounceVolumeRepeat];
}

- (void)_commitVolumeChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double pendingVolumeChange = self->_pendingVolumeChange;
    int v6 = 134217984;
    double v7 = pendingVolumeChange;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Committing volume change to: %f", (uint8_t *)&v6, 0xCu);
  }

  double v5 = self->_pendingVolumeChange;
  *(float *)&double v5 = v5;
  [(MPVolumeControllerDataSource *)self->_activeDataSource setVolume:v5];
  [(MPVolumeHardwareButtonController *)self cancelVolumeEvent];
}

- (void)_changeVolumeBy:(double)a3
{
  double v3 = -a3;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (v3 > 0.00000011920929)
  {
    double v4 = self->_pendingVolumeChange + a3;
    if (v4 < 0.0) {
      double v4 = 0.0;
    }
    self->_double pendingVolumeChange = fmin(v4, 1.0);
    [(MPVolumeHardwareButtonController *)self _commitVolumeChange];
  }
}

uint64_t __56__MPVolumeHardwareButtonController_setActiveDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelVolumeEvent];
}

@end