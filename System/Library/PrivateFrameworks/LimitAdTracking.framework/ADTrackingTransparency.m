@interface ADTrackingTransparency
- (BOOL)_isUserEDURestricted;
- (BOOL)_isUserManagedRestricted;
- (BOOL)_userAllowedToChangeSettings;
- (BOOL)crossAppTrackingAllowed;
- (BOOL)crossAppTrackingAllowedSwitchEnabled;
- (BOOL)isPersonalizedAdsScreenTimeRestricted;
- (BOOL)personalizedAds;
- (BOOL)personalizedAdsAvailable;
- (BOOL)personalizedAdsAvailableForAdPlatforms;
- (BOOL)personalizedAdsSwitchEnabled;
- (BOOL)shouldDisplayPAUI;
- (BOOL)shouldPresentPersonalizedAdsOnboarding;
- (BOOL)shouldShowPersonalizedAdsToggle;
- (NSArray)adSwitchDisabledReasons;
- (id)appTrackingServiceProxy:(id)a3;
- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4;
- (int64_t)accountLevelSwitchDisabledReason;
- (int64_t)accountRestrictionReason;
- (int64_t)acknowledgedVersionForPersonalizedAds;
- (int64_t)crossAppTrackingAllowedSwitchDisabledReason;
- (int64_t)latestVersionForPersonalizedAdsConsent;
- (int64_t)personalizedAdsSwitchDisabledReason;
- (void)personalizedAdsAvailable:(id)a3;
- (void)setAcknowledgedVersionForPersonalizedAds:(int64_t)a3;
- (void)setCrossAppTrackingAllowed:(BOOL)a3;
- (void)setPersonalizedAds:(BOOL)a3;
@end

@implementation ADTrackingTransparency

- (BOOL)personalizedAds
{
  if (![(ADTrackingTransparency *)self personalizedAdsSwitchEnabled]) {
    return 0;
  }
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53760]] == 1;

  return v3;
}

- (BOOL)shouldPresentPersonalizedAdsOnboarding
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(ADTrackingTransparency *)self personalizedAdsSwitchEnabled])
  {
    BOOL v8 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return v8;
    }
    int v14 = 138412290;
    id v15 = (id)objc_opt_class();
    id v9 = v15;
    v10 = &_os_log_internal;
    v11 = "[%@] personalizedAdsSwitchEnabled is NO.";
LABEL_16:
    _os_log_impl(&dword_21EEF9000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);

    return 0;
  }
  if (![(ADTrackingTransparency *)self personalizedAdsAvailableForAdPlatforms])
  {
    BOOL v8 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return v8;
    }
    int v14 = 138412290;
    id v15 = (id)objc_opt_class();
    id v9 = v15;
    v10 = &_os_log_internal;
    v11 = "[%@] personalizedAdsAvailableForAdPlatforms is NO.";
    goto LABEL_16;
  }
  int64_t v3 = [(ADTrackingTransparency *)self acknowledgedVersionForPersonalizedAds];
  if (v3 >= [(ADTrackingTransparency *)self latestVersionForPersonalizedAdsConsent])
  {
    BOOL v8 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return v8;
    }
    int v14 = 138412290;
    id v15 = (id)objc_opt_class();
    id v9 = v15;
    v10 = &_os_log_internal;
    v11 = "[%@] acknowledgedVersionForPersonalizedAds is already set.";
    goto LABEL_16;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  int v5 = [v4 BOOLForKey:@"personalizedAdsDefaulted"];
  int64_t v6 = [(ADTrackingTransparency *)self acknowledgedVersionForPersonalizedAds];
  if (v6 >= [(ADTrackingTransparency *)self latestVersionForPersonalizedAdsConsent]|| (([(ADTrackingTransparency *)self personalizedAds] | v5) & 1) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v7 = v15;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] shouldPresentPersonalizedAdsOnboarding is TRUE.", (uint8_t *)&v14, 0xCu);
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v13 = v15;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Previous selection for PA was made.", (uint8_t *)&v14, 0xCu);

      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)personalizedAdsSwitchEnabled
{
  if ([(ADTrackingTransparency *)self isPersonalizedAdsScreenTimeRestricted]) {
    return 0;
  }
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v5 = *MEMORY[0x263F53760];
  int v6 = [v4 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53760]];

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The device has a profile installed that has a restriction on Personalized Advertising. Personalized Ads switch will be disabled and locked.", buf, 2u);
    }
    id v7 = [MEMORY[0x263F53C50] sharedConnection];
    int v8 = [v7 effectiveBoolValueForSetting:v5];

    if (v8 != 2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "There is a profile installed that has a restriction on Limit Ad Tracking Forced AND tracking is still enabled. Correcting config value.", v10, 2u);
      }
      id v9 = [MEMORY[0x263F53C50] sharedConnection];
      [v9 setBoolValue:0 forSetting:v5];
    }
    return 0;
  }

  return [(ADTrackingTransparency *)self _userAllowedToChangeSettings];
}

