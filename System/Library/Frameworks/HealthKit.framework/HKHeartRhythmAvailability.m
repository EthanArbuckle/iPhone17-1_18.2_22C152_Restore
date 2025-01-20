@interface HKHeartRhythmAvailability
+ (BOOL)_isECG1SupportedOnCompanionDevice:(id)a3 geolocatedCountryCode:(id)a4;
+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andPhoneDevice:(id)a4;
+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andWatchDevice:(id)a4;
+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3;
+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3 geolocatedCountryCode:(id)a4;
+ (BOOL)electrocardiogramSupportedForDevice:(id)a3;
+ (BOOL)isCompanionRegionCheckEnabledForActiveWatch;
+ (BOOL)isCompanionRegionCheckEnabledForDevice:(id)a3;
+ (BOOL)isCompanionRegionCheckEnabledOnPairedPhone;
+ (BOOL)isECG1SupportedOnlyForCountryCode:(id)a3;
+ (BOOL)isElectrocardiogram2SupportedWithCountryCode:(id)a3;
+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch;
+ (BOOL)isElectrocardiogramAppInstallableForLocale:(id)a3;
+ (BOOL)isElectrocardiogramSupportedOnActiveWatch;
+ (BOOL)isElectrocardiogramSupportedOnAllWatches;
+ (BOOL)isElectrocardiogramSupportedOnAnyWatch;
+ (BOOL)isElectrocardiogramSupportedOnPairedPhone;
+ (BOOL)isElectrocardiogramSupportedOnPairedPhoneWithGeolocatedCountryCode:(id)a3;
+ (BOOL)isElectrocardiogramSupportedOnWatch:(id)a3;
+ (BOOL)isHeartRateEnabledInPrivacy;
+ (BOOL)shouldInstallWatchApp;
+ (Class)deviceRegionFeatureSupportedStateProviderForCompanionDevice:(id)a3;
+ (Class)deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice;
+ (id)_ECG2SupportedCountriesOnDevice;
+ (id)_ECG2SupportedCountriesOnDevice:(id)a3;
+ (id)_availabilityPlistURL;
+ (id)_history:(id)a3 addCurrentOnboardingVersionCompletedIfApplicable:(int64_t)a4 countryCode:(id)a5;
+ (id)_onboardingCountryCodeKeyFromCompletedKey:(id)a3;
+ (id)_onboardingHistoryKeyFromCompletedKey:(id)a3;
+ (id)_onboardingHistoryWithVersionCompletedKey:(id)a3 keyValueDomain:(id)a4;
+ (id)activePairedDevice;
+ (id)currentDeviceRegionCode;
+ (id)electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:(id)a3;
+ (id)featureAvailabilityUserDefaults;
+ (id)pairedDevices;
+ (int64_t)_electrocardiogramRescindedStatusWithDataSource:(id)a3;
+ (int64_t)currentElectrocardiogramOnboardingVersion;
+ (unint64_t)_electrocardiogramSupportedStateForDeviceRegion:(id)a3;
+ (unint64_t)electrocardiogramSupportedState;
+ (unint64_t)electrocardiogramSupportedStateForActiveWatch;
+ (unint64_t)electrocardiogramSupportedStateForWatch:(id)a3;
+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3;
- (BOOL)_activePairedDevicesSupportECGAlgorithmVersionTwo:(id)a3;
- (BOOL)_isECG1SupportedForCountryCode:(id)a3 watchOSVersion:(unsigned int)a4 isWatchOSSeedBuild:(BOOL)a5;
- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4;
- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4 useCache:(BOOL)a5;
- (BOOL)_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:(id)a3;
- (BOOL)_meetsMinimumAgeRequirementWithMinimumRequiredAge:(int64_t)a3 currentDate:(id)a4;
- (BOOL)_shouldAdvertiseECG2BackgroundDeliveryCompletedWithDevice:(id)a3;
- (BOOL)_shouldAdvertiseECG2DirectOnboardingWithWatchDevice:(id)a3;
- (BOOL)_shouldAdvertiseECG2UpgradeWithDevice:(id)a3;
- (BOOL)_shouldAdvertiseECGDirectOnboardingWithDevice:(id)a3;
- (BOOL)_shouldAdvertiseElectrocardiogramUpgradeForDevice:(id)a3;
- (BOOL)_shouldAdvertiseWithAdvertiseECGVersions:(id)a3;
- (BOOL)activePairedDevicesSupportElectrocardiogramAlgorithmVersion:(int64_t)a3;
- (BOOL)isAtrialFibrillationDetectionDisabled;
- (BOOL)isAtrialFibrillationDetectionOnboardingCompleted;
- (BOOL)isAtrialFibrillationDetectionSettingEnabled;
- (BOOL)isElectrocardiogramAppInstallAllowedForWatch:(id)a3;
- (BOOL)isElectrocardiogramAvailableForOnboardingCountryCode:(id)a3;
- (BOOL)isElectrocardiogramAvailableOnWatch:(id)a3 countryCode:(id)a4;
- (BOOL)isElectrocardiogramOnboardingCompleted;
- (BOOL)isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion;
- (BOOL)isElectrocardiogramOnboardingCompletedNoCache;
- (BOOL)isElectrocardiogramRecordingDisabled;
- (BOOL)isHeartAgeGatingEnabledOnActiveWatchWithCurrentDate:(id)a3;
- (BOOL)isHeartAgeGatingEnabledOnWatch:(id)a3 currentDate:(id)a4;
- (BOOL)shouldAdvertiseAtrialFibrillationDetectionForActiveWatch;
- (BOOL)shouldAdvertiseECG2BackgroundDeliveryCompletedForActiveWatch;
- (BOOL)shouldAdvertiseElectrocardiogramForActiveWatch;
- (BOOL)shouldAdvertiseElectrocardiogramForWatch:(id)a3;
- (BOOL)shouldAdvertiseElectrocardiogramUpgradeBackgroundDeliveryCompletedForActivePhone;
- (HKActiveWatchRemoteFeatureAvailabilityDataSource)electrocardiogramAvailabilityDataSource;
- (HKHealthStore)healthStore;
- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3;
- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3 currentCountryCode:(id)a4;
- (HKKeyValueDomain)keyValueDomain;
- (HKObserverSet)heartRhythmAvailabilityObservers;
- (HKRegulatoryDomainProvider)mobileCountryCodeManager;
- (HKWatchAppAvailability)ecgAppAvailability;
- (NSMutableSet)onboardingKeysReadSet;
- (NSString)currentCountryCode;
- (NSUserDefaults)heartRhythmUserDefaults;
- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3;
- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3 wasUpgradeBackgroundDelivered:(BOOL)a4;
- (id)_ecg2AvailabilityWithWatchDevice:(id)a3;
- (id)_electrocardiogramFirstOnboardingCompletedDate;
- (id)_electrocardiogramOnboardingHistory;
- (id)_electrocardiogramOnboardingHistoryKnown;
- (id)_makeOnboardingHistoryWithVersionCompleted:(int64_t)a3 versionCompletedKey:(id)a4 additionalValues:(id)a5 countryCodeKey:(id)a6;
- (id)electrocardiogramOnboardingCountryCode;
- (id)electrocardiogramOnboardingHistoryType:(int64_t)a3;
- (int)featureAvailabilityConditionsDidUpdateNotificationToken;
- (int)onboardingStateDidChangeNotificationToken;
- (int)userCharacteristicsDidChangeNotificationToken;
- (int64_t)_getOnboardingVersionForKey:(id)a3;
- (int64_t)atrialFibrillationDetectionRescindedStatus;
- (int64_t)electrocardiogramOnboardingCompletedVersionNoCache;
- (int64_t)electrocardiogramRecordingRescindedStatus;
- (unint64_t)electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone;
- (void)_electrocardiogramFirstOnboardingCompletedDate;
- (void)_featureAvailabilityConditionsDidUpdate;
- (void)_pairedOrActiveDevicesDidChange:(id)a3;
- (void)_registerForNotifications;
- (void)_removeFirstOnboardingCompletedDatesForKey:(id)a3 completion:(id)a4;
- (void)_resetElectrocardiogramRescindedStatusCacheWithLock:(BOOL)a3;
- (void)_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 inCountryCode:(id)a4;
- (void)_setFirstOnboardingCompletedDate:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)_setOnboardingVersionCompleted:(int64_t)a3 forKey:(id)a4 additionalValues:(id)a5 completion:(id)a6;
- (void)_triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay:(int64_t)a3;
- (void)_unregisterForNotifications;
- (void)_updateOnboardingCompletionForKey:(id)a3 andVersion:(int64_t)a4;
- (void)addHeartRhythmAvailabilityObserver:(id)a3;
- (void)dealloc;
- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3;
- (void)electrocardiogramOnboardingCountryCode;
- (void)notifyHeartRhythmAvailabilityDidUpdate;
- (void)removeHeartRhythmAvailabilityObserver:(id)a3;
- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3;
- (void)setCurrentCountryCode:(id)a3;
- (void)setEcgAppAvailability:(id)a3;
- (void)setElectrocardiogramAvailabilityDataSource:(id)a3;
- (void)setElectrocardiogramFirstOnboardingCompletedDate:(id)a3;
- (void)setElectrocardiogramOnboardingCompleted;
- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3;
- (void)setHealthStore:(id)a3;
- (void)setHeartRhythmAvailabilityObservers:(id)a3;
- (void)setHeartRhythmUserDefaults:(id)a3;
- (void)setKeyValueDomain:(id)a3;
- (void)setMobileCountryCodeManager:(id)a3;
- (void)setOnboardingKeysReadSet:(id)a3;
- (void)setOnboardingStateDidChangeNotificationToken:(int)a3;
- (void)setUserCharacteristicsDidChangeNotificationToken:(int)a3;
- (void)unitTest_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 countryCode:(id)a4 completion:(id)a5;
- (void)updateElectrocardiogramWatchAppInstallIsAllowed;
- (void)updateOnboardingCompletionVersionCache;
@end

@implementation HKHeartRhythmAvailability

- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKHeartRhythmAvailability;
  v6 = [(HKHeartRhythmAvailability *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc_init(HKActiveWatchRemoteFeatureAvailabilityDataSource);
    electrocardiogramAvailabilityDataSource = v7->_electrocardiogramAvailabilityDataSource;
    v7->_electrocardiogramAvailabilityDataSource = v8;

    v10 = [HKObserverSet alloc];
    uint64_t v11 = [(HKObserverSet *)v10 initWithName:@"heart-rhythm-availability-observers" loggingCategory:HKLogHeartRhythm];
    heartRhythmAvailabilityObservers = v7->_heartRhythmAvailabilityObservers;
    v7->_heartRhythmAvailabilityObservers = (HKObserverSet *)v11;

    uint64_t v13 = +[HKKeyValueDomain heartRhythmDefaultsDomainWithHealthStore:v5];
    keyValueDomain = v7->_keyValueDomain;
    v7->_keyValueDomain = (HKKeyValueDomain *)v13;

    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
    heartRhythmUserDefaults = v7->_heartRhythmUserDefaults;
    v7->_heartRhythmUserDefaults = (NSUserDefaults *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    onboardingKeysReadSet = v7->_onboardingKeysReadSet;
    v7->_onboardingKeysReadSet = v17;

    *(void *)&v7->_cacheLock._os_unfair_lock_opaque = 0;
    v19 = [[HKWatchAppAvailability alloc] initWithBundleID:@"com.apple.NanoHeartRhythm"];
    ecgAppAvailability = v7->_ecgAppAvailability;
    v7->_ecgAppAvailability = v19;

    [(HKHeartRhythmAvailability *)v7 _registerForNotifications];
  }

  return v7;
}

- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3 currentCountryCode:(id)a4
{
  id v7 = a4;
  v8 = [(HKHeartRhythmAvailability *)self initWithHealthStore:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_currentCountryCode, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(HKHeartRhythmAvailability *)self _unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)HKHeartRhythmAvailability;
  [(HKHeartRhythmAvailability *)&v3 dealloc];
}

- (void)addHeartRhythmAvailabilityObserver:(id)a3
{
}

- (void)removeHeartRhythmAvailabilityObserver:(id)a3
{
}

- (void)notifyHeartRhythmAvailabilityDidUpdate
{
}

uint64_t __67__HKHeartRhythmAvailability_notifyHeartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 heartRhythmAvailabilityDidUpdate];
}

