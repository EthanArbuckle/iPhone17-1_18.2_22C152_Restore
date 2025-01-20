@interface HMDFeaturesDataSource
+ (id)defaultDataSource;
- (BOOL)isHH2AutoMigrationEnabled;
- (BOOL)isHH2MigrationDryRunEnabled;
- (BOOL)isNativeMatterEnabled;
- (BOOL)isPersistentBulletinRegistrationsFeatureEnabled;
- (BOOL)isRVCEnabled;
- (BOOL)isResidentSelectionEnabledForHomeUUID:(id)a3;
- (BOOL)isSHADEREnabled;
- (BOOL)isSHADERMercuryEnabled;
- (BOOL)isUserActivityStateDetectionFeatureEnabled;
@end

@implementation HMDFeaturesDataSource

- (BOOL)isSHADERMercuryEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSHADEREnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isRVCEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED() != 0;
}

- (BOOL)isNativeMatterEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2MigrationDryRunEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2AutoMigrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isResidentSelectionEnabledForHomeUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (isInternalBuild())
    {
      v6 = [MEMORY[0x263F42608] sharedPreferences];
      v7 = [v6 preferenceForKey:@"HMDisableResidentSelection"];
      int v8 = [v7 BOOLValue];

      if (v8)
      {
        v9 = (void *)MEMORY[0x230FBD990]();
        v10 = self;
        v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = HMFGetLogIdentifier();
          int v18 = 138543618;
          v19 = v12;
          __int16 v20 = 2112;
          id v21 = v4;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident Selection disabled via defaults write for home:%@", (uint8_t *)&v18, 0x16u);
        }
LABEL_11:

        char v5 = v8 ^ 1;
        goto LABEL_12;
      }
      v13 = objc_msgSend(v4, "hmf_bytesAsData");
      uint64_t v14 = HMDTruncatedHash(v13);

      if (v14)
      {
        v9 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v16 = HMFGetLogIdentifier();
          int v18 = 138543874;
          v19 = v16;
          __int16 v20 = 2112;
          id v21 = v4;
          __int16 v22 = 2048;
          uint64_t v23 = v14;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident Selection enabled for home: %@ based on home UUID hash: %tu", (uint8_t *)&v18, 0x20u);
        }
        goto LABEL_11;
      }
    }
    char v5 = 0;
    goto LABEL_12;
  }
  char v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)isUserActivityStateDetectionFeatureEnabled
{
  return CFPreferencesGetAppBooleanValue(@"ActivityStateDetection", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) != 0;
}

- (BOOL)isPersistentBulletinRegistrationsFeatureEnabled
{
  return 1;
}

+ (id)defaultDataSource
{
  if (defaultDataSource_onceToken != -1) {
    dispatch_once(&defaultDataSource_onceToken, &__block_literal_global_239393);
  }
  v2 = (void *)defaultDataSource_dataSource;
  return v2;
}

void __42__HMDFeaturesDataSource_defaultDataSource__block_invoke()
{
  v0 = objc_alloc_init(HMDFeaturesDataSource);
  v1 = (void *)defaultDataSource_dataSource;
  defaultDataSource_dataSource = (uint64_t)v0;
}

@end