@interface _DKSyncedFeatures
+ (id)sharedInstance;
- (BOOL)isDigitalHealthDisabledWithIsSingleDevice:(uint64_t)a3 forTransports:;
- (BOOL)isEucalyptusDisabled;
- (BOOL)isIDSMessageGatingDisabled;
- (_DKSyncedFeatures)init;
- (id)description;
- (uint64_t)isOptimizedBatteryChargingDisabled;
- (uint64_t)isSiriPortraitDisabled;
- (uint64_t)isSupergreenDisabledForTransports:(uint64_t)a1;
- (uint64_t)isTipsDisabled;
- (void)_fetchScreenTimeSyncState;
@end

@implementation _DKSyncedFeatures

+ (id)sharedInstance
{
  self;
  if (sharedInstance_initialized_2 != -1) {
    dispatch_once(&sharedInstance_initialized_2, &__block_literal_global_50);
  }
  v0 = (void *)sharedInstance_instance_0;
  return v0;
}

- (_DKSyncedFeatures)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DKSyncedFeatures;
  v2 = [(_DKSyncedFeatures *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_screenTimeSyncState = 0;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 objectForKey:@"ScreenTimeSyncDisabled"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v6 = [v5 BOOLValue];
        uint64_t v7 = 1;
        if (!v6) {
          uint64_t v7 = 2;
        }
        v3->_screenTimeSyncState = v7;
      }
    }
  }
  return v3;
}

- (void)_fetchScreenTimeSyncState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 16)];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "ScreenTime sync state query timed out. Falling back to state %@", (uint8_t *)&v4, 0xCu);
}

- (BOOL)isDigitalHealthDisabledWithIsSingleDevice:(uint64_t)a3 forTransports:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  *(unsigned char *)(a1 + 10) = a2;
  if (a2)
  {
    BOOL v5 = 1;
  }
  else
  {
    -[_DKSyncedFeatures _fetchScreenTimeSyncState](a1);
    BOOL v5 = *(void *)(a1 + 16) == 1;
  }
  uint64_t v6 = +[_DKSyncPeerStatusTracker stringForTransports:a3];
  if (!*(unsigned char *)(a1 + 8) || *(unsigned char *)(a1 + 9) != v5)
  {
    *(unsigned char *)(a1 + 8) = 1;
    *(unsigned char *)(a1 + 9) = v5;
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = @"enabled";
      if (v5) {
        v8 = @"disabled";
      }
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "Digital Health feature is %{public}@ for transport %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v5;
}

- (BOOL)isIDSMessageGatingDisabled
{
  if (a1 && isIDSMessageGatingDisabled_initialized != -1) {
    dispatch_once(&isIDSMessageGatingDisabled_initialized, &__block_literal_global_534);
  }
  return a1 != 0;
}

- (uint64_t)isSiriPortraitDisabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = [getAFPreferencesClass() sharedPreferences];
    int v2 = [v1 cloudSyncEnabled];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___DKSyncedFeatures_isSiriPortraitDisabled__block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v6 = v2;
    if (isSiriPortraitDisabled_initialized != -1) {
      dispatch_once(&isSiriPortraitDisabled_initialized, block);
    }
    if (isSiriPortraitDisabled_previousResult != v2)
    {
      v3 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v4 = @"disabled";
        if (v2) {
          int v4 = @"enabled";
        }
        *(_DWORD *)buf = 138412290;
        v8 = v4;
        _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_INFO, "Siri Portrait feature is %@", buf, 0xCu);
      }

      isSiriPortraitDisabled_previousResult = v2;
    }
    return v2 ^ 1u;
  }
  return result;
}