+ (BOOL)isHeartRateEnabledInPrivacy
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.nanolifestyle.privacy"];
  objc_super v3 = [v2 objectForKey:@"EnableHeartRate"];

  if (v3) {
    char v4 = [v2 BOOLForKey:@"EnableHeartRate"];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isHeartAgeGatingEnabledOnActiveWatchWithCurrentDate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() activePairedDevice];
  if (v5) {
    BOOL v6 = [(HKHeartRhythmAvailability *)self isHeartAgeGatingEnabledOnWatch:v5 currentDate:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isHeartAgeGatingEnabledOnWatch:(id)a3 currentDate:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F29128];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithUUIDString:@"D6645782-7A76-4E52-8155-151366EBD4AB"];
  int v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    healthStore = self->_healthStore;
    id v17 = 0;
    v12 = [(HKHealthStore *)healthStore dateOfBirthComponentsWithError:&v17];
    id v13 = v17;
    v14 = v13;
    if (v12)
    {
      BOOL v15 = objc_msgSend(v12, "hk_ageWithCurrentDate:", v6) < 13;
    }
    else
    {
      if (v13)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
          -[HKHeartRhythmAvailability isHeartAgeGatingEnabledOnWatch:currentDate:]();
        }
      }
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:(id)a3
{
  return [(HKHeartRhythmAvailability *)self _meetsMinimumAgeRequirementWithMinimumRequiredAge:22 currentDate:a3];
}

- (BOOL)_meetsMinimumAgeRequirementWithMinimumRequiredAge:(int64_t)a3 currentDate:(id)a4
{
  id v6 = a4;
  healthStore = self->_healthStore;
  id v13 = 0;
  id v8 = [(HKHealthStore *)healthStore dateOfBirthComponentsWithError:&v13];
  id v9 = v13;
  int v10 = v9;
  if (v8)
  {
    BOOL v11 = objc_msgSend(v8, "hk_ageWithCurrentDate:", v6) >= a3;
  }
  else
  {
    if (v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:]();
      }
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_registerForNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = MEMORY[0x1E4F14428];
  id v4 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke;
  handler[3] = &unk_1E58BED68;
  objc_copyWeak(&v32, &location);
  notify_register_dispatch("HKHeartRhythmOnboardingStateDidChangeNotification", &self->_onboardingStateDidChangeNotificationToken, v3, handler);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_2;
  v29[3] = &unk_1E58BED68;
  objc_copyWeak(&v30, &location);
  notify_register_dispatch("HKRemoteFeatureAvailabilityConditionsDidUpdateNotification", &self->_featureAvailabilityConditionsDidUpdateNotificationToken, v3, v29);
  id v5 = MEMORY[0x1E4F14428];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_3;
  v27 = &unk_1E58BED68;
  objc_copyWeak(&v28, &location);
  notify_register_dispatch("com.apple.healthd.user-characteristics.did-change", &self->_userCharacteristicsDidChangeNotificationToken, v5, &v24);

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v7 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1;
  uint64_t v42 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_block_invoke_1;
    v37 = &unk_1E58BD760;
    v38 = &v39;
    id v8 = (void *)NanoRegistryLibrary_5();
    id v9 = dlsym(v8, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    *(void *)(v38[1] + 24) = v9;
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1 = *(void *)(v38[1] + 24);
    id v7 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (v7)
  {
    id v10 = *v7;
    BOOL v11 = [getNRPairedDeviceRegistryClass_1() sharedInstance];
    [v6 addObserver:self selector:sel__pairedOrActiveDevicesDidChange_ name:v10 object:v11];

    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    v12 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1;
    uint64_t v42 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1;
    if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1)
    {
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_block_invoke_1;
      v37 = &unk_1E58BD760;
      v38 = &v39;
      id v13 = (void *)NanoRegistryLibrary_5();
      v14 = dlsym(v13, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
      *(void *)(v38[1] + 24) = v14;
      getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1 = *(void *)(v38[1] + 24);
      v12 = (id *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (v12)
    {
      id v15 = *v12;
      v16 = [getNRPairedDeviceRegistryClass_1() sharedInstance];
      [v6 addObserver:self selector:sel__pairedOrActiveDevicesDidChange_ name:v15 object:v16];

      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      id v17 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1;
      uint64_t v42 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1;
      if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1)
      {
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        v36 = __getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_block_invoke_1;
        v37 = &unk_1E58BD760;
        v38 = &v39;
        v18 = (void *)NanoRegistryLibrary_5();
        v19 = dlsym(v18, "NRPairedDeviceRegistryDeviceDidBecomeActive");
        *(void *)(v38[1] + 24) = v19;
        getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1 = *(void *)(v38[1] + 24);
        id v17 = (id *)v40[3];
      }
      _Block_object_dispose(&v39, 8);
      if (v17)
      {
        id v20 = *v17;
        v21 = [getNRPairedDeviceRegistryClass_1() sharedInstance];
        [v6 addObserver:self selector:sel__pairedOrActiveDevicesDidChange_ name:v20 object:v21];

        [v6 addObserver:self selector:sel__localeDidChange name:*MEMORY[0x1E4F1C370] object:0];
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
        return;
      }
      objc_super v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"HKHeartRhythmAvailability.m", 65, @"%s", dlerror(), v24, v25, v26, v27);
    }
    else
    {
      objc_super v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"NSString *getNRPairedDeviceRegistryDeviceDidUnpairNotification(void)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"HKHeartRhythmAvailability.m", 64, @"%s", dlerror(), v24, v25, v26, v27);
    }
  }
  else
  {
    objc_super v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"NSString *getNRPairedDeviceRegistryDeviceIsSetupNotification(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"HKHeartRhythmAvailability.m", 63, @"%s", dlerror(), v24, v25, v26, v27);
  }

  __break(1u);
}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyHeartRhythmAvailabilityDidUpdate];
}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _featureAvailabilityConditionsDidUpdate];
}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyHeartRhythmAvailabilityDidUpdate];
}

- (void)_unregisterForNotifications
{
  if (notify_is_valid_token(self->_onboardingStateDidChangeNotificationToken)) {
    notify_cancel(self->_onboardingStateDidChangeNotificationToken);
  }
  if (notify_is_valid_token(self->_featureAvailabilityConditionsDidUpdateNotificationToken)) {
    notify_cancel(self->_featureAvailabilityConditionsDidUpdateNotificationToken);
  }
  if (notify_is_valid_token(self->_userCharacteristicsDidChangeNotificationToken))
  {
    int userCharacteristicsDidChangeNotificationToken = self->_userCharacteristicsDidChangeNotificationToken;
    notify_cancel(userCharacteristicsDidChangeNotificationToken);
  }
}

- (void)_featureAvailabilityConditionsDidUpdate
{
  [(HKHeartRhythmAvailability *)self _resetElectrocardiogramRescindedStatusCacheWithLock:1];

  [(HKHeartRhythmAvailability *)self notifyHeartRhythmAvailabilityDidUpdate];
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  id v4 = objc_alloc_init(HKActiveWatchRemoteFeatureAvailabilityDataSource);
  electrocardiogramAvailabilityDataSource = self->_electrocardiogramAvailabilityDataSource;
  self->_electrocardiogramAvailabilityDataSource = v4;

  [(HKHeartRhythmAvailability *)self _resetElectrocardiogramRescindedStatusCacheWithLock:1];

  [(HKHeartRhythmAvailability *)self notifyHeartRhythmAvailabilityDidUpdate];
}

+ (id)activePairedDevice
{
  v2 = [getNRPairedDeviceRegistryClass_1() sharedInstance];
  objc_super v3 = [getNRPairedDeviceRegistryClass_1() activeDeviceSelectorBlock];
  id v4 = [v2 getDevicesMatching:v3];
  id v5 = [v4 firstObject];

  return v5;
}

+ (id)pairedDevices
{
  v2 = [getNRPairedDeviceRegistryClass_1() sharedInstance];
  objc_super v3 = [v2 getSetupCompletedDevices];

  return v3;
}

+ (Class)deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice
{
  return (Class)objc_opt_class();
}

+ (Class)deviceRegionFeatureSupportedStateProviderForCompanionDevice:(id)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)isCompanionRegionCheckEnabledForActiveWatch
{
  v2 = objc_opt_class();
  objc_super v3 = [(id)objc_opt_class() activePairedDevice];
  LOBYTE(v2) = [v2 isCompanionRegionCheckEnabledForDevice:v3];

  return (char)v2;
}

+ (BOOL)isCompanionRegionCheckEnabledForDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithUUIDString:@"03C7A646-DB1E-404B-B393-033E5496A383"];
  int v7 = [v5 supportsCapability:v6];

  _HKInitializeLogging();
  id v8 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = objc_opt_class();
    id v11 = v10;
    v12 = NSStringFromSelector(a2);
    int v14 = 138543874;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v12;
    __int16 v18 = 1026;
    int v19 = v7;
    _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> supports capability: %{public}d", (uint8_t *)&v14, 0x1Cu);
  }
  return v7;
}

+ (BOOL)isCompanionRegionCheckEnabledOnPairedPhone
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 activePairedDevice];
  if (v4)
  {
    int v5 = [(id)objc_opt_class() isCompanionRegionCheckEnabledForDevice:v4];
    id v6 = +[HKNanoRegistryDeviceUtility systemBuildVersionForDevice:v4];
    int v7 = [v6 hasPrefix:@"17E5223"] ^ 1;
    LODWORD(v8) = v5 & v7;
    _HKInitializeLogging();
    id v9 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = NSStringFromSelector(a2);
      int v17 = 138544130;
      id v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 1026;
      int v22 = (int)v8;
      __int16 v23 = 1026;
      int v24 = v7;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (companion software supported: %{public}d)", (uint8_t *)&v17, 0x22u);
    }
  }
  else
  {
    _HKInitializeLogging();
    int v14 = (void *)HKLogHeartRhythm;
    LOBYTE(v8) = 0;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v14;
      id v15 = NSStringFromSelector(a2);
      int v17 = 138543874;
      id v18 = a1;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      __int16 v21 = 1026;
      int v22 = 0;
      _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (No paired phone)", (uint8_t *)&v17, 0x1Cu);

      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

+ (id)currentDeviceRegionCode
{
  return +[_HKBehavior currentDeviceRegionCode];
}

+ (id)featureAvailabilityUserDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CB18], "hk_remoteFeatureAvailabilityUserDefaults");
}

- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4
{
  return [(HKHeartRhythmAvailability *)self _isOnboardingCompletedForKey:a3 version:a4 useCache:1];
}

- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v5)
  {
    id v10 = [(HKHeartRhythmAvailability *)self heartRhythmUserDefaults];
    id v11 = [v10 objectForKey:v9];

    if (v11)
    {
      LOBYTE(v12) = [v11 integerValue] >= a4;
      p_onboardingKeysReadLock = &self->_onboardingKeysReadLock;
      os_unfair_lock_lock(&self->_onboardingKeysReadLock);
      int v14 = [(HKHeartRhythmAvailability *)self onboardingKeysReadSet];
      char v15 = [v14 containsObject:v9];

      if (v15)
      {
        _HKInitializeLogging();
        __int16 v16 = (void *)HKLogHeartRhythm;
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_INFO))
        {
          int v17 = v16;
          id v18 = objc_opt_class();
          id v19 = v18;
          uint64_t v20 = NSStringFromSelector(a2);
          int v33 = 138544130;
          uint64_t v34 = (const char *)v18;
          __int16 v35 = 2114;
          *(void *)v36 = v20;
          *(_WORD *)&v36[8] = 2114;
          *(void *)&v36[10] = v9;
          *(_WORD *)&v36[18] = 2114;
          v37 = v11;
          __int16 v21 = v17;
          os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_16:
          _os_log_impl(&dword_19C023000, v21, v22, "[%{public}@ %{public}@%{public}@] -> %{public}@ (Cached value)", (uint8_t *)&v33, 0x2Au);
        }
      }
      else
      {
        v29 = [(HKHeartRhythmAvailability *)self onboardingKeysReadSet];
        [v29 addObject:v9];

        _HKInitializeLogging();
        id v30 = (void *)HKLogHeartRhythm;
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = v30;
          v31 = objc_opt_class();
          id v19 = v31;
          uint64_t v20 = NSStringFromSelector(a2);
          int v33 = 138544130;
          uint64_t v34 = (const char *)v31;
          __int16 v35 = 2114;
          *(void *)v36 = v20;
          *(_WORD *)&v36[8] = 2114;
          *(void *)&v36[10] = v9;
          *(_WORD *)&v36[18] = 2114;
          v37 = v11;
          __int16 v21 = v17;
          os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_16;
        }
      }
      os_unfair_lock_unlock(p_onboardingKeysReadLock);

      goto LABEL_18;
    }
  }
  if (![v9 isEqualToString:@"HKElectrocardiogramOnboardingCompleted"])
  {
    unint64_t v27 = [(HKHeartRhythmAvailability *)self _getOnboardingVersionForKey:v9];
    int v12 = v27 >= a4;
    if (!v5) {
      goto LABEL_12;
    }
LABEL_10:
    if (v27) {
      [(HKHeartRhythmAvailability *)self _updateOnboardingCompletionForKey:v9 andVersion:v27];
    }
    goto LABEL_12;
  }
  __int16 v23 = [(HKHeartRhythmAvailability *)self electrocardiogramOnboardingHistoryType:1];
  int v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "maxOnboardedVersion"));
  uint64_t v25 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  v26 = +[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:v24 keyValueDomain:v25];

  unint64_t v27 = +[HKElectrocardiogramActiveAlgorithmVersion onboardingVersionForKnownAlgorithmVersion:](HKElectrocardiogramActiveAlgorithmVersion, "onboardingVersionForKnownAlgorithmVersion:", [v26 integerValue]);
  int v12 = [v23 containsOnboardedVersion:a4];

  if (v5) {
    goto LABEL_10;
  }
