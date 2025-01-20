@interface HFUserItem
+ (NSMutableDictionary)_fakeHMSettings;
- (BOOL)_getBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4 settingsType:(unint64_t)a5;
- (BOOL)_getFakeBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_hasValidPrivateSettings;
- (BOOL)_isSettingsValueForKeyPath:(id)a3 atMaximumValue:(int64_t)a4 settingsType:(unint64_t)a5;
- (BOOL)hasCompletedNonOwnerUserHomeSwitchingUI;
- (BOOL)hasDismissedAccessCodeOnboarding;
- (BOOL)hasDismissedAccessoryFirmwareUpdateOnboarding;
- (BOOL)hasDismissedAnnounceOnboarding;
- (BOOL)hasDismissedAudioAnalysisOnboardingOnThisDevice;
- (BOOL)hasDismissedCameraRecordingOnboarding;
- (BOOL)hasDismissedCameraRecordingReminderBanner;
- (BOOL)hasDismissedCameraUpgradeBanner;
- (BOOL)hasDismissedHomeHubMigrationBanner;
- (BOOL)hasDismissedHomeTheaterOnboarding;
- (BOOL)hasDismissedIdentifyVoiceReminderBanner;
- (BOOL)hasDismissedNaturalLightingOnboarding;
- (BOOL)hasDismissedTVViewingProfilesOnboarding;
- (BOOL)hasDismissedTVViewingProfilesReminderBanner;
- (BOOL)hasDismissedUserSplitMediaAccountWarning;
- (BOOL)hasDismissedUtilityOnboarding;
- (BOOL)hasDismissedVoiceProfileOnboarding;
- (BOOL)hasDismissedWelcomeUIBanner;
- (BOOL)hasValidSettings;
- (BOOL)isAllowiTunesAccountEnabled;
- (BOOL)isAnnounceEnabled;
- (BOOL)isContainedWithinItemGroup;
- (BOOL)isIdentifyVoiceEnabled;
- (BOOL)isItemGroup;
- (BOOL)isPlaybackInfluencesForYouEnabled;
- (BOOL)shouldHideAddSceneButton;
- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager;
- (HFHomeKitSettingsValueManager)hf_settingsValueManager;
- (HFUserItem)init;
- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5;
- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5 userDefaults:(id)a6;
- (HFUserNameFormatter)userNameFormatter;
- (HMHome)hf_home;
- (HMHome)home;
- (HMSettings)settings;
- (HMUser)user;
- (NSSet)hf_dependentHomeKitObjectsForDownstreamItems;
- (NSSet)homekitObjectIdentifiers;
- (NSUUID)uniqueIdentifier;
- (NSUserDefaults)userDefaults;
- (id)_accessDescription;
- (id)_getSettingsValueForKeyPath:(id)a3 defaultValue:(id)a4 settingsType:(unint64_t)a5 block:(id)a6;
- (id)_hasDismissedWalletKeyFeatureOnboardingForKeyPath:(id)a3 onThisDeviceKeyPath:(id)a4;
- (id)_incrementSettingsValueForKeyPath:(id)a3 stepValue:(int64_t)a4 maximumValue:(int64_t)a5 settingsType:(unint64_t)a6;
- (id)_privateSettings;
- (id)_privateSettingsValueManager;
- (id)_setBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4 settingsType:(unint64_t)a5;
- (id)_setDismissWalletKeyFeatureOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4 featureDescription:(id)a5 keyPath:(id)a6 keyOnThisDevice:(id)a7;
- (id)_setSettingsValueForKeyPath:(id)a3 settingsType:(unint64_t)a4 usingBlock:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hasDismissedWalletKeyExpressModeOnboardingOnThisDevice;
- (id)incrementAddSceneButtonPresentedCount;
- (id)setAllowiTunesAccount:(BOOL)a3;
- (id)setCompletedNonOwnerUserHomeSwitchingUI:(BOOL)a3;
- (id)setDismissAccessCodeOnboarding:(BOOL)a3;
- (id)setDismissAccessoryFirmwareUpdateOnboarding:(BOOL)a3;
- (id)setDismissAnnounceOnboarding:(BOOL)a3;
- (id)setDismissCameraRecordingOnboarding:(BOOL)a3;
- (id)setDismissCameraRecordingReminderBanner:(BOOL)a3;
- (id)setDismissCameraUpgradeBanner:(BOOL)a3;
- (id)setDismissHomeTheaterOnboarding:(BOOL)a3;
- (id)setDismissIdentifyVoiceOnboarding:(BOOL)a3;
- (id)setDismissIdentifyVoiceReminderBanner:(BOOL)a3;
- (id)setDismissNaturalLightingOnboarding:(BOOL)a3;
- (id)setDismissTVViewingProfilesOnboarding:(BOOL)a3;
- (id)setDismissTVViewingProfilesReminderBanner:(BOOL)a3;
- (id)setDismissUserSplitMediaAccountWarning:(BOOL)a3;
- (id)setDismissUtilityOnboarding:(BOOL)a3;
- (id)setDismissWalletKeyExpressModeOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4;
- (id)setDismissedAudioAnalysisOnboardingOnThisDevice:(BOOL)a3;
- (id)setDismissedHomeHubMigrationBanner:(BOOL)a3;
- (id)setDismissedWelcomeUIBanner:(BOOL)a3;
- (id)setEnableAnnounce:(BOOL)a3;
- (id)setEnableIdentifyVoice:(BOOL)a3;
- (id)setPlaybackInfluencesForYou:(BOOL)a3;
- (unint64_t)nameStyle;
- (unint64_t)numberOfItemsContainedWithinGroup;
- (void)_setFakeBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4;
- (void)setHf_home:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation HFUserItem

