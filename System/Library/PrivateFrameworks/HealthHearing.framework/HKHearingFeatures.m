@interface HKHearingFeatures
+ (BOOL)_BOOLForPreferenceKey:(id)a3 defaultValue:(BOOL)a4 fromValues:(id)a5;
+ (BOOL)_isHeadphoneExposureDataTransient;
+ (BOOL)_isHeadphoneExposureDataTransientOnActiveWatchWithError:(id *)a3;
+ (BOOL)_isMeasureOtherHeadphonesEnabled;
+ (BOOL)_isMeasureOtherHeadphonesEnabledOnActiveWatchWithError:(id *)a3;
+ (BOOL)_setBoolForPhonePreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5;
+ (BOOL)_setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5;
+ (BOOL)_setBoolForWatchPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5;
+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabled:(BOOL)a3 error:(id *)a4;
+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4;
+ (BOOL)_setHeadphoneExposureNotificationsEnabled:(BOOL)a3 error:(id *)a4;
+ (BOOL)_setHeadphoneExposureNotificationsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4;
+ (BOOL)areHeadphoneExposureNotificationsMandatory;
+ (BOOL)areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:(id *)a3;
+ (BOOL)hasActivePairedDevice;
+ (BOOL)isHeadphoneExposureMeasureLevelsEnabled;
+ (BOOL)isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError:(id *)a3;
+ (BOOL)isHeadphoneExposureNotificationsEnabled;
+ (BOOL)isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError:(id *)a3;
+ (BOOL)isHeadphoneExposureNotificationsSupportedOnActiveWatch;
+ (BOOL)setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 forPairedWatch:(BOOL)a5 error:(id *)a6;
+ (BOOL)unitTesting_forceDefaultHeadphoneDataCollectionInterval;
+ (BOOL)unitTesting_simulateLocalHeadphonePlayback;
+ (id)_numbersForPhonePreferenceKeys:(id)a3;
+ (id)_numbersForPreferenceKeys:(id)a3 error:(id *)a4;
+ (id)_numbersForPreferenceKeys:(id)a3 fromActiveWatch:(BOOL)a4;
+ (id)_numbersForWatchPreferenceKeys:(id)a3;
+ (id)_sharedAudioDataAnalysisManager;
+ (id)activePairedDevice;
+ (id)sharedInstance;
+ (void)isHeadphoneExposureNotificationsEnabled;
+ (void)startObservingForChanges;
+ (void)unitTesting_overrideForceDefaultHeadphoneDataCollectionInterval:(id)a3;
+ (void)unitTesting_overrideIsHeadphoneExposureNotificationsEnabled:(id)a3;
+ (void)unitTesting_overrideSimulateLocalHeadphonePlayback:(id)a3;
- (BOOL)swizzled_isHAENFeatureEnabled;
- (HKHearingFeatures)init;
- (void)_adasPreferenceDidChange:(id)a3;
- (void)_startObservingForChanges;
- (void)_startObservingForChangesOnActiveWatch;
- (void)_stopObservingForChanges;
- (void)dealloc;
@end

@implementation HKHearingFeatures

+ (void)startObservingForChanges
{
  id v2 = (id)[a1 sharedInstance];
}

+ (BOOL)isHeadphoneExposureMeasureLevelsEnabled
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28BE8];
  uint64_t v4 = *MEMORY[0x263F28BA8];
  v11[0] = *MEMORY[0x263F28BE8];
  v11[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  id v10 = 0;
  v6 = [a1 _numbersForPreferenceKeys:v5 error:&v10];
  id v7 = v10;
  if (v6)
  {
    if ([a1 _BOOLForPreferenceKey:v3 defaultValue:0 fromValues:v6]) {
      char v8 = 1;
    }
    else {
      char v8 = [a1 _BOOLForPreferenceKey:v4 defaultValue:0 fromValues:v6];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled]();
    }
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isHeadphoneExposureNotificationsEnabled
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled;
  if (_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled)
  {
    return [v3 BOOLValue];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    uint64_t v6 = *MEMORY[0x263F28BE0];
    v16[0] = *MEMORY[0x263F28BE8];
    v16[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    id v13 = 0;
    char v8 = [a1 _numbersForPreferenceKeys:v7 error:&v13];
    id v9 = v13;
    if (v8)
    {
      char v10 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v8), v8);
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x263F09910];
      v12 = *MEMORY[0x263F09910];
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled]();
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_22315A000, v11, OS_LOG_TYPE_INFO, "Unable to read preferences %{public}@", buf, 0xCu);
      }
      char v10 = 0;
    }

    return v10;
  }
}

