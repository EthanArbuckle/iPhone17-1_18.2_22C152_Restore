@interface HMHome
@end

@implementation HMHome

uint64_t __42__HMHome_Additions__hf_allVisibleServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_visibleServices");
}

uint64_t __44__HMHome_Additions__hf_walletKeyAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsWalletKey];
}

uint64_t __57__HMHome_Additions__hf_audioAnalysisSupportedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAudioAnalysisSupportedDevice");
}

uint64_t __45__HMHome_Additions__hf_hasVisibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __35__HMHome_Additions__hf_hasHomePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __32__HMHome_Additions__hf_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __77__HMHome_Additions__hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    v3 = [v2 mediaProfile];
    v4 = objc_msgSend(v3, "hf_settingsValueManager");

    v5 = [v2 settings];
    v6 = objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", @"root.announce.enabled");

    objc_opt_class();
    v7 = [v4 valueForSetting:v6];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    v7 = objc_msgSend(v2, "hf_siriEndpointProfile");

    if (!v7)
    {
LABEL_17:
      uint64_t v14 = 0;
      goto LABEL_18;
    }
    v10 = [v2 mediaProfile];
    v11 = objc_msgSend(v10, "hf_mediaAccessoryCommonSettingsManager");

    objc_opt_class();
    v7 = [v11 settingValueForKeyPath:HFAnnounceEnabledKeyPath];
    if (objc_opt_isKindOfClass()) {
      v12 = v7;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {

LABEL_16:
      v7 = 0;
      goto LABEL_17;
    }
    [v13 BOOLValue];
  }
  if (([v7 BOOLValue] & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v14 = [v2 supportsAnnounce];
LABEL_18:

  return v14;
}

uint64_t __35__HMHome_Additions__hf_hasAppleTVs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAppleTV");
}

uint64_t __56__HMHome_Additions__hf_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

uint64_t __55__HMHome_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

uint64_t __54__HMHome_Additions__hf_accessoriesSupportingUWBUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsUWBUnlock];
}

uint64_t __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isCamera");
}

uint64_t __42__HMHome_Additions__hf_visibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __40__HMHome_Additions__hf_mediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __63__HMHome_Additions__hf_siriEndpointCapableAccessoriesToOnboard__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_siriEndpointProfile");
  if ([v2 supportsOnboarding]) {
    uint64_t v3 = [v2 isNeedsOnboarding];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __43__HMHome_Additions__hf_roomWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

BOOL __41__HMHome_Additions__hf_hasVisibleServies__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_visibleServices");
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __44__HMHome_Additions__hf_hasRMVCapableAppleTV__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isAppleTV")) {
    uint64_t v3 = objc_msgSend(v2, "hf_supportsRMVOnAppleTV");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __41__HMHome_Additions__hf_allCameraProfiles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cameraProfiles];
}

uint64_t __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

BOOL __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 userSettings];
  char v3 = [v2 supportedFeatures];

  return (v3 & 6) != 0;
}

id __40__HMHome_Additions__hf_allLightProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 lightProfiles];
  char v3 = [v2 allObjects];

  return v3;
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = HFLogForCategory(0x43uLL);
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "(%@) Fetched Wallet Key Device State for current device: %@. Updating cache.", buf, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithResult:v5];
    objc_setAssociatedObject(WeakRetained, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey", v5, (void *)1);
    v11 = +[HFHomeKitDispatcher sharedDispatcher];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke_393;
    v13[3] = &unk_264092450;
    id v14 = v5;
    id v15 = WeakRetained;
    [v11 dispatchWalletKeyDeviceStateObserverMessage:v13 sender:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%@) Could not fetch Wallet Key Device State for current device: %@", buf, 0x16u);
    }

    if (!v6)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", -1);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  objc_setAssociatedObject(WeakRetained, "hf_fetchWalletKeyDeviceStateFuture", 0, (void *)1);
}

id __37__HMHome_Additions__hf_walletKeyUUID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F58190];
  char v3 = [a2 walletKey];
  uint64_t v4 = [v3 UUID];
  id v5 = [v2 futureWithResult:v4];

  return v5;
}

uint64_t __74__HMHome_Additions__hf_dashboardSectionReorderableHomeKitObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  id v9 = [v6 uniqueIdentifier];

  uint64_t v10 = [v9 UUIDString];
  v11 = [v5 uniqueIdentifier];

  uint64_t v12 = [v11 UUIDString];
  if ([v8 sortedIdentifiersWithIdentifier1:v10 identifier2:v12]) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }

  return v13;
}

uint64_t __71__HMHome_Additions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  int v9 = [v8 sortedIdentifiersWithIdentifier1:v6 identifier2:v5];

  if (v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke_2;
  v6[3] = &unk_26408E0E8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 cameraProfiles];
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_179);

  return v3;
}

id __36__HMHome_Additions__hf_orderedRooms__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_msgSend(WeakRetained, "hf_dashboardSectionReorderableHomeKitObjectComparator");
  if (!v2) {
    NSLog(&cfstr_CouldNotCreate.isa, WeakRetained);
  }
  uint64_t v3 = objc_msgSend(WeakRetained, "hf_activeRooms");
  uint64_t v4 = [v3 sortedArrayUsingComparator:v2];

  return v4;
}

uint64_t __60__HMHome_Additions__hf_allCameraProfilesSupportingRecording__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userSettings];
  unint64_t v3 = [v2 supportedFeatures];

  return (v3 >> 1) & 1;
}

uint64_t __50__HMHome_HFUserHandleAdditions__hf_userForHandle___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 userID];
  uint64_t v4 = [*(id *)(a1 + 32) userID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __54__HMHome_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_displayName");
  uint64_t v5 = [v3 uuid];

  id v6 = [v2 stringWithFormat:@"%@ : UUID %@", v4, v5];

  return v6;
}

id __54__HMHome_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_displayName");
  uint64_t v5 = [v3 uuid];

  id v6 = [v2 stringWithFormat:@"%@ : UUID %@", v4, v5];

  return v6;
}

uint64_t __79__HMHome_HFFavoritingAdditions__hf_favoriteCameraCountExcludingHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "hf_isCamera") & v4;
  }

  return v5;
}

uint64_t __40__HMHome_Additions__hf_canAddHomeMember__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

uint64_t __37__HMHome_Additions__hf_roomWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __40__HMHome_Additions__hf_setSelectedRoom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didSelectRoom:*(void *)(a1 + 40)];
  }
}

uint64_t __43__HMHome_Additions__hf_zoneWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = WeakRetained;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Updating network protection mode to %li for home %@", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_77;
  v9[3] = &unk_26408C8C8;
  v9[4] = WeakRetained;
  id v10 = v3;
  id v8 = v3;
  [WeakRetained updateNetworkProtection:v7 completionHandler:v9];
}