- (BOOL)hasDismissedAudioAnalysisOnboardingOnThisDevice
{
  v3 = [(HFUserItem *)self userDefaults];
  if (!v3)
  {
    v4 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", v11, 2u);
    }
  }
  v5 = [v3 dictionaryForKey:@"HFUserHasDismissedAudioAnalysisOnboarding"];
  v6 = [(HFUserItem *)self home];
  v7 = [v6 uniqueIdentifier];
  v8 = [v7 UUIDString];
  char v9 = objc_msgSend(v5, "hmf_BOOLForKey:", v8);

  return v9;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5
{
  v8 = (objc_class *)MEMORY[0x263EFFA40];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithSuiteName:@"com.apple.Home.group"];
  v12 = [(HFUserItem *)self initWithHome:v10 user:v9 nameStyle:a5 userDefaults:v11];

  return v12;
}

- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5 userDefaults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HFUserItem;
  v14 = [(HFUserItem *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_hf_home, v15->_home);
    objc_storeStrong((id *)&v15->_user, a4);
    v16 = [[HFUserNameFormatter alloc] initWithHome:v11];
    userNameFormatter = v15->_userNameFormatter;
    v15->_userNameFormatter = v16;

    [(HFUserNameFormatter *)v15->_userNameFormatter setStyle:a5];
    objc_storeStrong((id *)&v15->_userDefaults, a6);
    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v18;

    v15->_isItemGroup = 0;
    v15->_isContainedWithinItemGroup = 0;
    v15->_numberOfItemsContainedWithinGroup = 0;
  }

  return v15;
}

- (id)hasDismissedWalletKeyExpressModeOnboardingOnThisDevice
{
  return [(HFUserItem *)self _hasDismissedWalletKeyFeatureOnboardingForKeyPath:@"root.home.dismissedWalletKeyExpressModeOnboarding" onThisDeviceKeyPath:@"HFUserHasDismissedWalletKeyOnboardingOnThisDevice"];
}

- (BOOL)hasDismissedNaturalLightingOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedNaturalLightingOnboarding" defaultValue:1 settingsType:1];
}

- (BOOL)hasDismissedCameraRecordingReminderBanner
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedCameraRecordingSetupBanner" defaultValue:1 settingsType:1];
}

- (BOOL)hasDismissedCameraRecordingOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedCameraRecordingOnboarding" defaultValue:1 settingsType:1];
}

- (BOOL)hasDismissedAccessCodeOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedAccessCodeOnboarding" defaultValue:1 settingsType:1];
}

- (id)_hasDismissedWalletKeyFeatureOnboardingForKeyPath:(id)a3 onThisDeviceKeyPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(HFUserItem *)self _getBoolSettingsValueForKeyPath:a3 defaultValue:1 settingsType:1])
  {
    v7 = [(HFUserItem *)self home];
    v8 = objc_msgSend(v7, "hf_walletKeyUUID");
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84__HFUserItem__hasDismissedWalletKeyFeatureOnboardingForKeyPath_onThisDeviceKeyPath___block_invoke;
    v12[3] = &unk_264096A28;
    v12[4] = self;
    id v13 = v6;
    char v14 = 1;
    id v9 = [v8 flatMap:v12];
  }
  else
  {
    id v10 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]";
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(%s) home level flag is not onboarded. Returning NO since user can't onboard if home isn't onboarded.", buf, 0xCu);
    }

    id v9 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA80]];
  }

  return v9;
}

- (BOOL)_getBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4 settingsType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (HKFakeFeatureOnboardingSettings())
  {
    char v9 = [(HFUserItem *)self _getFakeBoolSettingsValueForKeyPath:v8 defaultValue:0];
  }
  else
  {
    id v10 = [NSNumber numberWithBool:v6];
    id v11 = [(HFUserItem *)self _getSettingsValueForKeyPath:v8 defaultValue:v10 settingsType:a5 block:0];
    char v9 = [v11 BOOLValue];
  }
  return v9;
}

- (NSSet)homekitObjectIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFUserItem *)self user];
  v4 = [v3 uniqueIdentifier];
  v5 = objc_msgSend(v2, "na_setWithSafeObject:", v4);

  return (NSSet *)v5;
}

- (id)_getSettingsValueForKeyPath:(id)a3 defaultValue:(id)a4 settingsType:(unint64_t)a5 block:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void *))a6;
  if (a5)
  {
    id v13 = [(HFUserItem *)self _privateSettings];
    char v14 = [(HFUserItem *)self _privateSettingsValueManager];
    if (![(HFUserItem *)self _hasValidPrivateSettings])
    {
      v15 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412802;
        v26 = self;
        __int16 v27 = 2112;
        id v28 = v10;
        __int16 v29 = 2112;
        id v30 = v11;
        v16 = "%@ Read setting %@ failed - invalid private settings, returning default value %@";
LABEL_19:
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, 0x20u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
LABEL_6:
    if (!v14) {
      NSLog(&cfstr_ValueManagerWa.isa);
    }
    uint64_t v17 = objc_msgSend(v13, "hf_accessorySettingAtKeyPath:", v10);
    objc_opt_class();
    id v18 = [v14 valueForSetting:v17];
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    objc_super v21 = HFLogForCategory(0x3AuLL);
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138413058;
        v26 = self;
        __int16 v27 = 2112;
        id v28 = v17;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v20;
        _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "Read setting item '%@/%@/%@' : value: %@", (uint8_t *)&v25, 0x2Au);
      }

      id v23 = v20;
      if (!v12) {
        goto LABEL_16;
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v25 = 138413058;
        v26 = self;
        __int16 v27 = 2112;
        id v28 = v17;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "READ HMSETTING FAILED '%@/%@/%@' - returning default value: %@", (uint8_t *)&v25, 0x2Au);
      }

      id v18 = v11;
      if (!v12) {
        goto LABEL_16;
      }
    }
    v12[2](v12, v17, v14);
