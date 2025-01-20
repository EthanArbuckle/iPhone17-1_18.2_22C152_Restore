@interface HMMediaProfile(HFMediaAccessoryProfileAdditions)
- (BOOL)hasValidSettings;
- (BOOL)hf_homePodIsCapableOfShowingSplitAccountError;
- (BOOL)isContainedWithinItemGroup;
- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager;
- (HFHomeKitSettingsValueManager)hf_settingsValueManager;
- (HFMediaAccessoryCommonSettingsManager)hf_mediaAccessoryCommonSettingsManager;
- (HFMediaValueManager)hf_mediaValueSource;
- (HFSiriLanguageOptionsManager)hf_siriLanguageOptionsManager;
- (id)accessories;
- (id)hf_analyticsClient;
- (id)hf_appleMusicCurrentLoggedInAccount;
- (id)hf_appleMusicCurrentLoggedInAccountDSID;
- (id)hf_categoryCapitalizedLocalizedDescription;
- (id)hf_categoryLowercaseLocalizedDescription;
- (id)hf_dateAdded;
- (id)hf_dependentHomeKitObjectsForDownstreamItems;
- (id)hf_deviceIdentifiers;
- (id)hf_displayName;
- (id)hf_fakeDebugSymptoms;
- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:;
- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions;
- (id)hf_home;
- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount;
- (id)hf_homePodSupportsMultiUserLanguage;
- (id)hf_identify;
- (id)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions;
- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent;
- (id)hf_mediaRouteIdentifier;
- (id)hf_parentRoom;
- (id)hf_preferredMediaUser;
- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions;
- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions;
- (id)homekitObjectIdentifiers;
- (id)mediaProfiles;
- (id)symptoms;
- (id)symptomsHandler;
- (uint64_t)hf_effectiveIsFavorite;
- (uint64_t)hf_effectiveShowInHomeDashboard;
- (uint64_t)hf_hasSetFavorite;
- (uint64_t)hf_hasSetShowInHomeDashboard;
- (uint64_t)hf_homePodSupportsMultiUser;
- (uint64_t)hf_isAccessorySettingsReachable;
- (uint64_t)hf_isAppleMusicReachable;
- (uint64_t)hf_isCurrentAccessory;
- (uint64_t)hf_isFavorite;
- (uint64_t)hf_isReachable;
- (uint64_t)hf_offersAutomation;
- (uint64_t)hf_preferredUserSelectionType;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_showsAudioSettings;
- (uint64_t)hf_supportsHomeTheater;
- (uint64_t)hf_supportsMediaActions;
- (uint64_t)hf_supportsMultiUser;
- (uint64_t)hf_supportsMusicAlarm;
- (uint64_t)hf_supportsPreferredMediaUser;
- (uint64_t)hf_supportsSoftwareUpdate;
- (uint64_t)hf_supportsStereoPairing;
- (uint64_t)hf_updateIsFavorite:()HFMediaAccessoryProfileAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()HFMediaAccessoryProfileAdditions;
- (uint64_t)isItemGroup;
- (uint64_t)numberOfItemsContainedWithinGroup;
@end

@implementation HMMediaProfile(HFMediaAccessoryProfileAdditions)

- (id)accessories
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 accessory];
  v3 = objc_msgSend(v1, "na_setWithSafeObject:", v2);

  return v3;
}

- (id)mediaProfiles
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 accessory];
  v3 = [v2 mediaProfile];
  v4 = objc_msgSend(v1, "na_setWithSafeObject:", v3);

  return v4;
}

- (id)hf_home
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = [a1 accessory];
  v5 = [v4 home];

  if (!v5)
  {
    v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      int v12 = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@:%@ nil home. Please file a radar against “Home App | New Bugs” with any info you have on what you were doing.", (uint8_t *)&v12, 0x16u);
    }
    if (+[HFUtilities isInternalInstall])
    {
      v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", -1);
      v8 = +[HFErrorHandler sharedHandler];
      [v8 handleError:v7 operationType:@"HFOperationRemoveHomePodAlarm" options:0 retryBlock:0 cancelBlock:0];
    }
    v9 = +[HFHomeKitDispatcher sharedDispatcher];
    v5 = [v9 home];
  }
  return v5;
}

