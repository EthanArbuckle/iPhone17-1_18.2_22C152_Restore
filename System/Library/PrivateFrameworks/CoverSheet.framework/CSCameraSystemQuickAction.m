@interface CSCameraSystemQuickAction
- (BOOL)_allowsCamera;
- (BOOL)allowsInteraction;
- (CSCameraSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5 prewarmer:(id)a6 prototypeSettings:(id)a7 defaults:(id)a8;
- (id)_prewarmReason;
- (id)_prewarmingIdentifier;
- (int64_t)_prewarmingType;
- (void)_stopTrackingPrewarm;
- (void)fireAction;
- (void)touchBegan;
- (void)touchEnded;
@end

@implementation CSCameraSystemQuickAction

- (CSCameraSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5 prewarmer:(id)a6 prototypeSettings:(id)a7 defaults:(id)a8
{
  id v15 = a5;
  id v21 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CSCameraSystemQuickAction;
  v18 = [(CSSystemQuickAction *)&v22 initWithQuickActionControlIdentity:a3 instance:a4 delegate:v15];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_prewarmer, a6);
    objc_storeStrong((id *)&v19->_prototypeSettings, a7);
    objc_storeStrong((id *)&v19->_lockScreenDefaults, a8);
    objc_storeStrong((id *)&v19->_cameraDelegate, a5);
  }

  return v19;
}

- (BOOL)allowsInteraction
{
  v5.receiver = self;
  v5.super_class = (Class)CSCameraSystemQuickAction;
  BOOL v3 = [(CSSystemQuickAction *)&v5 allowsInteraction];
  if (v3) {
    LOBYTE(v3) = [(CSCameraSystemQuickAction *)self _allowsCamera];
  }
  return v3;
}

- (BOOL)_allowsCamera
{
  cameraDelegate = self->_cameraDelegate;
  if (cameraDelegate) {
    return [(CSCameraSystemQuickActionDelegate *)cameraDelegate isCameraRestricted] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)touchBegan
{
  v15.receiver = self;
  v15.super_class = (Class)CSCameraSystemQuickAction;
  [(CSSystemQuickAction *)&v15 touchBegan];
  self->_hasFiredForTouch = 0;
  prewarmer = self->_prewarmer;
  v4 = [(CSCameraSystemQuickAction *)self _prewarmingIdentifier];
  objc_super v5 = [(CSCameraSystemQuickAction *)self _prewarmReason];
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
  v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__stopTrackingPrewarm selector:0 userInfo:0 repeats:v12];
  v14 = self->_activePrewarmTimer;
  self->_activePrewarmTimer = v13;
}

- (void)_stopTrackingPrewarm
{
  [(NSTimer *)self->_activePrewarmTimer invalidate];
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  prewarmer = self->_prewarmer;
  id v5 = [(CSCameraSystemQuickAction *)self _prewarmingIdentifier];
  [(CSCameraPrewarming *)prewarmer notePrewarmRequestEndedForIdentifier:v5];
}

- (void)fireAction
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Quick Action] Will fire action %@", buf, 0xCu);
  }

  v4 = [(CSSystemQuickAction *)self controlInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CSCameraSystemQuickAction_fireAction__block_invoke;
  v5[3] = &unk_1E6ADA358;
  v5[4] = self;
  [v4 performControlActionWithCompletion:v5];
}

uint64_t __39__CSCameraSystemQuickAction_fireAction__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[6];
  v4 = [v2 _prewarmingIdentifier];
  [v3 notePrewarmRequestWasUsefulForIdentifier:v4];

  id v5 = *(void **)(*(void *)(a1 + 32) + 72);

  return objc_msgSend(v5, "systemQuickActionActionFired:");
}

- (void)touchEnded
{
  v6.receiver = self;
  v6.super_class = (Class)CSCameraSystemQuickAction;
  [(CSSystemQuickAction *)&v6 touchEnded];
  [(NSTimer *)self->_activePrewarmTimer invalidate];
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  if (!self->_hasFiredForTouch)
  {
    prewarmer = self->_prewarmer;
    id v5 = [(CSCameraSystemQuickAction *)self _prewarmingIdentifier];
    [(CSCameraPrewarming *)prewarmer notePrewarmRequestEndedForIdentifier:v5];
  }
}

- (int64_t)_prewarmingType
{
  if ([(CSLockScreenSettings *)self->_prototypeSettings prelaunchesCameraAppOnTap]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)_prewarmingIdentifier
{
  BOOL v3 = [(CSSystemQuickAction *)self controlIdentity];
  v4 = [v3 extensionIdentity];
  id v5 = [v4 containerBundleIdentifier];

  objc_super v6 = [[CSCameraPrewarmingIdentifier alloc] initWithCameraPrewarmType:[(CSCameraSystemQuickAction *)self _prewarmingType] applicationBundleIdentifier:v5];

  return v6;
}

- (id)_prewarmReason
{
  return (id)*MEMORY[0x1E4F15908];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrewarmTimer, 0);
  objc_storeStrong((id *)&self->_cameraDelegate, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);

  objc_storeStrong((id *)&self->_prewarmer, 0);
}

@end