@interface AXRDeviceRemoteActionHelper
+ (id)sharedInstance;
- (float)_getCurrentVolume;
- (id)_init;
- (void)_setVolumeBy:(float)a3;
- (void)performAction:(id)a3;
@end

@implementation AXRDeviceRemoteActionHelper

+ (id)sharedInstance
{
  if (qword_10000CD00 != -1) {
    dispatch_once(&qword_10000CD00, &stru_1000086A0);
  }
  v2 = (void *)qword_10000CCF8;

  return v2;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)AXRDeviceRemoteActionHelper;
  v2 = [(AXRDeviceRemoteActionHelper *)&v5 init];
  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 warm];
  }
  return v2;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = ax_remote_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "performing action: %@", (uint8_t *)&v15, 0xCu);
  }

  if (([v4 isEqualToString:AXRDeviceRemoteActionNone] & 1) == 0)
  {
    if ([v4 isEqualToString:AXRDeviceRemoteActionHome])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 activateHomeButton];
LABEL_51:

      goto LABEL_52;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionAppSwitcher])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 toggleAppSwitcher];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionNotificationCenter])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 toggleNotificationCenter];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionControlCenter])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 toggleControlCenter];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSiri])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 activateSiri];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionTVMenu])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 pressTVMenuButton];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionTVSelect])
    {
      v6 = +[AXPISystemActionHelper sharedInstance];
      [v6 pressTVSelectButton];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandActivate])
    {
      v7 = +[AXSwitchControlServer server];
      v6 = v7;
      uint64_t v8 = 1;
LABEL_50:
      [v7 triggerCommand:v8];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMenu])
    {
      v7 = +[AXSwitchControlServer server];
      v6 = v7;
      uint64_t v8 = 2;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandStartScanning])
    {
      v9 = AXSwitchControlServer;
LABEL_24:
      v7 = [v9 server];
      v6 = v7;
      uint64_t v8 = 3;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandSelect])
    {
      v10 = AXSwitchControlServer;
LABEL_27:
      v7 = [v10 server];
      v6 = v7;
      uint64_t v8 = 4;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMoveNext])
    {
      v11 = AXSwitchControlServer;
LABEL_30:
      v7 = [v11 server];
      v6 = v7;
      uint64_t v8 = 5;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMovePrevious])
    {
      v12 = AXSwitchControlServer;
LABEL_33:
      v7 = [v12 server];
      v6 = v7;
      uint64_t v8 = 6;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandStopScanning])
    {
      v7 = +[AXSwitchControlServer server];
      v6 = v7;
      uint64_t v8 = 7;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandSimpleTap])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 19;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextElement])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 9;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousElement])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 8;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextRotorOption])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 14;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousRotorOption])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 15;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextRotorItem])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 17;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousRotorItem])
    {
      v7 = +[AXVoiceOverServer server];
      v6 = v7;
      uint64_t v8 = 16;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollUpPage])
    {
      v9 = AXVoiceOverServer;
      goto LABEL_24;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollDownPage])
    {
      v10 = AXVoiceOverServer;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollLeftPage])
    {
      v11 = AXVoiceOverServer;
      goto LABEL_30;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollRightPage])
    {
      v12 = AXVoiceOverServer;
      goto LABEL_33;
    }
    if ([v4 isEqualToString:AXRDeviceRemoteActionMediaPlayPause])
    {
      uint64_t v13 = 2;
    }
    else if ([v4 isEqualToString:AXRDeviceRemoteActionMediaNextTrack])
    {
      uint64_t v13 = 4;
    }
    else
    {
      if (![v4 isEqualToString:AXRDeviceRemoteActionMediaPreviousTrack])
      {
        if ([v4 isEqualToString:AXRDeviceRemoteActionMediaVolumeUp])
        {
          LODWORD(v14) = 1028443341;
        }
        else
        {
          if (![v4 isEqualToString:AXRDeviceRemoteActionMediaVolumeDown]) {
            goto LABEL_52;
          }
          LODWORD(v14) = -1119040307;
        }
        [(AXRDeviceRemoteActionHelper *)self _setVolumeBy:v14];
        goto LABEL_52;
      }
      uint64_t v13 = 5;
    }
    sub_100004BC4(v13);
  }
LABEL_52:
}

- (float)_getCurrentVolume
{
  v2 = [sub_100004D00() sharedAVSystemController];
  float v5 = 0.0;
  [v2 getVolume:&v5 forCategory:@"MediaPlayback"];
  float v3 = v5;

  return v3;
}

- (void)_setVolumeBy:(float)a3
{
  [(AXRDeviceRemoteActionHelper *)self _getCurrentVolume];
  float v6 = v5;
  [(AXRDeviceRemoteActionHelper *)self _getCurrentVolume];
  double v8 = fmin((float)(v7 + a3), 1.0);
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  float v9 = v8;
  if (vabds_f32(v6, v9) >= 0.00000011921)
  {
    id v11 = [sub_100004D00() sharedAVSystemController];
    *(float *)&double v10 = v9;
    [v11 setVolumeTo:@"MediaPlayback" forCategory:v10];
  }
}

@end