- (uint64_t)isSupergreenDisabledForTransports:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F79EF8] sharedInstance];
  int v4 = [v3 getPairedDevices];

  if ([v4 count])
  {
    if (a2 == 1) {
      int OneDay = slREIsSupergreenUsedInLastOneDay();
    }
    else {
      int OneDay = slREIsSupergreenUsedInLastSevenDays();
    }
    uint64_t v6 = OneDay ^ 1u;
  }
  else
  {
    uint64_t v6 = 1;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___DKSyncedFeatures_isSupergreenDisabledForTransports___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v11 = v6;
  if (isSupergreenDisabledForTransports__initialized != -1) {
    dispatch_once(&isSupergreenDisabledForTransports__initialized, block);
  }
  if (isSupergreenDisabledForTransports__previousResult != v6)
  {
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = @"enabled";
      if (v6) {
        v8 = @"disabled";
      }
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "Supergreen feature is now %@", buf, 0xCu);
    }

    isSupergreenDisabledForTransports__previousResult = v6;
  }

  return v6;
}

- (BOOL)isEucalyptusDisabled
{
  return a1 != 0;
}

- (uint64_t)isOptimizedBatteryChargingDisabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = (void *)CFPreferencesCopyValue(@"enabled", @"com.apple.smartcharging.topoffprotection", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  int v2 = v1;
  if (v1) {
    int v3 = [v1 BOOLValue];
  }
  else {
    int v3 = 1;
  }
  int v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = @"disabled";
    if (v3) {
      BOOL v5 = @"enabled";
    }
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "Optimized Battery Charging feature is %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = v3 ^ 1u;
  return v6;
}

- (uint64_t)isTipsDisabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = [MEMORY[0x1E4F79EF8] sharedInstance];
  int v2 = [v1 getPairedDevices];

  if ([v2 count])
  {
    int v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    int v4 = [v3 applicationIsInstalled:@"com.apple.tips"];

    BOOL v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"not ";
      if (v4) {
        uint64_t v6 = &stru_1EDDE58B8;
      }
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Tips is %@installed.", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = v4 ^ 1u;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)description
{
  int v3 = objc_opt_new();
  int v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p: ", v5, self];

  if (-[_DKSyncedFeatures isDigitalHealthDisabledWithIsSingleDevice:forTransports:]((uint64_t)self, self->_isSingleDevice, 0))
  {
    uint64_t v6 = @"YES";
  }
  else
  {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"isDigitalHealthDisabled=%@", v6];
  if (self->_isSingleDevice) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int v8 = @"unknown";
  int64_t screenTimeSyncState = self->_screenTimeSyncState;
  if (screenTimeSyncState == 2) {
    int v8 = @"enabled";
  }
  if (screenTimeSyncState == 1) {
    int v8 = @"disabled";
  }
  if (self->_isDigitalHealthDisabledPreviousResult) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v3 appendFormat:@" (isSingleDevice=%@, STState=%@) previously %@", v7, v8, v10];
  [v3 appendString:@", "];
  if (-[_DKSyncedFeatures isSiriPortraitDisabled]((uint64_t)self)) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  [v3 appendFormat:@"isSiriPortraitDisabled=%@", v11];
  [v3 appendString:@", "];
  if (-[_DKSyncedFeatures isOptimizedBatteryChargingDisabled]((uint64_t)self)) {
    __int16 v12 = @"YES";
  }
  else {
    __int16 v12 = @"NO";
  }
  [v3 appendFormat:@"isOptimizedBatteryChargingDisabled=%@", v12];
  [v3 appendString:@", "];
  if (-[_DKSyncedFeatures isTipsDisabled]((uint64_t)self)) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@"isTipsDisabled=%@", v13];
  [v3 appendFormat:@", "];
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 4)) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  [v3 appendFormat:@"isSupergreenDisabled(CloudDown)=%@", v14];
  [v3 appendString:@", "];
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 8)) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v3 appendFormat:@"isSupergreenDisabled(CloudUp)=%@", v15];
  [v3 appendString:@", "];
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 1)) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v3 appendFormat:@"isSupergreenDisabled(Rapport)=%@", v16];
  [v3 appendString:@">"];
  return v3;
}

@end