LABEL_16:

    goto LABEL_21;
  }
  id v13 = [(HFUserItem *)self settings];
  char v14 = [(HFUserItem *)self hf_settingsValueManager];
  if ([(HFUserItem *)self hasValidSettings]) {
    goto LABEL_6;
  }
  v15 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    v16 = "%@ Read setting %@ failed - invalid settings, returning default value %@";
    goto LABEL_19;
  }
LABEL_20:

  id v18 = v11;
LABEL_21:

  return v18;
}

- (id)_privateSettingsValueManager
{
  v4 = [(HFUserItem *)self _privateSettings];

  if (v4)
  {
    objc_getAssociatedObject(self, a2);
    v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HFHomeKitSettingsValueManager alloc];
      BOOL v6 = [(HFUserItem *)self _privateSettings];
      v7 = [(HFUserItem *)self homekitObjectIdentifiers];
      v4 = [(HFHomeKitSettingsValueManager *)v5 initWithSettings:v6 homeKitObjectIdentifiers:v7];

      objc_setAssociatedObject(self, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (id)_privateSettings
{
  v3 = [(HFUserItem *)self user];
  v4 = [(HFUserItem *)self home];
  v5 = [v3 userSettingsForHome:v4];

  BOOL v6 = [v5 privateSettings];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (BOOL)_hasValidPrivateSettings
{
  v2 = [(HFUserItem *)self _privateSettings];
  v3 = [v2 rootGroup];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_hf_home, 0);
  objc_storeStrong((id *)&self->_userNameFormatter, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (BOOL)hasDismissedCameraUpgradeBanner
{
  if (+[HFCameraUtilities forceDisplayOfDismissedCameraUpgradeBanner])
  {
    return 0;
  }
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedCameraUpgradeOfferBanner" defaultValue:1 settingsType:1];
}

- (BOOL)hasDismissedWelcomeUIBanner
{
  v3 = +[HFLocalSettingCachingUtility sharedInstance];
  BOOL v4 = [(HFUserItem *)self hf_home];
  char v5 = [v3 getWelcomeBannerDismissedLocalCachedValue:v4];

  if (v5) {
    return 1;
  }
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedWelcomeUI" defaultValue:0 settingsType:1];
}

- (HMHome)hf_home
{
  return self->_hf_home;
}

id __84__HFUserItem__hasDismissedWalletKeyFeatureOnboardingForKeyPath_onThisDeviceKeyPath___block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v43[5] = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) userDefaults];
    if (!v7)
    {
      id v8 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v35 = 136315138;
        v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
        _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "(%s) Failed to fetch shared app suite user defaults!", (uint8_t *)&v35, 0xCu);
      }
    }
    char v9 = [v7 dictionaryForKey:*(void *)(a1 + 40)];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 allKeys];
      id v12 = [v6 UUIDString];
      char v13 = [v11 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        char v14 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [v10 allKeys];
          uint64_t v16 = [v15 count];
          int v35 = 136316418;
          v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
          __int16 v37 = 2112;
          *(void *)v38 = v10;
          *(_WORD *)&v38[8] = 2048;
          uint64_t v39 = v16;
          *(_WORD *)v40 = 2112;
          *(void *)&v40[2] = v6;
          strcpy((char *)&v41, "p\bhash");
          HIBYTE(v41) = 0;
          __int16 v42 = 0;
          LOWORD(v43[0]) = 2112;
          *(void *)((char *)v43 + 2) = v6;
          _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "(%s) dict does NOT contain wallet key uuid. dict = %@ | keys.count = %ld | walletKeyUUID = %@ (Hashed walletKeyUUID = %{mask.hash}@)", (uint8_t *)&v35, 0x3Eu);
        }
      }
      uint64_t v17 = [v6 UUIDString];
      id v18 = [v10 objectForKey:v17];

      if (!v18)
      {
        v19 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v10 allKeys];
          uint64_t v21 = [v20 count];
          int v35 = 136316418;
          v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
          __int16 v37 = 2112;
          *(void *)v38 = v10;
          *(_WORD *)&v38[8] = 2048;
          uint64_t v39 = v21;
          *(_WORD *)v40 = 2112;
          *(void *)&v40[2] = v6;
          strcpy((char *)&v41, "p\bhash");
          HIBYTE(v41) = 0;
          __int16 v42 = 0;
          LOWORD(v43[0]) = 2112;
          *(void *)((char *)v43 + 2) = v6;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "(%s) hasDismissedOnThisDeviceObj is NOT found among dict %@ (count = %ld | walletKeyUUID = %@ (uuid hashed = %{mask.hash}@)", (uint8_t *)&v35, 0x3Eu);
        }
      }
      objc_opt_class();
      v22 = v18;
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }
      v24 = v23;

      if (v22 && !v24)
      {
        int v25 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = 136315394;
          v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
          __int16 v37 = 2112;
          *(void *)v38 = v22;
          _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "(%s) hasDismissedOnThisDeviceObj is NOT an NSNumber. hasDismissedOnThisDeviceObj = %@", (uint8_t *)&v35, 0x16u);
        }
      }
    }
    else
    {
      v22 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136315394;
        v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
        __int16 v37 = 2112;
        *(void *)v38 = v7;
        _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "(%s) dictionary is nil for 'onThisDevice' key. defaults = %@", (uint8_t *)&v35, 0x16u);
      }
    }

    __int16 v27 = [v6 UUIDString];
    unsigned int v26 = objc_msgSend(v10, "hmf_BOOLForKey:", v27);
  }
  else
  {
    unsigned int v26 = 1;
  }
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = 0;
  }
  __int16 v29 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = *(unsigned __int8 *)(a1 + 48);
    int v35 = 136316674;
    v36 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
    __int16 v37 = 1024;
    *(_DWORD *)v38 = v30;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v26;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v28;
    HIWORD(v39) = 2112;
    *(void *)v40 = v6;
    *(_WORD *)&v40[8] = 2160;
    uint64_t v41 = 1752392040;
    __int16 v42 = 2112;
    *(void *)v43 = v6;
    _os_log_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEFAULT, "(%s) hasDismissedForHome = %{BOOL}d. hasDismissedOnThisDevice = %{BOOL}d. result = %{BOOL}d | walletKeyUUID = %@ (uuid hashed = %{mask.hash}@)", (uint8_t *)&v35, 0x3Cu);
  }

  __int16 v31 = (void *)MEMORY[0x263F58190];
  id v32 = [NSNumber numberWithBool:v28];
  uint64_t v33 = [v31 futureWithResult:v32];

  return v33;
}