void __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_2;
  v6[3] = &unk_26408CDA0;
  void v6[4] = *(void *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v6 sender:0];

  if (v3)
  {
    uint64_t v5 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to update network protection mode with error %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

uint64_t __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 homeDidUpdateProtectionMode:*(void *)(a1 + 32)];
}

uint64_t __50__HMHome_Additions__hf_accessoryWithMatterNodeID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 matterNodeID];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke_2;
  v6[3] = &unk_26408D968;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 symptomsHandler];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __51__HMHome_Additions__hf_allNetworkRouterAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

uint64_t __51__HMHome_Additions__hf_allTargetControlAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRemoteControl");
}

unint64_t __45__HMHome_Additions__hf_primaryResidentDevice__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 status] >> 1) & 1;
}

uint64_t __46__HMHome_Additions__hf_enabledResidentDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    uint64_t v3 = [v2 capabilities] & 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __42__HMHome_Additions__hf_actionSetWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

unint64_t __78__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 16) & 1;
}

unint64_t __77__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 26) & 1;
}

unint64_t __64__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingCHIP__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 22) & 1;
}

unint64_t __73__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingActivityZones__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 12) & 1;
}

unint64_t __82__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 20) & 1;
}

id __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  uint64_t v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isResidentAppleTV"))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 device];
    uint64_t v6 = [v5 uniqueIdentifier];
    uint64_t v7 = [v4 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __45__HMHome_Additions__hf_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

uint64_t __48__HMHome_Additions__hf_serviceGroupsForService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isSupported"))
  {
    uint64_t v4 = [v3 services];
    uint64_t v5 = [v4 containsObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __51__HMHome_Additions__hf_serviceGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 components];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke_2;
  v6[3] = &unk_264092038;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  uint64_t v4 = [v3 accessory];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __50__HMHome_Additions__hf_mediaSystemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __53__HMHome_Additions__hf_appleTVUsingAudioDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 audioDestinationController];
  uint64_t v4 = [v3 destination];
  uint64_t v5 = [v4 audioDestinationIdentifier];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __67__HMHome_Additions__hf_relatedHomeTheaterMediaProfileContainerFor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_backingAccessory");

  if (v4)
  {
    uint64_t v5 = objc_msgSend(v3, "hf_backingAccessory");
    id v6 = v5;
  }
  else
  {
    objc_opt_class();
    id v7 = v3;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v6 = v8;

    uint64_t v5 = v6;
  }
  uint64_t v9 = [v5 audioDestinationIdentifier];
  id v10 = [*(id *)(a1 + 32) audioDestinationIdentifier];
  uint64_t v11 = [v9 isEqualToString:v10];

  return v11;
}

BOOL __53__HMHome_Additions__hf_appleTVsSupportingHomeTheater__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 audioDestinationController];
  id v3 = [v2 availableDestinations];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __56__HMHome_Additions__accessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

uint64_t __62__HMHome_Additions__hf_hasAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

uint64_t __72__HMHome_Additions__hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 supportsSoftwareUpdateV2];
  }

  return v3;
}

uint64_t __72__HMHome_Additions__hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_supportsSoftwareUpdate")) {
    uint64_t v3 = objc_msgSend(v2, "hf_isHomePod") ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __69__HMHome_Additions__hf_accessoriesWithValidSoftwareOrFirmwareUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasValidSoftwareOrFirmwareUpdate");
}

id __60__HMHome_Additions__hf_accessoriesSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_137_1);

  return v3;
}

uint64_t __60__HMHome_Additions__hf_accessoriesSupportingNaturalLighting__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

uint64_t __63__HMHome_Additions__hf_homeKitObjectsSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  return [a2 services];
}

id __63__HMHome_Additions__hf_homeKitObjectsSupportingNaturalLighting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 accessory];
  if (objc_msgSend(v3, "hf_isMultiServiceAccessory"))
  {
    BOOL v4 = [v2 accessory];
    char v5 = objc_msgSend(v4, "hf_showAsIndividualServices");

    if ((v5 & 1) == 0)
    {
      id v6 = [v2 accessory];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = v2;
LABEL_6:
  id v7 = v6;

  return v7;
}

uint64_t __53__HMHome_Additions__hf_containsActionableAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_alloc_init(HFNullValueSource);
  BOOL v4 = +[HFServiceItem serviceItemForService:v2 valueSource:v3];

  uint64_t v5 = [v4 containsActions];
  return v5;
}

uint64_t __44__HMHome_Additions__hf_allAccessoryProfiles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 profiles];
}

uint64_t __51__HMHome_Additions__hf_accessoryProfilesWithClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id __55__HMHome_Additions__hf_allNetworkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __65__HMHome_Additions__hf_allLightProfilesSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 settings];
  uint64_t v3 = [v2 supportedFeatures] & 1;

  return v3;
}

uint64_t __52__HMHome_Additions__hf_cameraProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __57__HMHome_Additions__hf_cameraProfileForSignificantEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) cameraProfileUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

BOOL __60__HMHome_Additions__hf_allCameraProfilesWithDoorbellService__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hf_serviceOfType:", *MEMORY[0x263F0D6C0]);
  BOOL v4 = v3 != 0;

  return v4;
}

BOOL __72__HMHome_Additions__hf_allCameraProfilesWithSmartMotionRecordingEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [v3 userSettings];
  uint64_t v5 = [v4 accessModeForPresenceType:3];

  id v6 = [v3 userSettings];
  uint64_t v7 = [v6 accessModeForPresenceType:4];

  id v8 = [v3 userSettings];
  uint64_t v9 = [v8 recordingEventTriggers];

  BOOL v11 = v5 == 2 || v7 == 2;
  uint64_t v12 = *(void *)(a1 + 32) & v9;
  __int16 v13 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v3;
    __int16 v18 = 1024;
    BOOL v19 = v11;
    __int16 v20 = 1024;
    BOOL v21 = v12 != 0;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Camera %@ streamAndRecord %d recordingEvents %d", (uint8_t *)&v16, 0x18u);
  }

  if (v12) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __49__HMHome_Additions__hf_allMediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __49__HMHome_Additions__hf_allMediaProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hf_isMediaAccessory");

  return v3;
}

BOOL __75__HMHome_Additions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "hf_backingAccessory");
  BOOL v4 = [v3 home];
  uint64_t v5 = objc_msgSend(v2, "hf_backingAccessory");

  id v6 = objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);

  return v6 == 0;
}

id __55__HMHome_Additions__hf_allUniqueMediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory"))
  {
    uint64_t v3 = [v2 mediaProfile];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __55__HMHome_Additions__hf_allUniqueMediaProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "hf_backingAccessory");
  BOOL v4 = [v3 home];
  uint64_t v5 = objc_msgSend(v2, "hf_backingAccessory");

  id v6 = objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);

  return v6 == 0;
}

uint64_t __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