- (BOOL)isPersonalizedAdsScreenTimeRestricted
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  int v3 = [v2 containsObject:@"advertising"];
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The device has a screen time restriction on Personalized Advertising. Personalized Ads switch will be disabled and locked.", v5, 2u);
  }

  return v3;
}

- (BOOL)personalizedAdsAvailableForAdPlatforms
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  int v3 = [v2 objectForKey:@"AdPlatformsPAAvailable"];

  if (v3) {
    char v4 = [v2 BOOLForKey:@"AdPlatformsPAAvailable"];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)latestVersionForPersonalizedAdsConsent
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  int v3 = [v2 objectForKey:@"LatestPAVersion"];

  if (v3) {
    int64_t v4 = [v2 integerForKey:@"LatestPAVersion"];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)acknowledgedVersionForPersonalizedAds
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  int v3 = [v2 objectForKey:@"acknowledgedPersonalizedAdsVersion"];

  if (v3) {
    int v3 = (void *)[v2 integerForKey:@"acknowledgedPersonalizedAdsVersion"];
  }

  return (int64_t)v3;
}

- (BOOL)_userAllowedToChangeSettings
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(ADTrackingTransparency *)self _isUserEDURestricted])
  {
    BOOL v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v4 = v10;
      uint64_t v5 = &_os_log_internal;
      int v6 = "[%@] The device is in Education Mode.";
LABEL_7:
      _os_log_impl(&dword_21EEF9000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);

      return 0;
    }
  }
  else
  {
    if (![(ADTrackingTransparency *)self _isUserManagedRestricted])
    {
      id v7 = [MEMORY[0x263F53C50] sharedConnection];
      BOOL v3 = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53920]] == 1;

      return v3;
    }
    BOOL v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v4 = v10;
      uint64_t v5 = &_os_log_internal;
      int v6 = "[%@] The device is in Managed Mode.";
      goto LABEL_7;
    }
  }
  return v3;
}

- (BOOL)_isUserManagedRestricted
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  BOOL v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v5 = objc_msgSend(v4, "ams_activeiCloudAccount");

  if (objc_msgSend(v3, "ams_isManagedAppleID")) {
    char v6 = 1;
  }
  else {
    char v6 = objc_msgSend(v5, "ams_isManagedAppleID");
  }

  return v6;
}

- (BOOL)_isUserEDURestricted
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  int v3 = [v2 isSharedIPad];

  if (v3)
  {
    id v4 = [MEMORY[0x263F53C50] sharedConnection];
    [v4 setBoolValue:0 forSetting:*MEMORY[0x263F53920]];
  }
  return v3;
}

- (BOOL)crossAppTrackingAllowedSwitchEnabled
{
  int v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v4 = *MEMORY[0x263F53940];
  int v5 = [v3 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53940]];

  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The device has a profile installed that has a restriction on Limit Ad Tracking Forced  Cross App Tracking switch will be disabled and locked.", buf, 2u);
    }
    char v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:v4];

    if (v7 != 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "There is a profile installed that has a restriction on Limit Ad Tracking Forced AND tracking is still enabled. Correcting config value.", v10, 2u);
      }
      int v8 = [MEMORY[0x263F53C50] sharedConnection];
      [v8 setBoolValue:1 forSetting:v4];
    }
    return 0;
  }
  else
  {
    return [(ADTrackingTransparency *)self _userAllowedToChangeSettings];
  }
}