- (HFUserItem)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  char v5 = NSStringFromSelector(sel_initWithHome_user_nameStyle_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserItem.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFUserItem init]",
    v5);

  return 0;
}

+ (NSMutableDictionary)_fakeHMSettings
{
  if (_MergedGlobals_4_2 != -1) {
    dispatch_once(&_MergedGlobals_4_2, &__block_literal_global_30_6);
  }
  v2 = (void *)qword_2676B6AC0;
  return (NSMutableDictionary *)v2;
}

uint64_t __29__HFUserItem__fakeHMSettings__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = qword_2676B6AC0;
  qword_2676B6AC0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (unint64_t)nameStyle
{
  v2 = [(HFUserItem *)self userNameFormatter];
  unint64_t v3 = [v2 style];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HFUserItem allocWithZone:a3];
  char v5 = [(HFUserItem *)self home];
  id v6 = [(HFUserItem *)self user];
  v7 = [(HFUserItem *)v4 initWithHome:v5 user:v6 nameStyle:[(HFUserItem *)self nameStyle]];

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  char v5 = [(HFUserItem *)self home];
  id v6 = [(HFUserItem *)self user];
  v7 = objc_msgSend(v5, "hf_handleForUser:", v6);

  if (v7)
  {
    id v8 = [(HFUserItem *)self userNameFormatter];
    [v8 stringForObjectValue:v7];
  }
  else
  {
    id v8 = [(HFUserItem *)self user];
    [v8 name];
  char v9 = };

  [(HFMutableItemUpdateOutcome *)v4 setObject:v7 forKeyedSubscript:@"userID"];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v9 forKeyedSubscript:@"title"];
  id v10 = [(HFUserItem *)self _accessDescription];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v10 forKeyedSubscript:@"userAccessDescription"];

  [(HFMutableItemUpdateOutcome *)v4 setObject:@"Home.HomeSettings.UserHandle" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  id v11 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v11;
}

- (id)_accessDescription
{
  unint64_t v3 = _HFLocalizedStringWithDefaultValue(@"HFUserAccessDescription", @"HFUserAccessDescription", 1);
  id v4 = [(HFUserItem *)self home];
  char v5 = [(HFUserItem *)self user];
  int v6 = objc_msgSend(v4, "hf_userIsOwner:", v5);

  if (v6)
  {
    v7 = @"HFUserOwnerAccessSuffix";
LABEL_5:
    id v11 = _HFLocalizedStringWithDefaultValue(v7, v7, 1);
    uint64_t v12 = [v3 stringByAppendingFormat:@" %@", v11];
LABEL_6:

    unint64_t v3 = (void *)v12;
    goto LABEL_7;
  }
  id v8 = [(HFUserItem *)self home];
  char v9 = [(HFUserItem *)self user];
  int v10 = objc_msgSend(v8, "hf_userIsAdministrator:", v9);

  if (v10)
  {
    v7 = @"HFUserAdminAccessSuffix";
    goto LABEL_5;
  }
  char v14 = [(HFUserItem *)self home];
  v15 = [(HFUserItem *)self user];
  int v16 = objc_msgSend(v14, "hf_userIsRestrictedGuest:", v15);

  if (v16)
  {
    uint64_t v17 = [(HFUserItem *)self home];
    id v18 = [(HFUserItem *)self user];
    id v11 = [v17 homeAccessControlForUser:v18];

    v19 = [v11 restrictedGuestAccessSettings];
    id v20 = [v19 guestAccessSchedule];
    uint64_t v21 = +[HFScheduleBuilder scheduleBuilderFromHomeAccessSchedule:v20];
    v22 = [v21 build];

    uint64_t v12 = +[HFScheduleUtilities localizedStringForSchedule:v22];

    unint64_t v3 = v19;
    goto LABEL_6;
  }
LABEL_7:
  return v3;
}

- (NSSet)hf_dependentHomeKitObjectsForDownstreamItems
{
  unint64_t v3 = objc_opt_new();
  [v3 addObject:self];
  id v4 = [(HFUserItem *)self settings];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  char v5 = [(HFUserItem *)self _privateSettings];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return (NSSet *)v3;
}

- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager
{
  objc_getAssociatedObject(self, a2);
  id v4 = (HFHomeKitSettingsAdapterManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = [[HFHomeKitSettingsAdapterManager alloc] initWithHomeKitSettingsVendor:self];
    objc_setAssociatedObject(self, a2, v4, (void *)1);
  }
  return v4;
}

