@interface _ATXAppLaunchLocationGuardedData
- (void)dealloc;
@end

@implementation _ATXAppLaunchLocationGuardedData

- (void)dealloc
{
  if (self->waitForUnlockNotificationToken) {
    objc_msgSend(MEMORY[0x1E4F93B10], "unregisterForLockStateChangeNotifications:");
  }
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchLocationGuardedData;
  [(_ATXAppLaunchLocationGuardedData *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->totalIntentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->totalLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appForAllIntentsLaunchCountMap, 0);
  objc_storeStrong((id *)&self->intentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appIntentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appLaunchCountMap, 0);
  objc_storeStrong(&self->waitForUnlockNotificationToken, 0);
}

@end