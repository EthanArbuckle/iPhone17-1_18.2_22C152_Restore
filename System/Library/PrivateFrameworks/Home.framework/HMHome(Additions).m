@interface HMHome(Additions)
+ (__CFString)_hf_appDataKeyForColorPaletteOfType:()Additions;
+ (uint64_t)hf_minimumDescriptionsOfHomes:()Additions;
- (BOOL)hf_atleastOneMediaAccessoryHasSiriEnabled;
- (BOOL)hf_canAddAccessCode;
- (BOOL)hf_containsWalletKeyUWBAccessory;
- (BOOL)hf_hasAtleastOneAudioAnalysisSupportedAccessory;
- (BOOL)hf_hasAtleastOneSafetyAndSecuritySupportedAccessory;
- (BOOL)hf_hasReachableResidents;
- (BOOL)hf_hasResident;
- (BOOL)hf_hasSecureRecordingCameras;
- (BOOL)hf_isCurrentRestrictedGuestAwayFromHome;
- (BOOL)hf_isNetworkCredentialManagementEnabled;
- (BOOL)hf_isNetworkProtectionEnabled;
- (BOOL)hf_isNetworkProtectionSupportedForAccessories;
- (BOOL)hf_isNetworkProtectionSupportedForHome;
- (BOOL)hf_isNetworkRouterSupported;
- (BOOL)hf_isPresenceAuthorizedForUser:()Additions;
- (BOOL)hf_shouldBlockCurrentUserFromHomeForRoarUpgrade;
- (BOOL)hf_userCanCreateTrigger;
- (HFAccessoryCategoryReorderableItemList)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;
- (HFCharacteristicValueManager)hf_characteristicValueManager;
- (HFColorPalette)hf_colorPaletteOfType:()Additions;
- (HFHomeDashboardReorderableItemList)hf_reorderableDashboardSectionList;
- (HFReorderableHomeKitItemList)hf_reorderableActionSetsList;
- (HFReorderableHomeKitItemList)hf_reorderableCamerasList;
- (HFReorderableHomeKitItemList)hf_reorderableRoomsList;
- (HFReorderableHomeKitItemList)hf_reorderableServicesList;
- (HFSuspendedStateOverrideValueProvider)hf_suspendedStateOverrideValueProvider;
- (_TtC4Home19HFHomeEnergyManager)hf_energyManager;
- (id)_hf_cachedWalletKeyDeviceStateForCurrentDevice;
- (id)_hf_existingWalletKeyColorForCurrentDevice;
- (id)_hf_fetchWalletKeyColorFromAccessories;
- (id)accessoriesSupportingSoftwareUpdate;
- (id)hf_accessControlDescriptor;
- (id)hf_accessoriesMatchingCategoryType:()Additions;
- (id)hf_accessoriesRequiringManualWiFiReconfiguration;
- (id)hf_accessoriesSupportingAccessCodes;
- (id)hf_accessoriesSupportingNaturalLighting;
- (id)hf_accessoriesSupportingUWBUnlock;
- (id)hf_accessoriesWithValidSoftwareOrFirmwareUpdates;
- (id)hf_accessoryCategoriesReorderableItemComparator;
- (id)hf_accessoryForSymptomsHandler:()Additions;
- (id)hf_accessoryProfilesWithClass:()Additions;
- (id)hf_accessoryRepresentableUsageCountsByRoomWithFilter:()Additions;
- (id)hf_accessoryWithDeviceIdentifier:()Additions;
- (id)hf_accessoryWithIdentifier:()Additions;
- (id)hf_accessoryWithMatterNodeID:()Additions;
- (id)hf_actionSetWithUUID:()Additions;
- (id)hf_activeRooms;
- (id)hf_addWalletKeyToPairedWatchesWithOptions:()Additions;
- (id)hf_addWalletKeyWithOptions:()Additions;
- (id)hf_allAccessoryProfiles;
- (id)hf_allBridgeAccessories;
- (id)hf_allCameraProfiles;
- (id)hf_allCameraProfilesSupportingRecording;
- (id)hf_allCameraProfilesWithDoorbellService;
- (id)hf_allCameraProfilesWithSmartMotionRecordingEnabled;
- (id)hf_allHomePodProfileContainers;
- (id)hf_allHomePodsOrStereoPairs;
- (id)hf_allHomePodsOrStereoPairsThatWillChime;
- (id)hf_allLightProfiles;
- (id)hf_allLightProfilesSupportingNaturalLighting;
- (id)hf_allMediaProfileContainers;
- (id)hf_allNetworkConfigurationProfiles;
- (id)hf_allNetworkRouterAccessories;
- (id)hf_allNonAdminUsers;
- (id)hf_allNonEmptyActionSets;
- (id)hf_allNonOwnerUsers;
- (id)hf_allPersonManagers;
- (id)hf_allPersons;
- (id)hf_allPhotosPersonManagers;
- (id)hf_allProgrammableSwitchAccessories;
- (id)hf_allResidentAccessories;
- (id)hf_allRooms;
- (id)hf_allServices;
- (id)hf_allSiriEndPointProfileContainers;
- (id)hf_allSiriEndPointProfileContainersThatWillChime;
- (id)hf_allTargetControlAccessories;
- (id)hf_allUniqueMediaProfileContainers;
- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups;
- (id)hf_allUsersIncludingCurrentUser;
- (id)hf_allVisibleServices;
- (id)hf_appleTVUsingAudioDestination:()Additions;
- (id)hf_appleTVs;
- (id)hf_appleTVsSupportingHomeTheater;
- (id)hf_audioAnalysisSupportedAccessories;
- (id)hf_cameraProfileForSignificantEvent:()Additions;
- (id)hf_cameraProfileWithIdentifier:()Additions;
- (id)hf_characteristicValueManagerIfCreated;
- (id)hf_dashboardSectionReorderableHomeKitObjectComparator;
- (id)hf_dashboardSectionReorderableItemComparator;
- (id)hf_dashboardSectionReorderableUUIDStringComparator;
- (id)hf_ecosystemAccessoryUUIDMapFuture;
- (id)hf_enableExpressModeForWalletKeyWithAuthData:()Additions;
- (id)hf_enableUWBForWalletKeyWithAuthData:()Additions enableNFCExpress:;
- (id)hf_enabledResidentDevices;
- (id)hf_fetchAvailableWalletKeyEncodedPKPass;
- (id)hf_fetchExistingWalletKeyEncodedPKPass;
- (id)hf_fetchWalletKeyDeviceStateForCurrentDevice;
- (id)hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary;
- (id)hf_fetchWalletKeyDeviceStateForPairedWatches;
- (id)hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice;
- (id)hf_hasWalletKey;
- (id)hf_hasWalletKeyCompatibleDevice;
- (id)hf_homeKitObjectsSupportingNaturalLighting;
- (id)hf_homePods;
- (id)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;
- (id)hf_localizedDescriptionForNetworkProtectionSupport;
- (id)hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion:()Additions;
- (id)hf_mediaAccessories;
- (id)hf_mediaProfileContainerForSymptomsHandler:()Additions;
- (id)hf_mediaSystemForAccessory:()Additions;
- (id)hf_mediaSystemForSymptomsHandler:()Additions;
- (id)hf_mediaSystemWithIdentifier:()Additions;
- (id)hf_minimumDescription;
- (id)hf_notesApplicationData;
- (id)hf_orderedActionSets;
- (id)hf_orderedRooms;
- (id)hf_personManagerWithIdentifier:()Additions;
- (id)hf_personWithIdentifier:()Additions;
- (id)hf_personalRequestAccessories;
- (id)hf_primaryResidentDevice;
- (id)hf_relatedHomeTheaterMediaProfileContainerFor:()Additions;
- (id)hf_resetAllNetworkConfigurationProfiles;
- (id)hf_residentDevicesAddedToHome;
- (id)hf_restrictedGuestAllowedAccessories;
- (id)hf_roomWithIdentifier:()Additions;
- (id)hf_roomWithName:()Additions;
- (id)hf_selectedRoom;
- (id)hf_serviceGroupWithIdentifier:()Additions;
- (id)hf_serviceGroupsForService:()Additions;
- (id)hf_serviceWithIdentifier:()Additions;
- (id)hf_setFaceRecognitionEnabled:()Additions;
- (id)hf_setHasOnboardedForAccessCode;
- (id)hf_setHasOnboardedForWalletKey;
- (id)hf_setHomeHasMigratedForRedesign:()Additions;
- (id)hf_setHomeHasMigratedServicesToAccessories:()Additions;
- (id)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:()Additions;
- (id)hf_setNotesApplicationData:()Additions;
- (id)hf_setPhotosLibrarySettingsForUser:()Additions importPhotosLibraryEnabled:shareFacesEnabled:;
- (id)hf_setSharePhotosLibraryEnabled:()Additions forUser:;
- (id)hf_setShowPredictedScenesOnDashboard:()Additions;
- (id)hf_siriEndPointAccessories;
- (id)hf_siriEndpointCapableAccessoriesToOnboard;
- (id)hf_tvViewingProfilesAccessories;
- (id)hf_unitaryCameraProfile;
- (id)hf_updateAccessControlDescriptor:()Additions;
- (id)hf_updateAutomaticSoftwareUpdateEnabled:()Additions;
- (id)hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:()Additions;
- (id)hf_updateColorPalette:()Additions type:;
- (id)hf_updateNetworkProtection:()Additions;
- (id)hf_visibleAccessories;
- (id)hf_walletKeyAccessories;
- (id)hf_walletKeyColorToDisplay;
- (id)hf_walletKeyDeviceStatesOfCompatiblePairedWatches;
- (id)hf_walletKeyInWalletAppURL;
- (id)hf_walletKeyUUID;
- (id)hf_zoneWithIdentifier:()Additions;
- (uint64_t)hf_allHomePodsSupportRemoteProfileInstallation;
- (uint64_t)hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage;
- (uint64_t)hf_atleastOneHomePodSupportsAnnounce;
- (uint64_t)hf_atleastOneMediaAccessorySupportingJustSiri;
- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled;
- (uint64_t)hf_blockCurrentUserFromHomeReason;
- (uint64_t)hf_cachedHasEnergySite;
- (uint64_t)hf_canAddHomeMember;
- (uint64_t)hf_canAddRestrictedGuest;
- (uint64_t)hf_canEnableAudioAnalysisAfterHH2Upgrade;
- (uint64_t)hf_canShowTvViewingInfoForUser:()Additions;
- (uint64_t)hf_canUpdateToHH2;
- (uint64_t)hf_containsActionableAccessories;
- (uint64_t)hf_currentUserIsAdministrator;
- (uint64_t)hf_currentUserIsOwner;
- (uint64_t)hf_currentUserIsRestrictedGuest;
- (uint64_t)hf_enabledResidentsSupportsMediaActions;
- (uint64_t)hf_enabledResidentsSupportsNaturalLight;
- (uint64_t)hf_hasAcceptedTermsAndConditionsForHomePodVersion:()Additions;
- (uint64_t)hf_hasAccessoriesSupportingSoftwareUpdate;
- (uint64_t)hf_hasAnyVisibleTriggers;
- (uint64_t)hf_hasAppleTVs;
- (uint64_t)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;
- (uint64_t)hf_hasAtLeastOneReachableHomeMediaAccessory;
- (uint64_t)hf_hasAtLeastOneRestrictedGuest;
- (uint64_t)hf_hasAtleastOneOasisEnabledHomePod;
- (uint64_t)hf_hasAutomatableProfiles;
- (uint64_t)hf_hasAutomatableServices;
- (uint64_t)hf_hasCameraRecordingResident;
- (uint64_t)hf_hasEnabledAndReachableResident;
- (uint64_t)hf_hasEnabledResident;
- (uint64_t)hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate;
- (uint64_t)hf_hasFavorites;
- (uint64_t)hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate;
- (uint64_t)hf_hasHomeHubSupportingAccessCodes;
- (uint64_t)hf_hasHomeHubSupportingWalletKey;
- (uint64_t)hf_hasHomePods;
- (uint64_t)hf_hasMediaAccessories;
- (uint64_t)hf_hasRMVCapableAppleTV;
- (uint64_t)hf_hasResidentDeviceCapableOfSupportingActivityZones;
- (uint64_t)hf_hasResidentDeviceCapableOfSupportingCHIP;
- (uint64_t)hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes;
- (uint64_t)hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin;
- (uint64_t)hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter;
- (uint64_t)hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate;
- (uint64_t)hf_hasUtilitySubscription;
- (uint64_t)hf_hasVisibleAccessories;
- (uint64_t)hf_hasVisibleServies;
- (uint64_t)hf_homeHasMigratedForRedesign;
- (uint64_t)hf_homeHasMigratedIntoHomeApp;
- (uint64_t)hf_homeHasMigratedServicesToAccessories;
- (uint64_t)hf_isAbleToAddTrigger;
- (uint64_t)hf_isAutomatable;
- (uint64_t)hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
- (uint64_t)hf_isCurrentLocationHome;
- (uint64_t)hf_isCurrentUserInRestrictedGuestAllowedPeriod;
- (uint64_t)hf_isEmpty;
- (uint64_t)hf_isFaceRecognitionAvailable;
- (uint64_t)hf_isGridForecastAvailable;
- (uint64_t)hf_isGridForecastAvailableForNewFeaturesView;
- (uint64_t)hf_isGridForecastEnabled;
- (uint64_t)hf_isGridForecastVisible;
- (uint64_t)hf_isHomeElectricitySupported;
- (uint64_t)hf_isHomeEnergyHomeEmpty;
- (uint64_t)hf_isHomeEnergyVisible;
- (uint64_t)hf_isInRestrictedGuestAllowedPeriodForUser:()Additions;
- (uint64_t)hf_isMediaAccessoryProfileValid:()Additions;
- (uint64_t)hf_numberOfHomePods;
- (uint64_t)hf_remoteAccessState;
- (uint64_t)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;
- (uint64_t)hf_setImportPhotosLibraryEnabled:()Additions forUser:;
- (uint64_t)hf_shortcutsComponentActionSetWithActions:()Additions;
- (uint64_t)hf_shouldBlockCurrentRestrictedGuestFromHome;
- (uint64_t)hf_shouldBlockCurrentUserFromHome;
- (uint64_t)hf_shouldHideResidentDeviceReachabilityIssues;
- (uint64_t)hf_shouldShowActivityLogSetting;
- (uint64_t)hf_shouldShowAnnounceButtonForThisHome;
- (uint64_t)hf_shouldShowAnnounceFeatureForThisHome;
- (uint64_t)hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:()Additions;
- (uint64_t)hf_shouldShowSoftwareUpdateSettings;
- (uint64_t)hf_showPredictedScenesOnDashboard;
- (uint64_t)hf_supportsPerUserRemoteAccess;
- (uint64_t)hf_supportsReachabilityNotifications;
- (uint64_t)hf_supportsRemoteAccessRestrictions;
- (uint64_t)hf_supportsSharedEventAutomation;
- (uint64_t)hf_userIsAdministrator:()Additions;
- (uint64_t)hf_userIsOwner:()Additions;
- (uint64_t)hf_userIsRestrictedGuest:()Additions;
- (void)hf_clearCachedWalletKeyDeviceStateForCurrentDevice;
- (void)hf_setIsGridForecastEnabled:()Additions;
- (void)hf_setSelectedRoom:()Additions;
- (void)hf_setTemporaryEnergyLocation:()Additions;
- (void)hf_startReprovisioningAccessory:()Additions;
@end

