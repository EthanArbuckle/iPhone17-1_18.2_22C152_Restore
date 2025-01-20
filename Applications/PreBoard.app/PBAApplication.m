@interface PBAApplication
+ (BOOL)registerAsSystemApp;
+ (id)_newApplicationInitializationContext;
- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)_handlePhysicalButtonEvent:(id)a3;
- (BOOL)_hostsSystemStatusBar;
- (BOOL)_isSpringBoard;
- (BOOL)disablesFrontBoardImplicitWindowScenes;
- (NSTimer)lockButtonTimer;
- (PBAApplication)init;
- (PBAIdleSleepController)idleSleepController;
- (void)_cancelLockButtonTimer;
- (void)_handleHIDEvent:(__IOHIDEvent *)a3;
- (void)_lockButtonDown;
- (void)_lockButtonLongPress;
- (void)_lockButtonUp;
- (void)_smartCoverClosed;
- (void)_smartCoverOpen;
- (void)_startLockButtonTimer;
- (void)setIdleSleepController:(id)a3;
- (void)setLockButtonTimer:(id)a3;
@end

@implementation PBAApplication

- (PBAApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)PBAApplication;
  v2 = [(PBAApplication *)&v5 init];
  if (v2)
  {
    v3 = +[PBAIdleSleepController sharedController];
    [(PBAApplication *)v2 setIdleSleepController:v3];
  }
  return v2;
}

+ (id)_newApplicationInitializationContext
{
  v2 = +[UISMutableApplicationInitializationContext defaultContext];
  v3 = +[FBSceneManager sharedInstance];
  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 bundleIdentifier];
  v6 = +[FBSSceneIdentity identityForIdentifier:v5];
  id v7 = [v3 newSceneIdentityTokenForIdentity:v6];

  [v2 setDefaultSceneToken:v7];
  return v2;
}

- (BOOL)_hostsSystemStatusBar
{
  return 0;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 0;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetType() != 3) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  int v5 = IOHIDEventGetIntegerValue();
  uint64_t v6 = IOHIDEventGetIntegerValue();
  id v7 = sub_1000085D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109632;
    v10[1] = IntegerValue;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v6 != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "usagePage: 0x%x usage: 0x%x downEvent: %d", (uint8_t *)v10, 0x14u);
  }

  if ((v5 | (IntegerValue << 16)) != 0xC0030)
  {
    if (IntegerValue == 65289)
    {
      int SmartCoverStateFromEvent = BKSHIDEventGetSmartCoverStateFromEvent();
      if (SmartCoverStateFromEvent == 3)
      {
        [(PBAApplication *)self _smartCoverClosed];
      }
      else if (SmartCoverStateFromEvent == 1)
      {
        [(PBAApplication *)self _smartCoverOpen];
      }
    }
    return 0;
  }
  if (v6) {
    [(PBAApplication *)self _lockButtonDown];
  }
  else {
    [(PBAApplication *)self _lockButtonUp];
  }
  return 1;
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  if (!-[PBAApplication __handleHIDEvent:](self, "__handleHIDEvent:"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PBAApplication;
    [(PBAApplication *)&v5 _handleHIDEvent:a3];
  }
}

- (BOOL)_handlePhysicalButtonEvent:(id)a3
{
  id v4 = [a3 _hidEvent];
  if (v4) {
    return ![(PBAApplication *)self __handleHIDEvent:v4];
  }
  else {
    return 1;
  }
}

- (void)_lockButtonDown
{
  if ([(PBAIdleSleepController *)self->_idleSleepController isDisplayDim])
  {
    idleSleepController = self->_idleSleepController;
    [(PBAIdleSleepController *)idleSleepController resetIdleTimerAndUndim:1];
  }
  else
  {
    [(PBAApplication *)self _startLockButtonTimer];
  }
}

- (void)_lockButtonLongPress
{
  v3 = sub_1000085D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down device", v8, 2u);
  }

  id v4 = objc_alloc((Class)FBSShutdownOptions);
  objc_super v5 = NSStringFromSelector(a2);
  id v6 = [v4 initWithReason:v5];

  [v6 setSource:1];
  id v7 = +[FBSystemService sharedInstance];
  [v7 shutdownUsingOptions:v6];
}

- (void)_smartCoverOpen
{
  if ([(PBAIdleSleepController *)self->_idleSleepController isDisplayDim])
  {
    idleSleepController = self->_idleSleepController;
    [(PBAIdleSleepController *)idleSleepController resetIdleTimerAndUndim:1];
  }
}

- (void)_smartCoverClosed
{
  if (![(PBAIdleSleepController *)self->_idleSleepController isDisplayDim])
  {
    idleSleepController = self->_idleSleepController;
    [(PBAIdleSleepController *)idleSleepController dimDisplay];
  }
}

- (void)_startLockButtonTimer
{
  id v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_lockButtonLongPress" selector:0 userInfo:0 repeats:10.0];
  [(PBAApplication *)self setLockButtonTimer:v3];
}

- (void)_cancelLockButtonTimer
{
}

- (void)setLockButtonTimer:(id)a3
{
  p_lockButtonTimer = &self->_lockButtonTimer;
  if (self->_lockButtonTimer != a3)
  {
    [(NSTimer *)*p_lockButtonTimer invalidate];
    objc_storeStrong((id *)p_lockButtonTimer, a3);
  }

  _objc_release_x1();
}

- (void)_lockButtonUp
{
  id v3 = [(PBAApplication *)self lockButtonTimer];

  [(PBAApplication *)self _cancelLockButtonTimer];
  if (v3)
  {
    idleSleepController = self->_idleSleepController;
    [(PBAIdleSleepController *)idleSleepController dimDisplay];
  }
}

- (NSTimer)lockButtonTimer
{
  return self->_lockButtonTimer;
}

- (PBAIdleSleepController)idleSleepController
{
  return self->_idleSleepController;
}

- (void)setIdleSleepController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleSleepController, 0);

  objc_storeStrong((id *)&self->_lockButtonTimer, 0);
}

@end