- (id)hf_parentRoom
{
  v1 = [a1 accessory];
  v2 = [v1 room];

  return v2;
}

- (uint64_t)hf_isCurrentAccessory
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 isCurrentAccessory];

  return v2;
}

- (uint64_t)hf_offersAutomation
{
  return 1;
}

- (id)symptomsHandler
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 symptomsHandler];

  return v2;
}

- (id)symptoms
{
  v1 = [a1 symptomsHandler];
  uint64_t v2 = [v1 symptoms];

  return v2;
}

- (id)hf_fakeDebugSymptoms
{
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hf_fakeDebugSymptoms");

  return v2;
}

- (uint64_t)hf_isReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_388_0);

  return v2;
}

- (uint64_t)hf_supportsStereoPairing
{
  uint64_t v2 = [a1 accessories];
  BOOL v3 = [v2 count] == 1;

  LODWORD(v2) = [a1 isItemGroup];
  v4 = objc_msgSend(a1, "hf_home");
  v5 = objc_msgSend(a1, "hf_backingAccessory");
  v6 = objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);

  v7 = [a1 accessories];
  v8 = [v7 anyObject];
  int v9 = objc_msgSend(v8, "hf_isHomePod");

  v10 = (void *)MEMORY[0x263F0E540];
  v11 = [a1 accessories];
  int v12 = [v11 anyObject];
  unsigned int v13 = [v10 supportsMediaSystem:v12];

  int v14 = v3 & ~v2;
  if (v6) {
    int v14 = 0;
  }
  return v14 & v9 & v13;
}

- (uint64_t)hf_supportsMusicAlarm
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "hf_backingAccessory");
  uint64_t v3 = [v2 supportsMusicAlarm];

  v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      v5 = @"YES";
    }
    else {
      v5 = @"NO";
    }
    v6 = [a1 description];
    int v8 = 138412546;
    int v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Accessory Supports Music Alarm (%@) mediaProfileContainer (%@)", (uint8_t *)&v8, 0x16u);
  }
  return v3;
}

- (uint64_t)hf_showsAudioSettings
{
  return 0;
}

- (uint64_t)hf_supportsSoftwareUpdate
{
  return 1;
}

- (uint64_t)hf_isAppleMusicReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_391);

  return v2;
}

- (uint64_t)hf_isAccessorySettingsReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_393);

  return v2;
}

- (HFMediaValueManager)hf_mediaValueSource
{
  objc_getAssociatedObject(a1, a2);
  v4 = (HFMediaValueManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[HFMediaValueManager alloc] initWithMediaProfileContainer:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, a2);
  v4 = (HFHomeKitSettingsAdapterManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      int v8 = "-[HMMediaProfile(HFMediaAccessoryProfileAdditions) hf_settingsAdapterManager]";
      __int16 v9 = 2112;
      __int16 v10 = a1;
      _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "%s Creating new HFHomeKitSettingsAdapterManager for HMMediaProfile %@", (uint8_t *)&v7, 0x16u);
    }

    v4 = [[HFHomeKitSettingsAdapterManager alloc] initWithHomeKitSettingsVendor:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_categoryCapitalizedLocalizedDescription
{
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hf_userFriendlyLocalizedCapitalizedDescription");

  return v2;
}

- (id)hf_categoryLowercaseLocalizedDescription
{
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hf_userFriendlyLocalizedLowercaseDescription");

  return v2;
}

- (id)hf_dependentHomeKitObjectsForDownstreamItems
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [a1 accessories];
  [v2 unionSet:v3];

  [v2 addObject:a1];
  v4 = [a1 settings];
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (uint64_t)hf_supportsMultiUser
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 supportsMultiUser];

  return v2;
}

- (uint64_t)hf_supportsMediaActions
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 supportsMediaActions];

  return v2;
}