@implementation HMHome(Additions)

- (id)hf_characteristicValueManagerIfCreated
{
  return objc_getAssociatedObject(a1, sel_hf_characteristicValueManager);
}

- (id)hf_orderedRooms
{
  objc_initWeak(&location, val);
  v2 = +[HFHomePropertyCacheManager sharedManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__HMHome_Additions__hf_orderedRooms__block_invoke;
  v5[3] = &unk_264091F70;
  objc_copyWeak(&v6, &location);
  v3 = [v2 valueForObject:val home:val key:@"hf_orderedRooms" invalidationReasons:4 recalculationBlock:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

- (uint64_t)hf_enabledResidentsSupportsNaturalLight
{
  v1 = objc_msgSend(a1, "hf_enabledResidentDevices");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_321);

  return v2;
}

- (id)hf_enabledResidentDevices
{
  v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_97);

  return v2;
}

- (HFCharacteristicValueManager)hf_characteristicValueManager
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, sel_hf_characteristicValueManager);
  uint64_t v2 = (HFCharacteristicValueManager *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    uint64_t v2 = [[HFCharacteristicValueManager alloc] initWithValueReader:a1 valueWriter:a1];
    objc_setAssociatedObject(a1, sel_hf_characteristicValueManager, v2, (void *)1);
    v3 = HFLogForCategory(0x37uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315906;
      id v6 = "-[HMHome(Additions) hf_characteristicValueManager]";
      __int16 v7 = 2048;
      uint64_t v8 = 123;
      __int16 v9 = 2112;
      v10 = v2;
      __int16 v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_INFO, "%s (Line: %ld) HFCharacteristicValueManager is %@ for Home %@.", (uint8_t *)&v5, 0x2Au);
    }
  }
  return v2;
}

- (id)hf_homePods
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_254);

  return v2;
}

- (id)hf_walletKeyAccessories
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_390);

  return v2;
}

- (id)hf_allVisibleServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessories];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_151);

  return v4;
}

- (id)hf_allBridgeAccessories
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hf_isBridge")) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (uint64_t)hf_canUpdateToHH2
{
  uint64_t v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 homeManager];

  if (objc_msgSend(a1, "hf_currentUserIsOwner")
    && [v3 isHH2MigrationAvailable])
  {
    uint64_t v4 = [v3 hasOptedToHH2] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_userIsAdministrator:()Additions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isAdministrator];

  return v2;
}

- (uint64_t)hf_userIsOwner:()Additions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isOwner];

  return v2;
}

- (BOOL)hf_isCurrentRestrictedGuestAwayFromHome
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 currentUser];
  int v3 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2);

  if (v3) {
    BOOL v4 = [a1 homeLocationStatus] == 2;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = HFLogForCategory(0x46uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [a1 name];
    __int16 v7 = [a1 uniqueIdentifier];
    [a1 homeLocationStatus];
    uint64_t v8 = HMStringFromHomeLocation();
    __int16 v9 = [a1 currentUser];
    long long v10 = objc_msgSend(v9, "hf_prettyDescription");
    int v12 = 136316418;
    long long v13 = "-[HMHome(Additions) hf_isCurrentRestrictedGuestAwayFromHome]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    v17 = v6;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%s) result = %{BOOL}d. home: <Name: %@, Id: %@>. HomeLocationStatus = %@. User:%@.", (uint8_t *)&v12, 0x3Au);
  }
  return v4;
}

- (uint64_t)hf_shouldShowAnnounceButtonForThisHome
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 currentUser];
  int v3 = [a1 homeAccessControlForUser:v2];

  int v4 = [v3 isAnnounceAccessAllowed];
  int v5 = objc_msgSend(a1, "hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled");
  uint64_t v6 = HFLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109634;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 2112;
    long long v13 = a1;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "isAnnounceAccessAllowedForThisUser = %d, atleastOneHomePodSupportsAnnounce = [%d], for home = %@", (uint8_t *)v9, 0x18u);
  }

  if ((v4 & v5) == 1) {
    uint64_t v7 = objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome") ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_345_0);

  return v2;
}

- (id)hf_serviceGroupsForService:()Additions
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [a1 serviceGroups];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__HMHome_Additions__hf_serviceGroupsForService___block_invoke;
    v8[3] = &unk_264092010;
    id v9 = v4;
    uint64_t v6 = objc_msgSend(v5, "na_filter:", v8);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (uint64_t)hf_shouldBlockCurrentUserFromHome
{
  if (objc_msgSend(a1, "hf_shouldBlockCurrentRestrictedGuestFromHome")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");
}

- (uint64_t)hf_currentUserIsAdministrator
{
  if ((HFForceNotAdministrator() & 1) != 0
    || +[HFUtilities isRunningInStoreDemoMode])
  {
    return 0;
  }
  int v3 = [a1 currentUser];
  id v4 = [a1 homeAccessControlForUser:v3];
  uint64_t v5 = [v4 isAdministrator];

  return v5;
}

- (uint64_t)hf_currentUserIsOwner
{
  if ((HFForceNotAdministrator() & 1) != 0
    || +[HFUtilities isRunningInStoreDemoMode])
  {
    return 0;
  }
  int v3 = [a1 currentUser];
  id v4 = [a1 homeAccessControlForUser:v3];
  uint64_t v5 = [v4 isOwner];

  return v5;
}

- (uint64_t)hf_currentUserIsRestrictedGuest
{
  uint64_t v2 = [a1 currentUser];
  uint64_t v3 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2);

  return v3;
}

- (uint64_t)hf_shouldBlockCurrentRestrictedGuestFromHome
{
  uint64_t v2 = [a1 currentUser];
  if (objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2))
  {
    if (objc_msgSend(a1, "hf_isCurrentRestrictedGuestAwayFromHome")) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = objc_msgSend(a1, "hf_isCurrentUserInRestrictedGuestAllowedPeriod") ^ 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)hf_userIsRestrictedGuest:()Additions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isRestrictedGuest];

  return v2;
}

- (BOOL)hf_shouldBlockCurrentUserFromHomeForRoarUpgrade
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 currentUser];
  uint64_t v3 = [a1 homeAccessControlForUser:v2];

  if (([v3 isAccessAllowed] & 1) == 0)
  {
    id v4 = HFLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = [v3 accessNotAllowedReasonCode];
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "User is blocked from home. HMHomeAccessNotAllowedReasonCode %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  if ([v3 isAccessAllowed]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v3 accessNotAllowedReasonCode] == 2 || objc_msgSend(v3, "accessNotAllowedReasonCode") == 4;
  }

  return v5;
}

- (uint64_t)hf_isHomeEnergyHomeEmpty
{
  if (!objc_msgSend(a1, "hf_hasVisibleAccessories")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
}

- (uint64_t)hf_hasVisibleAccessories
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_86);

  return v2;
}

- (uint64_t)hf_isHomeEnergyVisible
{
  v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 isHomeEnergyVisible];

  return v2;
}

- (uint64_t)hf_isGridForecastEnabled
{
  v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 isGridForecastEnabled];

  return v2;
}

- (uint64_t)hf_isGridForecastVisible
{
  v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 isGridForecastVisible];

  return v2;
}

- (_TtC4Home19HFHomeEnergyManager)hf_energyManager
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, sel_hf_energyManager);
  uint64_t v2 = (_TtC4Home19HFHomeEnergyManager *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    uint64_t v2 = [[_TtC4Home19HFHomeEnergyManager alloc] initWithHome:a1];
    objc_setAssociatedObject(a1, sel_hf_energyManager, v2, (void *)1);
    [(HFHomeEnergyManager *)v2 updateHomeEnergyAvailableFeaturesWithCompletionHandler:&__block_literal_global_63];
    uint64_t v3 = HFLogForCategory(0x24uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315650;
      uint64_t v6 = "-[HMHome(Additions) hf_energyManager]";
      __int16 v7 = 2112;
      uint64_t v8 = v2;
      __int16 v9 = 2112;
      __int16 v10 = a1;
      _os_log_debug_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEBUG, "%s HFHomeEnergyManager is %@ for Home %@.", (uint8_t *)&v5, 0x20u);
    }
  }
  return v2;
}