- (int64_t)accountLevelSwitchDisabledReason
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  int v3 = [(ADTrackingTransparency *)self appTrackingXPCConnection:&__block_literal_global withInvalidation:&__block_literal_global_18];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for accountLevelSwitchDisabledReason()", buf, 2u);
  }
  uint64_t v4 = [(ADTrackingTransparency *)self appTrackingServiceProxy:v3];
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get accountLevelSwitchDisabledReason", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to getAccountLevelSwitchDisabledReason()", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_19;
  v7[3] = &unk_2644FB8E8;
  v7[4] = self;
  v7[5] = &v9;
  [v4 getAccountLevelSwitchDisabledReasonWithHandler:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to getAccountLevelSwitchDisabledReason()", buf, 2u);
  }
  [v3 invalidate];
  int64_t v5 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_16()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2050;
    uint64_t v8 = a2;
    id v4 = v6;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The disabled reason is %{public}ld.", (uint8_t *)&v5, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)shouldDisplayPAUI
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  int v3 = [(ADTrackingTransparency *)self appTrackingXPCConnection:&__block_literal_global_22 withInvalidation:&__block_literal_global_25];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for DisplayPersonalizedAdsUI()", buf, 2u);
  }
  id v4 = [(ADTrackingTransparency *)self appTrackingServiceProxy:v3];
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get DisplayPersonalizedAdsUI", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_26;
  v7[3] = &unk_2644FB910;
  v7[4] = &v9;
  [v4 shouldDisplayPersonalizedAdsUI:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
  }
  [v3 invalidate];
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_23()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

uint64_t __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_26(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)accountRestrictionReason
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(ADTrackingTransparency *)self _isUserEDURestricted])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = (id)objc_opt_class();
      id v3 = v7;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The device is in Education Mode.", (uint8_t *)&v6, 0xCu);
    }
    return 3;
  }
  else if ([(ADTrackingTransparency *)self _isUserManagedRestricted])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The device has a Managed account.", (uint8_t *)&v6, 0xCu);
    }
    return 4;
  }
  else
  {
    return [(ADTrackingTransparency *)self accountLevelSwitchDisabledReason];
  }
}

- (NSArray)adSwitchDisabledReasons
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ADTrackingTransparency *)self isPersonalizedAdsScreenTimeRestricted])
  {
    id v4 = [NSNumber numberWithInteger:8];
    [v3 addObject:v4];
  }
  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  int v6 = [v5 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53760]];

  if (v6)
  {
    id v7 = [NSNumber numberWithInteger:7];
    [v3 addObject:v7];
  }
  if ([(ADTrackingTransparency *)self _isUserEDURestricted])
  {
    uint64_t v8 = [NSNumber numberWithInteger:3];
    [v3 addObject:v8];
  }
  if ([(ADTrackingTransparency *)self _isUserManagedRestricted])
  {
    uint64_t v9 = [NSNumber numberWithInteger:4];
    [v3 addObject:v9];
  }
  int64_t v10 = [(ADTrackingTransparency *)self accountLevelSwitchDisabledReason];
  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithInteger:v10];
    [v3 addObject:v11];
  }
  if (![v3 count])
  {
    char v12 = [NSNumber numberWithInteger:0];
    [v3 addObject:v12];
  }
  id v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (int64_t)crossAppTrackingAllowedSwitchDisabledReason
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  int v4 = [v3 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53940]];

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The device has a profile installed that has a restriction on Allow Apps to Request to Track.", (uint8_t *)&v7, 0xCu);
    }
    return 6;
  }
  else
  {
    return [(ADTrackingTransparency *)self accountRestrictionReason];
  }
}

- (BOOL)crossAppTrackingAllowed
{
  if (![(ADTrackingTransparency *)self crossAppTrackingAllowedSwitchEnabled]) {
    return 0;
  }
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53940]] != 1;

  return v3;
}

- (void)setCrossAppTrackingAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 setBoolValue:!v3 forSetting:*MEMORY[0x263F53940]];
}

- (int64_t)personalizedAdsSwitchDisabledReason
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(ADTrackingTransparency *)self isPersonalizedAdsScreenTimeRestricted])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v3 = v9;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The device has a screen time restriction on Personalized Ads.", (uint8_t *)&v8, 0xCu);
    }
    return 8;
  }
  else
  {
    id v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53760]];

    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = (id)objc_opt_class();
        id v7 = v9;
        _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The device has a profile installed that has a restriction on Personalized Ads.", (uint8_t *)&v8, 0xCu);
      }
      return 7;
    }
    else
    {
      return [(ADTrackingTransparency *)self accountRestrictionReason];
    }
  }
}

