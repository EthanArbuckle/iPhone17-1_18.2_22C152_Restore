@interface HDAudioAnalyticsSettingsPreferences
- (BOOL)_hasPairedWatchWithNoiseApp;
- (id)headphonePreferences;
- (id)headphonePreferencesForActivePairedWatch;
- (id)headphonePreferencesForLocalDevice;
- (id)noisePreferences;
- (void)headphonePreferencesForActivePairedWatch;
@end

@implementation HDAudioAnalyticsSettingsPreferences

- (id)noisePreferences
{
  BOOL v2 = [(HDAudioAnalyticsSettingsPreferences *)self _hasPairedWatchWithNoiseApp];
  v3 = [MEMORY[0x263F47560] sharedInstance];
  uint64_t v4 = [v3 notificationsEnabled];
  if ([v3 noiseEnabled]) {
    uint64_t v5 = [v3 onboardingCompleted];
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "notificationThreshold"));
  v7 = [[HDAudioAnalyticsNoiseSettingsResult alloc] initWithWatchPairedWithNoiseApp:v2 hasNoiseEnabled:v5 hasNoiseNotificationsEnabled:v4 noiseThreshold:v6];

  return v7;
}

- (id)headphonePreferences
{
  v3 = [HDAudioAnalyticsHeadphoneSettingsResult alloc];
  uint64_t v4 = [(HDAudioAnalyticsSettingsPreferences *)self headphonePreferencesForLocalDevice];
  uint64_t v5 = [(HDAudioAnalyticsSettingsPreferences *)self headphonePreferencesForActivePairedWatch];
  v6 = [(HDAudioAnalyticsHeadphoneSettingsResult *)v3 initWithLocalDevice:v4 activePairedWatch:v5];

  return v6;
}

- (id)headphonePreferencesForLocalDevice
{
  if ([MEMORY[0x263F44978] areHeadphoneExposureNotificationsMandatory])
  {
    +[HDAudioAnalyticsHeadphoneSettingsDeviceResult requiredSettingsWithSaveForEightDays:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "requiredSettingsWithSaveForEightDays:", [MEMORY[0x263F44978] _isHeadphoneExposureDataTransient]);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled];
    uint64_t v4 = [MEMORY[0x263F44978] isHeadphoneExposureMeasureLevelsEnabled];
    +[HDAudioAnalyticsHeadphoneSettingsDeviceResult optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:", v3, v4, [MEMORY[0x263F44978] _isMeasureOtherHeadphonesEnabled]);
  BOOL v2 = };
  return v2;
}

- (id)headphonePreferencesForActivePairedWatch
{
  if (![MEMORY[0x263F44978] isHeadphoneExposureNotificationsSupportedOnActiveWatch])
  {
    uint64_t v4 = 0;
    goto LABEL_36;
  }
  id v19 = 0;
  int v2 = [MEMORY[0x263F44978] areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:&v19];
  id v3 = v19;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.5();
    }
    uint64_t v4 = 0;
    goto LABEL_35;
  }
  if (v2)
  {
    id v18 = 0;
    uint64_t v5 = [MEMORY[0x263F44978] _isHeadphoneExposureDataTransientOnActiveWatchWithError:&v18];
    id v6 = v18;
    if (!v6)
    {
      uint64_t v4 = +[HDAudioAnalyticsHeadphoneSettingsDeviceResult requiredSettingsWithSaveForEightDays:v5];
      goto LABEL_34;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch]();
    }
  }
  else
  {
    id v17 = 0;
    uint64_t v7 = [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError:&v17];
    id v6 = v17;
    if (!v6)
    {
      id v16 = 0;
      uint64_t v8 = [MEMORY[0x263F44978] isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError:&v16];
      id v9 = v16;
      if (v9)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
          -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch]();
        }
        uint64_t v4 = 0;
      }
      else
      {
        id v15 = 0;
        uint64_t v10 = [MEMORY[0x263F44978] _isMeasureOtherHeadphonesEnabledOnActiveWatchWithError:&v15];
        id v11 = v15;
        int v12 = v10 ^ 1;
        if (v11) {
          int v12 = 1;
        }
        if (v12) {
          v13 = v11;
        }
        else {
          v13 = 0;
        }
        if (((v12 | v8) & 1) == 0)
        {
          v13 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"includeOtherHeadphonesEnabled should not be enabled if measureLevelsEnabled is disabled");
        }
        if (v13)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
            -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch]();
          }
          uint64_t v4 = 0;
        }
        else
        {
          uint64_t v4 = +[HDAudioAnalyticsHeadphoneSettingsDeviceResult optInSettingsWithHasHAENEnabled:v7 hasMeasureLevelsEnabled:v8 hasIncludeOtherHeadphonesEnabled:v10];
        }
      }
      goto LABEL_34;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.4();
    }
  }
  uint64_t v4 = 0;
LABEL_34:

LABEL_35:
LABEL_36:
  return v4;
}

- (BOOL)_hasPairedWatchWithNoiseApp
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F57730] sharedInstance];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(v2, "getPairedDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"];
        LOBYTE(v8) = [v8 supportsCapability:v9];

        if (v8)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)headphonePreferencesForActivePairedWatch
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_22615C000, v0, v1, "Unable to compute headphone preferences for active paired watch (haenRequired): %{public}@", v2, v3, v4, v5, v6);
}

@end