- (HFReorderableHomeKitItemList)hf_reorderableRoomsList
{
  v1 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"homeRooms"];
  return v1;
}

- (HFSuspendedStateOverrideValueProvider)hf_suspendedStateOverrideValueProvider
{
  objc_getAssociatedObject(a1, sel_hf_suspendedStateOverrideValueProvider);
  uint64_t v2 = (HFSuspendedStateOverrideValueProvider *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    uint64_t v2 = objc_alloc_init(HFSuspendedStateOverrideValueProvider);
    objc_setAssociatedObject(a1, sel_hf_suspendedStateOverrideValueProvider, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)hf_showPredictedScenesOnDashboard
{
  v1 = [a1 applicationData];
  uint64_t v2 = [v1 objectForKey:@"showPredictedScenesOnDashboard"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (BOOL)hf_hasAtleastOneAudioAnalysisSupportedAccessory
{
  v1 = objc_msgSend(a1, "hf_audioAnalysisSupportedAccessories");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (BOOL)hf_hasAtleastOneSafetyAndSecuritySupportedAccessory
{
  v1 = objc_msgSend(a1, "hf_safetyAndSecuritySupportedAccessories");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)hf_audioAnalysisSupportedAccessories
{
  v1 = [a1 accessories];
  BOOL v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_351);

  return v2;
}

- (HFHomeDashboardReorderableItemList)hf_reorderableDashboardSectionList
{
  v1 = [[HFHomeDashboardReorderableItemList alloc] initWithApplicationDataContainer:a1 category:@"dashboardSections"];
  return v1;
}

- (id)hf_dashboardSectionReorderableUUIDStringComparator
{
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HMHome_Additions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke;
  v3[3] = &unk_264092370;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_orderedActionSets
{
  BOOL v2 = objc_msgSend(a1, "hf_reorderableActionSetsList");
  uint64_t v3 = [v2 sortedHomeKitObjectComparator];

  if (!v3) {
    NSLog(&cfstr_CouldNotCreate_0.isa, a1);
  }
  id v4 = [a1 actionSets];
  int v5 = [v4 sortedArrayUsingComparator:v3];

  return v5;
}

- (HFReorderableHomeKitItemList)hf_reorderableActionSetsList
{
  v1 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"homeActionSets"];
  return v1;
}

- (HFReorderableHomeKitItemList)hf_reorderableServicesList
{
  v1 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"homeServices"];
  return v1;
}

- (HFReorderableHomeKitItemList)hf_reorderableCamerasList
{
  v1 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"homeCameras"];
  return v1;
}

- (uint64_t)hf_homeHasMigratedServicesToAccessories
{
  v1 = [a1 applicationData];
  BOOL v2 = [v1 objectForKey:@"hasMigratedAccessories"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)hf_userCanCreateTrigger
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(a1, "hf_isAbleToAddTrigger");
  int v3 = objc_msgSend(a1, "hf_userIsAllowedToCreateTrigger");
  id v4 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109376;
    BOOL v9 = v2;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Checking if user can create a trigger in this home isAbleToAddTrigger:%d userIsAllowedToCreateTrigger:%d", (uint8_t *)&v8, 0xEu);
  }

  BOOL v5 = (v2 & v3 & 1) != 0 || HFForceAllowAutomationCreation();
  uint64_t v6 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    BOOL v9 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Checking if user can create a trigger in this home userCanCreateTrigger:%d", (uint8_t *)&v8, 8u);
  }

  return v5;
}

- (uint64_t)hf_isAbleToAddTrigger
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "hf_remoteAccessState");
  int v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  int v5 = objc_msgSend(v4, "hf_hasDetectediCloudIssue");

  int v6 = objc_msgSend(a1, "hf_hasEnabledResident");
  unsigned int v7 = objc_msgSend(a1, "hf_isAutomatable");
  int v8 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109888;
    v10[1] = v2 == 1;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Checking if triggers can be added to this home hasRemoteAccessProblem:%d hasiCloudProblem:%d hasResident:%d isAutomatable:%d", (uint8_t *)v10, 0x1Au);
  }

  return (v2 != 1) & ~v5 & v6 & v7;
}

- (uint64_t)hf_remoteAccessState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((HFForceRemoteAccessStateAvailable() & 1) != 0
    || +[HFUtilities shouldSuppressAllErrorsForDemo])
  {
    return 3;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = objc_msgSend(a1, "residentDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v2 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isEnabled])
        {
          if ([v8 status])
          {
            uint64_t v2 = 3;
            goto LABEL_17;
          }
          uint64_t v2 = 2;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
LABEL_17:

  return v2;
}

- (uint64_t)hf_isAutomatable
{
  if (objc_msgSend(a1, "hf_hasAutomatableServices")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_hasAutomatableProfiles");
}

- (uint64_t)hf_hasEnabledResident
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFForceRemoteAccessStateAvailable();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = objc_msgSend(a1, "residentDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hf_isEnabled"))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)hf_hasAutomatableServices
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = objc_msgSend(a1, "hf_hasVisibleServies");
  uint64_t v2 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Checking if home has automatable services hasAutomatableServices:%d", (uint8_t *)v4, 8u);
  }

  return v1;
}

- (uint64_t)hf_hasVisibleServies
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_148_0);

  return v2;
}

- (id)hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary
{
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  if (v2) {
    [MEMORY[0x263F58190] futureWithResult:v2];
  }
  else {
  int v3 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  }

  return v3;
}

- (id)hf_walletKeyUUID
{
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  int v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F58190];
    uint64_t v5 = [v2 walletKey];
    uint64_t v6 = [v5 UUID];
    [v4 futureWithResult:v6];
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    uint64_t v6 = [v5 flatMap:&__block_literal_global_404];
    [v6 recoverIgnoringError];
  unsigned int v7 = };

  return v7;
}

- (id)hf_fetchWalletKeyDeviceStateForCurrentDevice
{
  uint64_t v2 = objc_getAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture");
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v5 = [a1 description];
    objc_setAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture", v4, (void *)1);
    objc_initWeak(&location, a1);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    _DWORD v9[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke;
    v9[3] = &unk_264092478;
    objc_copyWeak(&v12, &location);
    id v6 = v5;
    id v10 = v6;
    id v7 = v4;
    id v11 = v7;
    [a1 fetchWalletKeyDeviceStateWithCompletion:v9];
    id v3 = v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_hf_cachedWalletKeyDeviceStateForCurrentDevice
{
  return objc_getAssociatedObject(a1, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey");
}

- (id)hf_accessoriesSupportingNaturalLighting
{
  uint64_t v1 = objc_msgSend(a1, "hf_allLightProfilesSupportingNaturalLighting");
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_134);

  return v2;
}

- (id)hf_allLightProfilesSupportingNaturalLighting
{
  if (objc_msgSend(a1, "hf_enabledResidentsSupportsNaturalLight"))
  {
    uint64_t v2 = objc_msgSend(a1, "hf_allLightProfiles");
    id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_164);
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (uint64_t)hf_hasAppleTVs
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_335);

  return v2;
}

- (HFAccessoryCategoryReorderableItemList)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
{
  uint64_t v1 = [[HFAccessoryCategoryReorderableItemList alloc] initWithApplicationDataContainer:a1 category:@"homeAccessoryCategories"];
  return v1;
}

- (uint64_t)hf_hasRMVCapableAppleTV
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_337);

  return v2;
}

- (uint64_t)hf_hasHomeHubSupportingWalletKey
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_428);

  return v2;
}

- (uint64_t)hf_hasHomeHubSupportingAccessCodes
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_456);

  return v2;
}

- (id)hf_siriEndpointCapableAccessoriesToOnboard
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_256);

  return v2;
}

- (id)hf_accessoriesSupportingAccessCodes
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_454);

  return v2;
}

- (id)hf_visibleAccessories
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_84_0);

  return v2;
}

- (id)hf_mediaAccessories
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_250);

  return v2;
}

- (id)hf_allUsersIncludingCurrentUser
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [a1 users];
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v3);

  id v4 = [a1 currentUser];
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (id)hf_allLightProfiles
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_161_0);

  return v2;
}

- (id)hf_dashboardSectionReorderableHomeKitObjectComparator
{
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__HMHome_Additions__hf_dashboardSectionReorderableHomeKitObjectComparator__block_invoke;
  v3[3] = &unk_264092398;
  objc_copyWeak(&v4, &location);
  uint64_t v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_activeRooms
{
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = [a1 rooms];
  id v4 = (void *)[v2 initWithArray:v3];

  uint64_t v5 = [a1 roomForEntireHome];
  id v6 = [a1 rooms];
  if (![v6 count])
  {

    goto LABEL_5;
  }
  char v7 = objc_msgSend(v5, "hf_hasVisibleAccessories");

  if (v7) {
LABEL_5:
  }
    objc_msgSend(v4, "na_safeAddObject:", v5);

  return v4;
}

- (id)hf_roomWithIdentifier:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_allRooms");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __43__HMHome_Additions__hf_roomWithIdentifier___block_invoke;
  v9[3] = &unk_264091F48;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_allRooms
{
  id v2 = [MEMORY[0x263EFF980] array];
  id v3 = [a1 rooms];
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v3);

  id v4 = [a1 roomForEntireHome];
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (uint64_t)hf_isCurrentLocationHome
{
  id v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeManager];

  if (!+[HFUtilities isInternalTest])
  {
    id v4 = [v3 homes];
    char v5 = [v4 containsObject:a1];

    if ((v5 & 1) == 0) {
      NSLog(&cfstr_HomeIsNotAPart.isa, a1, v3);
    }
  }
  id v6 = [v3 currentHome];
  if (v6)
  {
    char v7 = [v3 currentHome];
    int v8 = [v7 uniqueIdentifier];
    long long v9 = [a1 uniqueIdentifier];
    uint64_t v10 = [v8 isEqual:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_hasHomePods
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_330);

  return v2;
}

- (id)hf_allProgrammableSwitchAccessories
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F0E708], "hf_programmableSwitchServiceTypes");
  id v3 = [a1 accessories];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke;
  v7[3] = &unk_26408D968;
  id v8 = v2;
  id v4 = v2;
  char v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

- (uint64_t)hf_hasAnyVisibleTriggers
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 triggers];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_370);

  id v3 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Checking if home has visible triggers hasVisibleTriggers:%d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (BOOL)hf_hasSecureRecordingCameras
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_175);

  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_177_0);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)hf_accessoriesSupportingUWBUnlock
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = [a1 accessories];
    id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_412);
  }
  else
  {
    BOOL v4 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      char v7 = "-[HMHome(Additions) hf_accessoriesSupportingUWBUnlock]";
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Returning empty collection because feature flag is NOT enabled.", (uint8_t *)&v6, 0xCu);
    }

    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)hf_allCameraProfilesSupportingRecording
{
  uint64_t v1 = objc_msgSend(a1, "hf_allCameraProfiles");
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_169_0);

  return v2;
}

- (id)hf_allCameraProfiles
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_167_0);

  return v2;
}

- (uint64_t)hf_homeHasMigratedForRedesign
{
  uint64_t v1 = [a1 applicationData];
  uint64_t v2 = [v1 objectForKey:@"hasMigratedForRedesign"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)hf_clearCachedWalletKeyDeviceStateForCurrentDevice
{
  objc_setAssociatedObject(a1, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey", 0, (void *)1);
  objc_setAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture", 0, (void *)1);
}

- (uint64_t)hf_isGridForecastAvailableForNewFeaturesView
{
  uint64_t v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 isGridForecastAvailableForNewFeaturesView];

  return v2;
}

- (uint64_t)hf_isGridForecastAvailable
{
  uint64_t v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 effectiveGridForecastAvailable];

  return v2;
}

- (void)hf_setIsGridForecastEnabled:()Additions
{
  objc_msgSend(a1, "hf_energyManager");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setIsGridForecastEnabled:a3];
}