BOOL __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 accessory];
  int v8 = objc_msgSend(v7, "hf_isHomePod");

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v6 accessory];
    BOOL v11 = objc_msgSend(v9, "hf_mediaSystemForAccessory:", v10);
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __51__HMHome_Additions__hf_allHomePodProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __51__HMHome_Additions__hf_allHomePodProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 accessory];
  uint64_t v7 = objc_msgSend(v6, "hf_isHomePod");

  return v7;
}

BOOL __61__HMHome_Additions__hf_allHomePodsOrStereoPairsThatWillChime__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFMediaHelper isDoorbellChimeEnabled:a2];
}

unint64_t __50__HMHome_Additions__hf_isFaceRecognitionAvailable__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 13) & 1;
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F0E5B8]);
  [v4 setFaceClassificationEnabled:*(unsigned __int8 *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2;
  v8[3] = &unk_264092188;
  char v11 = *(unsigned char *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 updatePersonManagerSettings:v6 completion:v8];
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = *(void **)(a1 + 32);
      int v7 = *(unsigned __int8 *)(a1 + 56);
      int v8 = [v6 personManager];
      *(_DWORD *)buf = 138413058;
      int v16 = v6;
      __int16 v17 = 1024;
      int v18 = v7;
      __int16 v19 = 2112;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to update face recognition enabled(%d) for person manager %@ with error %@", buf, 0x26u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    char v11 = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_203;
    BOOL v12 = &unk_26408D8F0;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    [v5 dispatchHomeObserverMessage:&v9 sender:0];

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult", v9, v10, v11, v12, v13);
  }
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_203(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdatePersonManagerSettings:*(void *)(a1 + 40)];
  }
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2_206(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) currentUser];
  id v5 = objc_alloc_init(MEMORY[0x263F0E5D0]);
  [v5 setImportingFromPhotoLibraryEnabled:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_3;
  v10[3] = &unk_2640921D8;
  uint64_t v6 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  v10[4] = v6;
  id v11 = v4;
  id v12 = v3;
  id v13 = v5;
  id v7 = v5;
  id v8 = v3;
  id v9 = v4;
  [v9 updatePhotosPersonManagerSettings:v7 completion:v10];
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      id v9 = [v7 name];
      *(_DWORD *)buf = 138413314;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to update face recognition enabled(%d) for user %@ (%@) with error %@", buf, 0x30u);
    }
    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_208;
    id v13 = &unk_2640921B0;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    [v5 dispatchUserObserverMessage:&v10 sender:0];

    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult", v10, v11, v12, v13);
  }
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_208(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 user:*(void *)(a1 + 32) didUpdatePersonManagerSettings:*(void *)(a1 + 40)];
  }
}

uint64_t __47__HMHome_Additions__hf_allPhotosPersonManagers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 photosPersonManager];
}

uint64_t __52__HMHome_Additions__hf_personManagerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __34__HMHome_Additions__hf_allPersons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__HMHome_Additions__hf_allPersons__block_invoke_2;
  v7[3] = &unk_26408CD78;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 futureWithCompletionHandlerAdapterBlock:v7];

  return v5;
}

uint64_t __34__HMHome_Additions__hf_allPersons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchAllPersonsWithCompletion:a2];
}

id __34__HMHome_Additions__hf_allPersons__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = objc_msgSend(a2, "na_flatMap:", &__block_literal_global_227_0);
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

uint64_t __34__HMHome_Additions__hf_allPersons__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 allObjects];
}

uint64_t __45__HMHome_Additions__hf_personWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_personWithIdentifier:", *(void *)(a1 + 32));
}

id __45__HMHome_Additions__hf_personWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "na_map:", &__block_literal_global_232_1);
  id v3 = [v2 firstObject];

  id v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [MEMORY[0x263F58190] futureWithResult:v3];
  }
  else
  {
    int v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v5 = [v4 futureWithError:v6];
  }
  return v5;
}

id __45__HMHome_Additions__hf_personWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F0E5D0]);
  [v4 setImportingFromPhotoLibraryEnabled:*(unsigned __int8 *)(a1 + 48)];
  [v4 setSharingFaceClassificationsEnabled:*(unsigned __int8 *)(a1 + 49)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_2;
  v8[3] = &unk_2640922B0;
  id v5 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v4;
  [v10 updatePersonManagerSettings:v7 completion:v8];
}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      __int16 v18 = "-[HMHome(Additions) hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:]_block_invoke_2";
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@ %s: Failed to update external person manager settings %@ for user %@", buf, 0x2Au);
    }

    [*(id *)(a1 + 56) finishWithError:v3];
  }
  else
  {
    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_241;
    id v12 = &unk_2640921B0;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    [v5 dispatchUserObserverMessage:&v9 sender:0];

    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult", v9, v10, v11, v12);
  }
}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_241(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 user:*(void *)(a1 + 32) didUpdatePersonManagerSettings:*(void *)(a1 + 40)];
  }
}

uint64_t __69__HMHome_Additions__hf_accessoriesRequiringManualWiFiReconfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_networkConfigurationProfiles");
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_247_1);

  return v3;
}

uint64_t __69__HMHome_Additions__hf_accessoriesRequiringManualWiFiReconfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresManualWiFiReconfiguration");
}

uint64_t __61__HMHome_Additions__hf_updateAutomaticSoftwareUpdateEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAutomaticSoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

uint64_t __80__HMHome_Additions__hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

uint64_t __32__HMHome_Additions__hf_appleTVs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAppleTV");
}

BOOL __46__HMHome_Additions__hf_allResidentAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_linkedResidentDevice");
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __50__HMHome_Additions__hf_personalRequestAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0E0E8] isAccessorySupported:a2];
}

uint64_t __52__HMHome_Additions__hf_tvViewingProfilesAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0E4B8] isAccessorySupported:a2];
}

BOOL __47__HMHome_Additions__hf_siriEndPointAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_siriEndpointProfile");
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __56__HMHome_Additions__hf_allSiriEndPointProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __56__HMHome_Additions__hf_allSiriEndPointProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 accessory];
  uint64_t v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  return v7;
}

uint64_t __69__HMHome_Additions__hf_allSiriEndPointProfileContainersThatWillChime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = objc_msgSend(v5, "hf_mediaAccessoryCommonSettingsManager");
  uint64_t v7 = [v6 settingValueForKeyPath:HFDoorbellChimeEnabledKeyPath];

  uint64_t v8 = [v7 BOOLValue];
  return v8;
}

uint64_t __68__HMHome_Additions__hf_accessoryCategoriesReorderableItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = objc_msgSend(WeakRetained, "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");
  int v9 = [v8 sortedItemsWithItem1:v6 item2:v5];

  if (v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __65__HMHome_Additions__hf_dashboardSectionReorderableItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  int v9 = [v8 sortedItemsWithItem1:v6 item2:v5];

  if (v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __48__HMHome_Additions__hf_setNotesApplicationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", *(void *)(a1 + 40), 1, a2);
}

void __59__HMHome_Additions__hf_setHomeHasOnboardedApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);
}

