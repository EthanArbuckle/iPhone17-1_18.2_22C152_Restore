@interface DTExposureNotificationSettings
- (DTExposureNotificationSettings)init;
@end

@implementation DTExposureNotificationSettings

- (DTExposureNotificationSettings)init
{
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v4 = [v3 firstObject];

  v5 = [v4 stringByAppendingPathComponent:@"PreferenceBundles"];
  v6 = [v5 stringByAppendingPathComponent:@"ENDeveloperSettings.bundle"];
  v7 = +[NSBundle bundleWithPath:v6];
  v8 = (DTExposureNotificationSettings *)objc_alloc_init((Class)[v7 principalClass]);

  return v8;
}

@end