- (HFHomeKitSettingsValueManager)hf_settingsValueManager
{
  id v4 = [(HFUserItem *)self settings];

  if (v4)
  {
    objc_getAssociatedObject(self, a2);
    id v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      char v5 = [HFHomeKitSettingsValueManager alloc];
      int v6 = [(HFUserItem *)self settings];
      v7 = [(HFUserItem *)self homekitObjectIdentifiers];
      id v4 = [(HFHomeKitSettingsValueManager *)v5 initWithSettings:v6 homeKitObjectIdentifiers:v7];

      objc_setAssociatedObject(self, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (HMSettings)settings
{
  unint64_t v3 = [(HFUserItem *)self user];
  id v4 = [(HFUserItem *)self home];
  char v5 = [v3 userSettingsForHome:v4];

  int v6 = [v5 settings];

  return (HMSettings *)v6;
}

- (BOOL)hasValidSettings
{
  v2 = [(HFUserItem *)self settings];
  unint64_t v3 = [v2 rootGroup];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_setSettingsValueForKeyPath:(id)a3 settingsType:(unint64_t)a4 usingBlock:(id)a5
{
  *(void *)&v32[11] = *MEMORY[0x263EF8340];
  char v9 = (HFUserItem *)a3;
  int v10 = (void (**)(id, void *, void *))a5;
  if (a4)
  {
    id v11 = [(HFUserItem *)self _privateSettings];
    uint64_t v12 = [(HFUserItem *)self _privateSettingsValueManager];
    BOOL v13 = [(HFUserItem *)self _hasValidPrivateSettings];
  }
  else
  {
    id v11 = [(HFUserItem *)self settings];
    uint64_t v12 = [(HFUserItem *)self hf_settingsValueManager];
    BOOL v13 = [(HFUserItem *)self hasValidSettings];
  }
  BOOL v14 = v13;
  if (v13 && v12)
  {
    objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v16 = v10[2](v10, v15, v12);
    uint64_t v17 = HFLogForCategory(0x3AuLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v25 = 138413058;
        unsigned int v26 = self;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        int v30 = v9;
        __int16 v31 = 2112;
        *(void *)id v32 = v16;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Updating setting item '%@/%@/%@' to value: %@", (uint8_t *)&v25, 0x2Au);
      }

      uint64_t v19 = [v12 changeValueForSetting:v15 toValue:v16];
    }
    else
    {
      if (v18)
      {
        int v25 = 138412802;
        unsigned int v26 = self;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        int v30 = v9;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Setting item '%@/%@/%@' not updated", (uint8_t *)&v25, 0x20u);
      }

      uint64_t v19 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    uint64_t v21 = (void *)v19;
  }
  else
  {
    id v20 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v23 = (HFUserItem *)objc_claimAutoreleasedReturnValue();
      int v25 = 138413314;
      v24 = @"private";
      unsigned int v26 = v23;
      __int16 v27 = 2112;
      if (!a4) {
        v24 = @"public";
      }
      uint64_t v28 = v24;
      __int16 v29 = 2112;
      int v30 = self;
      __int16 v31 = 1024;
      *(_DWORD *)id v32 = v14;
      v32[2] = 2112;
      *(void *)&v32[3] = v12;
      _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "%@: No valid %@ settings or value manager found on user: %@ - valid settings %{BOOL}d, value manager %@", (uint8_t *)&v25, 0x30u);
    }
    uint64_t v21 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v21;
}

- (id)_setBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4 settingsType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (HKFakeFeatureOnboardingSettings())
  {
    [(HFUserItem *)self _setFakeBoolSettingsValueForKeyPath:v8 newValue:v6];

    char v9 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__HFUserItem__setBoolSettingsValueForKeyPath_newValue_settingsType___block_invoke;
    v11[3] = &__block_descriptor_33_e63___NSNumber_24__0__HMSetting_8__HFHomeKitSettingsValueManager_16l;
    BOOL v12 = v6;
    char v9 = [(HFUserItem *)self _setSettingsValueForKeyPath:v8 settingsType:a5 usingBlock:v11];
  }
  return v9;
}

uint64_t __68__HFUserItem__setBoolSettingsValueForKeyPath_newValue_settingsType___block_invoke(uint64_t a1)
{
  return [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)_isSettingsValueForKeyPath:(id)a3 atMaximumValue:(int64_t)a4 settingsType:(unint64_t)a5
{
  BOOL v6 = [(HFUserItem *)self _getSettingsValueForKeyPath:a3 defaultValue:&unk_26C0F6C60 settingsType:a5 block:0];
  int64_t v7 = [v6 integerValue];

  return v7 >= a4;
}

- (id)_incrementSettingsValueForKeyPath:(id)a3 stepValue:(int64_t)a4 maximumValue:(int64_t)a5 settingsType:(unint64_t)a6
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HFUserItem__incrementSettingsValueForKeyPath_stepValue_maximumValue_settingsType___block_invoke;
  v8[3] = &__block_descriptor_48_e63___NSNumber_24__0__HMSetting_8__HFHomeKitSettingsValueManager_16l;
  v8[4] = a5;
  v8[5] = a4;
  BOOL v6 = [(HFUserItem *)self _setSettingsValueForKeyPath:a3 settingsType:a6 usingBlock:v8];
  return v6;
}

id __84__HFUserItem__incrementSettingsValueForKeyPath_stepValue_maximumValue_settingsType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    int64_t v7 = [v6 valueForSetting:v5];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = [v9 integerValue];

    id v11 = 0;
    if (v10 < *(void *)(a1 + 32))
    {
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 40) + v10];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_getFakeBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@ ACCESSING FAKE SETTINGS FOR %@ - DO NOT FILE RADARS.", (uint8_t *)&v21, 0x16u);
  }

  if (!HKFakeFeatureOnboardingSettings())
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HFUserItem.m" lineNumber:397 description:@"This is only useful for layout & design testing. Do not use unless you know what you are doing"];
  }
  id v9 = +[HFUserItem _fakeHMSettings];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    id v11 = [NSNumber numberWithBool:v4];
    BOOL v12 = +[HFUserItem _fakeHMSettings];
    [v12 setObject:v11 forKeyedSubscript:v7];
  }
  objc_opt_class();
  BOOL v13 = +[HFUserItem _fakeHMSettings];
  BOOL v14 = [v13 objectForKeyedSubscript:v7];
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (!v16)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"HFUserItem.m" lineNumber:404 description:@"This should not happen"];
  }
  char v17 = [v16 BOOLValue];

  return v17;
}