void __64__HMHome_Additions__hf_setHomeHasMigratedServicesToAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);
}

void __54__HMHome_Additions__hf_setHomeHasMigratedForRedesign___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);
}

void __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (HFPreferencesBooleanValueForKey(@"HFPreferencesRemoveAllSoftwareUpdateLicenseVersionsFromHomeKey") == 2)
  {
    v1 = [WeakRetained applicationData];
    [v1 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:@"HFApplicationHomePodTermsAndConditionsAcceptedKey"];

    id v2 = [WeakRetained applicationData];
    objc_msgSend(WeakRetained, "hf_updateApplicationData:handleError:completionHandler:", v2, 1, &__block_literal_global_302);

    HFPreferencesRemoveValueForKey(@"HFPreferencesRemoveAllSoftwareUpdateLicenseVersionsFromHomeKey");
  }
}

void __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "[START UPDATE] Unable to remove software update license versions & update application data: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Successfully removed all software update license agreement versions", (uint8_t *)&v5, 2u);
  }
}

void __94__HMHome_Additions__hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

unint64_t __51__HMHome_Additions__hf_supportsPerUserRemoteAccess__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 1) & 1;
}

unint64_t __56__HMHome_Additions__hf_supportsRemoteAccessRestrictions__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 2) & 1;
}

unint64_t __60__HMHome_Additions__hf_enabledResidentsSupportsMediaActions__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 9) & 1;
}

unint64_t __60__HMHome_Additions__hf_enabledResidentsSupportsNaturalLight__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 14) & 1;
}

unint64_t __76__HMHome_Additions__hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    unint64_t v3 = ((unint64_t)[v2 capabilities] >> 23) & 1;
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

uint64_t __40__HMHome_Additions__hf_allNonAdminUsers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) homeAccessControlForUser:v3];
  if ([v4 isAdministrator])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) homeAccessControlForUser:v3];
    uint64_t v5 = [v6 isOwner] ^ 1;
  }
  return v5;
}

uint64_t __40__HMHome_Additions__hf_allNonOwnerUsers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) homeAccessControlForUser:a2];
  uint64_t v3 = [v2 isOwner] ^ 1;

  return v3;
}

uint64_t __52__HMHome_Additions__hf_hasAtLeastOneRestrictedGuest__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) homeAccessControlForUser:a2];
  uint64_t v3 = [v2 isRestrictedGuest];

  return v3;
}

unint64_t __53__HMHome_Additions__hf_supportsSharedEventAutomation__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 3) & 1;
}

uint64_t __43__HMHome_Additions__hf_hasMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __40__HMHome_Additions__hf_numberOfHomePods__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "hf_isHomePod");
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

BOOL __67__HMHome_Additions__hf_allHomePodsSupportRemoteProfileInstallation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 softwareVersion];
  if ((unint64_t)[v3 majorVersion] > 0x11)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v4 = [v2 softwareVersion];
    if ([v4 majorVersion] == 17)
    {
      uint64_t v5 = [v2 softwareVersion];
      BOOL v6 = (unint64_t)[v5 minorVersion] > 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

unint64_t __50__HMHome_Additions__hf_hasCameraRecordingResident__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 6) & 1;
}

unint64_t __57__HMHome_Additions__hf_supportsReachabilityNotifications__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 17) & 1;
}

void __53__HMHome_Additions__hf_startReprovisioningAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Reprovision status - accessory: %@ error:%@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __57__HMHome_Additions__hf_atleastOneHomePodSupportsAnnounce__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = [v2 supportsAnnounce];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __64__HMHome_Additions__hf_hasAtLeastOneReachableHomeMediaAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = [v2 isControllable];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __58__HMHome_Additions__hf_hasAtLeastOneAccessoryWithSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 settings];
  uint64_t v3 = [v2 isControllable];

  return v3;
}

BOOL __61__HMHome_Additions__hf_canEnableAudioAnalysisAfterHH2Upgrade__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 softwareVersion];
  if ((unint64_t)[v3 majorVersion] > 0x10)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v4 = [v2 softwareVersion];
    if ([v4 majorVersion] == 16)
    {
      uint64_t v5 = [v2 softwareVersion];
      BOOL v6 = (unint64_t)[v5 minorVersion] > 3;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

unint64_t __52__HMHome_Additions__hf_shouldShowActivityLogSetting__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 27) & 1;
}

uint64_t __56__HMHome_Additions__hf_hasAtleastOneOasisEnabledHomePod__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 softwareVersion];
  long long v6 = *MEMORY[0x263F423A0];
  uint64_t v7 = *(void *)(MEMORY[0x263F423A0] + 16);
  uint64_t v3 = [MEMORY[0x263F42630] versionFromOperatingSystemVersion:&v6];
  uint64_t v4 = [v2 isAtLeastVersion:v3];

  return v4;
}

uint64_t __66__HMHome_Additions__hf_atleastOneMediaAccessorySupportingJustSiri__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsJustSiri];
}

uint64_t __78__HMHome_Additions__hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsJustSiri];
}

uint64_t __78__HMHome_Additions__hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [a2 mediaProfile];
  uint64_t v3 = +[HFMediaHelper siriLanguageOptionFor:v2];

  uint64_t v4 = [v3 recognitionLanguage];
  uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  uint64_t v6 = [v5 isCompactVoiceTriggerAvailableForLanguageCode:v4];

  uint64_t v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "siriLanguageCode: %@, isSupportedJSLanguage: %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

void __58__HMHome_Additions__hf_setCameraRecordingHasBeenOnboarded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Failed to set user has acknowledged camera recording onboarding. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __45__HMHome_Additions__hf_hasAnyVisibleTriggers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldDisplayTrigger");
}

uint64_t __46__HMHome_Additions__hf_hasAutomatableProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_offersAutomation");
}

void __48__HMHome_Additions__hf_updateColorPalette_type___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateMediaPeerToPeerEnabled:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_378(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateMinimumMediaUserPrivilege:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessPassword];
  id v3 = [*(id *)(a1 + 40) accessPassword];
  uint64_t v4 = [v2 compare:v3];

  return v4;
}

void __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_380(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) accessRequiresPassword])
  {
    uint64_t v3 = [*(id *)(a1 + 32) accessPassword];
    uint64_t v4 = (void *)v3;
    id v5 = &stru_26C081158;
    if (v3) {
      id v5 = (__CFString *)v3;
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 40) updateMediaPassword:v6 completionHandler:v7];
}

id __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2_384(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "hf_updateAccessControlDescriptor:", *(void *)(a1 + 40));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_3;
  v8[3] = &unk_264092428;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 flatMap:v8];

  return v6;
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithError:*(void *)(a1 + 32)];
}

uint64_t __57__HMHome_Additions__hf_restrictedGuestAllowedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRestrictedGuestAllowedAccessory");
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke_393(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 walletKeyDeviceStateUpdated:*(void *)(a1 + 32) inHome:*(void *)(a1 + 40)];
  }
}