+ (BOOL)_BOOLForPreferenceKey:(id)a3 defaultValue:(BOOL)a4 fromValues:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = [a5 objectForKeyedSubscript:v7];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _HKInitializeLogging();
      id v9 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT))
      {
        v12 = v9;
        id v13 = HKStringFromBool();
        int v14 = 138544130;
        id v15 = v7;
        __int16 v16 = 2114;
        v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = objc_opt_class();
        __int16 v20 = 2112;
        uint64_t v21 = objc_opt_class();
        _os_log_fault_impl(&dword_22315A000, v12, OS_LOG_TYPE_FAULT, "Error reading %{public}@ using defaultValue %{public}@: Unexpected class (expected %@, found %@)", (uint8_t *)&v14, 0x2Au);
      }
    }
    a4 = [v8 BOOLValue];
  }
  else
  {
    _HKInitializeLogging();
    char v10 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      +[HKHearingFeatures _BOOLForPreferenceKey:defaultValue:fromValues:]((uint64_t)v7, v10);
    }
  }

  return a4;
}

+ (id)_numbersForPreferenceKeys:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [a1 _sharedAudioDataAnalysisManager];
  id v7 = [v6 getPreferencesFor:v5];

  return v7;
}

+ (id)_sharedAudioDataAnalysisManager
{
  if (_sharedAudioDataAnalysisManager_onceToken != -1) {
    dispatch_once(&_sharedAudioDataAnalysisManager_onceToken, &__block_literal_global);
  }
  id v2 = (void *)_sharedAudioDataAnalysisManager_manager;
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HKHearingFeatures_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  id v2 = (void *)sharedInstance_instance;
  return v2;
}

+ (BOOL)areHeadphoneExposureNotificationsMandatory
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28BE8];
  v10[0] = *MEMORY[0x263F28BE8];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v9 = 0;
  id v5 = [a1 _numbersForPreferenceKeys:v4 error:&v9];
  id v6 = v9;
  if (v5)
  {
    char v7 = [a1 _BOOLForPreferenceKey:v3 defaultValue:0 fromValues:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled]();
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isHeadphoneExposureNotificationsSupportedOnActiveWatch
{
  id v2 = [a1 activePairedDevice];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FFF1DEA3-3FB3-43F8-B986-EAFC838148EA"];
    char v4 = [v2 supportsCapability:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError:(id *)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  if ([a1 hasActivePairedDevice])
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    uint64_t v6 = *MEMORY[0x263F28BE0];
    v11[0] = *MEMORY[0x263F28BE8];
    v11[1] = v6;
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    char v8 = [a1 _numbersForWatchPreferenceKeys:v7];
    if (v8)
    {
      char v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v8), v8);
    }
    else
    {
      if ([a1 isHeadphoneExposureNotificationsSupportedOnActiveWatch]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 11, @"Unable to read preferences %@.", v7);
      }
      else {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 110, @"Unable to read preferences %@. Feature not supported.", v7);
      }
      char v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 110, @"Unable to read preferences. No active watch.");
    return 0;
  }
  return v9;
}

+ (BOOL)isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError:(id *)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  if ([a1 hasActivePairedDevice])
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    uint64_t v6 = *MEMORY[0x263F28BA8];
    v11[0] = *MEMORY[0x263F28BE8];
    v11[1] = v6;
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    char v8 = [a1 _numbersForWatchPreferenceKeys:v7];
    if (v8)
    {
      if ([a1 _BOOLForPreferenceKey:v5 defaultValue:0 fromValues:v8]) {
        char v9 = 1;
      }
      else {
        char v9 = [a1 _BOOLForPreferenceKey:v6 defaultValue:0 fromValues:v8];
      }
    }
    else
    {
      if ([a1 isHeadphoneExposureNotificationsSupportedOnActiveWatch]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 11, @"Unable to read preferences %@.", v7);
      }
      else {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 110, @"Unable to read preferences %@. Feature not supported.", v7);
      }
      char v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 110, @"Unable to read preferences. No active watch.");
    return 0;
  }
  return v9;
}

