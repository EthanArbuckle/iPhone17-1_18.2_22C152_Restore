@interface TransportRestrictedModeService
- (TransportRestrictedModeService)initWithNotificationQueue:(id)a3;
- (int)entryPoint_onDaemonStarted;
- (int)entryPoint_onDaemonStarted_inBaseSystem;
- (int)entryPoint_onXPCEventWithName:(id)a3;
- (int)fetchFromKextAndSaveToFileWithKey:(unsigned int)a3;
- (int)loadFromFileAndPushToKextWithKey:(unsigned int)a3;
- (int)onDeviceLostStatusChanged;
- (int)onKextNotificationArrivedWithPropertyName:(id)a3;
- (int)onManagedConfigurationChanged;
- (int)onSaveData:(id *)a3;
- (int)onScheduleWakeup:(id *)a3;
- (int)prepareDataDir;
- (int)purgeLegacyFiles;
- (int)sendNotificationACKWithPropertyName:(id)a3;
- (void)cancelAlarm;
- (void)entryPoint_onAlarm;
- (void)handleXPCEventWithName:(id)a3;
- (void)setAlarm:(double)a3;
- (void)start;
@end

@implementation TransportRestrictedModeService

- (TransportRestrictedModeService)initWithNotificationQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TransportRestrictedModeService;
  v3 = [(DaemonService *)&v9 initWithNotificationQueue:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(DaemonService *)v3 notificationQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002280;
    handler[3] = &unk_1000182F8;
    v8 = v4;
    xpc_set_event_stream_handler("com.apple.alarm", v5, handler);
  }
  return v4;
}

- (void)start
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "ACMTRM-D";
    __int16 v5 = 2080;
    v6 = "-[TransportRestrictedModeService start]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, .\n", (uint8_t *)&v3, 0x16u);
  }
  if (sub_1000014B0()) {
    [(TransportRestrictedModeService *)self entryPoint_onDaemonStarted_inBaseSystem];
  }
  else {
    [(TransportRestrictedModeService *)self entryPoint_onDaemonStarted];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "ACMTRM-D";
    __int16 v5 = 2080;
    v6 = "-[TransportRestrictedModeService start]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, .\n", (uint8_t *)&v3, 0x16u);
  }
}

- (void)handleXPCEventWithName:(id)a3
{
}

- (int)prepareDataDir
{
  v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/root/Library/USBRestricted/"];

  if (v3) {
    return 0;
  }
  v4 = +[NSFileManager defaultManager];
  uint64_t v7 = 0;
  [v4 createDirectoryAtPath:@"/var/root/Library/USBRestricted/" withIntermediateDirectories:1 attributes:0 error:&v7];
  uint64_t v5 = v7;

  if (!v5) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v9 = "ACMTRM-D";
    __int16 v10 = 2080;
    v11 = "-[TransportRestrictedModeService prepareDataDir]";
    __int16 v12 = 2048;
    uint64_t v13 = -5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return -5;
}

- (int)purgeLegacyFiles
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    unsigned __int8 v3 = (&off_100018318)[i];
    v4 = +[NSFileManager defaultManager];
    uint64_t v5 = +[NSString stringWithUTF8String:v3];
    [v4 removeItemAtPath:v5 error:0];
  }
  return 0;
}

- (int)entryPoint_onDaemonStarted_inBaseSystem
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, .\n", (uint8_t *)&v4, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: acmd started in BaseSystem, handing control over to kext.\n", (uint8_t *)&v4, 0x16u);
  }
  int v2 = ACMKernelControl(33);
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    __int16 v8 = 2048;
    uint64_t v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v4, 0x20u);
  }
  return v2;
}