- (uint64_t)hf_isHomeElectricitySupported
{
  uint64_t v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 isHomeElectricitySupported];

  return v2;
}

- (uint64_t)hf_cachedHasEnergySite
{
  uint64_t v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 cachedHasEnergySite];

  return v2;
}

- (uint64_t)hf_hasUtilitySubscription
{
  uint64_t v1 = objc_msgSend(a1, "hf_energyManager");
  uint64_t v2 = [v1 cachedHasUtilitySubscription];

  return v2;
}

- (void)hf_setTemporaryEnergyLocation:()Additions
{
  id v4 = a3;
  objc_msgSend(a1, "hf_energyManager");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTemporaryLocation:v4];
}

- (uint64_t)hf_isEmpty
{
  if (objc_msgSend(a1, "hf_hasVisibleAccessories"))
  {
    return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
  }
  else
  {
    uint64_t v3 = [a1 rooms];
    if ([v3 count]) {
      uint64_t v4 = objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
    }
    else {
      uint64_t v4 = 1;
    }

    return v4;
  }
}

- (BOOL)hf_hasResident
{
  uint64_t v1 = [a1 residentDevices];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)hf_canAddHomeMember
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v3 = [v2 homeManager];
  int v4 = [v3 hasOptedToHH2];

  if (!v4) {
    return 1;
  }
  id v5 = [a1 residentDevices];
  uint64_t v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_43_0);

  return v6;
}

- (uint64_t)hf_canAddRestrictedGuest
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "hf_canAddHomeMember"))
  {
    BOOL v2 = objc_msgSend(a1, "hf_primaryResidentDevice");
    unsigned int v3 = [v2 capabilities];
    int v4 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ((v3 & 0x40000000) != 0) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      [v2 capabilities];
      uint64_t v6 = HMResidentDeviceCapabilitiesDescription();
      int v11 = 136315906;
      id v12 = "-[HMHome(Additions) hf_canAddRestrictedGuest]";
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      unsigned int v16 = v2;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. primary resident %@ has capabilities %@.", (uint8_t *)&v11, 0x2Au);
    }
    char v7 = objc_msgSend(a1, "hf_restrictedGuestAllowedAccessories");
    BOOL v8 = [v7 count] != 0;

    uint64_t v9 = *(_DWORD *)&v8 & (v3 >> 30);
  }
  else
  {
    BOOL v2 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[HMHome(Additions) hf_canAddRestrictedGuest]";
      _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because adding home is not available. Check if resident device opted into HH2 or not.", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_isInRestrictedGuestAllowedPeriodForUser:()Additions
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4))
  {
    id v5 = [a1 homeAccessControlForUser:v4];
    uint64_t v6 = [v5 restrictedGuestAccessSettings];

    char v7 = [v6 guestAccessSchedule];
    if (v7)
    {
      BOOL v8 = [a1 homeAccessControlForUser:v4];
      uint64_t v9 = [v8 isRestrictedGuestInAllowedPeriod];

      uint64_t v10 = HFLogForCategory(0x46uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = NSStringFromBOOL();
        id v12 = [a1 name];
        __int16 v13 = [a1 uniqueIdentifier];
        uint64_t v14 = objc_msgSend(v4, "hf_prettyDescription");
        __int16 v15 = [a1 timeZone];
        int v21 = 136316418;
        __int16 v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        __int16 v25 = 2112;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v13;
        __int16 v29 = 2112;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. home: <Name: %@, uniqueIdentifier: %@>. User = %@. (timeZone = %@.)", (uint8_t *)&v21, 0x3Eu);
      }
    }
    else
    {
      uint64_t v10 = HFLogForCategory(0x46uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [a1 name];
        __int16 v18 = [a1 uniqueIdentifier];
        uint64_t v19 = objc_msgSend(v4, "hf_prettyDescription");
        int v21 = 136315906;
        __int16 v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
        __int16 v23 = 2112;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        v26 = v18;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning YES because schedule is 'nil' aka 'Always Allowed' for RG. home: <Name: %@, Id: %@> user:%@.", (uint8_t *)&v21, 0x2Au);
      }
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v6 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = objc_msgSend(v4, "hf_prettyDescription");
      int v21 = 136315394;
      __int16 v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because user is NOT restricted guest. User = %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_isCurrentUserInRestrictedGuestAllowedPeriod
{
  BOOL v2 = [a1 currentUser];
  uint64_t v3 = objc_msgSend(a1, "hf_isInRestrictedGuestAllowedPeriodForUser:", v2);

  return v3;
}

- (uint64_t)hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:()Additions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4))
  {
    uint64_t v5 = objc_msgSend(a1, "hf_isInRestrictedGuestAllowedPeriodForUser:", v4) ^ 1;
    uint64_t v6 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = NSStringFromBOOL();
      BOOL v8 = [a1 name];
      uint64_t v9 = [a1 uniqueIdentifier];
      uint64_t v10 = objc_msgSend(v4, "hf_prettyDescription");
      int v15 = 136316162;
      unsigned int v16 = "-[HMHome(Additions) hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:]";
      __int16 v17 = 2112;
      __int16 v18 = v7;
      __int16 v19 = 2112;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. home: <Name: %@, Id: %@>. user = %@.", (uint8_t *)&v15, 0x34u);
    }
  }
  else
  {
    uint64_t v6 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [a1 name];
      id v12 = [a1 uniqueIdentifier];
      __int16 v13 = objc_msgSend(v4, "hf_prettyDescription");
      int v15 = 136315906;
      unsigned int v16 = "-[HMHome(Additions) hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:]";
      __int16 v17 = 2112;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v13;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because user is NOT a restricted guest. home: <Name: %@, Id: %@>. User:%@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_shouldHideResidentDeviceReachabilityIssues
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [a1 currentUser];
  uint64_t v5 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4);

  if (v5)
  {
    uint64_t v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = NSStringFromSelector(a2);
      int v9 = 138412546;
      uint64_t v10 = a1;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Current user is a restricted guest, will hide resident reachability issues.", (uint8_t *)&v9, 0x16u);
    }
  }
  return v5;
}

- (id)hf_roomWithName:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_allRooms");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __37__HMHome_Additions__hf_roomWithName___block_invoke;
  v9[3] = &unk_264091F48;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_selectedRoom
{
  BOOL v2 = +[HFStateRestorationSettings sharedInstance];
  uint64_t v3 = [a1 uniqueIdentifier];
  id v4 = [v2 selectedRoomIdentifierForHomeIdentifier:v3];

  uint64_t v5 = objc_msgSend(a1, "hf_roomWithIdentifier:", v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    BOOL v8 = objc_msgSend(a1, "hf_orderedRooms");
    if ([v8 count]) {
      [v8 objectAtIndexedSubscript:0];
    }
    else {
    id v7 = [a1 roomForEntireHome];
    }
  }
  return v7;
}

- (void)hf_setSelectedRoom:()Additions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[HFStateRestorationSettings sharedInstance];
  id v6 = [v5 selectedRoomIdentifierForSelectedHome];

  id v7 = [v4 uniqueIdentifier];
  char v8 = [v7 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    int v9 = +[HFStateRestorationSettings sharedInstance];
    id v10 = [v4 uniqueIdentifier];
    __int16 v11 = [a1 uniqueIdentifier];
    [v9 saveSelectedRoomIdentifier:v10 forHomeIdentifier:v11];

    id v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend(v4, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      __int16 v18 = a1;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "home:%@ didSelectRoom:%@", buf, 0x16u);
    }
    uint64_t v14 = +[HFHomeKitDispatcher sharedDispatcher];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __40__HMHome_Additions__hf_setSelectedRoom___block_invoke;
    v15[3] = &unk_26408D8F0;
    v15[4] = a1;
    id v16 = v4;
    [v14 dispatchHomeObserverMessage:v15 sender:0];
  }
}

- (id)hf_zoneWithIdentifier:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 zones];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __43__HMHome_Additions__hf_zoneWithIdentifier___block_invoke;
  v9[3] = &unk_264091F98;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (BOOL)hf_isNetworkProtectionSupportedForAccessories
{
  return ([a1 networkRouterSupport] & 2) == 0;
}

- (BOOL)hf_isNetworkProtectionSupportedForHome
{
  return ([a1 networkRouterSupport] & 1) == 0;
}

- (id)hf_localizedDescriptionForNetworkProtectionSupport
{
  if (([a1 networkRouterSupportDisableReason] & 2) != 0)
  {
    BOOL v2 = @"HFNetworkProtectionSupportIncompatibleVersion";
  }
  else if ([a1 networkRouterSupportDisableReason])
  {
    BOOL v2 = @"HFNetworkProtectionSupportIncompatibleHomeHub";
  }
  else
  {
    BOOL v2 = @"HFNetworkProtectionSupport";
  }
  uint64_t v3 = _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return v3;
}

- (BOOL)hf_isNetworkProtectionEnabled
{
  BOOL v2 = objc_msgSend(a1, "hf_allNetworkRouterAccessories");
  if ([v2 count]) {
    BOOL v3 = [a1 protectionMode] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)hf_isNetworkCredentialManagementEnabled
{
  uint64_t v1 = objc_msgSend(a1, "hf_allNetworkRouterAccessories");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (BOOL)hf_isNetworkRouterSupported
{
  return ([a1 networkRouterSupport] & 4) == 0;
}

- (id)hf_updateNetworkProtection:()Additions
{
  objc_initWeak(&location, val);
  id v4 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke;
  v7[3] = &unk_264091FC0;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  uint64_t v5 = [v4 futureWithBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_allNonEmptyActionSets
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = objc_msgSend(a1, "actionSets", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v9 = [v8 actions];
        if ([v9 count])
        {
          char v10 = objc_msgSend(v8, "hf_isAnonymous");

          if ((v10 & 1) == 0) {
            [v2 addObject:v8];
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_accessoryWithIdentifier:()Additions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a1, "accessories", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hf_accessoryWithDeviceIdentifier:()Additions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = objc_msgSend(a1, "accessories", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F42558]);
        char v11 = [v9 deviceIdentifier];
        long long v12 = (void *)[v10 initWithMACAddressString:v11];
        long long v13 = [v12 formattedString];
        long long v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v9 deviceIdentifier];
        }
        long long v16 = v15;

        if ([v16 isEqual:v4])
        {
          id v6 = v9;

          goto LABEL_14;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)hf_accessoryWithMatterNodeID:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __50__HMHome_Additions__hf_accessoryWithMatterNodeID___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_accessoryForSymptomsHandler:()Additions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a1, "accessories", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 symptomsHandler];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hf_mediaSystemForSymptomsHandler:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 mediaSystems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke;
  v9[3] = &unk_2640913C0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_mediaProfileContainerForSymptomsHandler:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_mediaSystemForSymptomsHandler:", v4);
  if (!v5)
  {
    id v6 = objc_msgSend(a1, "hf_accessoryForSymptomsHandler:", v4);
    uint64_t v5 = [v6 mediaProfile];
  }
  return v5;
}

- (id)hf_accessoriesMatchingCategoryType:()Additions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a1, "accessories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 category];
        long long v13 = [v12 categoryType];
        int v14 = [v13 isEqualToString:v4];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)hf_allNetworkRouterAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_89);

  return v2;
}

- (id)hf_allTargetControlAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_93_1);

  return v2;
}

- (id)hf_primaryResidentDevice
{
  uint64_t v1 = [a1 residentDevices];
  id v2 = objc_msgSend(v1, "na_firstObjectPassingTest:", &__block_literal_global_95_0);

  return v2;
}

- (id)hf_actionSetWithUUID:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 actionSets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __42__HMHome_Additions__hf_actionSetWithUUID___block_invoke;
  v9[3] = &unk_26408E348;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_100_1);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_102_0);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingCHIP
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_104);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingActivityZones
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_106);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_108);

  return v2;
}

