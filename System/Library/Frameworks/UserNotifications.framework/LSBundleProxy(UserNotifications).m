@interface LSBundleProxy(UserNotifications)
- (uint64_t)un_applicationBundleIdentifier;
- (uint64_t)un_applicationBundleURL;
@end

@implementation LSBundleProxy(UserNotifications)

- (uint64_t)un_applicationBundleIdentifier
{
  return 0;
}

- (uint64_t)un_applicationBundleURL
{
  return 0;
}

@end