- (int)entryPoint_onDaemonStarted
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "ACMTRM-D";
    __int16 v14 = 2080;
    v15 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, .\n", buf, 0x16u);
  }
  unsigned int v3 = [(TransportRestrictedModeService *)self prepareDataDir];
  if (v3
    || (unsigned int v3 = [(TransportRestrictedModeService *)self purgeLegacyFiles]) != 0
    || (unsigned int v3 = [(TransportRestrictedModeService *)self loadFromFileAndPushToKextWithKey:1]) != 0|| (unsigned int v3 = [(TransportRestrictedModeService *)self loadFromFileAndPushToKextWithKey:2]) != 0|| (unsigned int v3 = [(TransportRestrictedModeService *)self loadFromFileAndPushToKextWithKey:3]) != 0|| (unsigned int v3 = [(TransportRestrictedModeService *)self loadFromFileAndPushToKextWithKey:4]) != 0)
  {
    int v10 = v3;
LABEL_20:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "ACMTRM-D";
      __int16 v14 = 2080;
      v15 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
      __int16 v16 = 2048;
      v17 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
    }
    return v10;
  }
  unsigned int v4 = sub_100002A9C();
  int v5 = sub_1000013D8();
  int v6 = sub_100001444();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = "ACMTRM-D";
    uint64_t v7 = "YES";
    *(_DWORD *)buf = 136316418;
    v15 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
    __int16 v14 = 2080;
    if (v4) {
      __int16 v8 = "YES";
    }
    else {
      __int16 v8 = "NO";
    }
    __int16 v16 = 2080;
    v17 = v8;
    if (v5) {
      uint64_t v9 = "YES";
    }
    else {
      uint64_t v9 = "NO";
    }
    __int16 v18 = 2080;
    if (!v6) {
      uint64_t v7 = "NO";
    }
    v19 = "NO";
    __int16 v20 = 2080;
    v21 = v9;
    __int16 v22 = 2080;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: acmd started, handing control over to kext (TRM allowed by ManagedConfiguration: %s, disabled by AppleSetup: %s, isInternalBuild: %s, isUSBTypeCSupported: %s).\n", buf, 0x3Eu);
  }
  int v10 = ACMKernelControl(3);
  if (v10) {
    goto LABEL_20;
  }
  return v10;
}

- (int)entryPoint_onXPCEventWithName:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "ACMTRM-D";
    __int16 v10 = 2080;
    v11 = "-[TransportRestrictedModeService entryPoint_onXPCEventWithName:]";
    __int16 v12 = 2080;
    id v13 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, eventName=%s.\n", (uint8_t *)&v8, 0x20u);
  }
  if ([v4 isEqualToString:@"ACMTRMEvent_ScheduleWakeup"])
  {
LABEL_8:
    unsigned int v6 = [(TransportRestrictedModeService *)self onKextNotificationArrivedWithPropertyName:v4];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"ACMTRMEvent_SaveData"]
    || [v4 isEqualToString:@"ACMTRMEvent_CheckAppleSetup"])
  {
    if (sub_1000014B0())
    {
LABEL_7:
      int v5 = 0;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"AppleSetupCookieChanged"])
  {
    if (sub_1000014B0()) {
      goto LABEL_7;
    }
    unsigned int v6 = sub_100002D1C((uint64_t)"cookie");
  }
  else if ([v4 isEqualToString:@"com.apple.managedconfiguration.effectivesettingschanged"])
  {
    if (sub_1000014B0()) {
      goto LABEL_7;
    }
    unsigned int v6 = [(TransportRestrictedModeService *)self onManagedConfigurationChanged];
  }
  else
  {
    if (![v4 isEqualToString:kLostModeChangedNotification] || !objc_opt_class()) {
      goto LABEL_7;
    }
    unsigned int v6 = [(TransportRestrictedModeService *)self onDeviceLostStatusChanged];
  }
LABEL_9:
  int v5 = v6;
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "ACMTRM-D";
    __int16 v10 = 2080;
    v11 = "-[TransportRestrictedModeService entryPoint_onXPCEventWithName:]";
    __int16 v12 = 2048;
    id v13 = (id)v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
LABEL_12:

  return v5;
}

- (int)sendNotificationACKWithPropertyName:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    __int16 v16 = "-[TransportRestrictedModeService sendNotificationACKWithPropertyName:]";
    __int16 v17 = 2080;
    id v18 = [v3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: [COM] SENDING ACK %s.\n", buf, 0x20u);
  }
  char v19 = 0;
  id v4 = v3;
  strncpy((char *)buf, (const char *)[v4 UTF8String], 0x3FuLL);
  int v5 = 0;
  if (ACMKernelControl(7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      int v8 = "ACMTRM-D";
      __int16 v9 = 2080;
      __int16 v10 = "-[TransportRestrictedModeService sendNotificationACKWithPropertyName:]";
      __int16 v11 = 2048;
      uint64_t v12 = -5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
    }
    int v5 = -5;
  }

  return v5;
}

