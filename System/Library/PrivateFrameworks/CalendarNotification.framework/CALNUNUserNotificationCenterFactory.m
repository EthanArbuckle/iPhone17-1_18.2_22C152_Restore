@interface CALNUNUserNotificationCenterFactory
+ (CALNUNUserNotificationCenterFactory)sharedInstance;
- (id)userNotificationCenterWithBundleIdentifier:(id)a3;
@end

@implementation CALNUNUserNotificationCenterFactory

+ (CALNUNUserNotificationCenterFactory)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1) {
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_sharedInstance_16;
  return (CALNUNUserNotificationCenterFactory *)v2;
}

uint64_t __53__CALNUNUserNotificationCenterFactory_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_16 = objc_alloc_init(CALNUNUserNotificationCenterFactory);
  return MEMORY[0x270F9A758]();
}

- (id)userNotificationCenterWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[CALNUNDefaultUserNotificationCenter alloc] initWithBundleIdentifier:v3];

  return v4;
}

@end