+ (BOOL)areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:(id *)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([a1 hasActivePairedDevice])
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    v10[0] = *MEMORY[0x263F28BE8];
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    char v7 = [a1 _numbersForWatchPreferenceKeys:v6];
    if (v7)
    {
      char v8 = [a1 _BOOLForPreferenceKey:v5 defaultValue:0 fromValues:v7];
    }
    else
    {
      if ([a1 isHeadphoneExposureNotificationsSupportedOnActiveWatch]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 11, @"Unable to read preferences %@.", v6);
      }
      else {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 110, @"Unable to read preferences %@. Feature not supported.", v6);
      }
      char v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 110, @"Unable to read preferences. No active watch.");
    return 0;
  }
  return v8;
}

+ (BOOL)_setHeadphoneExposureNotificationsEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = *MEMORY[0x263F28BE0];
  id v9 = 0;
  [a1 setBoolForPreferenceKey:v6 newValue:v5 forPairedWatch:0 error:&v9];
  id v7 = v9;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = *MEMORY[0x263F28BA8];
  id v9 = 0;
  [a1 setBoolForPreferenceKey:v6 newValue:v5 forPairedWatch:0 error:&v9];
  id v7 = v9;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureNotificationsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = *MEMORY[0x263F28BE0];
  id v9 = 0;
  [a1 setBoolForPreferenceKey:v6 newValue:v5 forPairedWatch:1 error:&v9];
  id v7 = v9;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = *MEMORY[0x263F28BA8];
  id v9 = 0;
  [a1 setBoolForPreferenceKey:v6 newValue:v5 forPairedWatch:1 error:&v9];
  id v7 = v9;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v7 == 0;
}

+ (BOOL)_isHeadphoneExposureDataTransient
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28BE8];
  uint64_t v4 = *MEMORY[0x263F28C00];
  v12[0] = *MEMORY[0x263F28BE8];
  v12[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = 0;
  uint64_t v6 = [a1 _numbersForPreferenceKeys:v5 error:&v11];
  id v7 = v11;
  if (v6)
  {
    int v8 = [a1 _BOOLForPreferenceKey:v3 defaultValue:0 fromValues:v6];
    char v9 = 0;
    if (v8) {
      char v9 = [a1 _BOOLForPreferenceKey:v4 defaultValue:0 fromValues:v6];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled]();
    }
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)_isMeasureOtherHeadphonesEnabled
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28BE8];
  uint64_t v4 = *MEMORY[0x263F28BA8];
  v13[0] = *MEMORY[0x263F28BE8];
  v13[1] = v4;
  uint64_t v5 = *MEMORY[0x263F28BB0];
  v13[2] = *MEMORY[0x263F28BB0];
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  id v12 = 0;
  id v7 = [a1 _numbersForPreferenceKeys:v6 error:&v12];
  id v8 = v12;
  if (v7)
  {
    if ([a1 _BOOLForPreferenceKey:v3 defaultValue:0 fromValues:v7])
    {
      char v9 = 1;
    }
    else
    {
      int v10 = [a1 _BOOLForPreferenceKey:v4 defaultValue:0 fromValues:v7];
      char v9 = 0;
      if (v10) {
        char v9 = [a1 _BOOLForPreferenceKey:v5 defaultValue:0 fromValues:v7];
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled]();
    }
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)_isHeadphoneExposureDataTransientOnActiveWatchWithError:(id *)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  if ([a1 hasActivePairedDevice])
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    uint64_t v6 = *MEMORY[0x263F28C00];
    v11[0] = *MEMORY[0x263F28BE8];
    v11[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = [a1 _numbersForWatchPreferenceKeys:v7];
    if (v8)
    {
      char v9 = 0;
      if ([a1 _BOOLForPreferenceKey:v5 defaultValue:0 fromValues:v8]) {
        char v9 = [a1 _BOOLForPreferenceKey:v6 defaultValue:0 fromValues:v8];
      }
    }
    else
    {
      if ([a1 isHeadphoneExposureNotificationsSupportedOnActiveWatch]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 11, @"Unable to read preferences %@.", v7);
      }
      else {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 110, @"Unable to read preferences %@. Feature not supported.", v7);
      }
      char v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 110, @"Unable to read preferences. No active watch.");
    return 0;
  }
  return v9;
}