- (int)onKextNotificationArrivedWithPropertyName:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000163C(v4);
  if (![v5 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      uint64_t v12 = "ACMTRM-D";
      __int16 v13 = 2080;
      __int16 v14 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
      __int16 v15 = 2080;
      id v16 = [v4 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: [COM] IGNORING EMPTY %s.\n", (uint8_t *)&v11, 0x20u);
    }
    goto LABEL_14;
  }
  if ([v5 length] != (id)12)
  {
    int v9 = -5;
    goto LABEL_19;
  }
  unsigned int v6 = (int *)[v5 bytes];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMTRM-D";
    __int16 v13 = 2080;
    __int16 v14 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
    __int16 v15 = 2080;
    id v16 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: [COM] PROCESSING %s.\n", (uint8_t *)&v11, 0x20u);
  }
  int v7 = *v6;
  if (*v6 == 3)
  {
    unsigned int v8 = sub_100002D1C((uint64_t)"kext");
    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (v7 == 2)
  {
    unsigned int v8 = [(TransportRestrictedModeService *)self onSaveData:v6];
    if (v8) {
      goto LABEL_9;
    }
LABEL_13:
    [(TransportRestrictedModeService *)self sendNotificationACKWithPropertyName:v4];
LABEL_14:
    int v9 = 0;
    goto LABEL_15;
  }
  if (v7 == 1)
  {
    unsigned int v8 = [(TransportRestrictedModeService *)self onScheduleWakeup:v6];
    if (v8)
    {
LABEL_9:
      int v9 = v8;
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  int v9 = -3;
LABEL_19:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMTRM-D";
    __int16 v13 = 2080;
    __int16 v14 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
    __int16 v15 = 2048;
    id v16 = (id)v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
LABEL_15:

  return v9;
}

- (int)onManagedConfigurationChanged
{
  unsigned int v2 = sub_100002A9C();
  if (byte_10001C348 == v2) {
    int v3 = byte_10001C370;
  }
  else {
    int v3 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v4 = "NO";
    int v7 = 136315906;
    unsigned int v8 = "ACMTRM-D";
    if (v2) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    __int16 v10 = "-[TransportRestrictedModeService onManagedConfigurationChanged]";
    __int16 v9 = 2080;
    __int16 v11 = 2080;
    uint64_t v12 = (uint64_t)v5;
    if (!v3) {
      id v4 = "YES";
    }
    __int16 v13 = 2080;
    __int16 v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: TRM allowed by ManagedConfiguration: %s (willPublish=%s).\n", (uint8_t *)&v7, 0x2Au);
  }
  if (v3) {
    return 0;
  }
  int v7 = 1;
  LOBYTE(v8) = v2;
  int result = ACMKernelControl(6);
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      unsigned int v8 = "ACMTRM-D";
      __int16 v9 = 2080;
      __int16 v10 = "-[TransportRestrictedModeService onManagedConfigurationChanged]";
      __int16 v11 = 2048;
      uint64_t v12 = -5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
    }
    return -5;
  }
  else
  {
    byte_10001C370 = 1;
    byte_10001C348 = v2;
  }
  return result;
}

- (int)onDeviceLostStatusChanged
{
  unsigned int v2 = +[FMDFMIPManager sharedInstance];
  int v3 = [v2 lockdownShouldDisableDevicePairing];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v4 = "NO";
    int v6 = 136315650;
    int v7 = "ACMTRM-D";
    __int16 v9 = "-[TransportRestrictedModeService onDeviceLostStatusChanged]";
    __int16 v8 = 2080;
    if (v3) {
      id v4 = "YES";
    }
    __int16 v10 = 2080;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: lostModeIsActive = %s.\n", (uint8_t *)&v6, 0x20u);
  }
  if (v3)
  {
    int v6 = 2;
    int v3 = ACMKernelControl(4);
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315650;
        int v7 = "ACMTRM-D";
        __int16 v8 = 2080;
        __int16 v9 = "-[TransportRestrictedModeService onDeviceLostStatusChanged]";
        __int16 v10 = 2048;
        __int16 v11 = (const char *)v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v6, 0x20u);
      }
    }
  }
  return v3;
}

- (int)onScheduleWakeup:(id *)a3
{
  unint64_t v3 = *(void *)(&a3->var0 + 1);
  if (v3) {
    [(TransportRestrictedModeService *)self setAlarm:(double)v3];
  }
  else {
    [(TransportRestrictedModeService *)self cancelAlarm];
  }
  return 0;
}

- (int)loadFromFileAndPushToKextWithKey:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    id v16 = "ACMTRM-D";
    __int16 v17 = 2080;
    id v18 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
    __int16 v19 = 1024;
    LODWORD(v20) = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, key=%u.\n", (uint8_t *)&v15, 0x1Cu);
  }
  unsigned int v4 = a3 - 1;
  if (a3 - 1 <= 3)
  {
    int v5 = (&off_1000183A8)[v4];
    int v6 = (&off_100018368)[v4];
    int v7 = sub_100001660((uint64_t)v5);
    __int16 v8 = v7;
    if (!v7 || ![v7 length])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315650;
        id v16 = "ACMTRM-D";
        __int16 v17 = 2080;
        id v18 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
        __int16 v19 = 2080;
        uint64_t v20 = (uint64_t)v5;
        uint64_t v12 = "%s: %s: '%s' not loaded.\n";
        uint32_t v13 = 32;
        goto LABEL_11;
      }
