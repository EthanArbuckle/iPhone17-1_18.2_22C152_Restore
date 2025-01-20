@interface VOTCrashManager
+ (VOTCrashManager)sharedInstance;
- (AXDispatchTimer)crashloopTimer;
- (BOOL)didStartFromCrashState;
- (id)_init;
- (int64_t)consecutiveCrashCount;
- (void)_incrementConsecutiveCrashCount;
- (void)_resetConsecutiveCrashCount;
- (void)handleStartUp;
- (void)setCrashloopTimer:(id)a3;
- (void)setDidStartFromCrashState:(BOOL)a3;
@end

@implementation VOTCrashManager

+ (VOTCrashManager)sharedInstance
{
  if (qword_1001EB758 != -1) {
    dispatch_once(&qword_1001EB758, &stru_1001B3A68);
  }
  v2 = (void *)qword_1001EB750;

  return (VOTCrashManager *)v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTCrashManager;
  return [(VOTCrashManager *)&v3 init];
}

- (void)handleStartUp
{
  objc_super v3 = +[VOTConfiguration rootConfiguration];
  v4 = [v3 preferenceForKey:@"VOTIsRunningKey"];
  self->_didStartFromCrashState = [v4 BOOLValue];

  if (self->_didStartFromCrashState)
  {
    [(VOTCrashManager *)self _incrementConsecutiveCrashCount];
    v5 = VOTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[NSNumber numberWithInteger:[(VOTCrashManager *)self consecutiveCrashCount]];
      int v10 = 138412290;
      v11 = v6;
      v7 = "VoiceOver starting up from crash state. Consecutive crashes: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v5 = VOTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[NSNumber numberWithInteger:[(VOTCrashManager *)self consecutiveCrashCount]];
      int v10 = 138412290;
      v11 = v6;
      v7 = "VoiceOver starting up from fresh state. Consecutive crashes: %@";
      goto LABEL_6;
    }
  }

  id v8 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:0];
  [(VOTCrashManager *)self setCrashloopTimer:v8];

  v9 = [(VOTCrashManager *)self crashloopTimer];
  [v9 afterDelay:&stru_1001B3A88 processBlock:20.0];
}

- (int64_t)consecutiveCrashCount
{
  v2 = +[VOTConfiguration rootConfiguration];
  objc_super v3 = [v2 preferenceForKey:@"VOTConsecutiveCrashCount"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)_incrementConsecutiveCrashCount
{
  v2 = +[VOTConfiguration rootConfiguration];
  objc_super v3 = [v2 preferenceForKey:@"VOTConsecutiveCrashCount"];
  id v4 = (char *)[v3 integerValue];

  id v6 = +[VOTConfiguration rootConfiguration];
  v5 = +[NSNumber numberWithInteger:v4 + 1];
  [v6 setPreferenceSync:v5 forKey:@"VOTConsecutiveCrashCount"];
}

- (void)_resetConsecutiveCrashCount
{
  id v2 = +[VOTConfiguration rootConfiguration];
  [v2 setPreference:0 forKey:@"VOTConsecutiveCrashCount"];
}

- (BOOL)didStartFromCrashState
{
  return self->_didStartFromCrashState;
}

- (void)setDidStartFromCrashState:(BOOL)a3
{
  self->_didStartFromCrashState = a3;
}

- (AXDispatchTimer)crashloopTimer
{
  return self->_crashloopTimer;
}

- (void)setCrashloopTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end