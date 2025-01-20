@interface DTVideoSubscriberAccountSettings
- (DTVideoSubscriberAccountSettings)init;
@end

@implementation DTVideoSubscriberAccountSettings

- (DTVideoSubscriberAccountSettings)init
{
  v3 = +[NSProcessInfo processInfo];
  v4 = [v3 environment];
  uint64_t v5 = [v4 objectForKey:@"SIMULATOR_ROOT"];
  v6 = (void *)v5;
  v7 = @"/";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v10 = [v9 firstObject];
  v11 = [(__CFString *)v8 stringByAppendingPathComponent:v10];

  v12 = [v11 stringByAppendingPathComponent:@"PreferenceBundles"];
  v13 = [v12 stringByAppendingPathComponent:@"VideoSubscriberAccountDeveloperSettings.bundle"];
  v14 = +[NSBundle bundleWithPath:v13];
  v15 = (DTVideoSubscriberAccountSettings *)objc_alloc_init((Class)[v14 principalClass]);

  return v15;
}

@end