id __36__HMHome_Additions__hf_hasWalletKey__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = NSNumber;
  uint64_t v4 = [a2 walletKey];
  id v5 = [v3 numberWithInt:v4 != 0];
  uint64_t v6 = [v2 futureWithResult:v5];

  return v6;
}

uint64_t __36__HMHome_Additions__hf_hasWalletKey__block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA80]];
}

id __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 walletKey];
    id v7 = [v6 customURL];
    int v13 = 138413058;
    id v14 = WeakRetained;
    __int16 v15 = 2080;
    uint64_t v16 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]_block_invoke";
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning url %@ for newly fetched %@.", (uint8_t *)&v13, 0x2Au);
  }
  __int16 v8 = (void *)MEMORY[0x263F58190];
  id v9 = [v3 walletKey];
  uint64_t v10 = [v9 customURL];
  __int16 v11 = [v8 futureWithResult:v10];

  return v11;
}

id __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke_406(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[HFWalletUtilities walletAppURL];
    int v11 = 138413058;
    id v12 = WeakRetained;
    __int16 v13 = 2080;
    id v14 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning default wallet app url %@ because of error: %@", (uint8_t *)&v11, 0x2Au);
  }
  id v7 = (void *)MEMORY[0x263F58190];
  __int16 v8 = +[HFWalletUtilities walletAppURL];
  id v9 = [v7 futureWithResult:v8];

  return v9;
}

void __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke_2;
  v7[3] = &unk_2640924E8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v6 = v3;
  id v8 = v6;
  [WeakRetained enableExpressForWalletKeyWithAuthData:v5 completion:v7];

  objc_destroyWeak(&v9);
}

void __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke_2(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    id v20 = @"HFErrorHandlerOptionFailedItemName";
    id v6 = [WeakRetained name];
    v21[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    v18[0] = @"HFErrorUserInfoOptionsKey";
    v18[1] = @"HFErrorUserInfoOperationKey";
    v19[0] = v7;
    v19[1] = @"HFOperationAddWalletKey";
    id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v9 = objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);
    uint64_t v10 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      __int16 v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[HMHome(Additions) hf_enableExpressModeForWalletKeyWithAuthData:]_block_invoke_2";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) When trying to enable Express Mode for Wallet Key, error occurred %@", (uint8_t *)&v12, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithError:v9];
  }
  else
  {
    int v11 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      __int16 v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[HMHome(Additions) hf_enableExpressModeForWalletKeyWithAuthData:]_block_invoke";
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed enabling express mode for wallet key with auth data", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke_2;
  v8[3] = &unk_2640924E8;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v3;
  id v9 = v7;
  [WeakRetained setExpressSettingsAuthData:v5 enableUWB:v6 enableNFCExpress:v6 completion:v8];

  objc_destroyWeak(&v10);
}

void __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke_2(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    id v20 = @"HFErrorHandlerOptionFailedItemName";
    uint64_t v6 = [WeakRetained name];
    v21[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    v18[0] = @"HFErrorUserInfoOptionsKey";
    v18[1] = @"HFErrorUserInfoOperationKey";
    v19[0] = v7;
    v19[1] = @"HFOperationAddWalletKey";
    id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v9 = objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);
    id v10 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      __int16 v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]_block_invoke_2";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) When trying to enable UWB for wallet key, error occurred %@", (uint8_t *)&v12, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithError:v9];
  }
  else
  {
    int v11 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      __int16 v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]_block_invoke";
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed enabling UWB for wallet key with auth data", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_2;
  v7[3] = &unk_264092560;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained addWalletKeyWithOptions:v5 completionHandler:v7];

  objc_destroyWeak(v9);
}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 48);
  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = @"with";
      *(_DWORD *)buf = 138413826;
      id v28 = WeakRetained;
      __int16 v29 = 2080;
      v30 = "-[HMHome(Additions) hf_addWalletKeyWithOptions:]_block_invoke_2";
      if (v8) {
        int v12 = @"with";
      }
      else {
        int v12 = @"without";
      }
      v32 = v12;
      if ((v8 & 2) != 0) {
        __int16 v13 = @"with";
      }
      else {
        __int16 v13 = @"without";
      }
      __int16 v31 = 2112;
      if ((v9 & 4) == 0) {
        int v11 = @"without";
      }
      __int16 v33 = 2112;
      v34 = v13;
      __int16 v35 = 2112;
      v36 = v11;
      __int16 v37 = 2112;
      v38 = v5;
      __int16 v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key %@ notification, %@ enabling express mode, and %@ UWB unlock, uuid is %@. error is %@", buf, 0x48u);
    }
  }
  __int16 v14 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = @"with";
    *(_DWORD *)buf = 138413570;
    id v28 = WeakRetained;
    __int16 v29 = 2080;
    v30 = "-[HMHome(Additions) hf_addWalletKeyWithOptions:]_block_invoke";
    if (v8) {
      __int16 v16 = @"with";
    }
    else {
      __int16 v16 = @"without";
    }
    __int16 v31 = 2112;
    if ((v8 & 2) == 0) {
      __int16 v15 = @"without";
    }
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v5;
    __int16 v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key %@ notification and %@ enabling express mode, uuid is %@. error is %@", buf, 0x3Eu);
  }

  if (v6)
  {
    id v25 = @"HFErrorHandlerOptionFailedItemName";
    __int16 v17 = [WeakRetained name];
    uint64_t v26 = v17;
    id v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    v23[0] = @"HFErrorUserInfoOptionsKey";
    v23[1] = @"HFErrorUserInfoOperationKey";
    v24[0] = v18;
    v24[1] = @"HFOperationAddWalletKey";
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v20 = [(__CFString *)v6 hf_errorWithAddedUserInfo:v19];
    [*(id *)(a1 + 32) finishWithError:v20];
  }
  else
  {
    uint64_t v21 = +[HFHomeKitDispatcher sharedDispatcher];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_420;
    v22[3] = &unk_26408CDA0;
    v22[4] = WeakRetained;
    [v21 dispatchHomeObserverMessage:v22 sender:0];

    [*(id *)(a1 + 32) finishWithResult:v5];
  }
}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_420(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidAddWalletKey:*(void *)(a1 + 32)];
  }
}

void __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke_2;
  v7[3] = &unk_264092588;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained addWalletKeyToPairedWatchesWithOptions:v5 completion:v7];

  objc_destroyWeak(v9);
}