- (id)hf_residentDevicesAddedToHome
{
  uint64_t v2 = objc_msgSend(a1, "hf_appleTVs");
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_111_0);

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = [a1 residentDevices];
  id v6 = [v4 setWithArray:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke_2;
  v10[3] = &unk_264091FE8;
  id v11 = v3;
  id v7 = v3;
  uint64_t v8 = objc_msgSend(v6, "na_filter:", v10);

  return v8;
}

- (uint64_t)hf_blockCurrentUserFromHomeReason
{
  uint64_t v2 = [a1 currentUser];
  BOOL v3 = [a1 homeAccessControlForUser:v2];

  uint64_t v4 = [v3 accessNotAllowedReasonCode];
  return v4;
}

- (BOOL)hf_hasReachableResidents
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 residentDevices];
  uint64_t v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_114_0);
  id v6 = HFLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v10 = 138413058;
    id v11 = a1;
    __int16 v12 = 2112;
    long long v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 count];
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable: %@", (uint8_t *)&v10, 0x2Au);
  }
  BOOL v8 = [v5 count] != 0;

  return v8;
}

- (id)hf_serviceGroupWithIdentifier:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 serviceGroups];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __51__HMHome_Additions__hf_serviceGroupWithIdentifier___block_invoke;
  v9[3] = &unk_264092010;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_mediaSystemForAccessory:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 mediaSystems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke;
  v9[3] = &unk_2640913C0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_mediaSystemWithIdentifier:()Additions
{
  id v4 = a3;
  uint64_t v5 = [a1 mediaSystems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __50__HMHome_Additions__hf_mediaSystemWithIdentifier___block_invoke;
  v9[3] = &unk_2640913C0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_appleTVUsingAudioDestination:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_appleTVs");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __53__HMHome_Additions__hf_appleTVUsingAudioDestination___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_relatedHomeTheaterMediaProfileContainerFor:()Additions
{
  id v4 = a3;
  if (+[HFMediaHelper isHomePod:v4])
  {
    uint64_t v5 = objc_msgSend(v4, "hf_backingAccessory");
    id v6 = [v5 audioDestinationIdentifier];
    id v7 = objc_msgSend(a1, "hf_appleTVUsingAudioDestination:", v6);

    id v8 = [v7 mediaProfile];

LABEL_11:
    goto LABEL_12;
  }
  if (+[HFMediaHelper isHomePodMediaSystem:v4])
  {
    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    __int16 v12 = [v11 audioDestinationIdentifier];
    long long v13 = objc_msgSend(a1, "hf_appleTVUsingAudioDestination:", v12);

    id v8 = [v13 mediaProfile];

    goto LABEL_10;
  }
  if (+[HFMediaHelper isAppleTV:v4])
  {
    __int16 v14 = objc_msgSend(v4, "hf_backingAccessory");
    uint64_t v15 = [v14 audioDestinationController];
    __int16 v16 = [v15 destination];

    long long v17 = objc_msgSend(a1, "hf_allHomePodsOrStereoPairs");
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__HMHome_Additions__hf_relatedHomeTheaterMediaProfileContainerFor___block_invoke;
    v20[3] = &unk_264090270;
    id v21 = v16;
    id v11 = v16;
    uint64_t v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", v20);

    id v8 = v18;
LABEL_10:

    goto LABEL_11;
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)hf_appleTVsSupportingHomeTheater
{
  uint64_t v1 = objc_msgSend(a1, "hf_appleTVs");
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_121_2);

  return v2;
}

- (id)accessoriesSupportingSoftwareUpdate
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessories];
  BOOL v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_123_0);
  id v4 = [v1 setWithArray:v3];

  return v4;
}

- (uint64_t)hf_hasAccessoriesSupportingSoftwareUpdate
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_125);

  return v2;
}

- (uint64_t)hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_127_1);

  return v2;
}

- (uint64_t)hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_129);

  return v2;
}

- (uint64_t)hf_shouldShowSoftwareUpdateSettings
{
  if ((objc_msgSend(a1, "hf_canUpdateToHH2") & 1) != 0
    || (objc_msgSend(a1, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate") & 1) != 0)
  {
    return 1;
  }
  uint64_t result = objc_msgSend(a1, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  if (result)
  {
    return objc_msgSend(a1, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  }
  return result;
}

- (uint64_t)hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  uint64_t result = objc_msgSend(a1, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  if (result)
  {
    return [a1 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
  }
  return result;
}

- (id)hf_accessoriesWithValidSoftwareOrFirmwareUpdates
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessories];
  BOOL v3 = [v1 setWithArray:v2];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_131);

  return v4;
}

- (id)hf_homeKitObjectsSupportingNaturalLighting
{
  uint64_t v1 = objc_msgSend(a1, "hf_allLightProfilesSupportingNaturalLighting");
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_139_2);
  id v4 = [v2 setWithArray:v3];

  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_142_0);

  return v5;
}

- (uint64_t)hf_containsActionableAccessories
{
  uint64_t v2 = objc_msgSend(a1, "hf_allServices");
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_144_1);

  if (v3) {
    return 1;
  }
  return objc_msgSend(a1, "hf_hasMediaAccessories");
}

- (id)hf_serviceWithIdentifier:()Additions
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [a1 accessories];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = objc_msgSend(v8, "services", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              __int16 v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = [v14 uniqueIdentifier];
              char v16 = [v15 isEqual:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)hf_allServices
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) services];
        [v2 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_allAccessoryProfiles
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_154);

  return v2;
}

- (id)hf_accessoryProfilesWithClass:()Additions
{
  uint64_t v4 = objc_msgSend(a1, "hf_allAccessoryProfiles");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_Additions__hf_accessoryProfilesWithClass___block_invoke;
  v7[3] = &__block_descriptor_40_e28_B16__0__HMAccessoryProfile_8lu32l8;
  void v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

- (id)hf_allNetworkConfigurationProfiles
{
  uint64_t v1 = objc_msgSend(a1, "hf_allAccessoryProfiles");
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_158_1);

  return v2;
}

- (id)hf_cameraProfileWithIdentifier:()Additions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a1 accessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) cameraProfiles];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __52__HMHome_Additions__hf_cameraProfileWithIdentifier___block_invoke;
      v13[3] = &unk_264092120;
      id v14 = v4;
      long long v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", v13);

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v11 = 0;
  }

  return v11;
}

- (id)hf_cameraProfileForSignificantEvent:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_allCameraProfiles");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __57__HMHome_Additions__hf_cameraProfileForSignificantEvent___block_invoke;
  v9[3] = &unk_264092120;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_allCameraProfilesWithDoorbellService
{
  uint64_t v1 = objc_msgSend(a1, "hf_allCameraProfiles");
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_171);

  return v2;
}

- (id)hf_allCameraProfilesWithSmartMotionRecordingEnabled
{
  id v2 = +[HFCameraSignificantEventConfiguration defaultSmartMotionConfiguration];
  uint64_t v3 = [v2 eventTypes];

  id v4 = objc_msgSend(a1, "hf_allCameraProfilesSupportingRecording");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMHome_Additions__hf_allCameraProfilesWithSmartMotionRecordingEnabled__block_invoke;
  v7[3] = &__block_descriptor_40_e25_B16__0__HMCameraProfile_8l;
  void v7[4] = v3;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

- (id)hf_unitaryCameraProfile
{
  uint64_t v1 = objc_msgSend(a1, "hf_allCameraProfiles");
  if ([v1 count] == 1)
  {
    id v2 = [v1 firstObject];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)hf_allMediaProfileContainers
{
  id v2 = [a1 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_181_0);
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_184);

  uint64_t v5 = [a1 mediaSystems];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups
{
  uint64_t v1 = objc_msgSend(a1, "hf_allMediaProfileContainers");
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_186_0);
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)hf_allUniqueMediaProfileContainers
{
  id v2 = [a1 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_188);

  id v4 = [a1 mediaSystems];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_190_0);
  uint64_t v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (id)hf_allHomePodsOrStereoPairs
{
  id v2 = [a1 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_192);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke_2;
  v8[3] = &unk_264090270;
  void v8[4] = a1;
  id v4 = objc_msgSend(v3, "na_filter:", v8);
  uint64_t v5 = [a1 mediaSystems];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)hf_allHomePodProfileContainers
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_195);

  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_197);

  return v3;
}

- (id)hf_allHomePodsOrStereoPairsThatWillChime
{
  uint64_t v1 = objc_msgSend(a1, "hf_allHomePodsOrStereoPairs");
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_199_0);

  return v2;
}

- (uint64_t)hf_isFaceRecognitionAvailable
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [a1 residentDevices];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    uint64_t v9 = HFLogForCategory(0x13uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v11 = 138412290;
    long long v12 = a1;
    id v10 = "Home %@ does not have any resident device, which is required for Face Recognition feature";
LABEL_11:
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_12;
  }
  id v4 = [a1 residentDevices];
  char v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_201);

  if ((v5 & 1) == 0)
  {
    uint64_t v9 = HFLogForCategory(0x13uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v11 = 138412290;
    long long v12 = a1;
    id v10 = "No resident devices in home %@ support face classification";
    goto LABEL_11;
  }
  id v6 = objc_msgSend(a1, "hf_allCameraProfilesSupportingRecording");
  uint64_t v7 = [v6 count];

  if (v7) {
    return 1;
  }
  uint64_t v9 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    long long v12 = a1;
    id v10 = "No cameras in home %@ support recording";
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (id)hf_setFaceRecognitionEnabled:()Additions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v5 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = a1;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting face recognition enabled(%d)", buf, 0x12u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke;
  v15[3] = &unk_26408F050;
  char v16 = a3;
  v15[4] = a1;
  id v6 = [MEMORY[0x263F58190] futureWithBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2_206;
  v13[3] = &unk_26408F050;
  void v13[4] = a1;
  char v14 = a3;
  uint64_t v7 = [MEMORY[0x263F58190] futureWithBlock:v13];
  uint64_t v8 = (void *)MEMORY[0x263F58190];
  v17[0] = v6;
  v17[1] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  id v10 = [MEMORY[0x263F581B8] mainThreadScheduler];
  int v11 = [v8 combineAllFutures:v9 ignoringErrors:1 scheduler:v10];

  return v11;
}

- (id)hf_allPersonManagers
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [a1 personManager];
  objc_msgSend(v2, "na_safeAddObject:", v3);

  id v4 = objc_msgSend(a1, "hf_allPhotosPersonManagers");
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v4);

  return v2;
}

- (id)hf_allPhotosPersonManagers
{
  uint64_t v1 = objc_msgSend(a1, "hf_allUsersIncludingCurrentUser");
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_216_0);

  return v2;
}

- (id)hf_personManagerWithIdentifier:()Additions
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "hf_allPersonManagers");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __52__HMHome_Additions__hf_personManagerWithIdentifier___block_invoke;
  v9[3] = &unk_264092220;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_allPersons
{
  uint64_t v1 = objc_msgSend(a1, "hf_allPersonManagers");
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_220_0);

  uint64_t v3 = (void *)MEMORY[0x263F58190];
  id v4 = [MEMORY[0x263F581B8] mainThreadScheduler];
  char v5 = [v3 combineAllFutures:v2 ignoringErrors:1 scheduler:v4];
  id v6 = [v5 flatMap:&__block_literal_global_224_0];

  return v6;
}

- (id)hf_personWithIdentifier:()Additions
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "hf_allPersonManagers");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__HMHome_Additions__hf_personWithIdentifier___block_invoke;
  v13[3] = &unk_264092268;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_map:", v13);

  uint64_t v8 = (void *)MEMORY[0x263F58190];
  uint64_t v9 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v10 = [v8 combineAllFutures:v7 ignoringErrors:1 scheduler:v9];
  int v11 = [v10 flatMap:&__block_literal_global_229];

  return v11;
}

