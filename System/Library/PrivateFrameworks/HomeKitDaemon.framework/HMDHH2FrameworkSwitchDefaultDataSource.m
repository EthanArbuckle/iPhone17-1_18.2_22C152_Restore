@interface HMDHH2FrameworkSwitchDefaultDataSource
- (BOOL)isHH2Enabled;
- (id)controller:(id)a3 cloudDatabaseWithContainerID:(id)a4;
- (unint64_t)setupMode;
@end

@implementation HMDHH2FrameworkSwitchDefaultDataSource

- (id)controller:(id)a3 cloudDatabaseWithContainerID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDDatabase defaultDatabase];
  v9 = [v8 localDatabase];

  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F492F0]) initWithContainerID:v7];
    [v10 setSubscriptionPushRegistrationAction:1];
    v11 = (void *)[objc_alloc(MEMORY[0x263F49258]) initWithLocalDatabase:v9 configuration:v10];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default local database", (uint8_t *)&v17, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (unint64_t)setupMode
{
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"HHTTSUMode", @"com.apple.homed", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

- (BOOL)isHH2Enabled
{
  return CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0) != 0;
}

@end