void __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 48);
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = HFLogForCategory(0x43uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"with";
      *(_DWORD *)buf = 138413826;
      uint64_t v26 = WeakRetained;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(Additions) hf_addWalletKeyToPairedWatchesWithOptions:]_block_invoke_2";
      if (v5) {
        uint64_t v9 = @"with";
      }
      else {
        uint64_t v9 = @"without";
      }
      if ((v5 & 2) != 0) {
        id v10 = @"with";
      }
      else {
        id v10 = @"without";
      }
      __int16 v29 = 2112;
      v30 = WeakRetained;
      if ((v6 & 4) == 0) {
        id v8 = @"without";
      }
      __int16 v31 = 2112;
      v32 = v9;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      v36 = v8;
      __int16 v37 = 2112;
      v38 = v3;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key to paired Apple watches for home %@ %@ notification, %@ enabling express mode, and %@ UWB unlock, error is %@", buf, 0x48u);
    }
  }
  int v11 = HFLogForCategory(0x43uLL);
  int v12 = v11;
  if (v3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = @"with";
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = WeakRetained;
      if (v5) {
        id v20 = @"with";
      }
      else {
        id v20 = @"without";
      }
      __int16 v27 = 2112;
      id v28 = (const char *)v20;
      if ((v5 & 2) == 0) {
        uint64_t v19 = @"without";
      }
      __int16 v29 = 2112;
      v30 = v19;
      __int16 v31 = 2112;
      v32 = v3;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "When adding wallet key to paried Apple Watches for home %@ %@ notification and %@ enabling express mode, error occurred: %@", buf, 0x2Au);
    }

    uint64_t v23 = @"HFErrorHandlerOptionFailedItemName";
    __int16 v13 = [(__CFString *)WeakRetained name];
    __int16 v24 = v13;
    __int16 v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    v21[0] = @"HFErrorUserInfoOptionsKey";
    v21[1] = @"HFErrorUserInfoOperationKey";
    v22[0] = v14;
    v22[1] = @"HFOperationAddWalletKey";
    __int16 v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    __int16 v16 = [(__CFString *)v3 hf_errorWithAddedUserInfo:v15];
    [*(id *)(a1 + 32) finishWithError:v16];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = @"with";
      if (v5) {
        id v18 = @"with";
      }
      else {
        id v18 = @"without";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = WeakRetained;
      __int16 v27 = 2112;
      id v28 = (const char *)v18;
      if ((v5 & 2) == 0) {
        __int16 v17 = @"without";
      }
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Successfully added wallet key to paired Apple Watches for home %@ %@ notification and %@ enabling express mode", buf, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke_2;
  v7[3] = &unk_2640924E8;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained setHasOnboardedForWalletKeyWithCompletion:v7];

  objc_destroyWeak(&v9);
}

void __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = HFLogForCategory(0x43uLL);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "When turning on has onboarded for wallet key flag for home %@, error occurred: %@", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = WeakRetained;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Successfully turned on has onboarded for wallet key flag for home %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

unint64_t __53__HMHome_Additions__hf_hasHomeHubSupportingWalletKey__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 18) & 1;
}

id __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 canAddWalletKey]
    || ([v3 walletKey], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_4;
  }
  uint64_t v23 = @"HFErrorHandlerOptionFailedItemName";
  int v7 = [*(id *)(a1 + 32) name];
  v24[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  __int16 v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [v3 canAddWalletKeyErrorCode];
  uint64_t v11 = v10;
  if (v10 == 8)
  {
    __int16 v13 = _HFLocalizedStringWithDefaultValue(@"HFErrorButtonTitleShowInAppStore", @"HFErrorButtonTitleShowInAppStore", 1);
    __int16 v14 = @"HFErrorButtonTitleCancel";
  }
  else
  {
    if (v10 == 5)
    {
      int v12 = @"HFErrorButtonTitleOpenWallet";
    }
    else
    {
      if (v10 != 2)
      {
        __int16 v13 = 0;
        __int16 v15 = 0;
        goto LABEL_16;
      }
      int v12 = @"HFErrorButtonTitleiCloudSettings";
    }
    __int16 v13 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);
    __int16 v14 = @"HFErrorButtonTitleNotNow";
  }
  __int16 v15 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
LABEL_16:
  objc_msgSend(v9, "na_safeSetObject:forKey:", v13, @"HFErrorHandlerOptionRetryButtonText");
  objc_msgSend(v9, "na_safeSetObject:forKey:", v15, @"HFErrorHandlerOptionCancelButtonTextKey");
  v21[0] = @"HFErrorUserInfoOptionsKey";
  __int16 v16 = (void *)[v9 copy];
  v21[1] = @"HFErrorUserInfoOperationKey";
  v22[0] = v16;
  v22[1] = @"HFOperationAddWalletKey";
  __int16 v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v18 = (void *)[v17 mutableCopy];

  id v19 = objc_alloc(MEMORY[0x263F087E8]);
  id v20 = (void *)[v19 initWithDomain:*MEMORY[0x263F0CF50] code:v11 userInfo:v18];
  uint64_t v5 = [MEMORY[0x263F58190] futureWithResult:v20];

LABEL_4:
  return v5;
}

uint64_t __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F58190] futureWithError:a2];
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke_2;
  v7[3] = &unk_2640925D8;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:v7];

  objc_destroyWeak(&v9);
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = &stru_26C081158;
    int v11 = 138413058;
    if (v6) {
      id v9 = v6;
    }
    id v12 = WeakRetained;
    __int16 v13 = 2080;
    __int16 v14 = "-[HMHome(Additions) hf_fetchWalletKeyDeviceStateForPairedWatches]_block_invoke_2";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed wallet key device state for all paired watch devices %@. %@", (uint8_t *)&v11, 0x2Au);
  }

  if ([v5 count])
  {
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    if (v6) {
      [v10 finishWithError:v6];
    }
    else {
      [v10 finishWithNoResult];
    }
  }
}

void __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke_2;
  v6[3] = &unk_264092600;
  void v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  [WeakRetained fetchWalletKeyColorWithCompletion:v6];
}

void __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = HMHomeWalletKeyColorAsString();
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    id v12 = "-[HMHome(Additions) _hf_fetchWalletKeyColorFromAccessories]_block_invoke_2";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Fetched wallet key color %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [NSNumber numberWithInteger:a2];
  [v7 finishWithResult:v8];
}

id __63__HMHome_Additions___hf_existingWalletKeyColorForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 walletKey];

  uint64_t v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    uint64_t v5 = +[HFWalletUtilities walletKeyColorOfDeviceState:v2];
    id v6 = [v4 futureWithResult:v5];
  }
  else
  {
    id v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v6;
}

uint64_t __63__HMHome_Additions___hf_existingWalletKeyColorForCurrentDevice__block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

id __47__HMHome_Additions__hf_walletKeyColorToDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else {
  id v7 = objc_msgSend(*(id *)(a1 + 32), "_hf_fetchWalletKeyColorFromAccessories");
  }

  return v7;
}

void __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke_2;
  v7[3] = &unk_2640924E8;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained setHasOnboardedForAccessCodeWithCompletion:v7];

  objc_destroyWeak(&v9);
}

void __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = HFLogForCategory(0x33uLL);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "When turning on has onboarded for access code flag for home %@, error occurred: %@", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = WeakRetained;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Successfully turned on has onboarded for access code flag for home %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