LABEL_12:
  _HKInitializeLogging();
  id v28 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136447234;
    uint64_t v34 = "-[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:useCache:]";
    __int16 v35 = 1024;
    *(_DWORD *)v36 = v12;
    *(_WORD *)&v36[4] = 2114;
    *(void *)&v36[6] = v9;
    *(_WORD *)&v36[14] = 1026;
    *(_DWORD *)&v36[16] = a4;
    LOWORD(v37) = 1026;
    *(_DWORD *)((char *)&v37 + 2) = v27;
    _os_log_impl(&dword_19C023000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %i, argKey: %{public}@ argVersion: %{public}i, versionCompleted: %{public}i", (uint8_t *)&v33, 0x28u);
  }
LABEL_18:

  return v12;
}

- (int64_t)_getOnboardingVersionForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  id v16 = 0;
  int v7 = [v6 numberForKey:v5 error:&v16];
  id v8 = v16;

  if (v7)
  {
    int64_t v9 = [v7 integerValue];
  }
  else
  {
    if (v8)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        -[HKHeartRhythmAvailability _getOnboardingVersionForKey:]((uint64_t)v5);
      }
    }
    int64_t v9 = 0;
  }
  _HKInitializeLogging();
  id v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v12 = objc_opt_class();
    id v13 = v12;
    int v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    id v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 2048;
    int64_t v24 = v9;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@%{public}@] -> %ld (Retrieved from HealthKit)", buf, 0x2Au);
  }
  return v9;
}

- (void)_updateOnboardingCompletionForKey:(id)a3 andVersion:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(HKHeartRhythmAvailability *)self heartRhythmUserDefaults];
  [v7 setInteger:a4 forKey:v6];

  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];

  HKSynchronizeNanoPreferencesUserDefaults(@"com.apple.private.health.heart-rhythm", v8);
}

+ (id)_onboardingHistoryKeyFromCompletedKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HKElectrocardiogramOnboardingCompleted"])
  {
    id v4 = @"HKElectrocardiogramOnboardingHistory";
  }
  else
  {
    if (([v3 isEqualToString:@"HKAtrialFibrillationDetectionOnboardingCompleted"] & 1) == 0)
    {
      _HKInitializeLogging();
      id v5 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        +[HKHeartRhythmAvailability _onboardingHistoryKeyFromCompletedKey:](v5);
      }
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)_onboardingCountryCodeKeyFromCompletedKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HKElectrocardiogramOnboardingCompleted"])
  {
    id v4 = @"HKElectrocardiogramOnboardingCountryCode";
  }
  else if ([v3 isEqualToString:@"HKAtrialFibrillationDetectionOnboardingCompleted"])
  {
    id v4 = @"HKAtrialFibrillationDetectionOnboardingCountryCode";
  }
  else
  {
    _HKInitializeLogging();
    id v5 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      +[HKHeartRhythmAvailability _onboardingHistoryKeyFromCompletedKey:](v5);
    }
    id v4 = 0;
  }

  return v4;
}

- (id)_makeOnboardingHistoryWithVersionCompleted:(int64_t)a3 versionCompletedKey:(id)a4 additionalValues:(id)a5 countryCodeKey:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = objc_opt_class();
    int v14 = [(HKHeartRhythmAvailability *)self keyValueDomain];
    char v15 = [v13 _onboardingHistoryWithVersionCompletedKey:v12 keyValueDomain:v14];

    id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
    int v17 = [v11 objectForKeyedSubscript:v10];

    id v18 = &stru_1EEC60288;
    if (v17) {
      id v18 = v17;
    }
    __int16 v19 = v18;

    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a3);
    [v16 setObject:v19 forKey:v20];

    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v16];
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v21;
}

- (void)_setOnboardingVersionCompleted:(int64_t)a3 forKey:(id)a4 additionalValues:(id)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v26 = a5;
  id v27 = a6;
  id v11 = (void *)[v26 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v14 = v13;

  char v15 = [(id)objc_opt_class() _onboardingHistoryKeyFromCompletedKey:v10];
  uint64_t v16 = [(id)objc_opt_class() _onboardingCountryCodeKeyFromCompletedKey:v10];
  int v17 = (void *)v16;
  if (!v15 || !v16) {
    goto LABEL_8;
  }
  id v18 = [(HKHeartRhythmAvailability *)self _makeOnboardingHistoryWithVersionCompleted:a3 versionCompletedKey:v10 additionalValues:v26 countryCodeKey:v16];
  __int16 v19 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  id v32 = 0;
  char v20 = [v19 setPropertyListValue:v18 forKey:v15 error:&v32];
  id v21 = v32;

  if (v20)
  {

LABEL_8:
    id v22 = [NSNumber numberWithInteger:a3];
    [v14 setObject:v22 forKeyedSubscript:v10];

    _HKInitializeLogging();
    __int16 v23 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v34 = "-[HKHeartRhythmAvailability _setOnboardingVersionCompleted:forKey:additionalValues:completion:]";
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2114;
      id v38 = v10;
      __int16 v39 = 2114;
      v40 = v14;
      _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}s] %ld %{public}@ %{public}@", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    int64_t v24 = [(HKHeartRhythmAvailability *)self keyValueDomain];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke;
    v28[3] = &unk_1E58C7620;
    v31[1] = (id)a3;
    id v29 = v10;
    id v30 = v27;
    objc_copyWeak(v31, (id *)buf);
    [v24 setValuesWithDictionary:v14 completion:v28];

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);
    goto LABEL_16;
  }
  _HKInitializeLogging();
  uint64_t v25 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v34 = (const char *)a3;
    __int16 v35 = 2112;
    int64_t v36 = (int64_t)v10;
    __int16 v37 = 2112;
    id v38 = v21;
    _os_log_error_impl(&dword_19C023000, v25, OS_LOG_TYPE_ERROR, "Couldn't set heart rhythm onboarding history %ld for key [%@]: %@", buf, 0x20u);
  }
  if (v27) {
    (*((void (**)(id, void, id))v27 + 2))(v27, 0, v21);
  }

LABEL_16:
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = [WeakRetained heartRhythmUserDefaults];
    int64_t v9 = v8;
    if (v6) {
      [v8 setInteger:*(void *)(a1 + 56) forKey:*(void *)(a1 + 32)];
    }
    else {
      [v8 removeObjectForKey:*(void *)(a1 + 32)];
    }

    id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
    HKSynchronizeNanoPreferencesUserDefaults(@"com.apple.private.health.heart-rhythm", v11);

    notify_post("HKHeartRhythmOnboardingStateDidChangeNotification");
    id v12 = [HKNanoSyncControl alloc];
    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    int v14 = [v13 healthStore];
    char v15 = [(HKNanoSyncControl *)v12 initWithHealthStore:v14];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_114;
    v16[3] = &unk_1E58C75F8;
    uint64_t v19 = *(void *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    [(HKNanoSyncControl *)v15 forceNanoSyncWithOptions:0 completion:v16];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_cold_1();
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v5);
    }
  }
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_114(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_114_cold_1();
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
}

- (void)_setFirstOnboardingCompletedDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:v8 forKeyedSubscript:v9];
  _HKInitializeLogging();
  id v12 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v23 = "-[HKHeartRhythmAvailability _setFirstOnboardingCompletedDate:forKey:completion:]";
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] %{public}@ %{public}@ %{public}@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  id v13 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C7648;
  id v14 = v8;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  objc_copyWeak(&v21, (id *)buf);
  [v13 setValuesWithDictionary:v11 completion:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [HKNanoSyncControl alloc];
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v8 = [WeakRetained healthStore];
    id v9 = [(HKNanoSyncControl *)v6 initWithHealthStore:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_116;
    v11[3] = &unk_1E58BDCC8;
    id v12 = a1[4];
    id v13 = a1[5];
    id v14 = a1[6];
    [(HKNanoSyncControl *)v9 forceNanoSyncWithOptions:0 completion:v11];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_cold_1();
    }
    id v10 = (void (**)(id, void, id))a1[6];
    if (v10) {
      v10[2](v10, 0, v5);
    }
  }
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_116(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_116_cold_1();
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
}

- (void)_removeFirstOnboardingCompletedDatesForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  objc_initWeak(&location, self);
  id v9 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke;
  v12[3] = &unk_1E58C7670;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  objc_copyWeak(&v15, &location);
  [v9 removeValuesForKeys:v8 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [HKNanoSyncControl alloc];
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v8 = [WeakRetained healthStore];
    id v9 = [(HKNanoSyncControl *)v6 initWithHealthStore:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_117;
    v11[3] = &unk_1E58BBA50;
    id v12 = a1[4];
    id v13 = a1[5];
    [(HKNanoSyncControl *)v9 forceNanoSyncWithOptions:0 completion:v11];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_cold_1((uint64_t)a1);
    }
    id v10 = (void (**)(id, void, id))a1[5];
    if (v10) {
      v10[2](v10, 0, v5);
    }
  }
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_117(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_117_cold_1(a1);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
}

- (void)_triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay:(int64_t)a3
{
  notify_post("HKRemoteFeatureAvailabilityConditionsDidUpdateNotification");
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HKHeartRhythmAvailability__triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay___block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

void __87__HKHeartRhythmAvailability__triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay___block_invoke()
{
  id v2 = [(id)objc_opt_class() featureAvailabilityUserDefaults];
  v0 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setObject:v0 forKey:@"RefreshFeatureAvailabilityConditions"];

  v1 = [MEMORY[0x1E4F1CAD0] setWithObject:@"RefreshFeatureAvailabilityConditions"];
  HKSynchronizeNanoPreferencesUserDefaults(@"com.apple.private.health.feature-availability", v1);
}

- (HKRegulatoryDomainProvider)mobileCountryCodeManager
{
  mobileCountryCodeManager = self->_mobileCountryCodeManager;
  if (!mobileCountryCodeManager)
  {
    HKPreferredRegulatoryDomainProvider();
    id v4 = (HKRegulatoryDomainProvider *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v5 = self->_mobileCountryCodeManager;
    self->_mobileCountryCodeManager = v4;

    mobileCountryCodeManager = self->_mobileCountryCodeManager;
  }

  return mobileCountryCodeManager;
}

- (BOOL)isElectrocardiogramAvailableOnWatch:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HKNanoRegistryDeviceUtility systemVersionForDevice:v7];
  BOOL v9 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:v6 andWatchDevice:v7];

  BOOL v10 = v9
     || [(HKHeartRhythmAvailability *)self _isECG1SupportedForCountryCode:v6 watchOSVersion:v8 isWatchOSSeedBuild:0];

  return v10;
}

- (BOOL)isElectrocardiogramAvailableForOnboardingCountryCode:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[_HKBehavior currentOSVersion];
  uint64_t NRRawVersionFromString = getNRRawVersionFromString(v5);

  id v7 = [(id)objc_opt_class() activePairedDevice];
  BOOL v8 = v7
    && +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:v4 andPhoneDevice:v7]|| [(HKHeartRhythmAvailability *)self _isECG1SupportedForCountryCode:v4 watchOSVersion:NRRawVersionFromString isWatchOSSeedBuild:0];

  return v8;
}