- (BOOL)personalizedAdsAvailable
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v2 = [(ADTrackingTransparency *)self shouldDisplayPAUI];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = @"will NOT";
    if (v2) {
      id v3 = @"will";
    }
    int v5 = 138543362;
    int v6 = v3;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The Personalized Ads UI %{public}@ render.", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

- (void)personalizedAdsAvailable:(id)a3
{
  id v4 = a3;
  int v5 = [(ADTrackingTransparency *)self appTrackingXPCConnection:&__block_literal_global_46 withInvalidation:&__block_literal_global_49];
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for DisplayPersonalizedAdsUI()", buf, 2u);
  }
  int v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_53];
  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Started asynchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_54;
    v8[3] = &unk_2644FB958;
    id v10 = v4;
    id v9 = v5;
    [v6 shouldDisplayPersonalizedAdsUI:v8];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get DisplayPersonalizedAdsUI", buf, 2u);
    }
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
    [v5 invalidate];
  }
}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_47()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v0, 2u);
  }
}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    uint64_t v4 = [v3 code];
    int v5 = [v3 localizedDescription];

    int v6 = 134218242;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"will NOT";
    if (a2) {
      uint64_t v4 = @"will";
    }
    int v7 = 138543362;
    __int16 v8 = v4;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The Personalized Ads UI %{public}@ render.", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  return [*(id *)(a1 + 32) invalidate];
}

- (void)setAcknowledgedVersionForPersonalizedAds:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  [v5 setInteger:a3 forKey:@"acknowledgedPersonalizedAdsVersion"];
  uint64_t v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 postNotificationName:@"PersonalizedAdsPreferenceDidChange" object:0];
}

- (BOOL)shouldShowPersonalizedAdsToggle
{
  if (![(ADTrackingTransparency *)self personalizedAdsSwitchEnabled]) {
    return 1;
  }
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdPlatforms"];
  char v4 = [v3 BOOLForKey:@"personalizedAdsDefaulted"];
  int64_t v5 = [(ADTrackingTransparency *)self acknowledgedVersionForPersonalizedAds];
  if (v5 >= [(ADTrackingTransparency *)self latestVersionForPersonalizedAdsConsent])char v6 = 1; {
  else
  }
    char v6 = v4 ^ 1;

  return v6;
}

- (void)setPersonalizedAds:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(ADTrackingTransparency *)self appTrackingXPCConnection:&__block_literal_global_61 withInvalidation:&__block_literal_global_64];
  int64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_67];
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting asynchronous remote call to setPersonalizedAds()", buf, 2u);
      }
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_68;
      v8[3] = &unk_2644FB980;
      id v9 = v5;
      [v6 setPersonalizedAds:v3 withCompletionHandler:v8];
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to set personalized ads.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection to setPersonalizedAds()", buf, 2u);
  }
}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_62()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v0, 2u);
  }
}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    uint64_t v4 = [v3 code];
    int64_t v5 = [v3 localizedDescription];

    int v6 = 134218242;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_68(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"was NOT";
    if (a2) {
      uint64_t v4 = @"was";
    }
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The Personalized Ads value %@ set.", (uint8_t *)&v6, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from asynchronous remote call to setPersonalizedAds()", (uint8_t *)&v6, 2u);
  }
  return [*(id *)(a1 + 32) invalidate];
}

- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adprivacyd.opt-out" options:4096];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D088FD8];
    [v7 setRemoteObjectInterface:v8];

    [v7 setInvalidationHandler:v6];
    [v7 setInterruptionHandler:v5];
    [v7 resume];
    id v9 = v7;
  }

  return v7;
}

- (id)appTrackingServiceProxy:(id)a3
{
  return (id)[a3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_93];
}

void __50__ADTrackingTransparency_appTrackingServiceProxy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    uint64_t v4 = [v3 code];
    id v5 = [v3 localizedDescription];

    int v6 = 134218242;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);
  }
}

@end