unint64_t __55__HMHome_Additions__hf_hasHomeHubSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 21) & 1;
}

id __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 BOOLValue])
  {
    id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    int v7 = objc_msgSend(WeakRetained, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke_2;
    v9[3] = &unk_26408F468;
    objc_copyWeak(&v10, v4);
    id v6 = [v7 flatMap:v9];
    objc_destroyWeak(&v10);
  }
  return v6;
}

id __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [v3 count];

  id v6 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = WeakRetained;
    __int16 v13 = 2080;
    __int16 v14 = "-[HMHome(Additions) hf_hasWalletKeyCompatibleDevice]_block_invoke_2";
    __int16 v15 = 1024;
    BOOL v16 = v5 != 0;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning %{BOOL}d because current device and paired watches are not wallet key compatible", (uint8_t *)&v11, 0x1Cu);
  }

  int v7 = (void *)MEMORY[0x263F58190];
  id v8 = [NSNumber numberWithBool:v5 != 0];
  __int16 v9 = [v7 futureWithResult:v8];

  return v9;
}

id __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = +[HFWalletUtilities isWalletKeyDeviceStateCompatible:a2];
  id v3 = (void *)MEMORY[0x263F58190];
  id v4 = [NSNumber numberWithBool:v2];
  uint64_t v5 = [v3 futureWithResult:v4];

  return v5;
}

id __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 2080;
    int v11 = "-[HMHome(Additions) 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]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning NO for wallet key compatibility for current device because of %@", (uint8_t *)&v8, 0x20u);
  }

  id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA80]];

  return v6;
}

id __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (+[HFWalletUtilities isWalletKeyDeviceStateCompatible:v11])
        {
          objc_msgSend(v5, "na_safeAddObject:", v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v8);
  }

  __int16 v12 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v22 = WeakRetained;
    __int16 v23 = 2080;
    __int16 v24 = "-[HMHome(Additions) hf_walletKeyDeviceStatesOfCompatiblePairedWatches]_block_invoke";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) Among %@, wallet key device states of compatible paired watches are %@", buf, 0x2Au);
  }

  id v13 = (void *)MEMORY[0x263F58190];
  uint64_t v14 = (void *)[v5 copy];
  __int16 v15 = [v13 futureWithResult:v14];

  return v15;
}

id __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke_461(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 2080;
    int v11 = "-[HMHome(Additions) hf_walletKeyDeviceStatesOfCompatiblePairedWatches]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning empty array for wallet key device states of compatible paired watches because of %@", (uint8_t *)&v8, 0x20u);
  }

  id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];

  return v6;
}

void __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke_2;
  v7[3] = &unk_264092678;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained fetchAvailableWalletKeyEncodedPKPass:v7];

  objc_destroyWeak(&v9);
}

void __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory(0x33uLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      int v11 = "-[HMHome(Additions) hf_fetchAvailableWalletKeyEncodedPKPass]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%s) When fetching available wallet key encoded pass for home %@, error occurred: %@", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      int v11 = "-[HMHome(Additions) hf_fetchAvailableWalletKeyEncodedPKPass]_block_invoke";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "(%s) Successfully fetched available wallet key's encoded pass for home %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithResult:v5];
  }
}

void __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke_2;
  v7[3] = &unk_264092678;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained fetchWalletKeyEncodedPKPass:v7];

  objc_destroyWeak(&v9);
}

void __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory(0x33uLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      int v11 = "-[HMHome(Additions) hf_fetchExistingWalletKeyEncodedPKPass]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%s) When fetching existing wallet key encoded pass for home %@, error occurred: %@", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      int v11 = "-[HMHome(Additions) hf_fetchExistingWalletKeyEncodedPKPass]_block_invoke";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "(%s) Successfully fetched existing encoded pass for home %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithResult:v5];
  }
}

uint64_t __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsCHIP];
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_allConnectedHomeToCHIPAccessoryPairingFuture");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_3;
  v7[3] = &unk_26408E098;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 flatMap:v7];

  return v5;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_3(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uniqueIdentifier];
  int v10 = v5;
  id v6 = [v4 allKeys];

  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v2 futureWithResult:v7];

  return v8;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addEntriesFromDictionary:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v9 = (void *)MEMORY[0x263F58190];
  int v10 = (void *)[v3 copy];
  int v11 = [v9 futureWithResult:v10];

  return v11;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_6;
  v9[3] = &unk_2640926C8;
  id v10 = v3;
  id v4 = v3;
  objc_msgSend(v2, "na_each:", v9);

  uint64_t v5 = (void *)MEMORY[0x263F58190];
  uint64_t v6 = (void *)[v4 copy];
  uint64_t v7 = [v5 futureWithResult:v6];

  return v7;
}

void __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_7;
  v7[3] = &unk_2640926A0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  objc_msgSend(a3, "na_each:", v7);
}

void __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v13 = v3;
  id v5 = [v3 ecosystem];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v8 = *(void **)(a1 + 32);
    id v9 = [v13 ecosystem];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  id v10 = *(void **)(a1 + 32);
  int v11 = [v13 ecosystem];
  __int16 v12 = [v10 objectForKeyedSubscript:v11];
  [v12 addObject:*(void *)(a1 + 40)];
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ failed due to %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];

  return v6;
}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_2(uint64_t a1)
{
  id v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_3;
  v3[3] = &unk_26408CDA0;
  v3[4] = *(void *)(a1 + 32);
  [v2 dispatchHomeObserverMessage:v3 sender:0];
}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidUpdateApplicationData:*(void *)(a1 + 32)];
  }
}

uint64_t __36__HMHome_Additions__hf_hasFavorites__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveIsFavorite");
}

uint64_t __62__HMHome_Additions__hf_atleastOneMediaAccessoryHasSiriEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_settingsValueManager");
  id v3 = [v2 valueForSettingAtKeyPath:@"root.siri.allowHeySiri"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __62__HMHome_Additions__hf_atleastOneMediaAccessoryHasSiriEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 accessories];
  id v3 = [v2 anyObject];
  uint64_t v4 = [v3 mediaProfile];
  id v5 = objc_msgSend(v4, "hf_mediaAccessoryCommonSettingsManager");

  id v6 = [v5 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];
  uint64_t v7 = [v6 BOOLValue];

  return v7;
}