- (BOOL)isElectrocardiogramOnboardingCompleted
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

  if (v4)
  {
    dispatch_time_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v6 = [v5 BOOLForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

    return v6;
  }
  else
  {
    unint64_t v8 = +[HKECGOnboardingVersion newestAvailableVersion];
    return [(HKHeartRhythmAvailability *)self _isOnboardingCompletedForKey:@"HKElectrocardiogramOnboardingCompleted" version:v8];
  }
}

- (BOOL)isElectrocardiogramOnboardingCompletedNoCache
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

  if (v4)
  {
    dispatch_time_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v6 = [v5 BOOLForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

    return v6;
  }
  else
  {
    unint64_t v8 = +[HKECGOnboardingVersion newestAvailableVersion];
    return [(HKHeartRhythmAvailability *)self _isOnboardingCompletedForKey:@"HKElectrocardiogramOnboardingCompleted" version:v8 useCache:0];
  }
}

- (void)updateOnboardingCompletionVersionCache
{
  int64_t v3 = [(HKHeartRhythmAvailability *)self electrocardiogramOnboardingCompletedVersionNoCache];

  [(HKHeartRhythmAvailability *)self _updateOnboardingCompletionForKey:@"HKElectrocardiogramOnboardingCompleted" andVersion:v3];
}

- (void)updateElectrocardiogramWatchAppInstallIsAllowed
{
  if ([(HKHeartRhythmAvailability *)self _isOnboardingCompletedForKey:@"HKElectrocardiogramOnboardingCompleted" version:3])
  {
    [(HKHeartRhythmAvailability *)self setAllowInstallingElectrocardiogramWatchApp:1];
  }
}

- (int64_t)electrocardiogramOnboardingCompletedVersionNoCache
{
  int64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

  if (v4)
  {
    dispatch_time_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int64_t v6 = [v5 BOOLForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

    return v6;
  }
  else
  {
    return [(HKHeartRhythmAvailability *)self _getOnboardingVersionForKey:@"HKElectrocardiogramOnboardingCompleted"];
  }
}

- (id)electrocardiogramOnboardingCountryCode
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  id v16 = 0;
  id v4 = [v3 stringForKey:@"HKElectrocardiogramOnboardingCountryCode" error:&v16];
  id v5 = v16;

  if (!v4 && v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      -[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]();
    }
    if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
    {
      _HKInitializeLogging();
      int64_t v6 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        id v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
        _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}s]: Database inaccessible, resetting electrocardiogram disabled cache for next query.", buf, 0xCu);
      }
      [(HKHeartRhythmAvailability *)self _resetElectrocardiogramRescindedStatusCacheWithLock:0];
    }
    _HKInitializeLogging();
    id v7 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> nil (Error retrieving)", buf, 0xCu);
    }
    unint64_t v8 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v4, "hk_copyNonEmptyString");
  unint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8
    || ![(HKHeartRhythmAvailability *)self isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion])
  {
    _HKInitializeLogging();
    BOOL v9 = HKLogHeartRhythm;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136446466;
    id v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    __int16 v19 = 2114;
    id v20 = (const char *)v8;
    BOOL v10 = "[%{public}s] -> %{public}@ (Retrieved from HealthKit)";
  }
  else
  {
    _HKInitializeLogging();
    BOOL v9 = HKLogHeartRhythm;
    unint64_t v8 = @"US";
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136446466;
    id v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    __int16 v19 = 2114;
    id v20 = (const char *)@"US";
    BOOL v10 = "[%{public}s] -> %{public}@ (Not Present, Assumed)";
  }
  _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);
LABEL_19:
  _HKInitializeLogging();
  id v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v18 = v13;
    __int16 v19 = 2082;
    id v20 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    __int16 v21 = 2114;
    id v22 = v8;
    id v14 = v13;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] -> %{public}@", buf, 0x20u);
  }
LABEL_21:

  return v8;
}

- (id)_electrocardiogramFirstOnboardingCompletedDate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  id v7 = 0;
  int64_t v3 = [v2 dateForKey:@"HKElectrocardiogramFirstOnboardingCompleted" error:&v7];
  id v4 = v7;

  if (v3)
  {
    _HKInitializeLogging();
    id v5 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v9 = "-[HKHeartRhythmAvailability _electrocardiogramFirstOnboardingCompletedDate]";
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %{public}@ (Retrieved from HealthKit)", buf, 0x16u);
    }
  }
  else if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      -[HKHeartRhythmAvailability _electrocardiogramFirstOnboardingCompletedDate]();
    }
  }

  return v3;
}

- (void)setElectrocardiogramOnboardingCompleted
{
  unint64_t v3 = +[HKECGOnboardingVersion newestAvailableVersion];

  [(HKHeartRhythmAvailability *)self _setOnboardingVersionCompleted:v3 forKey:@"HKElectrocardiogramOnboardingCompleted" additionalValues:0 completion:0];
}

- (void)setElectrocardiogramFirstOnboardingCompletedDate:(id)a3
{
}

- (void)unitTest_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 countryCode:(id)a4 completion:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a4)
  {
    id v11 = @"HKElectrocardiogramOnboardingCountryCode";
    v12[0] = a4;
    BOOL v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = a4;
    a4 = [v9 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  [(HKHeartRhythmAvailability *)self _setOnboardingVersionCompleted:a3 forKey:@"HKElectrocardiogramOnboardingCompleted" additionalValues:a4 completion:v8];
}

- (void)_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 inCountryCode:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v12 = @"HKElectrocardiogramOnboardingCountryCode";
    v13[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    id v8 = 0;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__HKHeartRhythmAvailability__setElectrocardiogramOnboardingCompletedForVersion_inCountryCode___block_invoke;
  v9[3] = &unk_1E58C7698;
  objc_copyWeak(&v10, &location);
  [(HKHeartRhythmAvailability *)self _setOnboardingVersionCompleted:a3 forKey:@"HKElectrocardiogramOnboardingCompleted" additionalValues:v8 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__HKHeartRhythmAvailability__setElectrocardiogramOnboardingCompletedForVersion_inCountryCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay:2];
}

- (BOOL)activePairedDevicesSupportElectrocardiogramAlgorithmVersion:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [(id)objc_opt_class() activePairedDevice];
  if (!v5) {
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    int v6 = [(HKHeartRhythmAvailability *)self _activePairedDevicesSupportECGAlgorithmVersionTwo:v5];
    goto LABEL_7;
  }
  if (a3 != 1)
  {
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  int v6 = [(id)objc_opt_class() electrocardiogramSupportedForDevice:v5];
LABEL_7:
  BOOL v7 = v6;
LABEL_8:
  _HKInitializeLogging();
  id v8 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[HKHeartRhythmAvailability activePairedDevicesSupportElectrocardiogramAlgorithmVersion:]";
    __int16 v12 = 1024;
    BOOL v13 = v7;
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %i", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (BOOL)_activePairedDevicesSupportECGAlgorithmVersionTwo:(id)a3
{
  id v3 = a3;
  id v4 = +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice];
  id v5 = +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice:v3];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

+ (BOOL)shouldInstallWatchApp
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"HKForceInstallCinnamon"];

  if (v5) {
    return 1;
  }
  if (+[_HKBehavior isRunningStoreDemoMode])
  {
    _HKInitializeLogging();
    BOOL v7 = (void *)HKLogHeartRhythm;
    BOOL v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    id v8 = v7;
    BOOL v9 = NSStringFromSelector(a2);
    int v29 = 138543618;
    id v30 = a1;
    __int16 v31 = 2114;
    id v32 = v9;
    int v10 = "[%{public}@ %{public}@] -> 0 (Not allowed in Store Demo Mode)";
LABEL_15:
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v29, 0x16u);

    return 0;
  }
  id v11 = +[_HKBehavior sharedBehavior];
  int v12 = [v11 tinkerModeEnabled];

  if (v12)
  {
    _HKInitializeLogging();
    BOOL v13 = (void *)HKLogHeartRhythm;
    BOOL v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    id v8 = v13;
    BOOL v9 = NSStringFromSelector(a2);
    int v29 = 138543618;
    id v30 = a1;
    __int16 v31 = 2114;
    id v32 = v9;
    int v10 = "[%{public}@ %{public}@] -> 0 (Not allowed in Satellite Pairing Mode)";
    goto LABEL_15;
  }
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    _HKInitializeLogging();
    __int16 v19 = (void *)HKLogHeartRhythm;
    BOOL v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    id v8 = v19;
    BOOL v9 = NSStringFromSelector(a2);
    int v29 = 138543618;
    id v30 = a1;
    __int16 v31 = 2114;
    id v32 = v9;
    int v10 = "[%{public}@ %{public}@] -> 0 (Device hardware not supported)";
    goto LABEL_15;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  int v15 = objc_msgSend(v14, "hk_electrocardiogramWatchAppInstallHasBeenAllowed");

  if (v15)
  {
    _HKInitializeLogging();
    id v16 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = NSStringFromSelector(a2);
      int v29 = 138543618;
      id v30 = a1;
      __int16 v31 = 2114;
      id v32 = v18;
      _os_log_impl(&dword_19C023000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 1 (HKElectrocardiogramWatchAppInstallIsAllowed is set to True", (uint8_t *)&v29, 0x16u);
    }
    return 1;
  }
  __int16 v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.heart-rhythm"];
  id v22 = [v21 objectForKey:@"HKElectrocardiogramOnboardingCompleted"];

  if (v22 && (unint64_t)[v22 integerValue] >= 3)
  {
    _HKInitializeLogging();
    uint64_t v23 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = v23;
      id v25 = NSStringFromSelector(a2);
      int v29 = 138543618;
      id v30 = a1;
      __int16 v31 = 2114;
      id v32 = v25;
      _os_log_impl(&dword_19C023000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 1 (Onboarding has been completed (From Cached Value))", (uint8_t *)&v29, 0x16u);
    }
    BOOL v6 = 1;
  }
  else
  {
    _HKInitializeLogging();
    __int16 v26 = (void *)HKLogHeartRhythm;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v26;
      __int16 v28 = NSStringFromSelector(a2);
      int v29 = 138544386;
      id v30 = a1;
      __int16 v31 = 2114;
      id v32 = v28;
      __int16 v33 = 1026;
      int v34 = 1;
      __int16 v35 = 1026;
      int v36 = 0;
      __int16 v37 = 1026;
      int v38 = 0;
      _os_log_impl(&dword_19C023000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 0 (device supported (%{public}d), app install allowed (%{public}d), Current onboarding version completed (%{public}d))", (uint8_t *)&v29, 0x28u);

      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isElectrocardiogramAppInstallableForLocale:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 countryCode];
  _HKInitializeLogging();
  BOOL v7 = (void *)HKLogHeartRhythm;
  BOOL v8 = os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      BOOL v9 = v7;
      int v10 = NSStringFromSelector(a2);
      id v11 = [v5 localeIdentifier];
      int v16 = 138544130;
      id v17 = a1;
      __int16 v18 = 2114;
      __int16 v19 = v10;
      __int16 v20 = 2114;
      __int16 v21 = v11;
      __int16 v22 = 2114;
      uint64_t v23 = v6;
      _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Locale: %{public}@), Country Code: %{public}@)", (uint8_t *)&v16, 0x2Au);
    }
    char IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v6);
  }
  else
  {
    if (v8)
    {
      BOOL v13 = v7;
      uint64_t v14 = NSStringFromSelector(a2);
      int v16 = 138543618;
      id v17 = a1;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Locale contained a nil country code", (uint8_t *)&v16, 0x16u);
    }
    char IsAvailableForGeolocatedCountryCode = 0;
  }

  return IsAvailableForGeolocatedCountryCode;
}

- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  objc_msgSend(v6, "hk_setElectrocardiogramWatchAppInstallIsAllowed:", v3);

  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v21[0] = @"ElectrocardiogramWatchAppInstallIsAllowed";
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  BOOL v9 = (void *)[v7 initWithArray:v8];

  HKSynchronizeNanoPreferencesUserDefaults(@"com.apple.private.health.heart-rhythm", v9);
  _HKInitializeLogging();
  int v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v12 = NSStringFromSelector(a2);
    int v13 = 138544130;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    int v16 = v12;
    __int16 v17 = 2114;
    __int16 v18 = @"ElectrocardiogramWatchAppInstallIsAllowed";
    __int16 v19 = 1026;
    BOOL v20 = v3;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Triggered NanoPreferencesSync (key: %{public}@; value: %{public}d)",
      (uint8_t *)&v13,
      0x26u);
  }
}