- (uint64_t)hf_setImportPhotosLibraryEnabled:()Additions forUser:
{
  return objc_msgSend(a1, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", a4, a3, 0);
}

- (id)hf_setSharePhotosLibraryEnabled:()Additions forUser:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (objc_msgSend(v6, "hf_isImportingPhotosLibraryEnabledForFaceRecognition"))
  {
    uint64_t v7 = a1;
    id v8 = v6;
    uint64_t v9 = 1;
    uint64_t v10 = a3;
  }
  else
  {
    int v11 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      long long v15 = a1;
      __int16 v16 = 2080;
      long long v17 = "-[HMHome(Additions) hf_setSharePhotosLibraryEnabled:forUser:]";
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s: importing photos library is disabled, so disabling sharing of photos library.", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v7 = a1;
    id v8 = v6;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  long long v12 = objc_msgSend(v7, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", v8, v9, v10);

  return v12;
}

- (id)hf_setPhotosLibrarySettingsForUser:()Additions importPhotosLibraryEnabled:shareFacesEnabled:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    long long v26 = a1;
    __int16 v27 = 2080;
    long long v28 = "-[HMHome(Additions) hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:]";
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 1024;
    int v32 = a4;
    __int16 v33 = 1024;
    int v34 = a5;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@ (%s): Setting Use Photos Library for user %@ enabled=%d and sharing=%d", buf, 0x2Cu);
  }

  uint64_t v10 = objc_msgSend(a1, "hf_allUsersIncludingCurrentUser");
  char v11 = [v10 containsObject:v8];

  if ((v11 & 1) == 0)
  {
    long long v12 = (void *)MEMORY[0x263F087E8];
    id v18 = v8;
    uint64_t v19 = a1;
    uint64_t v13 = @"%@ is not a user of home %@";
    goto LABEL_8;
  }
  if (a5 && (a4 & 1) == 0)
  {
    long long v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = @"Sharing photos library is only possible when using photos library for face recognition is enabled.";
LABEL_8:
    int v14 = objc_msgSend(v12, "hf_errorWithCode:descriptionFormat:", 33, v13, v18, v19);
    long long v15 = [MEMORY[0x263F58190] futureWithError:v14];
    goto LABEL_10;
  }
  __int16 v16 = (void *)MEMORY[0x263F58190];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke;
  v20[3] = &unk_2640922D8;
  char v23 = a4;
  char v24 = a5;
  id v21 = v8;
  uint64_t v22 = a1;
  long long v15 = [v16 futureWithBlock:v20];
  int v14 = v21;
LABEL_10:

  return v15;
}

- (id)hf_resetAllNetworkConfigurationProfiles
{
  uint64_t v1 = (void *)MEMORY[0x263F0E000];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [a1 accessoryProtectionGroups];
  id v4 = [v2 setWithArray:v3];
  char v5 = objc_msgSend(v1, "hf_updateProtectionMode:forGroups:", 0, v4);

  return v5;
}

- (id)hf_accessoriesRequiringManualWiFiReconfiguration
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_244);

  return v2;
}

- (id)hf_updateAutomaticSoftwareUpdateEnabled:()Additions
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __61__HMHome_Additions__hf_updateAutomaticSoftwareUpdateEnabled___block_invoke;
  v5[3] = &unk_264092320;
  void v5[4] = a1;
  char v6 = a3;
  uint64_t v3 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v5];
  return v3;
}

- (id)hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:()Additions
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __80__HMHome_Additions__hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled___block_invoke;
  v5[3] = &unk_264092320;
  void v5[4] = a1;
  char v6 = a3;
  uint64_t v3 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v5];
  return v3;
}

- (id)hf_appleTVs
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_252);

  return v2;
}

- (id)hf_allResidentAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_258);

  return v2;
}

- (id)hf_personalRequestAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_260_0);

  return v2;
}

- (id)hf_tvViewingProfilesAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_263);

  return v2;
}

- (uint64_t)hf_canShowTvViewingInfoForUser:()Additions
{
  return objc_msgSend(a1, "hf_userIsRestrictedGuest:") ^ 1;
}

- (id)hf_siriEndPointAccessories
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_266);

  return v2;
}

- (id)hf_allSiriEndPointProfileContainers
{
  uint64_t v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_268_0);

  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_270);

  return v3;
}

- (id)hf_allSiriEndPointProfileContainersThatWillChime
{
  uint64_t v1 = objc_msgSend(a1, "hf_allSiriEndPointProfileContainers");
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_272);

  return v2;
}

- (id)hf_accessoryCategoriesReorderableItemComparator
{
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__HMHome_Additions__hf_accessoryCategoriesReorderableItemComparator__block_invoke;
  v3[3] = &unk_264092348;
  objc_copyWeak(&v4, &location);
  uint64_t v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_dashboardSectionReorderableItemComparator
{
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__HMHome_Additions__hf_dashboardSectionReorderableItemComparator__block_invoke;
  v3[3] = &unk_264092348;
  objc_copyWeak(&v4, &location);
  uint64_t v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_notesApplicationData
{
  uint64_t v1 = [a1 applicationData];
  id v2 = [v1 objectForKey:@"UserDetails"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"Notes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  uint64_t v3 = 0;
LABEL_5:

  return v3;
}

- (id)hf_setNotesApplicationData:()Additions
{
  id v4 = a3;
  char v5 = [a1 applicationData];
  char v6 = [v5 objectForKey:@"UserDetails"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v8 = v7;
  [v7 setObject:v4 forKeyedSubscript:@"Notes"];

  [v5 setObject:v8 forKey:@"UserDetails"];
  uint64_t v9 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__HMHome_Additions__hf_setNotesApplicationData___block_invoke;
  v13[3] = &unk_26408E218;
  void v13[4] = a1;
  id v14 = v5;
  id v10 = v5;
  char v11 = [v9 futureWithErrorOnlyHandlerAdapterBlock:v13];

  return v11;
}

- (uint64_t)hf_homeHasMigratedIntoHomeApp
{
  uint64_t v1 = [a1 applicationData];
  id v2 = [v1 objectForKey:@"hasOnboarded"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)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:()Additions
{
  id v2 = objc_msgSend(NSNumber, "numberWithBool:");
  uint64_t v3 = [a1 applicationData];
  [v3 setObject:v2 forKeyedSubscript:@"hasOnboarded"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMHome_Additions__hf_setHomeHasOnboardedApplicationData___block_invoke;
  v6[3] = &unk_26408CD50;
  v6[4] = a1;
  id v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v6];
  return v4;
}

- (id)hf_setHomeHasMigratedServicesToAccessories:()Additions
{
  id v2 = objc_msgSend(NSNumber, "numberWithBool:");
  uint64_t v3 = [a1 applicationData];
  [v3 setObject:v2 forKeyedSubscript:@"hasMigratedAccessories"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HMHome_Additions__hf_setHomeHasMigratedServicesToAccessories___block_invoke;
  v6[3] = &unk_26408CD50;
  v6[4] = a1;
  id v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v6];
  return v4;
}

- (id)hf_setHomeHasMigratedForRedesign:()Additions
{
  id v2 = objc_msgSend(NSNumber, "numberWithBool:");
  uint64_t v3 = [a1 applicationData];
  [v3 setObject:v2 forKeyedSubscript:@"hasMigratedForRedesign"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HMHome_Additions__hf_setHomeHasMigratedForRedesign___block_invoke;
  v6[3] = &unk_26408CD50;
  v6[4] = a1;
  id v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v6];
  return v4;
}

- (uint64_t)hf_hasAcceptedTermsAndConditionsForHomePodVersion:()Additions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[HFUtilities isInternalInstall])
  {
    objc_initWeak((id *)location, a1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke;
    block[3] = &unk_26408E550;
    objc_copyWeak(&v11, (id *)location);
    if (hf_hasAcceptedTermsAndConditionsForHomePodVersion__onceToken != -1) {
      dispatch_once(&hf_hasAcceptedTermsAndConditionsForHomePodVersion__onceToken, block);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  char v5 = [a1 applicationData];
  char v6 = [v5 objectForKeyedSubscript:@"HFApplicationHomePodTermsAndConditionsAcceptedKey"];

  uint64_t v7 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id location = 138412546;
    *(void *)&location[4] = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Comparing previously accepted license agremenet versions to current version: %@ %@", location, 0x16u);
  }

  uint64_t v8 = [v6 containsObject:v4];
  return v8;
}

- (id)hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion:()Additions
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HMHome+HFAdditions.m", 2030, @"Invalid parameter not satisfying: %@", @"licenseAgreementVersion" object file lineNumber description];
  }
  char v6 = [a1 applicationData];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"HFApplicationHomePodTermsAndConditionsAcceptedKey"];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  if ([v10 containsObject:v5])
  {
    id v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v12 = [v10 arrayByAddingObject:v5];

    __int16 v13 = [a1 applicationData];
    [v13 setObject:v12 forKey:@"HFApplicationHomePodTermsAndConditionsAcceptedKey"];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __94__HMHome_Additions__hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion___block_invoke;
    v16[3] = &unk_26408CD50;
    v16[4] = a1;
    id v11 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v16];
    id v10 = (id)v12;
  }

  return v11;
}

- (uint64_t)hf_supportsPerUserRemoteAccess
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_315);

  return v2;
}

- (uint64_t)hf_supportsRemoteAccessRestrictions
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_317);

  return v2;
}

- (uint64_t)hf_enabledResidentsSupportsMediaActions
{
  uint64_t v1 = objc_msgSend(a1, "hf_enabledResidentDevices");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_319);

  return v2;
}

- (uint64_t)hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_323);

  return v2;
}

- (id)hf_allNonAdminUsers
{
  uint64_t v2 = [a1 users];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __40__HMHome_Additions__hf_allNonAdminUsers__block_invoke;
  v5[3] = &unk_26408F748;
  void v5[4] = a1;
  uint64_t v3 = objc_msgSend(v2, "na_filter:", v5);

  return v3;
}

- (id)hf_allNonOwnerUsers
{
  uint64_t v2 = [a1 users];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __40__HMHome_Additions__hf_allNonOwnerUsers__block_invoke;
  v5[3] = &unk_26408F748;
  void v5[4] = a1;
  uint64_t v3 = objc_msgSend(v2, "na_filter:", v5);

  return v3;
}

- (uint64_t)hf_hasAtLeastOneRestrictedGuest
{
  uint64_t v2 = [a1 users];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __52__HMHome_Additions__hf_hasAtLeastOneRestrictedGuest__block_invoke;
  v5[3] = &unk_26408F748;
  void v5[4] = a1;
  uint64_t v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

- (BOOL)hf_isPresenceAuthorizedForUser:()Additions
{
  id v4 = a3;
  id v5 = [a1 currentUser];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) != 0 || (uint64_t v7 = HFPreferencesBooleanValueForKey(@"HFForceUserPresenceAuthorized"), v7 == 2))
  {
    BOOL v8 = 1;
  }
  else if (v7 == 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [a1 homeAccessControlForUser:v4];
    BOOL v8 = [v9 presenceAuthorizationStatus] == 1;
  }
  return v8;
}

- (uint64_t)hf_isMediaAccessoryProfileValid:()Additions
{
  id v4 = a3;
  id v5 = objc_opt_new();
  char v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [a1 mediaSystems];
  BOOL v8 = [v6 setWithArray:v7];
  [v5 unionSet:v8];

  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = objc_msgSend(a1, "hf_allMediaProfileContainers");
  id v11 = [v9 setWithArray:v10];
  [v5 unionSet:v11];

  uint64_t v12 = [v5 containsObject:v4];
  return v12;
}

- (uint64_t)hf_supportsSharedEventAutomation
{
  uint64_t v2 = HFPreferencesBooleanValueForKey(@"HFForcedResidentSupportsSharedEventTriggerActivationState");
  if (v2 == 2) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  id v4 = [a1 residentDevices];
  uint64_t v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_326);

  return v5;
}