- (void)_setFakeBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    BOOL v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@ ACCESSING FAKE SETTINGS FOR %@ - DO NOT FILE RADARS.", (uint8_t *)&v12, 0x16u);
  }

  if (!HKFakeFeatureOnboardingSettings())
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HFUserItem.m" lineNumber:413 description:@"This is only useful for layout & design testing. Do not use unless you know what you are doing"];
  }
  id v9 = [NSNumber numberWithBool:v4];
  uint64_t v10 = +[HFUserItem _fakeHMSettings];
  [v10 setObject:v9 forKeyedSubscript:v7];
}

- (BOOL)hasDismissedVoiceProfileOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedIdentifyVoiceOnboarding" defaultValue:1 settingsType:1];
}

- (id)setDismissIdentifyVoiceOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedIdentifyVoiceOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedIdentifyVoiceReminderBanner
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedIdentifyVoiceSetupBanner" defaultValue:1 settingsType:1];
}

- (id)setDismissIdentifyVoiceReminderBanner:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedIdentifyVoiceSetupBanner" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedAnnounceOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedAnnounceOnboarding" defaultValue:1 settingsType:1];
}

- (id)setDismissAnnounceOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedAnnounceOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedHomeTheaterOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedHomeTheaterOnboarding" defaultValue:1 settingsType:1];
}

- (id)setDismissHomeTheaterOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedHomeTheaterOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedTVViewingProfilesOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedTVViewingProfileOnboarding" defaultValue:1 settingsType:1];
}

- (id)setDismissTVViewingProfilesOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedTVViewingProfileOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedTVViewingProfilesReminderBanner
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedTVViewingProfileSetupBanner" defaultValue:1 settingsType:1];
}

- (id)setDismissTVViewingProfilesReminderBanner:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedTVViewingProfileSetupBanner" newValue:a3 settingsType:1];
}

- (id)setDismissNaturalLightingOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedNaturalLightingOnboarding" newValue:a3 settingsType:1];
}

- (id)setDismissCameraRecordingOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedCameraRecordingOnboarding" newValue:a3 settingsType:1];
}

- (id)setDismissCameraRecordingReminderBanner:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedCameraRecordingSetupBanner" newValue:a3 settingsType:1];
}

- (id)setDismissCameraUpgradeBanner:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedCameraUpgradeOfferBanner" newValue:a3 settingsType:1];
}

- (id)setEnableIdentifyVoice:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.siri.identifyVoice" newValue:a3 settingsType:0];
}

- (BOOL)isIdentifyVoiceEnabled
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.siri.identifyVoice" defaultValue:1 settingsType:0];
}

- (id)setPlaybackInfluencesForYou:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.music.playbackInfluencesForYou" newValue:a3 settingsType:0];
}

- (BOOL)isPlaybackInfluencesForYouEnabled
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.music.playbackInfluencesForYou" defaultValue:1 settingsType:0];
}

- (id)setAllowiTunesAccount:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.music.allowiTunesAccount" newValue:a3 settingsType:0];
}

- (BOOL)isAllowiTunesAccountEnabled
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.music.allowiTunesAccount" defaultValue:1 settingsType:0];
}

- (id)setDismissUserSplitMediaAccountWarning:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedUserSplitMediaAccountWarning" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedUserSplitMediaAccountWarning
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedUserSplitMediaAccountWarning" defaultValue:1 settingsType:1];
}

- (id)setCompletedNonOwnerUserHomeSwitchingUI:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.completedSwitchingHomesOnboardingUI" newValue:a3 settingsType:1];
}

- (BOOL)hasCompletedNonOwnerUserHomeSwitchingUI
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.completedSwitchingHomesOnboardingUI" defaultValue:0 settingsType:1];
}

- (id)setDismissedWelcomeUIBanner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[HFLocalSettingCachingUtility sharedInstance];
  id v6 = [(HFUserItem *)self hf_home];
  [v5 setWelcomeBannerDismissedLocalCachedValue:v3 home:v6];

  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedWelcomeUI" newValue:v3 settingsType:1];
}

- (id)setEnableAnnounce:(BOOL)a3
{
  id v5 = [(HFUserItem *)self home];
  id v6 = [(HFUserItem *)self user];
  id v7 = [v5 homeAccessControlForUser:v6];

  id v8 = (void *)MEMORY[0x263F58190];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__HFUserItem_setEnableAnnounce___block_invoke;
  v12[3] = &unk_26408F050;
  id v13 = v7;
  BOOL v14 = a3;
  id v9 = v7;
  uint64_t v10 = [v8 futureWithBlock:v12];

  return v10;
}