- (BOOL)isElectrocardiogramAppInstallAllowedForWatch:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getNRDevicePropertyName();
  id v27 = [v4 valueForProperty:v5];

  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
  int v7 = [v4 supportsCapability:v6];

  BOOL v8 = getNRDevicePropertyIsAltAccount();
  BOOL v9 = [v4 valueForProperty:v8];
  int v26 = [v9 BOOLValue];

  BOOL v10 = [(HKHeartRhythmAvailability *)self isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
  int v12 = [v11 countryCode];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v13 = (void *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  uint64_t v32 = getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNRDevicePropertyCurrentUserLocaleSymbolLoc_block_invoke;
    *(void *)&long long v34 = &unk_1E58BD760;
    *((void *)&v34 + 1) = &v29;
    uint64_t v14 = (void *)NanoRegistryLibrary_5();
    __int16 v15 = dlsym(v14, "NRDevicePropertyCurrentUserLocale");
    *(void *)(*(void *)(*((void *)&v34 + 1) + 8) + 24) = v15;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr = *(void *)(*(void *)(*((void *)&v34 + 1) + 8) + 24);
    int v13 = (void *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v13) {
    -[HKHeartRhythmAvailability isElectrocardiogramAppInstallAllowedForWatch:]();
  }
  int v16 = [v4 valueForProperty:*v13];
  BOOL v17 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:v12 andWatchDevice:v4];
  if (((v17 | +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:v16 andWatchDevice:v4]) & 1) == 0)
  {
    if (v12)
    {
      int IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v12);
      if (v16)
      {
LABEL_9:
        int v21 = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v16);
        goto LABEL_12;
      }
    }
    else
    {
      int IsAvailableForGeolocatedCountryCode = 0;
      if (v16) {
        goto LABEL_9;
      }
    }
    int v21 = 0;
LABEL_12:
    int v18 = IsAvailableForGeolocatedCountryCode | v21;
    if (v7) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  int v18 = 1;
  if (v7)
  {
LABEL_6:
    int v19 = (v10 | v18) & ~v26;
    goto LABEL_14;
  }
LABEL_13:
  int v19 = 0;
LABEL_14:
  _HKInitializeLogging();
  __int16 v22 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    uint64_t v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138545154;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v34) = v19;
    WORD2(v34) = 2114;
    *(void *)((char *)&v34 + 6) = v27;
    HIWORD(v34) = 1026;
    int v35 = v7;
    __int16 v36 = 1026;
    int v37 = v26;
    __int16 v38 = 1026;
    BOOL v39 = v10;
    __int16 v40 = 1026;
    int v41 = v18;
    _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (deviceName: %{public}@, deviceSupported: %{public}d, tinkerPaired: %{public}d, anyOnboardingCompleted: %{public}d, localeSupported: %{public}d", buf, 0x3Eu);
  }
  return v19;
}

+ (BOOL)isElectrocardiogramSupportedOnWatch:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [a1 _electrocardiogramSupportedStateForDeviceRegion:v5];
  int v7 = [a1 electrocardiogramSupportedForDevice:v5];
  BOOL v8 = getNRDevicePropertyIsAltAccount();
  BOOL v9 = [v5 valueForProperty:v8];
  int v10 = [v9 BOOLValue];

  if (v6 < 2) {
    int v11 = v7 & ~v10;
  }
  else {
    int v11 = 0;
  }
  _HKInitializeLogging();
  int v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = v6 < 2;
    uint64_t v14 = v12;
    __int16 v15 = NSStringFromSelector(a2);
    int v16 = getNRDevicePropertyName();
    BOOL v17 = [v5 valueForProperty:v16];
    int v19 = 138544898;
    id v20 = a1;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v17;
    __int16 v25 = 1026;
    int v26 = v11;
    __int16 v27 = 1026;
    int v28 = v7;
    __int16 v29 = 1026;
    int v30 = v10;
    __int16 v31 = 1026;
    BOOL v32 = v13;
    _os_log_impl(&dword_19C023000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> %{public}d (Device supported: %{public}d; Alt Account: %{public}d; Region"
      " supported: %{public}d;)",
      (uint8_t *)&v19,
      0x38u);
  }
  return v11;
}

+ (BOOL)isElectrocardiogramSupportedOnAnyWatch
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnAnyWatch"];

  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v7 = [v6 BOOLForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnAnyWatch"];

    return v7;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v9 = objc_msgSend(a1, "pairedDevices", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([a1 isElectrocardiogramSupportedOnWatch:*(void *)(*((void *)&v16 + 1) + 8 * i)])
          {
            LODWORD(v10) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    _HKInitializeLogging();
    BOOL v13 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      __int16 v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v21 = a1;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      __int16 v24 = 1026;
      int v25 = v10;
      _os_log_impl(&dword_19C023000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", buf, 0x1Cu);
    }
    return v10;
  }
}

+ (BOOL)isElectrocardiogramSupportedOnActiveWatch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActiveWatch"];

  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v7 = [v6 BOOLForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActiveWatch"];

    return v7;
  }
  else
  {
    BOOL v9 = [a1 activePairedDevice];
    if (v9) {
      int v10 = [a1 isElectrocardiogramSupportedOnWatch:v9];
    }
    else {
      int v10 = 0;
    }
    _HKInitializeLogging();
    uint64_t v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      BOOL v13 = NSStringFromSelector(a2);
      int v14 = 138543874;
      id v15 = a1;
      __int16 v16 = 2114;
      long long v17 = v13;
      __int16 v18 = 1026;
      int v19 = v10;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v14, 0x1Cu);
    }
    return v10;
  }
}

+ (BOOL)isElectrocardiogramSupportedOnAllWatches
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnAllWatches"];

  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v7 = [v6 BOOLForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnAllWatches"];

    return v7;
  }
  else
  {
    BOOL v9 = [a1 pairedDevices];
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v10 = [v9 count] != 0;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          if (!objc_msgSend(a1, "isElectrocardiogramSupportedOnWatch:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19))
          {
            BOOL v10 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    _HKInitializeLogging();
    __int16 v16 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = v16;
      __int16 v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v24 = a1;
      __int16 v25 = 2114;
      int v26 = v18;
      __int16 v27 = 1026;
      BOOL v28 = v10;
      _os_log_impl(&dword_19C023000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", buf, 0x1Cu);
    }
    return v10;
  }
}

+ (unint64_t)electrocardiogramSupportedStateForWatch:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a1 electrocardiogramSupportedForDevice:v5];
  char v7 = getNRDevicePropertyIsAltAccount();
  BOOL v8 = [v5 valueForProperty:v7];
  int v9 = [v8 BOOLValue];

  unint64_t v10 = [a1 _electrocardiogramSupportedStateForDeviceRegion:v5];
  _HKInitializeLogging();
  id v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = getNRDevicePropertyName();
    id v15 = [v5 valueForProperty:v14];
    __int16 v16 = NSStringFromHKElectrocardiogramSupportedState(v10);
    int v20 = 138544642;
    id v21 = a1;
    __int16 v22 = 2114;
    __int16 v23 = v13;
    __int16 v24 = 2114;
    __int16 v25 = v15;
    __int16 v26 = 1026;
    int v27 = v6;
    __int16 v28 = 1026;
    int v29 = v9;
    __int16 v30 = 2114;
    __int16 v31 = v16;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> (Device supported: %{public}d; Alt Account: %{public}d; Region supported: %{public}@)",
      (uint8_t *)&v20,
      0x36u);
  }
  uint64_t v17 = 5;
  if (!v9) {
    uint64_t v17 = v10;
  }
  if (v6) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = 2;
  }

  return v18;
}

+ (unint64_t)electrocardiogramSupportedStateForActiveWatch
{
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"HKGlobalDefaultsElectrocardiogramSupportedStateForActiveWatchKey"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 integerForKey:@"HKGlobalDefaultsElectrocardiogramSupportedStateForActiveWatchKey"];
  }
  else
  {
    id v5 = [a1 activePairedDevice];
    if (!v5)
    {
      unint64_t v7 = 2;
      goto LABEL_6;
    }
    uint64_t v6 = [a1 electrocardiogramSupportedStateForWatch:v5];
  }
  unint64_t v7 = v6;
LABEL_6:

  return v7;
}

+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch
{
  id v2 = [a1 activePairedDevice];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (unint64_t)_electrocardiogramSupportedStateForDeviceRegion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "deviceRegionFeatureSupportedStateProviderForCompanionDevice:", v4), "electrocardiogramSupportedStateForDeviceRegion:", v4);

  return v5;
}

+ (unint64_t)electrocardiogramSupportedState
{
  BOOL v3 = +[_HKBehavior sharedBehavior];
  char v4 = [v3 tinkerModeEnabled];

  if (v4) {
    return 5;
  }
  uint64_t v6 = (void *)[a1 deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice];

  return [v6 electrocardiogramSupportedStateForCurrentDeviceRegion];
}

- (BOOL)shouldAdvertiseElectrocardiogramForActiveWatch
{
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 objectForKey:@"HKGlobalDefaultsShouldAdvertiseElectrocardiogramForActiveWatchKey"];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v6 = [v5 BOOLForKey:@"HKGlobalDefaultsShouldAdvertiseElectrocardiogramForActiveWatchKey"];
  }
  else
  {
    unint64_t v5 = [(id)objc_opt_class() activePairedDevice];
    if (!v5)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    char v6 = [(HKHeartRhythmAvailability *)self shouldAdvertiseElectrocardiogramForWatch:v5];
  }
  BOOL v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)shouldAdvertiseElectrocardiogramForWatch:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HKHeartRhythmAvailability *)self _shouldAdvertiseECGDirectOnboardingWithDevice:v4];
  BOOL v6 = [(HKHeartRhythmAvailability *)self _shouldAdvertiseECG2DirectOnboardingWithWatchDevice:v4];

  BOOL v7 = [NSNumber numberWithBool:v5];
  v11[0] = v7;
  BOOL v8 = [NSNumber numberWithBool:v6];
  v11[1] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  LOBYTE(self) = [(HKHeartRhythmAvailability *)self _shouldAdvertiseWithAdvertiseECGVersions:v9];

  return (char)self;
}

- (BOOL)_shouldAdvertiseECGDirectOnboardingWithDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_currentCountryCode)
  {
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [(id)objc_opt_class() electrocardiogramSupportedStateForWatch:v5];
  if (v6 == 1)
  {
    if (HKElectrocardiogramIsAvailableForGeolocatedCountryCode(self->_currentCountryCode))
    {
      int v7 = [(id)objc_opt_class() isElectrocardiogramSupportedOnWatch:v5];
      goto LABEL_9;
    }
  }
  else if (!v6)
  {
    int v7 = 1;
    goto LABEL_9;
  }
  int v7 = 0;
LABEL_9:
  int v9 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v10 = [(HKHeartRhythmAvailability *)self _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:v9];

  int v8 = v7 & v10;
  _HKInitializeLogging();
  id v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = NSStringFromSelector(a2);
    currentCountryCode = self->_currentCountryCode;
    int v16 = 138544386;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    long long v19 = v13;
    __int16 v20 = 1026;
    int v21 = v8;
    __int16 v22 = 2114;
    __int16 v23 = currentCountryCode;
    __int16 v24 = 1026;
    BOOL v25 = v10;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (Cached MCC: %{public}@, Meets Minimum Age Requirement: %{public}d)", (uint8_t *)&v16, 0x2Cu);
  }
LABEL_11:

  return v8;
}

- (BOOL)_shouldAdvertiseECG2DirectOnboardingWithWatchDevice:(id)a3
{
  BOOL v3 = [(HKHeartRhythmAvailability *)self _ecg2AvailabilityWithWatchDevice:a3];
  char v4 = [v3 advertiseDirectOnboarding];

  return v4;
}