LABEL_12:

      return 0;
    }
    __int16 v9 = +[NSString stringWithUTF8String:v6];
    BOOL v10 = sub_10000164C(v9, v8);

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unsigned int v11 = [v8 length];
        int v15 = 136315906;
        id v16 = "ACMTRM-D";
        __int16 v17 = 2080;
        id v18 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
        __int16 v19 = 2080;
        uint64_t v20 = (uint64_t)v5;
        __int16 v21 = 1024;
        unsigned int v22 = v11;
        uint64_t v12 = "%s: %s: '%s' loaded (len=%u).\n";
        uint32_t v13 = 38;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, v13);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    id v16 = "ACMTRM-D";
    __int16 v17 = 2080;
    id v18 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
    __int16 v19 = 2048;
    uint64_t v20 = -5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v15, 0x20u);
  }
  return -5;
}

- (int)fetchFromKextAndSaveToFileWithKey:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint32_t v13 = "ACMTRM-D";
    __int16 v14 = 2080;
    int v15 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
    __int16 v16 = 1024;
    LODWORD(v17) = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, key=%u.\n", (uint8_t *)&v12, 0x1Cu);
  }
  unsigned int v4 = a3 - 1;
  if (a3 - 1 > 3)
  {
    int v10 = -5;
  }
  else
  {
    int v5 = (&off_1000183A8)[v4];
    int v6 = +[NSString stringWithUTF8String:(&off_100018388)[v4]];
    int v7 = sub_10000163C(v6);

    if (!v7 || ![v7 length])
    {
LABEL_9:

      return 0;
    }
    int v8 = sub_100001778(v5, v7, 0);
    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unsigned int v9 = [v7 length];
        int v12 = 136315906;
        uint32_t v13 = "ACMTRM-D";
        __int16 v14 = 2080;
        int v15 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
        __int16 v16 = 2080;
        __int16 v17 = v5;
        __int16 v18 = 1024;
        unsigned int v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: '%s' saved (len=%u).\n", (uint8_t *)&v12, 0x26u);
      }
      goto LABEL_9;
    }
    int v10 = v8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint32_t v13 = "ACMTRM-D";
    __int16 v14 = 2080;
    int v15 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
    __int16 v16 = 2048;
    __int16 v17 = (const char *)v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v12, 0x20u);
  }
  return v10;
}

- (int)onSaveData:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    unsigned int var1 = a3->var1;
    int v9 = 136315650;
    int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    int v12 = "-[TransportRestrictedModeService onSaveData:]";
    __int16 v13 = 1024;
    LODWORD(v14) = var1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, (gen=%u).\n", (uint8_t *)&v9, 0x1Cu);
  }
  unsigned int v6 = [(TransportRestrictedModeService *)self fetchFromKextAndSaveToFileWithKey:1];
  if (v6
    || (unsigned int v6 = [(TransportRestrictedModeService *)self fetchFromKextAndSaveToFileWithKey:2]) != 0|| (unsigned int v6 = [(TransportRestrictedModeService *)self fetchFromKextAndSaveToFileWithKey:3]) != 0)
  {
    int v7 = v6;
  }
  else
  {
    int v7 = [(TransportRestrictedModeService *)self fetchFromKextAndSaveToFileWithKey:4];
    if (!v7) {
      return v7;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    int v12 = "-[TransportRestrictedModeService onSaveData:]";
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return v7;
}

- (void)setAlarm:(double)a3
{
  unint64_t v4 = (unint64_t)a3;
  unint64_t v5 = sub_100001398();
  unint64_t v6 = v5 + 30;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = "NO";
    int v9 = 136316418;
    int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    int v12 = "-[TransportRestrictedModeService setAlarm:]";
    if (v6 < v4) {
      int v7 = "YES";
    }
    __int16 v13 = 2048;
    unint64_t v14 = v4;
    __int16 v15 = 2080;
    __int16 v16 = v7;
    __int16 v17 = 2048;
    unint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = 30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: requestedAlarmTime=%llu willSchedule=%s (now=%llu threshold=%llus).\n", (uint8_t *)&v9, 0x3Eu);
  }
  if (v6 < v4)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_date(v8, "Date", (uint64_t)(a3 * 1000000000.0));
    xpc_set_event();
  }
}

- (void)cancelAlarm
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    unint64_t v3 = "ACMTRM-D";
    __int16 v4 = 2080;
    unint64_t v5 = "-[TransportRestrictedModeService cancelAlarm]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, .\n", (uint8_t *)&v2, 0x16u);
  }
  xpc_set_event();
}

- (void)entryPoint_onAlarm
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    unint64_t v3 = "ACMTRM-D";
    __int16 v4 = 2080;
    unint64_t v5 = "-[TransportRestrictedModeService entryPoint_onAlarm]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called, wake-up alarm triggered.\n", (uint8_t *)&v2, 0x16u);
  }
  ACMKernelControl(30);
}

@end