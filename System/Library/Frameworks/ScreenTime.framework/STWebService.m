@interface STWebService
+ (NSString)clientBundleIdentifier;
+ (NSURL)clientBundleURL;
+ (id)newDelegateInterface;
+ (id)newServiceInterface;
@end

@implementation STWebService

+ (id)newServiceInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newDelegateInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)clientBundleIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    MainBundle = CFBundleGetMainBundle();
    v3 = CFBundleGetIdentifier(MainBundle);
    if (!v3)
    {
      v5 = [MEMORY[0x263F08AB0] processInfo];
      v6 = [v5 processName];
      v3 = [@"com.apple.ScreenTime.ScreenTimeWebExtension." stringByAppendingString:v6];
    }
  }

  return (NSString *)v3;
}

+ (NSURL)clientBundleURL
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleURL];

  if (!v3)
  {
    MainBundle = CFBundleGetMainBundle();
    v3 = CFBundleCopyBundleURL(MainBundle);
  }

  return (NSURL *)v3;
}

@end