- (id)_ecg2AvailabilityWithWatchDevice:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  currentCountryCode = self->_currentCountryCode;
  id v5 = a3;
  BOOL v43 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:currentCountryCode andWatchDevice:v5];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v42 = [(HKHeartRhythmAvailability *)self _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:v6];

  int v7 = [(HKHeartRhythmAvailability *)self _electrocardiogramOnboardingHistoryKnown];
  unint64_t v8 = [(id)objc_opt_class() currentElectrocardiogramOnboardingVersion];
  int v9 = [v7 filteredHistoryByVersion:v8 filterType:2];
  uint64_t v10 = [v9 count];
  BOOL v11 = v10 > 0;
  uint64_t v12 = [(HKHeartRhythmAvailability *)self heartRhythmUserDefaults];
  uint64_t v13 = [v12 objectForKey:@"HKElectrocardiogramOnboardingCompleted"];

  int v41 = v13;
  if (v13)
  {
    unint64_t v14 = [v13 integerValue];
    BOOL v11 = v10 > 0 || v14 < v8;
    LODWORD(v13) = [v13 integerValue] == 4;
  }
  v44 = v7;
  char v16 = [v7 containsOnboardedVersion:4];
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  int v18 = [v17 BOOLForKey:@"HKElectrocardiogramV1ToV2UpgradeBackgroundDelivered"];

  long long v19 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  int v20 = [v19 BOOLForKey:@"HKElectrocardiogramV1ToV2UpgradeAlertDismissed"];

  if ((v16 & 1) != 0 || v13) {
    uint64_t v21 = v18 & (v20 ^ 1u);
  }
  else {
    uint64_t v21 = 0;
  }
  unsigned int v22 = [(id)objc_opt_class() electrocardiogramSupportedForDevice:v5];
  __int16 v23 = +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice:v5];

  unsigned int v39 = v22;
  if (v23) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = 0;
  }
  BOOL v25 = getNRDevicePropertyIsAltAccount();
  uint64_t v26 = [v5 valueForProperty:v25];

  char v27 = [v26 BOOLValue];
  LOBYTE(v37) = v27;
  __int16 v28 = +[HKECGAvailabilityEngine shouldAdvertiseECG2WithSupportedRegion:v43 meetsAgeRequirement:v42 backgroundDeliveredNotAdvertised:v21 prevOnboarded:v11 watchCapable:v24 phoneCapable:1 isTinker:v37];
  _HKInitializeLogging();
  int v29 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v38 = v23 != 0;
    __int16 v30 = v29;
    __int16 v31 = NSStringFromSelector(a2);
    int v32 = [v28 advertiseDirectOnboarding];
    int v33 = [v28 advertiseUpgradeBackgroundDelivered];
    int v34 = [v28 advertiseUpgrade];
    int v35 = self->_currentCountryCode;
    *(_DWORD *)buf = 138546178;
    v46 = self;
    __int16 v47 = 2114;
    v48 = v31;
    __int16 v49 = 1026;
    int v50 = v32;
    __int16 v51 = 1026;
    int v52 = v33;
    __int16 v53 = 1026;
    int v54 = v34;
    __int16 v55 = 2114;
    v56 = v35;
    __int16 v57 = 1026;
    BOOL v58 = v43;
    __int16 v59 = 1026;
    BOOL v60 = v42;
    __int16 v61 = 1026;
    BOOL v62 = v11;
    __int16 v63 = 1026;
    unsigned int v64 = v39;
    __int16 v65 = 1026;
    BOOL v66 = v38;
    __int16 v67 = 1026;
    int v68 = 1;
    _os_log_impl(&dword_19C023000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG2 advertiseDirect: %{public}d advertiseUpgradeBackgroundDelivered: %{public}d advertiseUpgrade: %{public}d (Cached MCC: %{public}@, SupportedRegion: %{public}d, meetsMinAge: %{public}d, highestOnboardedVersionIsLessThanNewestKnownVersion: %{public}d, watchHardwareSupported: %{public}d, watchSoftwareSupported: %{public}d, phoneCapable: %{public}d", buf, 0x56u);
  }

  return v28;
}

- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3
{
  return [(HKHeartRhythmAvailability *)self _ecg2AvailabilityWithPhoneDevice:a3 wasUpgradeBackgroundDelivered:0];
}

- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3 wasUpgradeBackgroundDelivered:(BOOL)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v40 = v6;
  if (a4)
  {
    BOOL v41 = 1;
  }
  else
  {
    id v7 = v6;
    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    int v9 = [v8 countryCode];

    BOOL v41 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:v9 andPhoneDevice:v7];
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v11 = [(HKHeartRhythmAvailability *)self _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:v10];

  uint64_t v12 = [(HKHeartRhythmAvailability *)self _electrocardiogramOnboardingHistoryKnown];
  unsigned int v39 = objc_msgSend(v12, "filteredHistoryByVersion:filterType:", objc_msgSend((id)objc_opt_class(), "currentElectrocardiogramOnboardingVersion"), 2);
  uint64_t v13 = [v39 count];
  BOOL v38 = v12;
  LODWORD(v12) = [v12 containsOnboardedVersion:4];
  unint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  int v15 = [v14 BOOLForKey:@"HKElectrocardiogramV1ToV2UpgradeBackgroundDelivered"];

  char v16 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  int v17 = [v16 BOOLForKey:@"HKElectrocardiogramV1ToV2UpgradeAlertDismissed"];

  if (v12) {
    uint64_t v18 = v15 & (v17 ^ 1u);
  }
  else {
    uint64_t v18 = 0;
  }
  unsigned int v19 = MGGetBoolAnswer();
  int v20 = +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice];

  if (v20) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 0;
  }
  unsigned int v22 = +[_HKBehavior sharedBehavior];
  char v23 = [v22 tinkerModeEnabled];

  LOBYTE(v36) = v23;
  BOOL v24 = v11;
  BOOL v25 = +[HKECGAvailabilityEngine shouldAdvertiseECG2WithSupportedRegion:v41 meetsAgeRequirement:v11 backgroundDeliveredNotAdvertised:v18 prevOnboarded:v13 > 0 watchCapable:v21 phoneCapable:1 isTinker:v36];
  _HKInitializeLogging();
  uint64_t v26 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = v20 != 0;
    BOOL v28 = v13 > 0;
    int v29 = v26;
    __int16 v30 = NSStringFromSelector(a2);
    int v31 = [v25 advertiseDirectOnboarding];
    int v32 = [v25 advertiseUpgradeBackgroundDelivered];
    int v33 = [v25 advertiseUpgrade];
    currentCountryCode = self->_currentCountryCode;
    *(_DWORD *)buf = 138546178;
    BOOL v43 = self;
    __int16 v44 = 2114;
    v45 = v30;
    __int16 v46 = 1026;
    int v47 = v31;
    __int16 v48 = 1026;
    int v49 = v32;
    __int16 v50 = 1026;
    int v51 = v33;
    __int16 v52 = 2114;
    __int16 v53 = currentCountryCode;
    __int16 v54 = 1026;
    BOOL v55 = v41;
    __int16 v56 = 1026;
    BOOL v57 = v24;
    __int16 v58 = 1026;
    BOOL v59 = v28;
    __int16 v60 = 1026;
    unsigned int v61 = v19;
    __int16 v62 = 1026;
    BOOL v63 = v27;
    __int16 v64 = 1026;
    int v65 = 1;
    _os_log_impl(&dword_19C023000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG2 advertiseDirect: %{public}d advertiseUpgradeBackgroundDelivered: %{public}d advertiseUpgrade: %{public}d (Cached MCC: %{public}@, SupportedRegion: %{public}d, meetsMinAge: %{public}d, prevOnboarded: %{public}d, watchHardwareSupported: %{public}d, watchSoftwareSupported: %{public}d, phoneCapable: %{public}d", buf, 0x56u);
  }

  return v25;
}

- (BOOL)_shouldAdvertiseWithAdvertiseECGVersions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "BOOLValue", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_shouldAdvertiseElectrocardiogramUpgradeForDevice:(id)a3
{
  id v3 = self;
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HKHeartRhythmAvailability *)self _shouldAdvertiseECG2UpgradeWithDevice:a3];
  uint64_t v5 = [NSNumber numberWithBool:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  LOBYTE(v3) = [(HKHeartRhythmAvailability *)v3 _shouldAdvertiseWithAdvertiseECGVersions:v6];

  return (char)v3;
}

- (BOOL)_shouldAdvertiseECG2UpgradeWithDevice:(id)a3
{
  id v3 = [(HKHeartRhythmAvailability *)self _ecg2AvailabilityWithWatchDevice:a3];
  char v4 = [v3 advertiseUpgrade];

  return v4;
}

- (BOOL)_shouldAdvertiseECG2BackgroundDeliveryCompletedWithDevice:(id)a3
{
  id v3 = [(HKHeartRhythmAvailability *)self _ecg2AvailabilityWithWatchDevice:a3];
  char v4 = [v3 advertiseUpgradeBackgroundDelivered];

  return v4;
}

- (BOOL)shouldAdvertiseECG2BackgroundDeliveryCompletedForActiveWatch
{
  id v3 = [(id)objc_opt_class() activePairedDevice];
  if (v3) {
    BOOL v4 = [(HKHeartRhythmAvailability *)self _shouldAdvertiseElectrocardiogramUpgradeForDevice:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone
{
  id v3 = [(id)objc_opt_class() activePairedDevice];
  if (!v3
    || (unint64_t v4 = 1,
        -[HKHeartRhythmAvailability _ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:](self, "_ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:", v3, 1), uint64_t v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 advertiseUpgradeBackgroundDelivered], v5, (v6 & 1) == 0))
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)shouldAdvertiseElectrocardiogramUpgradeBackgroundDeliveryCompletedForActivePhone
{
  return [(HKHeartRhythmAvailability *)self electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone] != 0;
}

+ (BOOL)isElectrocardiogramSupportedOnPairedPhone
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"];

  if (!v5)
  {
    long long v9 = [a1 activePairedDevice];
    if (v9) {
      int v7 = [a1 _isElectrocardiogramSupportedOnPhone:v9];
    }
    else {
      int v7 = 0;
    }
    _HKInitializeLogging();
    long long v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = NSStringFromSelector(a2);
      int v15 = 138543874;
      id v16 = a1;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      __int16 v19 = 1026;
      int v20 = v7;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);
    }
    goto LABEL_9;
  }
  char v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"];

  _HKInitializeLogging();
  long long v8 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = v8;
    long long v10 = NSStringFromSelector(a2);
    int v15 = 138543874;
    id v16 = a1;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1026;
    int v20 = v7;
    _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);

LABEL_9:
  }
  return v7;
}

+ (BOOL)isElectrocardiogramSupportedOnPairedPhoneWithGeolocatedCountryCode:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 objectForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"];

  if (v7)
  {
    long long v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LOBYTE(v9) = [v8 BOOLForKey:@"HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"];
  }
  else
  {
    long long v10 = [a1 activePairedDevice];
    if (v10) {
      int v9 = [a1 _isElectrocardiogramSupportedOnPhone:v10 geolocatedCountryCode:v5];
    }
    else {
      int v9 = 0;
    }
    _HKInitializeLogging();
    long long v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = NSStringFromSelector(a2);
      int v15 = 138543874;
      id v16 = a1;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      __int16 v19 = 1026;
      int v20 = v9;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);
    }
  }

  return v9;
}

+ (BOOL)electrocardiogramSupportedForDevice:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
  char v6 = [v4 supportsCapability:v5];

  return v6;
}

+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = getNRDevicePropertySystemVersion();
  int v7 = [v5 valueForProperty:v6];
  uint64_t NRRawVersionFromString = getNRRawVersionFromString(v7);

  int IsGreaterThanOrEqual = getNRVersionIsGreaterThanOrEqual(NRRawVersionFromString);
  _HKInitializeLogging();
  long long v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    uint64_t v13 = getNRDevicePropertyName();
    unint64_t v14 = [v5 valueForProperty:v13];
    int v16 = 138544130;
    id v17 = a1;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    __int16 v22 = 1026;
    int v23 = IsGreaterThanOrEqual;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> %{public}d)", (uint8_t *)&v16, 0x26u);
  }
  return IsGreaterThanOrEqual;
}

+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3 geolocatedCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isECG2SupportedForCountryCode:v7 andPhoneDevice:v6]) {
    char v8 = 1;
  }
  else {
    char v8 = [a1 _isECG1SupportedOnCompanionDevice:v6 geolocatedCountryCode:v7];
  }

  return v8;
}

