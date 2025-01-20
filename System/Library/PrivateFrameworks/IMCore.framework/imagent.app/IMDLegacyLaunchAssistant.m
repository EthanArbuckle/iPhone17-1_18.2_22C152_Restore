@interface IMDLegacyLaunchAssistant
+ (void)logLaunchInfo;
- (BOOL)hasDeviceName;
- (void)postAliveNotification;
- (void)prewarmHSAAuthenticationServer;
- (void)registerForInternalCoreTelephonyNotifications;
@end

@implementation IMDLegacyLaunchAssistant

- (void)prewarmHSAAuthenticationServer
{
  id v2 = +[HSAAuthenticationServer sharedInstance];
}

- (BOOL)hasDeviceName
{
  id v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (void)postAliveNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, kFZDaemonLaunchedDistNotification, 0, 0, 0);
  id v3 = +[NSNotificationCenter defaultCenter];
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", kFZDaemonFinishedLaunchingNotification, 0);
}

- (void)registerForInternalCoreTelephonyNotifications
{
  id v2 = +[FTDeviceSupport sharedInstance];
  [v2 _registerForInternalCoreTelephonyNotifications];
}

+ (void)logLaunchInfo
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = +[FTDeviceSupport sharedInstance];
      v4 = [v3 deviceInformationString];
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "imagent launching (%@)", (uint8_t *)&v8, 0xCu);
    }
  }
  v5 = +[IMLockdownManager sharedInstance];
  unsigned int v6 = [v5 isInternalInstall];

  if (v6 && IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "Dec  6 2024";
      __int16 v10 = 2080;
      v11 = "19:20:06";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "imagent built %s %s", (uint8_t *)&v8, 0x16u);
    }
  }
}

@end