- (uint64_t)hf_hasMediaAccessories
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_328);

  return v2;
}

- (uint64_t)hf_numberOfHomePods
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = [a1 accessories];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __40__HMHome_Additions__hf_numberOfHomePods__block_invoke;
  v4[3] = &unk_2640923C0;
  v4[4] = &v5;
  objc_msgSend(v1, "na_each:", v4);

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (uint64_t)hf_allHomePodsSupportRemoteProfileInstallation
{
  uint64_t v1 = objc_msgSend(a1, "hf_homePods");
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_333);

  return v2;
}

- (uint64_t)hf_hasCameraRecordingResident
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_339);

  return v2;
}

- (uint64_t)hf_supportsReachabilityNotifications
{
  uint64_t v1 = [a1 residentDevices];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_341);

  return v2;
}

- (void)hf_startReprovisioningAccessory:()Additions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Requesting reprovisioning for accessory: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMHome_Additions__hf_startReprovisioningAccessory___block_invoke;
  v7[3] = &unk_26408CDF0;
  id v8 = v4;
  id v6 = v4;
  [a1 reprovisionAccessory:v6 completionHandler:v7];
}

- (uint64_t)hf_shouldShowAnnounceFeatureForThisHome
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "hf_atleastOneHomePodSupportsAnnounce");
  uint64_t v3 = HFLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v2;
    __int16 v6 = 2112;
    uint64_t v7 = a1;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "atleastOneHomePodSupportsAnnounce = [%d], for home = %@", (uint8_t *)v5, 0x12u);
  }

  return v2;
}

- (uint64_t)hf_atleastOneHomePodSupportsAnnounce
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_343);

  return v2;
}

- (uint64_t)hf_hasAtLeastOneReachableHomeMediaAccessory
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_347);

  return v2;
}

- (uint64_t)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
{
  uint64_t v1 = objc_msgSend(a1, "hf_homePods");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_349);

  return v2;
}

- (uint64_t)hf_canEnableAudioAnalysisAfterHH2Upgrade
{
  uint64_t v1 = objc_msgSend(a1, "hf_homePods");
  int v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_353_0);

  uint64_t v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  uint64_t v5 = [v4 homeSafetySecurityEnabled] & v2;

  return v5;
}

- (uint64_t)hf_shouldShowActivityLogSetting
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v3 = [v2 activityLogCoordinatorForHome:a1];

  id v4 = [a1 residentDevices];
  int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_355);

  if (v5 && objc_msgSend(a1, "hf_hasEnabledResident")) {
    char v6 = objc_msgSend(a1, "hf_hasCompatibleActivityLogAccessories");
  }
  else {
    char v6 = 0;
  }
  int v7 = [v3 eventsExist];
  uint64_t v8 = HFLogForCategory(3uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138413826;
    uint64_t v12 = a1;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = objc_msgSend(a1, "hf_hasEnabledResident");
    __int16 v17 = 1024;
    int v18 = objc_msgSend(a1, "hf_hasCompatibleActivityLogAccessories");
    __int16 v19 = 1024;
    int v20 = v7;
    __int16 v21 = 1024;
    int v22 = [a1 isEventLogEnabled];
    __int16 v23 = 1024;
    int v24 = objc_msgSend(a1, "hf_hasActivityLogPrerequisites");
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Home:%@ hasActivityCapableHub:%{BOOL}d hasEnabledResident:%{BOOL}d hasCompatibleActivityLogAccessories:%{BOOL}d hasEvents:%{BOOL}d isEventLogEnabled:%{BOOL}d hasActivityLogPrerequisites:%{BOOL}d", (uint8_t *)&v11, 0x30u);
  }

  if ((v6 & 1) != 0 || ([a1 isEventLogEnabled] & v7) == 1) {
    uint64_t v9 = objc_msgSend(a1, "hf_hasActivityLogPrerequisites");
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_hasAtleastOneOasisEnabledHomePod
{
  uint64_t v1 = objc_msgSend(a1, "hf_homePods");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_357_0);

  return v2;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportingJustSiri
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_360);

  return v2;
}

- (uint64_t)hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_362);
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_364);

  return v3;
}

- (uint64_t)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
{
  return [a1 setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:&__block_literal_global_367];
}

- (uint64_t)hf_hasEnabledAndReachableResident
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFForceRemoteAccessStateAvailable();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(a1, "residentDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if objc_msgSend(v8, "hf_isEnabled") && (objc_msgSend(v8, "hf_isReachable"))
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (uint64_t)hf_hasAutomatableProfiles
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = objc_msgSend(a1, "hf_allAccessoryProfiles");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_372);

  uint64_t v3 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Checking if home has automatable profiles hasAutomatableProfiles:%d", (uint8_t *)v5, 8u);
  }

  return v2;
}

+ (__CFString)_hf_appDataKeyForColorPaletteOfType:()Additions
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_264092748[a3];
  }
}

- (HFColorPalette)hf_colorPaletteOfType:()Additions
{
  uint64_t v5 = [a1 applicationData];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"colorPickerFavorites"];

  if (!v6)
  {
LABEL_5:
    uint64_t v9 = objc_msgSend((id)objc_opt_class(), "_hf_appDataKeyForColorPaletteOfType:", a3);
    long long v13 = [a1 applicationData];
    long long v11 = [v13 objectForKeyedSubscript:v9];

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v12 = [[HFColorPalette alloc] initWithSerializedRepresentation:v11 type:a3];
    }
    else
    {
      long long v12 = +[HFColorPalette defaultColorPaletteOfType:a3];
    }
    goto LABEL_9;
  }
  int v7 = [a1 currentUser];
  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v8 UUIDString];

  uint64_t v10 = [v6 objectForKeyedSubscript:v9];
  if (!v10)
  {

    goto LABEL_5;
  }
  long long v11 = (void *)v10;
  long long v12 = [[HFColorPalette alloc] initWithDawnColorPickerFavorites:v10 type:a3];
LABEL_9:
  int v14 = v12;

  return v14;
}

- (id)hf_updateColorPalette:()Additions type:
{
  id v6 = a3;
  int v7 = objc_msgSend((id)objc_opt_class(), "_hf_appDataKeyForColorPaletteOfType:", a4);
  uint64_t v8 = [v6 serializedRepresentation];

  uint64_t v9 = [a1 applicationData];
  [v9 setObject:v8 forKeyedSubscript:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HMHome_Additions__hf_updateColorPalette_type___block_invoke;
  v12[3] = &unk_26408CD50;
  v12[4] = a1;
  uint64_t v10 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v12];

  return v10;
}

- (id)hf_accessControlDescriptor
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 mediaPassword];
  uint64_t v3 = [a1 minimumMediaUserPrivilege];
  int v4 = [a1 isMediaPeerToPeerEnabled];
  if ((unint64_t)(v3 - 1) >= 3)
  {
    if (!v3)
    {
      uint64_t v5 = v4 ^ 1u;
      goto LABEL_8;
    }
    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Unknown HMUserPrivilege %lu", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v5 = 2;
LABEL_8:
  int v7 = +[HFMediaAccessControlDescriptor descriptorWithAccess:v5 requiresPassword:v2 != 0 password:v2];

  return v7;
}

- (id)hf_updateAccessControlDescriptor:()Additions
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_msgSend(a1, "hf_accessControlDescriptor");
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v7 = [(__CFString *)v6 isEqual:v5];
  uint64_t v8 = HFLogForCategory(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "MediaAccessControl is same; returning.", buf, 2u);
    }

    uint64_t v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v48 = v6;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v5;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Transitioning from %@ -> %@", buf, 0x16u);
    }

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = 1;
    switch([v5 access])
    {
      case 0:
        uint64_t v12 = 0;
        goto LABEL_9;
      case 1:
        uint64_t v12 = 0;
        goto LABEL_13;
      case 2:
LABEL_9:
        if ([a1 isMediaPeerToPeerEnabled]) {
          goto LABEL_17;
        }
        int v13 = 1;
        goto LABEL_15;
      case 3:
        int v14 = [MEMORY[0x263F08690] currentHandler];
        [v14 handleFailureInMethod:a2 object:a1 file:@"HMHome+HFAdditions.m" lineNumber:2672 description:@"Error: Cannot do a access control descirptor for 'count'; that doesn't even make any sense!"];

        uint64_t v12 = 1;
        goto LABEL_13;
      default:
LABEL_13:
        if (([a1 isMediaPeerToPeerEnabled] & 1) == 0) {
          goto LABEL_17;
        }
        int v13 = 0;
LABEL_15:
        uint64_t v15 = HFLogForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v30 = [a1 isMediaPeerToPeerEnabled];
          __int16 v31 = @"NO";
          if (v30) {
            int v32 = @"YES";
          }
          else {
            int v32 = @"NO";
          }
          if (v13) {
            __int16 v31 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          v48 = v32;
          __int16 v49 = 2112;
          uint64_t v50 = (uint64_t)v31;
          _os_log_debug_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEBUG, "--> Updating mediaPeerToPeerEnabled from '%@' to '%@'", buf, 0x16u);
        }

        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke;
        v45[3] = &unk_264092320;
        v45[4] = a1;
        char v46 = v13;
        int v16 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v45];
        [v11 addObject:v16];

LABEL_17:
        if (v12 != [a1 minimumMediaUserPrivilege])
        {
          __int16 v17 = HFLogForCategory(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            [a1 minimumMediaUserPrivilege];
            HMUserPrivilegeToString();
            __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v34 = HMUserPrivilegeToString();
            *(_DWORD *)buf = 138412546;
            v48 = v33;
            __int16 v49 = 2112;
            uint64_t v50 = v34;
            uint64_t v35 = (void *)v34;
            _os_log_debug_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEBUG, "--> Updating minimumMediaUserPrivilege from %@ to %@", buf, 0x16u);
          }
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_378;
          v44[3] = &unk_26408E7A0;
          v44[4] = a1;
          v44[5] = v12;
          int v18 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v44];
          [v11 addObject:v18];
        }
        __int16 v19 = [v5 accessPassword];
        int v20 = [v5 accessPassword];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2;
        v41[3] = &unk_264091450;
        id v21 = v5;
        id v42 = v21;
        int v22 = v6;
        v43 = v22;
        if (v19) {
          uint64_t v23 = -1;
        }
        else {
          uint64_t v23 = v20 != 0;
        }
        if (v19 && v20) {
          uint64_t v23 = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2((uint64_t)v41);
        }

        int v24 = [v21 accessRequiresPassword];
        if (v24 != [(__CFString *)v22 accessRequiresPassword] || v23)
        {
          uint64_t v25 = HFLogForCategory(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEBUG, "--> Updating access password.", buf, 2u);
          }

          long long v26 = (void *)MEMORY[0x263F58190];
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_380;
          v38[3] = &unk_26408E218;
          id v39 = v21;
          v40 = a1;
          __int16 v27 = [v26 futureWithErrorOnlyHandlerAdapterBlock:v38];
          [v11 addObject:v27];
        }
        long long v28 = [MEMORY[0x263F58190] combineAllFutures:v11];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2_384;
        v36[3] = &unk_26408CE18;
        v36[4] = a1;
        v37 = v22;
        uint64_t v10 = [v28 recover:v36];

        break;
    }
  }

  return v10;
}

- (id)hf_restrictedGuestAllowedAccessories
{
  uint64_t v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_388);

  return v2;
}

- (id)hf_hasWalletKey
{
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = (void *)MEMORY[0x263F58190];
    id v5 = NSNumber;
    id v6 = [v2 walletKey];
    int v7 = [v5 numberWithInt:v6 != 0];
    [v4 futureWithResult:v7];
  }
  else
  {
    id v6 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    int v7 = [v6 flatMap:&__block_literal_global_400];
    [v7 recover:&__block_literal_global_402];
  uint64_t v8 = };

  return v8;
}