+ (BOOL)_isMeasureOtherHeadphonesEnabledOnActiveWatchWithError:(id *)a3
{
  void v12[3] = *MEMORY[0x263EF8340];
  if ([a1 hasActivePairedDevice])
  {
    uint64_t v5 = *MEMORY[0x263F28BE8];
    uint64_t v6 = *MEMORY[0x263F28BA8];
    v12[0] = *MEMORY[0x263F28BE8];
    v12[1] = v6;
    uint64_t v7 = *MEMORY[0x263F28BB0];
    v12[2] = *MEMORY[0x263F28BB0];
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    char v9 = [a1 _numbersForWatchPreferenceKeys:v8];
    if (v9)
    {
      if ([a1 _BOOLForPreferenceKey:v5 defaultValue:0 fromValues:v9])
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if ([a1 _BOOLForPreferenceKey:v6 defaultValue:0 fromValues:v9]) {
          char v10 = [a1 _BOOLForPreferenceKey:v7 defaultValue:0 fromValues:v9];
        }
      }
    }
    else
    {
      if ([a1 isHeadphoneExposureNotificationsSupportedOnActiveWatch]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 11, @"Unable to read preferences %@.", v8);
      }
      else {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 110, @"Unable to read preferences %@. Feature not supported.", v8);
      }
      char v10 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 110, @"Unable to read preferences. No active watch.");
    return 0;
  }
  return v10;
}

+ (void)unitTesting_overrideIsHeadphoneExposureNotificationsEnabled:(id)a3
{
  id v5 = a3;
  BOOL v6 = _unitTesting_overrideIsHeadphoneExposureNotificationsEnabled == 0;
  objc_storeStrong((id *)&_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled, a3);
  if (((v6 ^ (_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled != 0)) & 1) == 0)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2050000000;
    uint64_t v7 = (void *)getHAENDefaultsClass_softClass;
    uint64_t v15 = getHAENDefaultsClass_softClass;
    if (!getHAENDefaultsClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getHAENDefaultsClass_block_invoke;
      void v11[3] = &unk_264699878;
      v11[4] = &v12;
      __getHAENDefaultsClass_block_invoke((uint64_t)v11);
      uint64_t v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    InstanceMethod = class_getInstanceMethod(v8, sel_isHAENFeatureEnabled);
    char v10 = class_getInstanceMethod((Class)a1, sel_swizzled_isHAENFeatureEnabled);
    method_exchangeImplementations(InstanceMethod, v10);
  }
}

- (BOOL)swizzled_isHAENFeatureEnabled
{
  return [(id)_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled BOOLValue];
}

+ (BOOL)unitTesting_simulateLocalHeadphonePlayback
{
  return [(id)_unitTesting_simulateLocalHeadphonePlayback BOOLValue];
}

+ (void)unitTesting_overrideSimulateLocalHeadphonePlayback:(id)a3
{
}

+ (BOOL)unitTesting_forceDefaultHeadphoneDataCollectionInterval
{
  return [(id)_unitTesting_forceDefaultHeadphoneDataCollectionInterval BOOLValue];
}

+ (void)unitTesting_overrideForceDefaultHeadphoneDataCollectionInterval:(id)a3
{
}

uint64_t __35__HKHearingFeatures_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (HKHearingFeatures)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKHearingFeatures;
  id v2 = [(HKHearingFeatures *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(HKHearingFeatures *)v2 _startObservingForChanges];
    [(HKHearingFeatures *)v3 _startObservingForChangesOnActiveWatch];
    uint64_t v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(HKHearingFeatures *)self _stopObservingForChanges];
  v3.receiver = self;
  v3.super_class = (Class)HKHearingFeatures;
  [(HKHearingFeatures *)&v3 dealloc];
}

- (void)_startObservingForChanges
{
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22315A000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation for HKHearingFeatures changes to current device.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_adasPreferenceDidChange, (CFStringRef)*MEMORY[0x263F28B58], 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_startObservingForChangesOnActiveWatch
{
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22315A000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation for HKHearingFeatures changes to active watch.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_adasPreferenceDidChange, (CFStringRef)*MEMORY[0x263F28B70], 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingForChanges
{
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22315A000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for HKHearingFeatures changes.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_adasPreferenceDidChange:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"HKHearingFeatureHeadphoneExposureNotificationsEnabledDidChange" object:self userInfo:v5];
}

+ (id)_numbersForPreferenceKeys:(id)a3 fromActiveWatch:(BOOL)a4
{
  if (a4) {
    [a1 _numbersForWatchPreferenceKeys:a3];
  }
  else {
  uint64_t v4 = [a1 _numbersForPhonePreferenceKeys:a3];
  }
  return v4;
}

+ (id)_numbersForPhonePreferenceKeys:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedAudioDataAnalysisManager];
  id v6 = [v5 getPreferencesFor:v4];

  return v6;
}

