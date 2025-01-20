@interface VOTSpringBoardConnection
+ (id)defaultConnection;
- (BOOL)isConnected;
- (__CFMachPort)_sbPort;
- (void)dealloc;
- (void)informConnectionDied;
- (void)restartConnection;
- (void)sendProgrammaticAppSwitch:(BOOL)a3;
- (void)setInPassthroughMode:(BOOL)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)showElementLabelPanel:(BOOL)a3 currentLabel:(id)a4;
- (void)showSpringBoardVOConfirmation:(BOOL)a3;
- (void)showSpringboardNoHomeButtonGestureAlert;
@end

@implementation VOTSpringBoardConnection

+ (id)defaultConnection
{
  if (AXInPreboardScenario() & 1) != 0 || (AXInCheckerBoardScenario())
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1001EB8A8 != -1) {
      dispatch_once(&qword_1001EB8A8, &stru_1001B3EC8);
    }
    id v2 = (id)qword_1001EB8A0;
  }

  return v2;
}

- (void)dealloc
{
  [(VOTSpringBoardConnection *)self informConnectionDied];
  v3.receiver = self;
  v3.super_class = (Class)VOTSpringBoardConnection;
  [(VOTSpringBoardConnection *)&v3 dealloc];
}

- (BOOL)isConnected
{
  sbPort = self->_sbPort;
  if (sbPort) {
    LOBYTE(sbPort) = CFMachPortIsValid(sbPort) != 0;
  }
  return (char)sbPort;
}

- (void)restartConnection
{
  *(void *)sp = 0;
  uint64_t v3 = bootstrap_look_up(bootstrap_port, "com.apple.SpringBoard.VOT", sp);
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      v7 = +[AXSubsystemVoiceOver identifier];
      v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = AXColorizeFormatLog();
        uint64_t v28 = v4;
        v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v11;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  uint64_t v12 = sub_10010E7A0(sp[0], 0x3A98u, &sp[1]);
  v13 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v14 = [v13 ignoreLogging];

  if ((v14 & 1) == 0)
  {
    v15 = +[AXSubsystemVoiceOver identifier];
    v16 = AXLoggerForFacility();

    os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = AXColorizeFormatLog();
      uint64_t v28 = v12;
      v19 = _AXStringForArgs();
      if (os_log_type_enabled(v16, v17))
      {
        LODWORD(buf.version) = 138543362;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v19;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  [(VOTSpringBoardConnection *)self informConnectionDied];
  if (v12 || !sp[1])
  {
    v21 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v22 = [v21 ignoreLogging];

    if ((v22 & 1) == 0)
    {
      v23 = +[AXSubsystemVoiceOver identifier];
      v24 = AXLoggerForFacility();

      os_log_type_t v25 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = AXColorizeFormatLog();
        v27 = _AXStringForArgs();
        if (os_log_type_enabled(v24, v25))
        {
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v27;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  else
  {
    memset(&buf, 0, sizeof(buf));
    self->_sbPort = CFMachPortCreateWithPort(0, sp[0], 0, &buf, 0);
    if (mach_port_mod_refs(mach_task_self_, sp[0], 0, 1) == 17)
    {
      mach_port_mod_refs(mach_task_self_, sp[0], 4u, 1);
      sp[0] = 0;
      sbPort = self->_sbPort;
      if (sbPort)
      {
        CFRelease(sbPort);
        self->_sbPort = 0;
      }
    }
    [(id)VOTSharedWorkspace handleRingerSwitchSwitched:0];
  }
}

- (void)informConnectionDied
{
  sbmach_port_name_t Port = self->_sbPort;
  if (sbPort)
  {
    mach_port_name_t Port = CFMachPortGetPort(sbPort);
    if (Port) {
      mach_port_deallocate(mach_task_self_, Port);
    }
    v5 = self->_sbPort;
    if (v5)
    {
      CFRelease(v5);
      self->_sbmach_port_name_t Port = 0;
    }
  }
}

- (__CFMachPort)_sbPort
{
  return self->_sbPort;
}

- (void)showSpringBoardVOConfirmation:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = +[VOTElement systemAppApplication];
    unsigned int v4 = [v3 isSystemSleeping];

    if (v4)
    {
      v5 = AXLogSystemApp();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFMachPortContext buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VOT requesting system-app wake-up for VO confirmation", buf, 2u);
      }

      unsigned __int8 v6 = +[AXSystemAppServer server];
      [v6 wakeUpDeviceIfNecessary];
    }
    v7 = +[AXSpringBoardServer server];
    [v7 showAlert:5 withHandler:&stru_1001B3F08];
  }
  else
  {
    id v8 = +[AXSpringBoardServer server];
    [v8 hideAlert];
  }
}

- (void)showSpringboardNoHomeButtonGestureAlert
{
  id v2 = +[AXSpringBoardServer server];
  [v2 showAlert:12 withHandler:0];
}

- (void)sendProgrammaticAppSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = +[AXSpringBoardServer server];
  unsigned __int8 v5 = [v4 isGuidedAccessActive];

  if ((v5 & 1) == 0)
  {
    id v6 = [objc_allocWithZone((Class)NSNumber) initWithBool:v3];
    sub_10003D0A4();
  }
}

- (void)showElementLabelPanel:(BOOL)a3 currentLabel:(id)a4
{
  unsigned int v4 = &kCFBooleanFalse;
  if (a3) {
    unsigned int v4 = &kCFBooleanTrue;
  }
  unsigned __int8 v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", *v4, a4, 0);
  sub_10003D0A4();
}

- (void)setInPassthroughMode:(BOOL)a3
{
  +[NSNumber numberWithBool:a3];

  sub_10003D0A4();
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  +[NSNumber numberWithBool:a3];

  sub_10003D0A4();
}

@end