@interface CALNNullCoreLocationProvider
+ (id)sharedInstance;
- (BOOL)preciseLocationAuthorizedForBundle:(id)a3;
- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3;
- (int)authorizationStatusForBundle:(id)a3;
- (int)authorizationStatusForBundleIdentifier:(id)a3;
@end

@implementation CALNNullCoreLocationProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

uint64_t __46__CALNNullCoreLocationProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return 3;
}

- (int)authorizationStatusForBundle:(id)a3
{
  return 3;
}

- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return 1;
}

- (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return 1;
}

@end