- (id)hf_walletKeyInWalletAppURL
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = [v2 walletKey];
    id v5 = [v4 customURL];

    id v6 = HFLogForCategory(0x43uLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = [v3 walletKey];
        BOOL v9 = [v8 customURL];
        *(_DWORD *)buf = 138413058;
        int v24 = a1;
        __int16 v25 = 2080;
        long long v26 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]";
        __int16 v27 = 2112;
        long long v28 = v9;
        __int16 v29 = 2112;
        int v30 = v3;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning url %@ for cached wallet key device state %@", buf, 0x2Au);
      }
      uint64_t v10 = (void *)MEMORY[0x263F58190];
      uint64_t v11 = [v3 walletKey];
      uint64_t v12 = [v11 customURL];
      int v13 = [v10 futureWithResult:v12];
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412802;
        int v24 = a1;
        __int16 v25 = 2080;
        long long v26 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]";
        __int16 v27 = 2112;
        long long v28 = v3;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning default wallet app url because customURL is nil for cached %@", buf, 0x20u);
      }

      int v16 = (void *)MEMORY[0x263F58190];
      __int16 v17 = +[HFWalletUtilities walletAppURL];
      int v13 = [v16 futureWithResult:v17];
    }
  }
  else
  {
    objc_initWeak((id *)buf, a1);
    int v14 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke;
    v21[3] = &unk_2640924C0;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v15 = [v14 flatMap:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke_406;
    v19[3] = &unk_26408F4B8;
    objc_copyWeak(&v20, (id *)buf);
    int v13 = [v15 recover:v19];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

  return v13;
}

- (id)hf_enableExpressModeForWalletKeyWithAuthData:()Additions
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  id v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke;
  v9[3] = &unk_264092510;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  BOOL v7 = [v5 futureWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)hf_enableUWBForWalletKeyWithAuthData:()Additions enableNFCExpress:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_initWeak((id *)location, a1);
    BOOL v7 = (void *)MEMORY[0x263F58190];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke;
    v11[3] = &unk_264092538;
    objc_copyWeak(&v13, (id *)location);
    id v12 = v6;
    char v14 = a4;
    uint64_t v8 = [v7 futureWithBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    BOOL v9 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = a1;
      __int16 v16 = 2080;
      __int16 v17 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]";
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning early because uwb feature flag.", location, 0x16u);
    }

    uint64_t v8 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v8;
}

- (BOOL)hf_containsWalletKeyUWBAccessory
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = objc_msgSend(a1, "hf_accessoriesSupportingUWBUnlock");
    BOOL v3 = [v2 count] != 0;
  }
  else
  {
    id v4 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[HMHome(Additions) hf_containsWalletKeyUWBAccessory]";
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Returning false because feature flag is NOT enabled.", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
  return v3;
}

- (id)hf_addWalletKeyWithOptions:()Additions
{
  objc_initWeak(&location, val);
  id v4 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke;
  v7[3] = &unk_264091FC0;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  id v5 = [v4 futureWithBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_addWalletKeyToPairedWatchesWithOptions:()Additions
{
  objc_initWeak(&location, val);
  id v4 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke;
  v7[3] = &unk_264091FC0;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  id v5 = [v4 futureWithBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_setHasOnboardedForWalletKey
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "hf_currentUserIsAdministrator"))
  {
    objc_initWeak((id *)location, a1);
    uint64_t v2 = (void *)MEMORY[0x263F58190];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke;
    v12[3] = &unk_26408F0F0;
    objc_copyWeak(&v13, (id *)location);
    BOOL v3 = [v2 futureWithBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v4 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a1 currentUser];
      int v6 = objc_msgSend(v5, "hf_prettyDescription");
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[HMHome(Additions) hf_setHasOnboardedForWalletKey]";
      __int16 v15 = 2112;
      __int16 v16 = v6;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Unable to update home level onboarding flag for wallet key because current user is NOT an admin. user = %@", location, 0x16u);
    }
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = _HFLocalizedStringWithDefaultValue(@"HFError_HMErrorCodeAccessDenied_description", @"HFError_HMErrorCodeAccessDenied_description", 1);
    BOOL v9 = _HFLocalizedStringWithDefaultValue(@"HFError_HMErrorCodeAccessDenied_description", @"HFError_HMErrorCodeAccessDenied_description", 1);
    id v10 = objc_msgSend(v7, "hf_errorWithCode:title:description:", 61, v8, v9);

    BOOL v3 = [MEMORY[0x263F58190] futureWithError:v10];
  }
  return v3;
}

- (id)hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice
{
  uint64_t v2 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke;
  v6[3] = &unk_2640925B0;
  v6[4] = a1;
  BOOL v3 = [v2 flatMap:v6];
  id v4 = [v3 recover:&__block_literal_global_445_0];

  return v4;
}

- (id)hf_fetchWalletKeyDeviceStateForPairedWatches
{
  objc_initWeak(&location, val);
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke;
  v4[3] = &unk_26408F0F0;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = [v1 futureWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_hf_fetchWalletKeyColorFromAccessories
{
  objc_initWeak(&location, val);
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke;
  v4[3] = &unk_26408F0F0;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = [v1 futureWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_hf_existingWalletKeyColorForCurrentDevice
{
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x263F58190];
    id v4 = +[HFWalletUtilities walletKeyColorOfDeviceState:v2];
    id v5 = [v3 futureWithResult:v4];
  }
  else
  {
    id v4 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    int v6 = [v4 flatMap:&__block_literal_global_449];
    id v5 = [v6 recover:&__block_literal_global_451];
  }
  return v5;
}

- (id)hf_walletKeyColorToDisplay
{
  uint64_t v2 = objc_msgSend(a1, "_hf_existingWalletKeyColorForCurrentDevice");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __47__HMHome_Additions__hf_walletKeyColorToDisplay__block_invoke;
  v5[3] = &unk_26408CDC8;
  void v5[4] = a1;
  BOOL v3 = [v2 flatMap:v5];

  return v3;
}

- (BOOL)hf_canAddAccessCode
{
  if (![a1 hasOnboardedForAccessCode]) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(a1, "hf_accessoriesSupportingAccessCodes");
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)hf_setHasOnboardedForAccessCode
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "hf_currentUserIsAdministrator"))
  {
    objc_initWeak((id *)location, a1);
    uint64_t v2 = (void *)MEMORY[0x263F58190];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke;
    v12[3] = &unk_26408F0F0;
    objc_copyWeak(&v13, (id *)location);
    BOOL v3 = [v2 futureWithBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v4 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a1 currentUser];
      int v6 = objc_msgSend(v5, "hf_prettyDescription");
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[HMHome(Additions) hf_setHasOnboardedForAccessCode]";
      __int16 v15 = 2112;
      __int16 v16 = v6;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Unable to update home level onboarding flag for access code because current user is NOT an admin. user = %@", location, 0x16u);
    }
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = _HFLocalizedStringWithDefaultValue(@"HFError_HMErrorCodeAccessDenied_description", @"HFError_HMErrorCodeAccessDenied_description", 1);
    BOOL v9 = _HFLocalizedStringWithDefaultValue(@"HFError_HMErrorCodeAccessDenied_description", @"HFError_HMErrorCodeAccessDenied_description", 1);
    id v10 = objc_msgSend(v7, "hf_errorWithCode:title:description:", 61, v8, v9);

    BOOL v3 = [MEMORY[0x263F58190] futureWithError:v10];
  }
  return v3;
}

- (id)hf_hasWalletKeyCompatibleDevice
{
  objc_initWeak(&location, val);
  uint64_t v2 = objc_msgSend(val, "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");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke;
  v5[3] = &unk_264092628;
  objc_copyWeak(&v6, &location);
  BOOL v3 = [v2 flatMap:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

- (id)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
{
  uint64_t v2 = objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  if (v2)
  {
    BOOL v3 = +[HFWalletUtilities isWalletKeyDeviceStateCompatible:v2];
    id v4 = (void *)MEMORY[0x263F58190];
    id v5 = [NSNumber numberWithBool:v3];
    id v6 = [v4 futureWithResult:v5];
  }
  else
  {
    objc_initWeak(&location, a1);
    BOOL v7 = objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    uint64_t v8 = [v7 flatMap:&__block_literal_global_459];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    _DWORD v10[2] = __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke_2;
    v10[3] = &unk_26408F4B8;
    objc_copyWeak(&v11, &location);
    id v6 = [v8 recover:v10];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)hf_walletKeyDeviceStatesOfCompatiblePairedWatches
{
  objc_initWeak(&location, val);
  uint64_t v2 = objc_msgSend(val, "hf_fetchWalletKeyDeviceStateForPairedWatches");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke;
  v8[3] = &unk_264092650;
  objc_copyWeak(&v9, &location);
  BOOL v3 = [v2 flatMap:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke_461;
  v6[3] = &unk_26408F4B8;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 recover:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v4;
}

- (id)hf_fetchAvailableWalletKeyEncodedPKPass
{
  objc_initWeak(&location, val);
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke;
  v4[3] = &unk_26408F0F0;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = [v1 futureWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_fetchExistingWalletKeyEncodedPKPass
{
  objc_initWeak(&location, val);
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke;
  v4[3] = &unk_26408F0F0;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = [v1 futureWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_ecosystemAccessoryUUIDMapFuture
{
  BOOL v3 = [a1 accessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_466);

  id v5 = (void *)MEMORY[0x263F58190];
  id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_468);
  id v7 = [v5 combineAllFutures:v6];

  uint64_t v8 = [v7 flatMap:&__block_literal_global_471];
  id v9 = [v8 flatMap:&__block_literal_global_473];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_8;
  v12[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSError_8l;
  void v12[4] = a2;
  id v10 = [v9 recover:v12];

  return v10;
}

- (id)hf_setShowPredictedScenesOnDashboard:()Additions
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:");
  BOOL v3 = [a1 applicationData];
  [v3 setObject:v2 forKeyedSubscript:@"showPredictedScenesOnDashboard"];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke;
  v8[3] = &unk_26408CD50;
  void v8[4] = a1;
  id v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_2;
  v7[3] = &unk_26408C8A0;
  void v7[4] = a1;
  id v5 = [v4 addSuccessBlock:v7];

  return v5;
}

- (uint64_t)hf_hasFavorites
{
  uint64_t v1 = objc_msgSend(a1, "hf_accessoryLikeObjects");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_482);

  return v2;
}

- (uint64_t)hf_shortcutsComponentActionSetWithActions:()Additions
{
  return [MEMORY[0x263F0E0C8] shortcutsComponentActionSetWithHome:a1 actions:a3];
}

- (id)hf_accessoryRepresentableUsageCountsByRoomWithFilter:()Additions
{
  id v4 = a3;
  id v5 = [[HFBiomeUsageCountsByRoomFetchRequest alloc] initWithHome:a1];
  [(HFBiomeUsageCountsByRoomFetchRequest *)v5 setFilter:v4];

  id v6 = [(HFBiomeAbstractFetchRequest *)v5 fetch];

  return v6;
}

- (BOOL)hf_atleastOneMediaAccessoryHasSiriEnabled
{
  uint64_t v2 = objc_msgSend(a1, "hf_allMediaProfileContainers");
  BOOL v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_486);
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = objc_msgSend(a1, "hf_allSiriEndPointProfileContainers");
    id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_488);

    BOOL v4 = v6 != 0;
  }

  return v4;
}

- (id)hf_minimumDescription
{
  uint64_t v2 = NSString;
  BOOL v3 = [a1 name];
  BOOL v4 = [a1 uniqueIdentifier];
  id v5 = [a1 uuid];
  id v6 = [v2 stringWithFormat:@"<HMHome: name = %@ | uniqueIdentifier = %@ | uuid = %@>", v3, v4, v5];

  return v6;
}

+ (uint64_t)hf_minimumDescriptionsOfHomes:()Additions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_494);
}

@end