uint64_t __51__HMHome_Additions__hf_minimumDescriptionsOfHomes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_2()
{
  v28[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  if (qword_26AB2F530 != -1) {
    dispatch_once(&qword_26AB2F530, &__block_literal_global_220_2);
  }
  id v1 = (id)qword_26AB2F538;
  uint64_t v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D8A8]];
  id v3 = [HFUserNotificationServiceTopic alloc];
  uint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [(HFUserNotificationServiceTopic *)v3 initWithServiceTypes:v1 accessoryCategoryTypes:v4 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_AllBlindsAndWindowsGroup" iconForAccessoryType:v2];

  __int16 v25 = (void *)v2;
  id v26 = v1;
  __int16 v24 = (void *)v5;
  if (qword_26AB2F540 != -1) {
    dispatch_once(&qword_26AB2F540, &__block_literal_global_227_1);
  }
  id v6 = (id)qword_26AB2F548;
  uint64_t v7 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"door.right.hand.open" configuration:v0];
  int v8 = [HFUserNotificationServiceTopic alloc];
  id v9 = [MEMORY[0x263EFFA08] set];
  __int16 v10 = [(HFUserNotificationServiceTopic *)v8 initWithServiceTypes:v6 accessoryCategoryTypes:v9 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_AllDoorsGroup" iconDescriptor:v7];

  __int16 v23 = v7;
  if (qword_26AB2F550 != -1) {
    dispatch_once(&qword_26AB2F550, &__block_literal_global_237_0);
  }
  id v11 = (id)qword_26AB2F558;
  __int16 v27 = (void *)v0;
  uint64_t v12 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"lock.fill" configuration:v0];
  id v13 = [HFUserNotificationServiceTopic alloc];
  long long v14 = [MEMORY[0x263EFFA08] set];
  long long v15 = [(HFUserNotificationServiceTopic *)v13 initWithServiceTypes:v11 accessoryCategoryTypes:v14 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_AllLocksGroup" iconDescriptor:v12];

  if (qword_26AB2F560 != -1) {
    dispatch_once(&qword_26AB2F560, &__block_literal_global_247_2);
  }
  id v16 = (id)qword_26AB2F568;
  long long v17 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:*MEMORY[0x263F0B118]];
  uint64_t v18 = [HFUserNotificationServiceTopic alloc];
  long long v19 = [MEMORY[0x263EFFA08] set];
  long long v20 = [(HFUserNotificationServiceTopic *)v18 initWithServiceTypes:v16 accessoryCategoryTypes:v19 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_AllSensorsGroup" iconDescriptor:v17];

  v28[0] = v24;
  v28[1] = v10;
  v28[2] = v20;
  v28[3] = v15;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

  id v22 = (void *)qword_26AB2F528;
  qword_26AB2F528 = v21;
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_5()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D8B8];
  v5[0] = *MEMORY[0x263F0D8A8];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2F538;
  qword_26AB2F538 = v3;
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_7()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D6F8];
  v5[0] = *MEMORY[0x263F0D6A8];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2F548;
  qword_26AB2F548 = v3;
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_9()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D798];
  v5[0] = *MEMORY[0x263F0D788];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2F558;
  qword_26AB2F558 = v3;
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_11()
{
  v8[8] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D670];
  v8[0] = *MEMORY[0x263F0D688];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D758];
  v8[2] = *MEMORY[0x263F0D698];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D7B8];
  void v8[4] = *MEMORY[0x263F0D7A8];
  void v8[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0D7D8];
  v8[6] = *MEMORY[0x263F0D7F8];
  v8[7] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];
  uint64_t v6 = [v0 setWithArray:v5];
  uint64_t v7 = (void *)qword_26AB2F568;
  qword_26AB2F568 = v6;
}

void __96__HMHome_HFUserNotificationTopics___hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType___block_invoke_2()
{
  uint64_t v0 = (void *)qword_26AB2F578;
  qword_26AB2F578 = MEMORY[0x263EFFA78];
}

uint64_t __56__HMHome_HFUserNotificationTopics___hf_accessoryTopics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isCamera")) {
    uint64_t v3 = objc_msgSend(v2, "hf_isNotificationSupportedCamera");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_visibleServices");
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_273);

  return v4;
}

BOOL __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isCameraContainedMotionSensor"))
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(v2, "hf_userNotificationSettings");
    BOOL v3 = v4 != 0;
  }
  return v3;
}

uint64_t __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveServiceType");
}

HFUserNotificationServiceTopic *__68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  long long v15 = __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_5;
  id v16 = &unk_2640979A0;
  id v5 = v3;
  id v17 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", &v13);
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = v6;
  }
  else
  {
    id v9 = objc_msgSend((id)objc_opt_class(), "_hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType:", v5);
    if (!v9)
    {
      __int16 v10 = NSString;
      id v11 = [MEMORY[0x263F0E708] localizedDescriptionForServiceType:v5];
      id v9 = [v10 stringWithFormat:@"Unknown (%@)", v11, v13, v14, v15, v16];
    }
    int v8 = [[HFUserNotificationServiceTopic alloc] initWithServiceType:v5 topicNameLocalizationKey:v9];
  }
  return v8;
}

uint64_t __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceTypes];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __71__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceTypes];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "hf_effectiveServiceType");
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __77__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryCategoryTypes];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

id __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke_2;
  v6[3] = &unk_26408E0E8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

uint64_t __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_userNotificationSettings");
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) serviceTypes];
    uint64_t v6 = objc_msgSend(v3, "hf_effectiveServiceType");
    if ([v5 containsObject:v6]) {
      uint64_t v7 = objc_msgSend(v3, "hf_isCameraContainedMotionSensor") ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 cameraProfiles];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke_2;
  v6[3] = &unk_264092120;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

uint64_t __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_userNotificationSettings");
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) accessoryCategoryTypes];
    uint64_t v6 = [v3 accessory];
    id v7 = [v6 category];
    int v8 = [v7 categoryType];
    uint64_t v9 = [v5 containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __90__HMHome_HFUserNotificationTopics__hf_safetyAndSecurityAccessoriesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isAudioAnalysisSupportedDevice"))
  {
    uint64_t v4 = [*(id *)(a1 + 32) accessoryCategoryTypes];
    uint64_t v5 = [v3 category];
    uint64_t v6 = [v5 categoryType];
    uint64_t v7 = [v4 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __59__HMHome_HFUserNotificationTopics__hf_applianceAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsCHIP] && (objc_msgSend(v2, "isBridged") & 1) == 0)
  {
    uint64_t v4 = [v2 category];
    uint64_t v5 = [v4 categoryType];
    uint64_t v3 = [v5 isEqualToString:*MEMORY[0x263F0B0D0]];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __55__HMHome_HFApplicationData___hf_updateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidUpdateApplicationData:*(void *)(a1 + 32)];
  }
}

void __84__HMHome_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    uint64_t v5 = [*(id *)(a1 + 32) residentDevices];
    uint64_t v6 = [v5 count];

    uint64_t v7 = HFOperationUpdateApplicationDataResidentSync;
    if (!v6) {
      uint64_t v7 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    uint64_t v7 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v8 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v9 = *v7;
  __int16 v10 = +[HFErrorHandler sharedHandler];
  id v11 = v10;
  if (v8) {
    [v10 handleError:v14 operationType:v9 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v10 logError:v14 operationDescription:v9];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = [WeakRetained applicationData];
  objc_msgSend(WeakRetained, "_hf_updateApplicationData:", v13);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end