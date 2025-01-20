@interface CALNCLCoreLocationProvider
+ (id)sharedInstance;
- (BOOL)preciseLocationAuthorizedForBundle:(id)a3;
- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3;
- (int)authorizationStatusForBundle:(id)a3;
- (int)authorizationStatusForBundleIdentifier:(id)a3;
- (void)markAsHavingReceivedLocationWithEffectiveBundleIdentifier:(id)a3;
@end

@implementation CALNCLCoreLocationProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1) {
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance_sharedInstance_19;
  return v2;
}

uint64_t __44__CALNCLCoreLocationProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_19 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return [MEMORY[0x263F30048] authorizationStatusForBundleIdentifier:a3];
}

- (int)authorizationStatusForBundle:(id)a3
{
  return [MEMORY[0x263F30048] authorizationStatusForBundle:a3];
}

- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return [MEMORY[0x263F30048] preciseLocationAuthorizedForBundleIdentifier:a3];
}

- (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return [MEMORY[0x263F30048] preciseLocationAuthorizedForBundle:a3];
}

- (void)markAsHavingReceivedLocationWithEffectiveBundleIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F00A60]) initWithEffectiveBundleIdentifier:v3 delegate:0 onQueue:0];
  [v4 markAsHavingReceivedLocation];
  v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Marked as having received location with effective bundle identifier = %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

@end