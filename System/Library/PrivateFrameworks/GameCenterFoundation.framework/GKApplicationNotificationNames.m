@interface GKApplicationNotificationNames
+ (id)didEnterBackground;
+ (id)willEnterForeground;
+ (id)willTerminate;
@end

@implementation GKApplicationNotificationNames

+ (id)didEnterBackground
{
  return @"UIApplicationDidEnterBackgroundNotification";
}

+ (id)willEnterForeground
{
  return @"UIApplicationWillEnterForegroundNotification";
}

+ (id)willTerminate
{
  return @"UIApplicationWillTerminateNotification";
}

@end