+ (id)_numbersForWatchPreferenceKeys:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedAudioDataAnalysisManager];
  id v6 = [v5 getNanoPreferencesFor:v4];

  return v6;
}

+ (BOOL)_setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  id v8 = 0;
  [a1 _setBoolForPhonePreferenceKey:a3 newValue:a4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    if (a5) {
      *a5 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v6 == 0;
}

+ (BOOL)_setBoolForPhonePreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (objc_class *)NSNumber;
  id v9 = a3;
  char v10 = (void *)[[v8 alloc] initWithBool:v6];
  id v11 = [a1 _sharedAudioDataAnalysisManager];
  uint64_t v12 = [v11 setPreferenceFor:v9 value:v10 notify:1];

  id v13 = v12;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v13 == 0;
}

+ (BOOL)_setBoolForWatchPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (objc_class *)NSNumber;
  id v9 = a3;
  char v10 = (void *)[[v8 alloc] initWithBool:v6];
  id v11 = [a1 _sharedAudioDataAnalysisManager];
  uint64_t v12 = [v11 setNanoPreferenceFor:v9 value:v10 notify:1];

  id v13 = v12;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v13 == 0;
}

uint64_t __52__HKHearingFeatures__sharedAudioDataAnalysisManager__block_invoke()
{
  _sharedAudioDataAnalysisManager_manager = (uint64_t)objc_alloc_init(MEMORY[0x263F28C30]);
  return MEMORY[0x270F9A758]();
}

+ (BOOL)setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 forPairedWatch:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v26[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v12 = *MEMORY[0x263F28BA8];
  v26[0] = *MEMORY[0x263F28BE0];
  uint64_t v11 = v26[0];
  v26[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  uint64_t v25 = v11;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  if (([v13 containsObject:v10] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a6, 3, @"Preference key not supported %@", v10);
LABEL_21:
    BOOL v20 = 0;
    goto LABEL_22;
  }
  if (v7)
  {
    id v24 = 0;
    int v15 = [a1 areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:&v24];
    id v16 = v24;
    if (v16)
    {
      v17 = v16;
      if (a6) {
        *a6 = v16;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_21;
    }
    if (!v15 || ([v14 containsObject:v10] & 1) != 0)
    {
      uint64_t v23 = 0;
      __int16 v18 = (id *)&v23;
      [a1 _setBoolForWatchPreferenceKey:v10 newValue:v8 error:&v23];
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if (([a1 areHeadphoneExposureNotificationsMandatory] & 1) != 0
    && ([v14 containsObject:v10] & 1) == 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a6, 110, @"Property can not be set when feature is mandatory.");
    goto LABEL_21;
  }
  uint64_t v22 = 0;
  __int16 v18 = (id *)&v22;
  [a1 _setBoolForPreferenceKey:v10 newValue:v8 error:&v22];
LABEL_13:
  id v19 = *v18;
  BOOL v20 = v19 == 0;
  if (v19)
  {
    if (a6) {
      *a6 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_22:
  return v20;
}

+ (id)activePairedDevice
{
  id v2 = [MEMORY[0x263F57738] sharedInstance];
  objc_super v3 = [v2 getActivePairedDevice];

  return v3;
}

+ (BOOL)hasActivePairedDevice
{
  id v2 = [a1 activePairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (void)isHeadphoneExposureNotificationsEnabled
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22315A000, v0, v1, "Unable to read preferences %{public}@: %@");
}

+ (void)_BOOLForPreferenceKey:(uint64_t)a1 defaultValue:(void *)a2 fromValues:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  id v4 = HKStringFromBool();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  BOOL v8 = v4;
  _os_log_error_impl(&dword_22315A000, v3, OS_LOG_TYPE_ERROR, "Missing preference for %{public}@, using defaultValue %{public}@.", (uint8_t *)&v5, 0x16u);
}

@end