void __32__HFUserItem_setEnableAnnounce___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__HFUserItem_setEnableAnnounce___block_invoke_2;
  v7[3] = &unk_26408CDF0;
  id v8 = v3;
  id v6 = v3;
  [v4 updateAnnounceAccess:v5 completionHandler:v7];
}

uint64_t __32__HFUserItem_setEnableAnnounce___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) finishWithError:a2];
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 finishWithNoResult];
}

- (BOOL)isAnnounceEnabled
{
  id v3 = [(HFUserItem *)self home];
  BOOL v4 = [(HFUserItem *)self user];
  uint64_t v5 = [v3 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v5 isAnnounceAccessAllowed];
  return (char)v4;
}

- (id)setDismissWalletKeyExpressModeOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4
{
  return [(HFUserItem *)self _setDismissWalletKeyFeatureOnboarding:a3 forWalletKeyUUID:a4 featureDescription:@"Express Mode" keyPath:@"root.home.dismissedWalletKeyExpressModeOnboarding" keyOnThisDevice:@"HFUserHasDismissedWalletKeyOnboardingOnThisDevice"];
}

- (id)_setDismissWalletKeyFeatureOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4 featureDescription:(id)a5 keyPath:(id)a6 keyOnThisDevice:(id)a7
{
  BOOL v10 = a3;
  v44[2] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke;
  aBlock[3] = &unk_264096A50;
  aBlock[4] = self;
  id v15 = v13;
  id v41 = v15;
  BOOL v43 = v10;
  id v16 = v14;
  id v42 = v16;
  id v17 = a6;
  BOOL v18 = _Block_copy(aBlock);
  uint64_t v19 = v18;
  if (v12)
  {
    id v20 = (void *)MEMORY[0x263F58190];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_83;
    v37[3] = &unk_264096A78;
    int v21 = &v39;
    id v39 = v18;
    id v38 = v12;
    v22 = [v20 futureWithBlock:v37];
    __int16 v23 = v38;
  }
  else
  {
    id v24 = [(HFUserItem *)self home];
    objc_msgSend(v24, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    uint64_t v25 = v32 = v16;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_2;
    v33[3] = &unk_264096AA0;
    int v21 = &v35;
    id v35 = v19;
    v33[4] = self;
    id v34 = v15;
    BOOL v36 = v10;
    unsigned int v26 = [v25 flatMap:v33];
    v22 = [v26 recoverIgnoringError];

    id v16 = v32;
    id v12 = 0;
    __int16 v23 = v34;
  }

  __int16 v27 = [(HFUserItem *)self _setBoolSettingsValueForKeyPath:v17 newValue:v10 settingsType:1];

  uint64_t v28 = (void *)MEMORY[0x263F58190];
  v44[0] = v22;
  v44[1] = v27;
  __int16 v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  int v30 = [v28 combineAllFutures:v29];

  return v30;
}

void __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(const char **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(unsigned __int8 *)(a1 + 56);
    int v19 = 138413826;
    id v20 = v5;
    __int16 v21 = 2080;
    v22 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevice:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 1024;
    int v26 = v7;
    __int16 v27 = 2112;
    id v28 = v3;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    id v32 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Setting Wallet Key %@ Onboarding value: %{BOOL}d for walletKeyUUID: %@ (uuid hashed = %{mask.hash}@)", (uint8_t *)&v19, 0x44u);
  }

  id v8 = [*(id *)(a1 + 32) userDefaults];
  if (!v8)
  {
    id v9 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v17 = *(const char **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      int v19 = 138412802;
      id v20 = v17;
      __int16 v21 = 2080;
      v22 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%@:%s) Failed to fetch shared app suite user defaults for %@", (uint8_t *)&v19, 0x20u);
    }
  }
  BOOL v10 = [v8 dictionaryForKey:*(void *)(a1 + 48)];
  id v11 = (void *)[v10 mutableCopy];

  if (!v11)
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    id v12 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke";
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "(%s) Dictionary for 'keyOnThisDevice' doesn't exist.", (uint8_t *)&v19, 0xCu);
    }
  }
  id v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  id v14 = [v3 UUIDString];
  [v11 setObject:v13 forKey:v14];

  [v8 setObject:v11 forKey:*(void *)(a1 + 48)];
  id v15 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v11 count];
    int v19 = 136315650;
    id v20 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevice:]_block_invoke";
    __int16 v21 = 2112;
    v22 = (const char *)v11;
    __int16 v23 = 2048;
    uint64_t v24 = v16;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "(%s) Updating wallet key feature onboarding | dict = %@ (count = %lu) ", (uint8_t *)&v19, 0x20u);
  }
}

void __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  [v5 finishWithNoResult];
}

id __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 walletKey];
  BOOL v4 = [v3 UUID];

  id v5 = HFLogForCategory(0x3AuLL);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      id v13 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2160;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2112;
      int v19 = v4;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Fetched wallet key UUID %@ (hashed uuid = %{mask.hash}@)", (uint8_t *)&v12, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(const char **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *(unsigned __int8 *)(a1 + 56);
      int v12 = 138413058;
      id v13 = v9;
      __int16 v14 = 2080;
      id v15 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 1024;
      LODWORD(v19) = v11;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "(%@:%s) Attempting to set wallet key %@ onboarding value: %{BOOL}d but it looks like Wallet Key doesn't exist!", (uint8_t *)&v12, 0x26u);
    }
  }
  int v7 = [MEMORY[0x263F58190] futureWithNoResult];

  return v7;
}

- (id)setDismissAccessCodeOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedAccessCodeOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)hasDismissedAccessoryFirmwareUpdateOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissedAccessoryFirmwareUpdateOnboarding" defaultValue:1 settingsType:1];
}

