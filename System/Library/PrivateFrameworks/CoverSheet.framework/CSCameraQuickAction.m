@interface CSCameraQuickAction
- (BOOL)_allowsCamera;
- (BOOL)_shouldPrelaunchOnTouch;
- (BOOL)_shouldPrewarmOnTouch;
- (BOOL)showsButton;
- (CSCameraQuickAction)initWithDelegate:(id)a3 prewarmer:(id)a4 prototypeSettings:(id)a5 defaults:(id)a6;
- (id)_containingApplicationBundleIdentifier;
- (id)_prewarmReason;
- (id)_prewarmingIdentifier;
- (id)accessibilityIdentifier;
- (id)accessoryTitleKey;
- (id)actionIdentifier;
- (id)selectedSymbolName;
- (id)statisticsIdentifier;
- (id)symbolName;
- (id)unavailableSymbolName;
- (int64_t)appearance;
- (void)_stopTrackingPrewarm;
- (void)fireAction;
- (void)touchBegan;
- (void)touchEnded;
@end

@implementation CSCameraQuickAction

- (CSCameraQuickAction)initWithDelegate:(id)a3 prewarmer:(id)a4 prototypeSettings:(id)a5 defaults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSCameraQuickAction;
  v15 = [(CSCameraQuickAction *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_delegate, a3);
    objc_storeStrong((id *)&v16->_prewarmer, a4);
    objc_storeStrong((id *)&v16->_prototypeSettings, a5);
    objc_storeStrong((id *)&v16->_lockScreenDefaults, a6);
  }

  return v16;
}

- (id)actionIdentifier
{
  return @"CSCameraQuickAction";
}

- (id)accessibilityIdentifier
{
  return @"camera-orb-button";
}

- (id)statisticsIdentifier
{
  return @"camera";
}

- (id)accessoryTitleKey
{
  return @"CAMERA_HINT_TEXT";
}

- (id)symbolName
{
  return @"camera.fill";
}

- (id)selectedSymbolName
{
  return 0;
}

- (BOOL)showsButton
{
  return 1;
}

- (int64_t)appearance
{
  if ([(CSCameraQuickAction *)self _allowsCamera]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)unavailableSymbolName
{
  return 0;
}

- (void)touchBegan
{
  self->_hasFiredForTouch = 0;
  prewarmer = self->_prewarmer;
  v4 = [(CSCameraQuickAction *)self _prewarmingIdentifier];
  v5 = [(CSCameraQuickAction *)self _prewarmReason];
  [(CSCameraPrewarming *)prewarmer prewarmCameraForIdentifier:v4 prewarmReason:v5];

  activePrewarmTimer = self->_activePrewarmTimer;
  if (activePrewarmTimer)
  {
    [(NSTimer *)activePrewarmTimer invalidate];
    v7 = self->_activePrewarmTimer;
    self->_activePrewarmTimer = 0;
  }
  v8 = [(CSLockScreenSettings *)self->_prototypeSettings dashBoardQuickActionButtonSettings];
  [v8 maximumTouchDuration];
  double v10 = v9;

  int IsZero = BSFloatIsZero();
  double v12 = v10 + 0.5;
  if (!IsZero) {
    double v12 = 2.5;
  }
  id v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__stopTrackingPrewarm selector:0 userInfo:0 repeats:v12];
  id v14 = self->_activePrewarmTimer;
  self->_activePrewarmTimer = v13;

  MEMORY[0x1F41817F8](v13, v14);
}

- (void)_stopTrackingPrewarm
{
  [(NSTimer *)self->_activePrewarmTimer invalidate];
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  prewarmer = self->_prewarmer;
  id v5 = [(CSCameraQuickAction *)self _prewarmingIdentifier];
  [(CSCameraPrewarming *)prewarmer notePrewarmRequestEndedForIdentifier:v5];
}

- (void)fireAction
{
  self->_hasFiredForTouch = 1;
  id v8 = [(CSCameraQuickAction *)self _prewarmingIdentifier];
  prewarmer = self->_prewarmer;
  uint64_t v4 = [(CSCameraQuickAction *)self _prewarmReason];
  [(CSCameraPrewarming *)prewarmer prewarmCameraForIdentifier:v8 prewarmReason:v4];

  id v5 = [(CSCameraPrewarming *)self->_prewarmer prewarmConfigurationForIdentifier:v8];
  LOBYTE(v4) = [v5 prewarmForCaptureLaunch];

  delegate = self->_delegate;
  if (v4)
  {
    v7 = [(CSCameraQuickAction *)self _containingApplicationBundleIdentifier];
    [(CSCameraQuickActionDelegate *)delegate launchCameraCapture:v7];
  }
  else
  {
    [(CSCameraQuickActionDelegate *)self->_delegate activateCameraView];
  }
  [(CSCameraPrewarming *)self->_prewarmer notePrewarmRequestWasUsefulForIdentifier:v8];
}

- (void)touchEnded
{
  [(NSTimer *)self->_activePrewarmTimer invalidate];
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  if (!self->_hasFiredForTouch)
  {
    prewarmer = self->_prewarmer;
    id v5 = [(CSCameraQuickAction *)self _prewarmingIdentifier];
    [(CSCameraPrewarming *)prewarmer notePrewarmRequestEndedForIdentifier:v5];
  }
}

- (id)_prewarmReason
{
  return (id)*MEMORY[0x1E4F15908];
}

- (BOOL)_shouldPrewarmOnTouch
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    return [(SBLockScreenDefaults *)lockScreenDefaults prewarmCameraOnButtonTouch];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    return [(CSLockScreenSettings *)prototypeSettings prewarmsCameraHardwareOnTap];
  }
}

- (BOOL)_shouldPrelaunchOnTouch
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    return [(SBLockScreenDefaults *)lockScreenDefaults prelaunchCameraOnButtonTouch];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    return [(CSLockScreenSettings *)prototypeSettings prelaunchesCameraAppOnTap];
  }
}

- (BOOL)_allowsCamera
{
  delegate = self->_delegate;
  if (delegate) {
    return [(CSCameraQuickActionDelegate *)delegate isCameraRestricted] ^ 1;
  }
  else {
    return 1;
  }
}

- (id)_containingApplicationBundleIdentifier
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 stringForKey:@"SBCameraContainingApplicationBundleIdentifier"];

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"com.apple.camera";
  }
  id v5 = v4;

  return v5;
}

- (id)_prewarmingIdentifier
{
  if ([(CSCameraQuickAction *)self _shouldPrelaunchOnTouch]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  uint64_t v4 = [CSCameraPrewarmingIdentifier alloc];
  id v5 = [(CSCameraQuickAction *)self _containingApplicationBundleIdentifier];
  v6 = [(CSCameraPrewarmingIdentifier *)v4 initWithCameraPrewarmType:v3 applicationBundleIdentifier:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrewarmTimer, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_prewarmer, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end