- (uint64_t)hf_homePodSupportsMultiUser
{
  uint64_t v2 = [a1 accessory];
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    uint64_t v3 = [a1 accessory];
    uint64_t v4 = [v3 supportsMultiUser];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)hf_homePodIsCapableOfShowingSplitAccountError
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (+[HFUtilities isAMac]) {
    goto LABEL_7;
  }
  uint64_t v4 = objc_msgSend(a1, "hf_home");
  int v5 = [v4 isMultiUserEnabled];

  if (!v5) {
    goto LABEL_7;
  }
  v6 = objc_msgSend(a1, "hf_backingAccessory");
  int v7 = objc_msgSend(v6, "hf_isHomePod");

  if (!v7) {
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "hf_homePodSupportsMultiUser")
    && (objc_msgSend(a1, "hf_home"),
        int v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = objc_msgSend(v8, "hf_currentUserIsOwner"),
        v8,
        v9))
  {
    __int16 v10 = objc_msgSend(a1, "hf_home");
    uint64_t v11 = [v10 users];
    BOOL v12 = [v11 count] == 0;
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }
  unsigned int v13 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = NSStringFromSelector(a2);
    BOOL v23 = +[HFUtilities isAMac];
    v25 = objc_msgSend(a1, "hf_home");
    int v22 = [v25 isMultiUserEnabled];
    v15 = objc_msgSend(a1, "hf_backingAccessory");
    int v16 = objc_msgSend(v15, "hf_isHomePod");
    int v17 = objc_msgSend(a1, "hf_homePodSupportsMultiUser");
    v18 = objc_msgSend(a1, "hf_home");
    int v19 = objc_msgSend(v18, "hf_currentUserIsOwner");
    v20 = objc_msgSend(a1, "hf_home");
    v21 = [v20 users];
    *(_DWORD *)buf = 138414338;
    v27 = a1;
    __int16 v28 = 2112;
    v29 = v24;
    __int16 v30 = 1024;
    BOOL v31 = v12;
    __int16 v32 = 1024;
    BOOL v33 = v23;
    __int16 v34 = 1024;
    int v35 = v22;
    __int16 v36 = 1024;
    int v37 = v16;
    __int16 v38 = 1024;
    int v39 = v17;
    __int16 v40 = 1024;
    int v41 = v19;
    __int16 v42 = 1024;
    BOOL v43 = [v21 count] == 0;
    _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "%@:%@: %{BOOL}d (Mac = %{BOOL}d, MU enabled = %{BOOL}d, is HomePod = %{BOOL}d, MU HomePod = %{BOOL}d, is Owner = %{BOOL}d, Home has users = %{BOOL}d,)", buf, 0x40u);
  }
  return v12;
}

- (id)hf_deviceIdentifiers
{
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessory];
  uint64_t v3 = [v2 deviceIdentifier];
  uint64_t v4 = objc_msgSend(v1, "na_setWithSafeObject:", v3);

  return v4;
}

- (id)hf_mediaRouteIdentifier
{
  v1 = objc_msgSend(a1, "hf_deviceIdentifiers");
  uint64_t v2 = [v1 anyObject];

  return v2;
}

- (BOOL)hasValidSettings
{
  v1 = [a1 settings];
  uint64_t v2 = [v1 rootGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)homekitObjectIdentifiers
{
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessory];
  BOOL v3 = [v2 uniqueIdentifier];
  uint64_t v4 = [v1 setWithObject:v3];

  return v4;
}

- (uint64_t)isItemGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  uint64_t v2 = objc_msgSend(a1, "hf_home");
  BOOL v3 = [a1 accessory];
  uint64_t v4 = objc_msgSend(v2, "hf_mediaSystemForAccessory:", v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (uint64_t)numberOfItemsContainedWithinGroup
{
  return 0;
}

- (id)hf_appleMusicCurrentLoggedInAccount
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 remoteLoginHandler];

  BOOL v3 = [v2 loggedInAccount];

  return v3;
}

- (id)hf_appleMusicCurrentLoggedInAccountDSID
{
  v1 = objc_msgSend(a1, "hf_appleMusicCurrentLoggedInAccount");
  uint64_t v2 = objc_msgSend(v1, "aa_altDSID");

  return v2;
}

- (id)hf_homePodSupportsMultiUserLanguage
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke;
  v4[3] = &unk_26408C8F0;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v2 = [MEMORY[0x263F58190] futureWithBlock:v4];
  return v2;
}

- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke;
  v4[3] = &unk_26408C8F0;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v2 = [MEMORY[0x263F58190] futureWithBlock:v4];
  return v2;
}

- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke;
  v4[3] = &unk_26408C8F0;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v2 = [MEMORY[0x263F58190] futureWithBlock:v4];
  return v2;
}

- (HFHomeKitSettingsValueManager)hf_settingsValueManager
{
  uint64_t v4 = [a1 settings];

  if (v4)
  {
    objc_getAssociatedObject(a1, a2);
    uint64_t v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      BOOL v5 = [HFHomeKitSettingsValueManager alloc];
      v6 = [a1 settings];
      int v7 = [a1 homekitObjectIdentifiers];
      uint64_t v4 = [(HFHomeKitSettingsValueManager *)v5 initWithSettings:v6 homeKitObjectIdentifiers:v7];

      objc_setAssociatedObject(a1, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (HFMediaAccessoryCommonSettingsManager)hf_mediaAccessoryCommonSettingsManager
{
  uint64_t v2 = [a1 accessories];
  BOOL v3 = [v2 allObjects];
  uint64_t v4 = [v3 lastObject];
  if ((objc_msgSend(v4, "hf_isSiriEndpoint") & 1) == 0)
  {

    goto LABEL_6;
  }
  BOOL v5 = [a1 accessories];
  v6 = [v5 allObjects];
  int v7 = [v6 lastObject];
  if (!objc_msgSend(v7, "hf_isSiriEndpoint"))
  {

    goto LABEL_8;
  }
  v15 = [a1 accessories];
  int v8 = [v15 allObjects];
  int v9 = [v8 lastObject];
  __int16 v10 = [v9 siriEndpointProfile];
  char v16 = [v10 supportsOnboarding];

  if ((v16 & 1) == 0)
  {
LABEL_6:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
LABEL_8:
  objc_getAssociatedObject(a1, sel_hf_mediaAccessoryCommonSettingsManager);
  uint64_t v11 = (HFMediaAccessoryCommonSettingsManager *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    BOOL v12 = [HFMediaAccessoryCommonSettingsManager alloc];
    unsigned int v13 = objc_msgSend(a1, "hf_home");
    uint64_t v11 = [(HFMediaAccessoryCommonSettingsManager *)v12 initWithMediaProfileContainer:a1 home:v13];

    objc_setAssociatedObject(a1, sel_hf_mediaAccessoryCommonSettingsManager, v11, (void *)1);
  }
LABEL_10:
  return v11;
}

- (HFSiriLanguageOptionsManager)hf_siriLanguageOptionsManager
{
  uint64_t v2 = [a1 accessories];
  BOOL v3 = [v2 allObjects];
  uint64_t v4 = [v3 lastObject];
  if (objc_msgSend(v4, "hf_isSiriEndpoint"))
  {
  }
  else
  {
    BOOL v5 = +[HFHomeKitDispatcher sharedDispatcher];
    v6 = [v5 homeManager];
    int v7 = [v6 hasOptedToHH2];

    if (!v7)
    {
      int v8 = 0;
      goto LABEL_7;
    }
  }
  objc_getAssociatedObject(a1, sel_hf_siriLanguageOptionsManager);
  int v8 = (HFSiriLanguageOptionsManager *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    int v9 = +[HFHomeKitDispatcher sharedDispatcher];
    __int16 v10 = [v9 homeManager];

    uint64_t v11 = [HFSiriLanguageOptionsManager alloc];
    BOOL v12 = objc_msgSend(v10, "hf_accessorySettingsController");
    unsigned int v13 = [a1 accessory];
    int v14 = [v13 uniqueIdentifier];
    v15 = objc_msgSend(a1, "hf_home");
    int v8 = [(HFSiriLanguageOptionsManager *)v11 initWithSettingsController:v12 accessoryIdentifier:v14 home:v15];

    objc_setAssociatedObject(a1, sel_hf_siriLanguageOptionsManager, v8, (void *)1);
  }
LABEL_7:
  return v8;
}

- (id)hf_analyticsClient
{
  uint64_t v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F5B610]) initWithErrorHandler:&__block_literal_global_403];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v6 = [v5 homeManager];
  int v7 = [v6 hasOptedToHH2];

  if (v7) {
    int v8 = @"com.apple.private.alloy.home";
  }
  else {
    int v8 = @"com.apple.private.alloy.willow";
  }
  int v9 = HFLogForCategory(0x28uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Performing IDS device lookup with service name %@", (uint8_t *)&v23, 0xCu);
  }

  __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v8];
  uint64_t v11 = [a1 accessory];
  BOOL v12 = [v11 device];
  unsigned int v13 = [v12 IDSDeviceForIDSService:v10];

  if (v13)
  {
    int v14 = (void *)IDSCopyIDForDevice();
  }
  else
  {
    v15 = HFLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v22 = [a1 accessory];
      int v23 = 138412290;
      v24 = v22;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Unable to obtain IDS Identifier for accessory: %@", (uint8_t *)&v23, 0xCu);
    }
    char v16 = objc_opt_new();
    objc_msgSend(v16, "na_safeSetObject:forKey:", v10, @"idsService");
    objc_msgSend(v16, "na_safeSetObject:forKey:", 0, @"IDSDevice");
    int v17 = [a1 accessory];
    objc_msgSend(v16, "na_safeSetObject:forKey:", v17, @"accessory");

    v18 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 19, @"HFOperationFindIDSDeviceIdentifier", v16);
    int v19 = v18;
    if (a3) {
      *a3 = v18;
    }
    v20 = +[HFErrorHandler sharedHandler];
    [v20 logError:v19 operationDescription:@"HFOperationFindIDSDeviceIdentifier"];

    int v14 = 0;
  }

  return v14;
}

- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions
{
  id v28 = 0;
  uint64_t v4 = objc_msgSend(a1, "hf_idsDeviceIdentifierWithError:", &v28);
  id v5 = v28;
  if (v5)
  {
    dispatch_queue_t v6 = (dispatch_queue_t)objc_opt_new();
    [v6 na_safeSetObject:v5 forKey:*MEMORY[0x263F08608]];
    [v6 na_safeSetObject:v4 forKey:@"idsDeviceIdentifier"];
    int v7 = (void *)MEMORY[0x263F58190];
    int v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 19, @"HFOperationHomePodDataAnalyticsRetrieveLogList", v6);
    int v9 = [v7 futureWithError:v8];
  }
  else
  {
    __int16 v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Home.dataAnalyticsLogListLoaderQueue", v10);

    BOOL v12 = (void *)MEMORY[0x263F58190];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke;
    v24[3] = &unk_264098950;
    dispatch_queue_t v6 = v11;
    dispatch_queue_t v25 = v6;
    v26 = a1;
    id v27 = v4;
    unsigned int v13 = [v12 futureWithBlock:v24];
    int v14 = 0;
    if (a2 > 0.0)
    {
      objc_initWeak(&location, v13);
      v15 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_4;
      v20[3] = &unk_264098978;
      v21 = v6;
      objc_copyWeak(&v22, &location);
      int v14 = [v15 afterDelay:v20 performBlock:a2];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_6;
    v18[3] = &unk_2640989A0;
    id v19 = v14;
    id v16 = v14;
    int v9 = [v13 addCompletionBlock:v18];

    int v8 = v25;
  }

  return v9;
}

- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:
{
  id v7 = a3;
  if (!v7)
  {
    int v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"HFMediaProfileContainer.m", 2366, @"Invalid parameter not satisfying: %@", @"log" object file lineNumber description];
  }
  id v37 = 0;
  int v8 = objc_msgSend(a1, "hf_idsDeviceIdentifierWithError:", &v37);
  id v9 = v37;
  if (v9)
  {
    dispatch_queue_t v10 = (dispatch_queue_t)objc_opt_new();
    [v10 na_safeSetObject:v9 forKey:*MEMORY[0x263F08608]];
    [v10 na_safeSetObject:v7 forKey:@"logFileName"];
    dispatch_queue_t v11 = [NSNumber numberWithDouble:a4];
    [v10 na_safeSetObject:v11 forKey:@"timeOut"];

    [v10 na_safeSetObject:v8 forKey:@"idsDeviceIdentifier"];
    BOOL v12 = (void *)MEMORY[0x263F58190];
    unsigned int v13 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 19, @"HFOperationHomePodDataAnalyticsRetrieveLogList", v10);
    int v14 = [v12 futureWithError:v13];
  }
  else
  {
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.Home.dataAnalyticsLogLoaderQueue", v15);

    int v17 = (void *)MEMORY[0x263F58190];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke;
    v32[3] = &unk_264097100;
    dispatch_queue_t v10 = v16;
    dispatch_queue_t v33 = v10;
    __int16 v34 = a1;
    id v35 = v8;
    id v36 = v7;
    v18 = [v17 futureWithBlock:v32];
    id v19 = 0;
    if (a4 > 0.0)
    {
      objc_initWeak(&location, v18);
      objc_initWeak(&from, a1);
      v20 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_4;
      v26[3] = &unk_2640989C8;
      id v27 = v10;
      objc_copyWeak(&v28, &location);
      objc_copyWeak(&v29, &from);
      id v19 = [v20 afterDelay:v26 performBlock:a4];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v28);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_437;
    v24[3] = &unk_2640989F0;
    id v25 = v19;
    id v21 = v19;
    int v14 = [v18 addCompletionBlock:v24];

    unsigned int v13 = v33;
  }

  return v14;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions
{
  return _HFStateDumpBuilderForMediaProfileContainer(a1, a3);
}

- (id)hf_displayName
{
  v1 = objc_msgSend(a1, "hf_serviceNameComponents");
  uint64_t v2 = [v1 composedString];

  return v2;
}

- (id)hf_dateAdded
{
  v1 = [a1 accessory];
  uint64_t v2 = HFDateAddedForApplicationDataContainer(v1);

  return v2;
}

- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions
{
  id v4 = a3;
  id v5 = [a1 accessory];
  dispatch_queue_t v6 = HFUpdateDateAddedForApplicationDataContainer(v5, v4);

  return v6;
}

- (uint64_t)hf_supportsHomeTheater
{
  uint64_t v2 = objc_msgSend(a1, "hf_backingAccessory");
  int v3 = objc_msgSend(v2, "hf_isHomePod");

  id v4 = objc_msgSend(a1, "hf_backingAccessory");
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 supportsAudioDestination];
  }
  else
  {
    int v7 = objc_msgSend(v4, "hf_isAppleTV");

    if (!v7) {
      return 0;
    }
    id v5 = objc_msgSend(a1, "hf_backingAccessory");
    int v8 = [v5 audioDestinationController];
    uint64_t v6 = v8 != 0;
  }
  return v6;
}

- (uint64_t)hf_supportsPreferredMediaUser
{
  int v3 = objc_msgSend(a1, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isHomePod");
  if ((v4 & 1) != 0
    || (objc_msgSend(a1, "hf_backingAccessory"),
        v1 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "hf_isSiriEndpoint")))
  {
    id v5 = objc_msgSend(a1, "hf_backingAccessory");
    uint64_t v6 = [v5 supportsPreferredMediaUser];

    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

LABEL_7:
  return v6;
}

- (id)hf_preferredMediaUser
{
  if (objc_msgSend(a1, "hf_supportsPreferredMediaUser"))
  {
    uint64_t v2 = objc_msgSend(a1, "hf_backingAccessory");
    int v3 = [v2 preferredMediaUser];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (uint64_t)hf_preferredUserSelectionType
{
  v1 = objc_msgSend(a1, "hf_backingAccessory");
  uint64_t v2 = [v1 preferredUserSelectionType];

  return v2;
}

- (id)hf_identify
{
  uint64_t v2 = objc_msgSend(a1, "hf_backingAccessory");
  int v3 = objc_msgSend(v2, "hf_isHomePod");

  if (v3)
  {
    char v4 = objc_msgSend(a1, "hf_backingAccessory");
    id v5 = objc_msgSend(v4, "hf_identifyHomePod");
  }
  else
  {
    id v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v5;
}

@end