- (id)setDismissAccessoryFirmwareUpdateOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissedAccessoryFirmwareUpdateOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)shouldHideAddSceneButton
{
  return [(HFUserItem *)self _isSettingsValueForKeyPath:@"root.home.addSceneButtonPresentedCount" atMaximumValue:4 settingsType:1];
}

- (id)incrementAddSceneButtonPresentedCount
{
  return [(HFUserItem *)self _incrementSettingsValueForKeyPath:@"root.home.addSceneButtonPresentedCount" stepValue:1 maximumValue:4 settingsType:1];
}

- (id)setDismissedAudioAnalysisOnboardingOnThisDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HFUserItem *)self userDefaults];
  if (!v5)
  {
    uint64_t v6 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", v15, 2u);
    }
  }
  int v7 = [v5 dictionaryForKey:@"HFUserHasDismissedAudioAnalysisOnboarding"];
  id v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v9 = [NSNumber numberWithBool:v3];
  uint64_t v10 = [(HFUserItem *)self home];
  int v11 = [v10 uniqueIdentifier];
  int v12 = [v11 UUIDString];
  [v8 setObject:v9 forKey:v12];

  [v5 setObject:v8 forKey:@"HFUserHasDismissedAudioAnalysisOnboarding"];
  id v13 = [MEMORY[0x263F58190] futureWithNoResult];

  return v13;
}

- (BOOL)hasDismissedHomeHubMigrationBanner
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HFUserItem *)self userDefaults];
  if (!v2)
  {
    BOOL v3 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", buf, 2u);
    }
  }
  BOOL v4 = [v2 dictionaryForKey:@"HFUserHasDismissedHomeHubMigrationBannerForThisDevice"];
  id v5 = v4;
  if (v4)
  {
    id v22 = 0;
    uint64_t v6 = objc_msgSend(v4, "hmf_integerForKey:error:", @"majorVersion", &v22);
    int v7 = v22;
    if (v7)
    {
      id v8 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (uint64_t)v7;
        _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to decode major OS version for when home hub migration banner was dismissed! Error: %@", buf, 0xCu);
      }
LABEL_16:
      char v9 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v21 = 0;
    uint64_t v10 = objc_msgSend(v5, "hmf_integerForKey:error:", @"minorVersion", &v21);
    int v11 = v21;
    if (v11)
    {
      id v8 = v11;
      int v12 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (uint64_t)v8;
        _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Failed to decode minor OS version for when home hub migration banner was dismissed! Error: %@", buf, 0xCu);
      }

      goto LABEL_16;
    }
    __int16 v14 = [MEMORY[0x263F08AB0] processInfo];
    id v15 = v14;
    if (v14) {
      [v14 operatingSystemVersion];
    }

    BOOL v16 = v10 < 0 && v6 == 0;
    int v17 = v6 < 0 || v16;
    __int16 v18 = HFLogForCategory(0x3AuLL);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134218752;
        uint64_t v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = v10;
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2048;
        uint64_t v30 = 0;
        uint64_t v20 = "Ignoring previous user dismissal for home hub migration banner due to updated system software. Previous OS"
              " version: %ld.%ld | Current OS version: %ld.%ld";
LABEL_32:
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x2Au);
      }
    }
    else if (v19)
    {
      *(_DWORD *)buf = 134218752;
      uint64_t v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      uint64_t v20 = "User did previously dismiss home hub migration banner on OS version: %ld.%ld | Current OS version: %ld.%ld";
      goto LABEL_32;
    }

    id v8 = 0;
    char v9 = v17 ^ 1;
    goto LABEL_17;
  }
  int v7 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "User defaults for home hub migration banner dismissal with major/minor OS version does not exist!", buf, 2u);
  }
  char v9 = 0;
LABEL_18:

  return v9;
}

- (id)setDismissedHomeHubMigrationBanner:(BOOL)a3
{
  BOOL v3 = [(HFUserItem *)self userDefaults];
  if (!v3)
  {
    BOOL v4 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", (uint8_t *)&v13, 2u);
    }
  }
  id v5 = [v3 dictionaryForKey:@"HFUserHasDismissedHomeHubMigrationBannerForThisDevice"];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v7 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", 0);
  id v8 = v7;
  if (v7)
  {
    [v7 operatingSystemVersion];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  char v9 = [NSNumber numberWithInteger:v13];
  [v6 setObject:v9 forKey:@"majorVersion"];

  uint64_t v10 = [NSNumber numberWithInteger:v14];
  [v6 setObject:v10 forKey:@"minorVersion"];

  [v3 setObject:v6 forKey:@"HFUserHasDismissedHomeHubMigrationBannerForThisDevice"];
  int v11 = [MEMORY[0x263F58190] futureWithNoResult];

  return v11;
}

- (BOOL)hasDismissedUtilityOnboarding
{
  return [(HFUserItem *)self _getBoolSettingsValueForKeyPath:@"root.home.dismissed2024EnergyOnboarding" defaultValue:0 settingsType:1];
}

- (id)setDismissUtilityOnboarding:(BOOL)a3
{
  return [(HFUserItem *)self _setBoolSettingsValueForKeyPath:@"root.home.dismissed2024EnergyOnboarding" newValue:a3 settingsType:1];
}

- (BOOL)isItemGroup
{
  return self->_isItemGroup;
}

- (BOOL)isContainedWithinItemGroup
{
  return self->_isContainedWithinItemGroup;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return self->_numberOfItemsContainedWithinGroup;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (HFUserNameFormatter)userNameFormatter
{
  return self->_userNameFormatter;
}

- (void)setHf_home:(id)a3
{
}

- (void)setUserDefaults:(id)a3
{
}

@end