+ (BOOL)_isECG1SupportedOnCompanionDevice:(id)a3 geolocatedCountryCode:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = getNRDevicePropertySystemVersion();
  int v9 = [v6 valueForProperty:v8];

  uint64_t NRRawVersionFromString = getNRRawVersionFromString(v9);
  long long v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v12 = [v11 stringForKey:@"HKForceIOSVersionKey"];

  if (v12)
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = v13;
      int v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v34 = a1;
      __int16 v35 = 2114;
      uint64_t v36 = v15;
      __int16 v37 = 2114;
      BOOL v38 = v12;
      _os_log_impl(&dword_19C023000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"] Forcing iOS product version: %{public}@)", buf, 0x20u);
    }
    int v16 = a2;
    id v17 = v12;

    int v9 = v17;
  }
  else
  {
    int v16 = a2;
  }
  unint64_t v18 = objc_msgSend((id)objc_msgSend(a1, "deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice"), "electrocardiogramSupportedOnPhone:iOSVersionString:", v6, v9);
  unint64_t v19 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion(v7, NRRawVersionFromString, 0);

  int IsGreaterThanOrEqual = getNRVersionIsGreaterThanOrEqual(NRRawVersionFromString);
  int v21 = IsGreaterThanOrEqual;
  if (v19 < 2) {
    BOOL v22 = IsGreaterThanOrEqual;
  }
  else {
    BOOL v22 = 0;
  }
  BOOL v23 = v18 < 2 && v22;
  _HKInitializeLogging();
  uint64_t v24 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = v19 < 2;
    BOOL v31 = v18 < 2;
    uint64_t v26 = v24;
    BOOL v27 = NSStringFromSelector(v16);
    BOOL v28 = getNRDevicePropertyName();
    int v29 = [v6 valueForProperty:v28];
    *(_DWORD *)buf = 138544898;
    id v34 = a1;
    __int16 v35 = 2114;
    uint64_t v36 = v27;
    __int16 v37 = 2114;
    BOOL v38 = v29;
    __int16 v39 = 1026;
    BOOL v40 = v23;
    __int16 v41 = 1026;
    int v42 = v21;
    __int16 v43 = 1026;
    BOOL v44 = v31;
    __int16 v45 = 1026;
    BOOL v46 = v25;
    _os_log_impl(&dword_19C023000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> (feature supported: %{public}d, OS supported: %{public}d, region supported: %{public}d, country supported: %{public}d)", buf, 0x38u);
  }
  return v23;
}

+ (BOOL)isElectrocardiogram2SupportedWithCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 activePairedDevice];
  if (v5) {
    char v6 = [a1 _isECG2SupportedForCountryCode:v4 andWatchDevice:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isECG1SupportedForCountryCode:(id)a3 watchOSVersion:(unsigned int)a4 isWatchOSSeedBuild:(BOOL)a5
{
  return (unint64_t)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion(a3, *(uint64_t *)&a4, a5) < 2;
}

+ (BOOL)isECG1SupportedOnlyForCountryCode:(id)a3
{
  id v4 = a3;
  char IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v4);
  char v6 = [a1 _ECG2SupportedCountriesOnDevice];
  id v7 = [[HKCountrySet alloc] initWithDictionaryRepresentation:v6 provenance:1];
  BOOL v8 = [(HKCountrySet *)v7 containsCountryCode:v4];

  return IsAvailableForGeolocatedCountryCode & !v8;
}

+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andWatchDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [a1 _ECG2SupportedCountriesOnDevice];
  long long v10 = [a1 _ECG2SupportedCountriesOnDevice:v8];

  int64_t v11 = +[HKCountrySet isRegionCodeFound:v7 availabilityWatch:v10 availabilityPhone:v9];
  _HKInitializeLogging();
  uint64_t v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    unint64_t v14 = NSStringFromSelector(a2);
    int v16 = 138544642;
    id v17 = a1;
    __int16 v18 = 2114;
    unint64_t v19 = v14;
    __int16 v20 = 1026;
    int v21 = v11;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    BOOL v25 = v10;
    __int16 v26 = 2114;
    BOOL v27 = v9;
    _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Comparator result: %{public}i for country code: %{public}@ with watch availability: %{public}@ phone availability: %{public}@", (uint8_t *)&v16, 0x3Au);
  }
  return v11 == 1;
}

+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andPhoneDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [a1 _ECG2SupportedCountriesOnDevice];
  long long v10 = [a1 _ECG2SupportedCountriesOnDevice:v8];

  int64_t v11 = +[HKCountrySet isRegionCodeFound:v7 availabilityWatch:v9 availabilityPhone:v10];
  _HKInitializeLogging();
  uint64_t v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    unint64_t v14 = NSStringFromSelector(a2);
    int v16 = 138544642;
    id v17 = a1;
    __int16 v18 = 2114;
    unint64_t v19 = v14;
    __int16 v20 = 1026;
    int v21 = v11;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    BOOL v25 = v9;
    __int16 v26 = 2114;
    BOOL v27 = v10;
    _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Comparator result: %{public}i for country code: %{public}@ with watch availability: %{public}@ phone availability: %{public}@", (uint8_t *)&v16, 0x3Au);
  }
  return v11 == 1;
}

+ (id)_ECG2SupportedCountriesOnDevice
{
  id v2 = [a1 _availabilityPlistURL];
  uint64_t v5 = 0;
  id v3 = +[HKCountrySet regionsWithPlistAtURL:v2 error:&v5];

  return v3;
}

+ (id)_ECG2SupportedCountriesOnDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[HKNanoRegistryDeviceUtility electrocardiogramV2AvailableRegionsForDevice:v4];
  if (!v5)
  {
    _HKInitializeLogging();
    char v6 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = a1;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nil available regions found for paired device %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

+ (id)_availabilityPlistURL
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [(id)GSSystemRootDirectory() stringByAppendingString:@"/System/Library/Health/AvailableRegions"];
  id v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  uint64_t v5 = [v4 URLByAppendingPathComponent:@"ElectrocardiogramV2Recording"];

  char v6 = [v5 URLByAppendingPathExtension:@"plist"];

  return v6;
}

- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void, void *))a3;
  char v6 = [(id)objc_opt_class() activePairedDevice];
  if (v6)
  {
    id v7 = [(HKHeartRhythmAvailability *)self ecgAppAvailability];
    [v7 appInstallStateOnWatch:v6 completion:v5];
  }
  else
  {
    _HKInitializeLogging();
    int v8 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      __int16 v10 = NSStringFromSelector(a2);
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      unint64_t v14 = v10;
      _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> No active device", (uint8_t *)&v11, 0x16u);
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"No active device");
    v5[2](v5, 0, v7);
  }
}

+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3
{
  id v5 = a3;
  char v6 = [a1 activePairedDevice];
  if (v6)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2050000000;
    id v7 = (void *)getASDSystemAppMetadataClass_softClass;
    uint64_t v25 = getASDSystemAppMetadataClass_softClass;
    if (!getASDSystemAppMetadataClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      unint64_t v19 = __getASDSystemAppMetadataClass_block_invoke;
      __int16 v20 = &unk_1E58BD760;
      int v21 = &v22;
      __getASDSystemAppMetadataClass_block_invoke((uint64_t)&v17);
      id v7 = (void *)v23[3];
    }
    int v8 = v7;
    _Block_object_dispose(&v22, 8);
    id v9 = (void *)[[v8 alloc] initWithBundleID:@"com.apple.NanoHeartRhythm"];
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2050000000;
    __int16 v10 = (void *)getASDInstallAppsClass_softClass;
    uint64_t v25 = getASDInstallAppsClass_softClass;
    if (!getASDInstallAppsClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      unint64_t v19 = __getASDInstallAppsClass_block_invoke;
      __int16 v20 = &unk_1E58BD760;
      int v21 = &v22;
      __getASDInstallAppsClass_block_invoke((uint64_t)&v17);
      __int16 v10 = (void *)v23[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v22, 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke;
    v13[3] = &unk_1E58C76C0;
    id v15 = a1;
    SEL v16 = a2;
    id v14 = v5;
    [v11 installApp:v9 onPairedDevice:v6 withCompletionHandler:v13];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      +[HKHeartRhythmAvailability installElectrocardiogramAppOnActiveWatch:a2];
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"No active device");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v9);
  }
}

void __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)HKLogHeartRhythm;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1((uint64_t)a1, v5, (uint64_t)v4);
    }
    char v6 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      id v7 = (const char *)a1[6];
      id v9 = v5;
      __int16 v10 = NSStringFromSelector(v7);
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduled installation of ECG app on watch", (uint8_t *)&v11, 0x16u);
    }
    char v6 = *(void (**)(void))(a1[4] + 16);
  }
  v6();
}

+ (int64_t)_electrocardiogramRescindedStatusWithDataSource:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"HKGlobalDefaultsIsCinnamonSeedExpired"];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v9 = [v8 BOOLForKey:@"HKGlobalDefaultsIsCinnamonSeedExpired"];

    if (v9)
    {
      int64_t v10 = 2;
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v12 = [v11 objectForKey:@"HKGlobalDefaultsIsCinnamonRemotelyDisabled"];
  if (v12)
  {
    __int16 v13 = (void *)v12;
    id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v15 = [v14 BOOLForKey:@"HKGlobalDefaultsIsCinnamonRemotelyDisabled"];

    if (v15)
    {
      int64_t v10 = 1;
      goto LABEL_15;
    }
  }
  else
  {
  }
  SEL v16 = a2;
  uint64_t v17 = [(id)objc_opt_class() featureAvailabilityUserDefaults];
  uint64_t v18 = [v17 dictionaryRepresentation];

  unint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v48[0] = @"DisableElectrocardiogramRecording";
  v48[1] = @"ExpireElectrocardiogramRecording";
  __int16 v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  int v21 = [v19 setWithArray:v20];

  uint64_t v22 = [[HKRemoteFeatureAvailabilityRuleSet alloc] initWithRawValue:v18 dataSource:v4 supportedConditions:v21];
  id v23 = [(HKRemoteFeatureAvailabilityRuleSet *)v22 evaluateAll];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"DisableElectrocardiogramRecording"];
  unsigned int v25 = [v24 BOOLValue];

  __int16 v26 = [v23 objectForKeyedSubscript:@"ExpireElectrocardiogramRecording"];
  int v27 = [v26 BOOLValue];

  _HKInitializeLogging();
  uint64_t v28 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    log = v28;
    int v29 = objc_opt_class();
    id v37 = v29;
    __int16 v30 = NSStringFromSelector(v16);
    [v4 onboardingCountryCode];
    id v31 = v4;
    int v32 = v21;
    id v34 = v33 = v18;
    *(_DWORD *)buf = 138544386;
    __int16 v39 = v29;
    __int16 v40 = 2114;
    __int16 v41 = v30;
    __int16 v42 = 2114;
    __int16 v43 = v34;
    __int16 v44 = 1026;
    unsigned int v45 = v25;
    __int16 v46 = 1026;
    int v47 = v27;
    _os_log_impl(&dword_19C023000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@ Country: %{public}@] -> Disabled: %{public}d, Expired: %{public}d", buf, 0x2Cu);

    uint64_t v18 = v33;
    int v21 = v32;
    id v4 = v31;
  }
  if (v27) {
    int64_t v10 = 2;
  }
  else {
    int64_t v10 = v25;
  }

LABEL_15:
  return v10;
}

- (void)_resetElectrocardiogramRescindedStatusCacheWithLock:(BOOL)a3
{
  if (a3)
  {
    os_unfair_lock_lock(&self->_cacheLock);
    electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = 0;

    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    id v5 = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = 0;
  }
}

- (BOOL)isElectrocardiogramRecordingDisabled
{
  return [(HKHeartRhythmAvailability *)self electrocardiogramRecordingRescindedStatus] != 0;
}

- (int64_t)electrocardiogramRecordingRescindedStatus
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
  if (!electrocardiogramRescindedStatusCache)
  {
    id v5 = [(HKHeartRhythmAvailability *)self electrocardiogramOnboardingCountryCode];
    [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self->_electrocardiogramAvailabilityDataSource setOnboardingCountryCode:v5];

    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "_electrocardiogramRescindedStatusWithDataSource:", self->_electrocardiogramAvailabilityDataSource));
    uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = v6;

    electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
  }
  int64_t v8 = [(NSNumber *)electrocardiogramRescindedStatusCache integerValue];
  os_unfair_lock_unlock(p_cacheLock);
  return v8;
}

+ (int64_t)currentElectrocardiogramOnboardingVersion
{
  return +[HKECGOnboardingVersion newestAvailableVersion];
}

