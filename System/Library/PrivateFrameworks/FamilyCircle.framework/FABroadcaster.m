@interface FABroadcaster
+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4;
+ (void)broadcastFamilyChangedNotification;
+ (void)broadcastFamilyMarqueeChangedNotification;
+ (void)broadcastRemoteUIWillDismissNotification:(id)a3;
+ (void)broadcastServicesChangedNotification;
@end

@implementation FABroadcaster

+ (void)broadcastFamilyChangedNotification
{
}

+ (void)broadcastFamilyMarqueeChangedNotification
{
}

+ (void)broadcastServicesChangedNotification
{
}

+ (void)broadcastRemoteUIWillDismissNotification:(id)a3
{
}

+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  id v6 = a4;
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "+[FABroadcaster _broadcastNotificationName:userInfo:]";
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, v6, 0, 1u);
  v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v9 postNotificationName:v5 object:0 userInfo:v6];
}

@end