- (BOOL)isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v7 = [v6 BOOLForKey:@"HKGlobalDefaultsIsCinnamonOnboardingCompleted"];

    return v7;
  }
  else
  {
    char v9 = [(HKHeartRhythmAvailability *)self heartRhythmUserDefaults];
    int64_t v10 = [v9 objectForKey:@"HKElectrocardiogramOnboardingCompleted"];

    if (v10)
    {
      _HKInitializeLogging();
      int v11 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        __int16 v13 = objc_opt_class();
        id v14 = v13;
        char v15 = NSStringFromSelector(a2);
        int v18 = 138544130;
        unint64_t v19 = v13;
        __int16 v20 = 2114;
        int v21 = v15;
        __int16 v22 = 2114;
        id v23 = @"HKElectrocardiogramOnboardingCompleted";
        __int16 v24 = 2114;
        unsigned int v25 = v10;
        _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@%{public}@] -> %{public}@ (Cached value)", (uint8_t *)&v18, 0x2Au);
      }
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v17 = [(HKHeartRhythmAvailability *)self electrocardiogramOnboardingHistoryType:2];
      BOOL v16 = [v17 count] > 0;
    }
    return v16;
  }
}

- (id)electrocardiogramOnboardingHistoryType:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(HKHeartRhythmAvailability *)self _electrocardiogramOnboardingHistoryKnown];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v3 = [(HKHeartRhythmAvailability *)self _electrocardiogramOnboardingHistory];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_electrocardiogramOnboardingHistory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  id v4 = [(HKHeartRhythmAvailability *)self keyValueDomain];
  id v5 = [v3 _onboardingHistoryWithVersionCompletedKey:@"HKElectrocardiogramOnboardingCompleted" keyValueDomain:v4];

  uint64_t v6 = [[HKHeartRhythmOnboardingHistory alloc] initWithDictionary:v5];
  _HKInitializeLogging();
  char v7 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int64_t v10 = "-[HKHeartRhythmAvailability _electrocardiogramOnboardingHistory]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] AllHistory: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)_electrocardiogramOnboardingHistoryKnown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [(HKHeartRhythmAvailability *)self _electrocardiogramOnboardingHistory];
  id v3 = objc_msgSend(v2, "filteredHistoryByVersion:filterType:", +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion"), 1);
  _HKInitializeLogging();
  id v4 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    char v7 = "-[HKHeartRhythmAvailability _electrocardiogramOnboardingHistoryKnown]";
    __int16 v8 = 2112;
    int v9 = v3;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s] KnownHistory: %@", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

+ (id)electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _onboardingHistoryWithVersionCompletedKey:@"HKElectrocardiogramOnboardingCompleted" keyValueDomain:v3];
  id v5 = [v4 allKeys];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v22;
  int64_t v9 = 0xFFFFFFFF80000000;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) integerValue];
      if ((unint64_t)v11 < 5 && v11 > v9) {
        int64_t v9 = v11;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  }
  while (v7);
  if (v9 != 0xFFFFFFFF80000000)
  {
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v9);
    char v15 = [v4 objectForKeyedSubscript:v14];
    uint64_t v16 = [(__CFString *)v15 length];
    uint64_t v17 = &stru_1EEC60288;
    if (v16) {
      uint64_t v17 = v15;
    }
    unsigned int v25 = v14;
    uint64_t v26 = v17;
    int v18 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v19 = v17;
    uint64_t v13 = [v18 dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  }
  else
  {
LABEL_14:
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

+ (id)_onboardingHistoryWithVersionCompletedKey:(id)a3 keyValueDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _onboardingHistoryKeyFromCompletedKey:v6];
  id v23 = 0;
  int64_t v9 = [v7 propertyListValueForKey:v8 error:&v23];
  id v10 = v23;
  uint64_t v11 = v10;
  if (v9 || !v10)
  {
    id v22 = 0;
    uint64_t v13 = [v7 numberForKey:v6 error:&v22];
    id v14 = v22;
    uint64_t v19 = [v13 integerValue];

    if (v14)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:]();
      }
    }
    __int16 v20 = v14;
    char v15 = [a1 _onboardingCountryCodeKeyFromCompletedKey:v6];
    id v21 = 0;
    uint64_t v16 = [v7 stringForKey:v15 error:&v21];
    id v17 = v21;
    if (v17)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:]();
      }
    }
    uint64_t v12 = [a1 _history:v9 addCurrentOnboardingVersionCompletedIfApplicable:v19 countryCode:v16];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:]();
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v12;
}

+ (id)_history:(id)a3 addCurrentOnboardingVersionCompletedIfApplicable:(int64_t)a4 countryCode:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (__CFString *)a5;
  int64_t v9 = v8;
  id v10 = &stru_1EEC60288;
  if (v8) {
    id v10 = v8;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = v12;
  if (v7) {
    [v12 addEntriesFromDictionary:v7];
  }
  if (a4)
  {
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a4);
    [v13 setObject:v11 forKey:v14];
  }
  char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v13];

  return v15;
}

- (BOOL)isAtrialFibrillationDetectionSettingEnabled
{
  id v2 = [[HKFeatureStatusManager alloc] initWithFeatureIdentifier:@"IrregularRhythmNotifications" healthStore:self->_healthStore countryCodeSource:0];
  id v3 = [(HKFeatureStatusManager *)v2 featureStatusWithError:0];
  id v4 = [v3 onboardingRecord];
  id v5 = [v4 featureSettings];
  id v6 = [v5 numberForKey:@"Enabled"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)isAtrialFibrillationDetectionOnboardingCompleted
{
  id v2 = [[HKFeatureStatusManager alloc] initWithFeatureIdentifier:@"IrregularRhythmNotifications" healthStore:self->_healthStore countryCodeSource:0];
  id v3 = [(HKFeatureStatusManager *)v2 featureStatusWithError:0];
  char v4 = [v3 isOnboardingRecordPresent];

  return v4;
}

- (BOOL)shouldAdvertiseAtrialFibrillationDetectionForActiveWatch
{
  id v2 = [[HKFeatureStatusManager alloc] initWithFeatureIdentifier:@"IrregularRhythmNotifications" healthStore:self->_healthStore countryCodeSource:1];
  id v3 = [(HKFeatureStatusManager *)v2 featureStatusWithError:0];
  char v4 = [v3 objectForKeyedSubscript:@"OnboardingPromotion"];
  char v5 = [v4 areAllRequirementsSatisfied];

  return v5;
}

- (BOOL)isAtrialFibrillationDetectionDisabled
{
  return [(HKHeartRhythmAvailability *)self atrialFibrillationDetectionRescindedStatus] != 0;
}

- (int64_t)atrialFibrillationDetectionRescindedStatus
{
  id v2 = [[HKFeatureStatusManager alloc] initWithFeatureIdentifier:@"IrregularRhythmNotifications" healthStore:self->_healthStore countryCodeSource:0];
  id v3 = [(HKFeatureStatusManager *)v2 featureStatusWithError:0];
  char v4 = v3;
  if (v3 && [v3 isOnboardingRecordPresent])
  {
    char v5 = [v4 objectForKeyedSubscript:@"Usage"];
    id v6 = [v5 objectForKeyedSubscript:@"SeedIsNotExpired"];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = [v5 objectForKeyedSubscript:@"FeatureIsNotRemotelyDisabled"];
    int v9 = [v8 BOOLValue];

    if (v7) {
      int64_t v10 = v9 ^ 1u;
    }
    else {
      int64_t v10 = 2;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
}

- (NSUserDefaults)heartRhythmUserDefaults
{
  return self->_heartRhythmUserDefaults;
}

- (void)setHeartRhythmUserDefaults:(id)a3
{
}

- (HKObserverSet)heartRhythmAvailabilityObservers
{
  return self->_heartRhythmAvailabilityObservers;
}

- (void)setHeartRhythmAvailabilityObservers:(id)a3
{
}

- (HKActiveWatchRemoteFeatureAvailabilityDataSource)electrocardiogramAvailabilityDataSource
{
  return self->_electrocardiogramAvailabilityDataSource;
}

- (void)setElectrocardiogramAvailabilityDataSource:(id)a3
{
}

- (NSMutableSet)onboardingKeysReadSet
{
  return self->_onboardingKeysReadSet;
}

- (void)setOnboardingKeysReadSet:(id)a3
{
}

- (int)onboardingStateDidChangeNotificationToken
{
  return self->_onboardingStateDidChangeNotificationToken;
}

- (void)setOnboardingStateDidChangeNotificationToken:(int)a3
{
  self->_onboardingStateDidChangeNotificationToken = a3;
}

- (int)featureAvailabilityConditionsDidUpdateNotificationToken
{
  return self->_featureAvailabilityConditionsDidUpdateNotificationToken;
}

- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3
{
  self->_featureAvailabilityConditionsDidUpdateNotificationToken = a3;
}

- (int)userCharacteristicsDidChangeNotificationToken
{
  return self->_userCharacteristicsDidChangeNotificationToken;
}

- (void)setUserCharacteristicsDidChangeNotificationToken:(int)a3
{
  self->_int userCharacteristicsDidChangeNotificationToken = a3;
}

- (void)setMobileCountryCodeManager:(id)a3
{
}

- (NSString)currentCountryCode
{
  return self->_currentCountryCode;
}

- (void)setCurrentCountryCode:(id)a3
{
}

- (HKWatchAppAvailability)ecgAppAvailability
{
  return self->_ecgAppAvailability;
}

- (void)setEcgAppAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecgAppAvailability, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_onboardingKeysReadSet, 0);
  objc_storeStrong((id *)&self->_electrocardiogramAvailabilityDataSource, 0);
  objc_storeStrong((id *)&self->_heartRhythmAvailabilityObservers, 0);
  objc_storeStrong((id *)&self->_heartRhythmUserDefaults, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_electrocardiogramRescindedStatusCache, 0);
}

- (void)isHeartAgeGatingEnabledOnWatch:currentDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "[%{public}@.%{public}s] Failed to get date of birth with error: %@");
}

- (void)_meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "[%{public}@.%{public}s] Failed to get date of birth with error: %@");
}

- (void)_getOnboardingVersionForKey:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v1, (uint64_t)v1, "Couldn't read heart rhythm onboarding completion state for key [%@]: %@", (uint8_t *)&v2);
}

+ (void)_onboardingHistoryKeyFromCompletedKey:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_7(&dword_19C023000, v3, v4, "[%{public}@ Mapping failed. Unexpected onboarding completion key.", v5, v6, v7, v8, 2u);
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "Couldn't set heart rhythm onboarding completion state %ld for key [%@]: %@");
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_114_cold_1()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "Failed to force nano sync to set heart rhythm onboarding completion version %ld for key [%@]: %@");
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "Couldn't set heart rhythm first onboarding completed date %@ for key [%@]: %@");
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_116_cold_1()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "Failed to force nano sync to set heart rhythm first onboarding completed date %@ for key [%@]: %@");
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v2, (uint64_t)v2, "Couldn't remove heart rhythm first onboarding completed dates for key [%@]: %@", (uint8_t *)&v3);
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_117_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v2, (uint64_t)v2, "Failed to force nano sync to set heart rhythm first onboarding completed dates for key [%@]: %@", (uint8_t *)&v3);
}

- (void)electrocardiogramOnboardingCountryCode
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v0, v1, "[%{public}s] Failed to read onboarding country code: %{public}@", (uint8_t *)v2);
}

- (void)_electrocardiogramFirstOnboardingCompletedDate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v0, v1, "[%{public}s] Failed to read first onboarding completed date: %{public}@", (uint8_t *)v2);
}

- (void)isElectrocardiogramAppInstallAllowedForWatch:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyCurrentUserLocale(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKHeartRhythmAvailability.m", 73, @"%s", dlerror());

  __break(1u);
}

+ (void)installElectrocardiogramAppOnActiveWatch:(const char *)a3 .cold.1(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint64_t v6 = NSStringFromSelector(a3);
  int v8 = 138543618;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v5, v7, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch due to no active device", (uint8_t *)&v8);
}

void __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(const char **)(a1 + 48);
  uint64_t v6 = a2;
  uint64_t v7 = NSStringFromSelector(v4);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C023000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch with error: %{public}@", (uint8_t *)&v8, 0x20u);
}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v0, v1, "[%{public}s] Failed to fetch onboarding history: %{public}@", (uint8_t *)v2);
}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v0, v1, "[%{public}s] Failed to fetch country code: %{public}@", (uint8_t *)v2);
}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_19C023000, v0, v1, "[%{public}s] Failed to fetch current version: %{public}@", (uint8_t *)v2);
}

@end