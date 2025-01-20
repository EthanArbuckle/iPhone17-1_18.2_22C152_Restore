@interface HMAccessory(HFAdditions)
+ (id)hf_getUserFriendlyDescriptionKey:()HFAdditions;
+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()HFAdditions;
+ (id)hf_userFriendlyLocalizedCapitalizedPluralDescription:()HFAdditions;
+ (id)hf_userFriendlyLocalizedLowercaseDescription:()HFAdditions;
+ (uint64_t)hf_isSuspendedStateSupported:()HFAdditions;
+ (uint64_t)hf_isSuspendedStateSuspended:()HFAdditions;
+ (uint64_t)hf_minimumDescriptionsOfAccessories:()HFAdditions;
- (BOOL)hf_canShowAsIndividualServices;
- (BOOL)hf_isAudioAnalysisSupportedDevice;
- (BOOL)hf_isDirectlyReachable;
- (BOOL)hf_isMultiSensorAccessory;
- (BOOL)hf_isMultiServiceAccessory;
- (BOOL)hf_isPureProgrammableSwitch;
- (BOOL)hf_isSingleSensorAccessory;
- (BOOL)hf_isSprinkler;
- (id)_hf_categoryType;
- (id)hf_allConnectedHomeToCHIPAccessoryPairingFuture;
- (id)hf_bridgedAccessories;
- (id)hf_categoryOrPrimaryServiceType;
- (id)hf_componentServices;
- (id)hf_displayNamesForVisibleTiles;
- (id)hf_errorForCurrentSessionState;
- (id)hf_groupableServices;
- (id)hf_irrigationSystemServices;
- (id)hf_linkedResidentDevice;
- (id)hf_minimumDescription;
- (id)hf_networkConfigurationProfiles;
- (id)hf_owningBridgeAccessory;
- (id)hf_primaryService;
- (id)hf_programmableSwitchNamespaceServices;
- (id)hf_programmableSwitchServices;
- (id)hf_serviceOfType:()HFAdditions;
- (id)hf_servicesBehindBridge;
- (id)hf_servicesWithBulletinBoardNotificationTurnedOff;
- (id)hf_setShowAsIndividualServices:()HFAdditions;
- (id)hf_siriEndpointProfile;
- (id)hf_standardServices;
- (id)hf_userFriendlyLocalizedCapitalizedDescription;
- (id)hf_userFriendlyLocalizedLowercaseDescription;
- (id)hf_visibleServices;
- (uint64_t)hf_appPunchOutReason;
- (uint64_t)hf_areAllServicesInGroups;
- (uint64_t)hf_canSyncExternalSettings;
- (uint64_t)hf_hasInputSourceService;
- (uint64_t)hf_hasManagedNetworkCredential;
- (uint64_t)hf_isBridge;
- (uint64_t)hf_isCamera;
- (uint64_t)hf_isCategorizedAsBridge;
- (uint64_t)hf_isCeilingFanWithLight;
- (uint64_t)hf_isDoorbell;
- (uint64_t)hf_isIdentifiable;
- (uint64_t)hf_isMatterOnlyAccessory;
- (uint64_t)hf_isNetworkRouter;
- (uint64_t)hf_isNetworkRouterSatellite;
- (uint64_t)hf_isNonServiceBasedAccessory;
- (uint64_t)hf_isNotificationSupportedCamera;
- (uint64_t)hf_isPowerStrip;
- (uint64_t)hf_isProgrammableSwitch;
- (uint64_t)hf_isPureBridge;
- (uint64_t)hf_isRemoteControl;
- (uint64_t)hf_isRestrictedGuestAllowedAccessory;
- (uint64_t)hf_isSensorAccessory;
- (uint64_t)hf_isSingleServiceAccessory;
- (uint64_t)hf_isSingleServiceLikeAccessory;
- (uint64_t)hf_isSupportedAccessory;
- (uint64_t)hf_isSuspended;
- (uint64_t)hf_isTelevision;
- (uint64_t)hf_isVisibleAccessory;
- (uint64_t)hf_isVisibleAsBridge;
- (uint64_t)hf_isVisibleAsBridgedAccessory;
- (uint64_t)hf_needsOnboarding;
- (uint64_t)hf_needsReprovisioningCheck;
- (uint64_t)hf_numberOfProgrammableSwitches;
- (uint64_t)hf_requiresFirmwareUpdate;
- (uint64_t)hf_shouldHideNearbyAccessoryService:()HFAdditions;
- (uint64_t)hf_shouldSeparateAccessoryName;
- (uint64_t)hf_showAsAccessoryTile;
- (uint64_t)hf_showAsIndividualServices;
- (uint64_t)hf_showsAsAccessoryInControlCentre;
- (uint64_t)hf_supportsSuspendedState;
- (void)hf_onboardSiriEndpointIfNeededWithSettingKeyPath:()HFAdditions settingValue:;
@end

@implementation HMAccessory(HFAdditions)

- (uint64_t)hf_isMatterOnlyAccessory
{
  if (qword_26AB2F128 != -1) {
    dispatch_once(&qword_26AB2F128, &__block_literal_global_36_0);
  }
  if ((_os_feature_enabled_impl() & 1) == 0
    && !HM_FEATURE_RVC_DEFAULTS_ENABLED()
    && !+[HFUtilities isInternalTest])
  {
    return 0;
  }
  v2 = [a1 matterNodeID];
  if (v2)
  {
    v3 = [a1 matterNodeID];
    if ([v3 intValue])
    {
      if ([a1 isBridged])
      {
        uint64_t v4 = _MergedGlobals_256 != 0;
      }
      else
      {
        v5 = [a1 category];
        v6 = [v5 categoryType];
        unsigned int v7 = [v6 isEqualToString:*MEMORY[0x263F0B0D0]];
        if (_MergedGlobals_256) {
          uint64_t v4 = 1;
        }
        else {
          uint64_t v4 = v7;
        }
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)hf_standardServices
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  uint64_t v4 = _Block_copy(aBlock);
  v5 = +[HFHomePropertyCacheManager sharedManager];
  v6 = NSStringFromSelector(a2);
  unsigned int v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:2 recalculationBlock:v4];

  return v7;
}

- (id)hf_visibleServices
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HMAccessory_HFAdditions__hf_visibleServices__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  uint64_t v4 = _Block_copy(aBlock);
  v5 = +[HFHomePropertyCacheManager sharedManager];
  v6 = NSStringFromSelector(a2);
  unsigned int v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:3 recalculationBlock:v4];

  return v7;
}

- (uint64_t)hf_isNonServiceBasedAccessory
{
  if ((objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isRemoteControl") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "hf_isMatterOnlyAccessory");
}

- (id)hf_siriEndpointProfile
{
  v1 = [a1 profiles];
  v2 = objc_msgSend(v1, "na_firstObjectPassingTest:", &__block_literal_global_208_1);

  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (uint64_t)hf_isRemoteControl
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B160]];
  return v3;
}

- (uint64_t)hf_isCamera
{
  v2 = [a1 cameraProfiles];
  if ([v2 count])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [a1 category];
    id v5 = [v4 categoryType];
    if ([v5 isEqualToString:*MEMORY[0x263F0B0A8]])
    {
      uint64_t v3 = 1;
    }
    else
    {
      v6 = [a1 category];
      unsigned int v7 = [v6 categoryType];
      uint64_t v3 = [v7 isEqualToString:*MEMORY[0x263F0B1B8]];
    }
  }

  return v3;
}

- (uint64_t)hf_isProgrammableSwitch
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_25_6);

  return v2;
}

- (BOOL)hf_isAudioAnalysisSupportedDevice
{
  if (![a1 supportsAudioAnalysis]) {
    return 0;
  }
  uint64_t v2 = [a1 audioAnalysisEventBulletinBoardNotification];
  BOOL v3 = v2 != 0;

  return v3;
}

- (uint64_t)hf_isSuspended
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 suspendedState];
  return objc_msgSend(v2, "hf_isSuspendedStateSuspended:", v3);
}

+ (uint64_t)hf_isSuspendedStateSuspended:()HFAdditions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 < 4) {
    return (0xCu >> (a3 & 0xF)) & 1;
  }
  id v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Unknown HMAccessorySuspendedState %lu", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)hf_owningBridgeAccessory
{
  if ([a1 isBridged])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke;
    aBlock[3] = &unk_264091718;
    aBlock[4] = a1;
    uint64_t v4 = _Block_copy(aBlock);
    id v5 = +[HFHomePropertyCacheManager sharedManager];
    int v6 = NSStringFromSelector(a2);
    unint64_t v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:3 recalculationBlock:v4];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (id)hf_linkedResidentDevice
{
  uint64_t v2 = [a1 home];
  uint64_t v3 = [v2 residentDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HMAccessory_HFAdditions__hf_linkedResidentDevice__block_invoke;
  v6[3] = &unk_264091FE8;
  v6[4] = a1;
  uint64_t v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);

  return v4;
}

- (uint64_t)hf_areAllServicesInGroups
{
  v1 = objc_msgSend(a1, "hf_visibleServices");
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_27_6);

  return v2;
}

- (uint64_t)hf_isVisibleAccessory
{
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  if ([v2 count]
    || (objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = objc_msgSend(a1, "hf_isRemoteControl");
  }

  return v3;
}

- (uint64_t)hf_showAsAccessoryTile
{
  if (objc_msgSend(a1, "hf_showAsIndividualServices")) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "hf_isSingleServiceAccessory") ^ 1;
  }
}

- (uint64_t)hf_showAsIndividualServices
{
  uint64_t result = objc_msgSend(a1, "hf_canShowAsIndividualServices");
  if (result)
  {
    uint64_t v3 = [a1 applicationData];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"HFAccessoryShowAsIndividualServicesKey"];
    uint64_t v5 = [v4 BOOLValue];

    return v5;
  }
  return result;
}

- (BOOL)hf_canShowAsIndividualServices
{
  if (objc_msgSend(a1, "hf_isSingleServiceAccessory")) {
    return 0;
  }
  uint64_t v2 = [a1 siriEndpointProfile];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [a1 category];
    int v5 = objc_msgSend(v4, "hf_isMediaAccessory");

    if (!v5) {
      return 0;
    }
  }
  if (objc_msgSend(a1, "hf_isProgrammableSwitch"))
  {
    int v6 = objc_msgSend(a1, "hf_visibleServices");
    uint64_t v7 = [v6 count];

    if (v7 == 1) {
      return 0;
    }
  }
  v9 = objc_msgSend(a1, "hf_visibleServices");
  v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_29_1);

  if (objc_msgSend(a1, "hf_isNonServiceBasedAccessory") && objc_msgSend(v10, "count"))
  {
    BOOL v8 = 1;
  }
  else if (objc_msgSend(a1, "hf_isMultiServiceAccessory"))
  {
    BOOL v8 = (unint64_t)[v10 count] > 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (uint64_t)hf_isSingleServiceAccessory
{
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  if ([v2 count] == 1) {
    uint64_t v3 = objc_msgSend(a1, "hf_isNonServiceBasedAccessory") ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_hf_categoryType
{
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];

  if (objc_msgSend(a1, "hf_isCeilingFanWithLight"))
  {
    uint64_t v4 = HMAccessoryCategoryTypeHFAdditionCeilingFanWithLight;
LABEL_17:
    uint64_t v7 = *v4;

    uint64_t v3 = v7;
    goto LABEL_18;
  }
  if (objc_msgSend(a1, "hf_isSensorAccessory"))
  {
    uint64_t v4 = (__CFString **)MEMORY[0x263F0B118];
    goto LABEL_17;
  }
  if (objc_msgSend(a1, "hf_isPowerStrip"))
  {
    uint64_t v4 = HMAccessoryCategoryTypeHFAdditionPowerStrip;
    goto LABEL_17;
  }
  if (objc_msgSend(a1, "hf_isProgrammableSwitch"))
  {
    uint64_t v4 = (__CFString **)MEMORY[0x263F0B0F0];
    goto LABEL_17;
  }
  if (objc_msgSend(a1, "hf_isSprinkler"))
  {
    uint64_t v4 = (__CFString **)MEMORY[0x263F0B140];
    goto LABEL_17;
  }
  if (objc_msgSend(a1, "hf_isVisibleAsBridge"))
  {
    uint64_t v4 = (__CFString **)MEMORY[0x263F0B040];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0B0D0]]
    && objc_msgSend(a1, "hf_isCamera"))
  {
    int v5 = [a1 services];
    int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_205);

    uint64_t v4 = (__CFString **)MEMORY[0x263F0B0A8];
    if (v6) {
      uint64_t v4 = (__CFString **)MEMORY[0x263F0B1B8];
    }
    goto LABEL_17;
  }
LABEL_18:
  return v3;
}

- (uint64_t)hf_isPureBridge
{
  if (!objc_msgSend(a1, "hf_isBridge")) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  if ([v2 count]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = objc_msgSend(a1, "hf_isNonServiceBasedAccessory") ^ 1;
  }

  return v3;
}

- (uint64_t)hf_isVisibleAsBridge
{
  if (objc_msgSend(a1, "hf_isCategorizedAsBridge") && !objc_msgSend(a1, "hf_isSprinkler")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_isPureBridge");
}

- (uint64_t)hf_isCategorizedAsBridge
{
  v1 = [a1 category];
  uint64_t v2 = [v1 categoryType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B040]];

  return v3;
}

- (BOOL)hf_isSprinkler
{
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];
  if ([v3 isEqualToString:*MEMORY[0x263F0B140]])
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = objc_msgSend(a1, "hf_irrigationSystemServices");
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (uint64_t)hf_isPowerStrip
{
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];
  if ([v3 isEqualToString:*MEMORY[0x263F0B0E0]])
  {
    unsigned int v4 = 1;
  }
  else
  {
    int v5 = [a1 category];
    int v6 = [v5 categoryType];
    unsigned int v4 = [v6 isEqualToString:*MEMORY[0x263F0B0D0]];
  }
  uint64_t v7 = [a1 services];
  BOOL v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_23_3);
  unint64_t v9 = [v8 count];

  if (v9 > 2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (uint64_t)hf_isCeilingFanWithLight
{
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];

  if (([v3 isEqualToString:*MEMORY[0x263F0B070]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F0B0D0]])
  {
    unsigned int v4 = objc_msgSend(a1, "hf_visibleServices");
    int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_6_3);

    int v6 = objc_msgSend(a1, "hf_visibleServices");
    int v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_8_3);

    BOOL v8 = objc_msgSend(a1, "hf_visibleServices");
    LODWORD(v6) = objc_msgSend(v8, "na_all:", &__block_literal_global_10_6);

    uint64_t v9 = v5 & v7 & v6;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)hf_irrigationSystemServices
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_51_0);

  return v2;
}

- (BOOL)hf_isSingleSensorAccessory
{
  if (!objc_msgSend(a1, "hf_isSensorAccessory")) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (uint64_t)hf_isSensorAccessory
{
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  BOOL v3 = [a1 category];
  unsigned int v4 = [v3 categoryType];

  if (([v4 isEqualToString:*MEMORY[0x263F0B118]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F0B0D0]])
  {
    uint64_t v5 = objc_msgSend(v2, "na_all:", &__block_literal_global_33_2);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_isBridge
{
  uint64_t v2 = [a1 uniqueIdentifiersForBridgedAccessories];
  if ([v2 count])
  {
    uint64_t v3 = 1;
  }
  else
  {
    unsigned int v4 = [a1 category];
    uint64_t v5 = [v4 categoryType];
    uint64_t v3 = [v5 isEqualToString:*MEMORY[0x263F0B040]];
  }
  return v3;
}

- (BOOL)hf_isMultiServiceAccessory
{
  v1 = objc_msgSend(a1, "hf_visibleServices");
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

- (uint64_t)hf_isSupportedAccessory
{
  BOOL v2 = objc_msgSend(a1, "hf_visibleServices");
  if ([v2 count])
  {
    uint64_t v3 = 1;
  }
  else
  {
    unsigned int v4 = objc_msgSend(a1, "hf_componentServices");
    if ([v4 count])
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v5 = [a1 cameraProfiles];
      if ([v5 count]
        || (objc_msgSend(a1, "hf_isBridge") & 1) != 0
        || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
        || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0)
      {
        uint64_t v3 = 1;
      }
      else
      {
        uint64_t v3 = objc_msgSend(a1, "hf_isRemoteControl");
      }
    }
  }

  return v3;
}

- (id)hf_componentServices
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  unsigned int v4 = _Block_copy(aBlock);
  uint64_t v5 = +[HFHomePropertyCacheManager sharedManager];
  int v6 = NSStringFromSelector(a2);
  int v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:3 recalculationBlock:v4];

  return v7;
}

- (uint64_t)hf_canSyncExternalSettings
{
  if (!objc_msgSend(a1, "hf_isTelevision")) {
    return 1;
  }
  uint64_t result = [a1 isReachable];
  if (result) {
    return objc_msgSend(a1, "hf_isSuspended") ^ 1;
  }
  return result;
}

- (uint64_t)hf_isTelevision
{
  BOOL v2 = [a1 televisionProfiles];
  if ([v2 count])
  {
    uint64_t v3 = 1;
  }
  else
  {
    unsigned int v4 = [a1 category];
    uint64_t v5 = [v4 categoryType];
    if ([v5 isEqualToString:*MEMORY[0x263F0B170]])
    {
      uint64_t v3 = 1;
    }
    else
    {
      int v6 = [a1 category];
      int v7 = [v6 categoryType];
      if ([v7 isEqualToString:*MEMORY[0x263F0B188]])
      {
        uint64_t v3 = 1;
      }
      else
      {
        BOOL v8 = [a1 category];
        uint64_t v9 = [v8 categoryType];
        uint64_t v3 = [v9 isEqualToString:*MEMORY[0x263F0B198]];
      }
    }
  }
  return v3;
}

- (id)hf_categoryOrPrimaryServiceType
{
  BOOL v2 = objc_msgSend(a1, "_hf_categoryType");
  if (([v2 isEqualToString:*MEMORY[0x263F0B0D0]] & 1) != 0
    || objc_msgSend(a1, "hf_isSingleSensorAccessory"))
  {
    uint64_t v3 = objc_msgSend(a1, "hf_primaryService");
    unsigned int v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 serviceType];

      BOOL v2 = (void *)v5;
    }
  }
  return v2;
}

+ (uint64_t)hf_minimumDescriptionsOfAccessories:()HFAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_231);
}

- (id)hf_primaryService
{
  BOOL v2 = objc_msgSend(a1, "hf_standardServices");
  uint64_t v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_53_1);

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [a1 category];
    int v6 = objc_msgSend(v5, "hf_compatibleServiceTypes");

    int v7 = [a1 services];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_2;
    v13[3] = &unk_26408E0E8;
    id v8 = v6;
    id v14 = v8;
    uint64_t v9 = objc_msgSend(v7, "na_filter:", v13);

    if ([v9 count])
    {
      id v4 = [v9 firstObject];
    }
    else
    {
      v10 = [a1 services];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_3;
      v12[3] = &unk_26408E0E8;
      v12[4] = a1;
      objc_msgSend(v10, "na_firstObjectPassingTest:", v12);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (id)hf_servicesBehindBridge
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  id v4 = _Block_copy(aBlock);
  uint64_t v5 = +[HFHomePropertyCacheManager sharedManager];
  int v6 = NSStringFromSelector(a2);
  int v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:3 recalculationBlock:v4];

  return v7;
}

- (id)hf_bridgedAccessories
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [a1 uniqueIdentifiersForBridgedAccessories];
  id v4 = [v2 setWithArray:v3];

  uint64_t v5 = [a1 home];
  int v6 = [v5 accessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HMAccessory_HFAdditions__hf_bridgedAccessories__block_invoke;
  v10[3] = &unk_26408D968;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_filter:", v10);

  return v8;
}

- (uint64_t)hf_requiresFirmwareUpdate
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_102);

  return v2;
}

- (uint64_t)hf_isIdentifiable
{
  if (objc_msgSend(a1, "hf_isTelevision")) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "hf_isMediaAccessory") ^ 1;
  }
}

- (uint64_t)hf_supportsSuspendedState
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 suspendedState];
  return objc_msgSend(v2, "hf_isSuspendedStateSupported:", v3);
}

- (BOOL)hf_isPureProgrammableSwitch
{
  if (!objc_msgSend(a1, "hf_isProgrammableSwitch")) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (uint64_t)hf_isVisibleAsBridgedAccessory
{
  uint64_t result = [a1 isBridged];
  if (result) {
    return objc_msgSend(a1, "hf_isNetworkRouterSatellite") ^ 1;
  }
  return result;
}

- (uint64_t)hf_isDoorbell
{
  uint64_t v2 = [a1 category];
  BOOL v3 = [v2 categoryType];
  if ([v3 isEqualToString:*MEMORY[0x263F0B1B8]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [a1 services];
    uint64_t v4 = objc_msgSend(v5, "na_any:", &__block_literal_global_12_4);
  }
  return v4;
}

- (uint64_t)hf_isNetworkRouter
{
  uint64_t v2 = [a1 category];
  BOOL v3 = [v2 categoryType];
  if ([v3 isEqualToString:*MEMORY[0x263F0B1C0]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [a1 services];
    uint64_t v4 = objc_msgSend(v5, "na_any:", &__block_literal_global_14_5);
  }
  return v4;
}

- (uint64_t)hf_isNetworkRouterSatellite
{
  uint64_t result = objc_msgSend(a1, "hf_isNetworkRouter");
  if (result)
  {
    BOOL v3 = [a1 services];
    uint64_t v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_16_4);

    return v4;
  }
  return result;
}

- (uint64_t)hf_isNotificationSupportedCamera
{
  v1 = [a1 cameraProfiles];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_19_3);

  return v2;
}

- (id)hf_servicesWithBulletinBoardNotificationTurnedOff
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_21_3);

  return v2;
}

- (uint64_t)hf_isSingleServiceLikeAccessory
{
  if (objc_msgSend(a1, "hf_isSingleServiceAccessory")) {
    return objc_msgSend(a1, "hf_isCategorizedAsBridge") ^ 1;
  }
  if (!objc_msgSend(a1, "hf_isProgrammableSwitch")) {
    return 0;
  }
  BOOL v3 = objc_msgSend(a1, "hf_programmableSwitchServices");
  if ([v3 count] == 1) {
    uint64_t v2 = objc_msgSend(a1, "hf_isCategorizedAsBridge") ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)hf_isRestrictedGuestAllowedAccessory
{
  v7[1] = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "hf_primaryService");
  uint64_t v2 = [v1 serviceType];

  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x263F0E6E8];
    v7[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    uint64_t v5 = [v3 doesAccessoryHaveRestrictedGuestCapableServiceTypes:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_showsAsAccessoryInControlCentre
{
  if ((objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isRemoteControl") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "hf_isSensorAccessory") ^ 1;
  }
}

- (BOOL)hf_isMultiSensorAccessory
{
  if (!objc_msgSend(a1, "hf_isSensorAccessory")) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(a1, "hf_visibleServices");
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (uint64_t)hf_shouldSeparateAccessoryName
{
  if (objc_msgSend(a1, "hf_isNonServiceBasedAccessory")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_isPowerStrip");
}

- (id)hf_setShowAsIndividualServices:()HFAdditions
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:");
  BOOL v3 = [a1 applicationData];
  [v3 setObject:v2 forKeyedSubscript:@"HFAccessoryShowAsIndividualServicesKey"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMAccessory_HFAdditions__hf_setShowAsIndividualServices___block_invoke;
  v6[3] = &unk_26408CD50;
  v6[4] = a1;
  uint64_t v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v6];
  return v4;
}

- (id)hf_groupableServices
{
  v1 = objc_msgSend(a1, "hf_visibleServices");
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_49);

  return v2;
}

- (uint64_t)hf_hasInputSourceService
{
  v1 = objc_msgSend(a1, "hf_standardServices");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_55_2);

  return v2;
}

- (id)hf_displayNamesForVisibleTiles
{
  if (objc_msgSend(a1, "hf_isVisibleAccessory")
    && objc_msgSend(a1, "hf_showAsAccessoryTile"))
  {
    uint64_t v2 = (void *)MEMORY[0x263EFFA08];
    BOOL v3 = objc_msgSend(a1, "hf_displayName");
    uint64_t v4 = [v2 setWithObject:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF9C0] set];
    BOOL v3 = objc_msgSend(a1, "hf_visibleServices");
    if (objc_msgSend(a1, "hf_isVisibleAccessory") && !objc_msgSend(v3, "count")
      || (objc_msgSend(a1, "hf_isNonServiceBasedAccessory") & 1) != 0
      || objc_msgSend(a1, "hf_isVisibleAsBridge"))
    {
      uint64_t v5 = objc_msgSend(a1, "hf_displayName");
      [v4 addObject:v5];
    }
    int v6 = objc_msgSend(v3, "na_map:", &__block_literal_global_62);
    [v4 unionSet:v6];
  }
  return v4;
}

- (uint64_t)hf_appPunchOutReason
{
  if ([a1 isAdditionalSetupRequired]) {
    return 1;
  }
  BOOL v3 = [a1 services];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_64_1);

  if (v4) {
    return 2;
  }
  if (!objc_msgSend(a1, "hf_isBridge")) {
    return 0;
  }
  uint64_t v5 = [a1 uniqueIdentifiersForBridgedAccessories];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 0;
  }
  else {
    return 3;
  }
}

- (uint64_t)hf_numberOfProgrammableSwitches
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_66_3);
  uint64_t v3 = [v2 count];

  return v3;
}

- (id)hf_serviceOfType:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 services];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HMAccessory_HFAdditions__hf_serviceOfType___block_invoke;
  v9[3] = &unk_26408E0E8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hf_programmableSwitchServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 services];
  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_68_1);
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA68];
  }
  id v6 = [v1 setWithArray:v5];

  return v6;
}

- (id)hf_programmableSwitchNamespaceServices
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = objc_msgSend(a1, "hf_programmableSwitchServices");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __66__HMAccessory_HFAdditions__hf_programmableSwitchNamespaceServices__block_invoke;
  v7[3] = &unk_264094ED0;
  id v8 = v2;
  id v4 = v2;
  objc_msgSend(v3, "na_each:", v7);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

- (id)hf_networkConfigurationProfiles
{
  v1 = [a1 profiles];
  uint64_t v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_76_0);

  return v2;
}

- (uint64_t)hf_hasManagedNetworkCredential
{
  v1 = objc_msgSend(a1, "hf_networkConfigurationProfiles");
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_80_0);

  return v2;
}

- (uint64_t)hf_needsReprovisioningCheck
{
  if ([a1 reachableTransports]) {
    return 0;
  }
  uint64_t v2 = [a1 home];
  if (objc_msgSend(v2, "hf_isUserAtHome")) {
    uint64_t v3 = [a1 transportTypes] & 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)hf_isDirectlyReachable
{
  return ([a1 reachableTransports] & 3) != 0;
}

+ (id)hf_getUserFriendlyDescriptionKey:()HFAdditions
{
  uint64_t v3 = qword_26AB2F138;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2F138, &__block_literal_global_82_1);
  }
  uint64_t v5 = [(id)qword_26AB2F130 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)hf_userFriendlyLocalizedCapitalizedPluralDescription:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  id v6 = [v5 stringByAppendingString:@"_CategoryCapitalizedPlural"];

  if (v6
    || (objc_msgSend(MEMORY[0x263F0E708], "hf_userFriendlyLocalizedCapitalizedDescription:", v4),
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x263F0B0D0]);
    uint64_t v9 = [v8 stringByAppendingString:@"_CategoryCapitalizedPlural"];
    id v10 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    id v7 = _HFLocalizedStringWithDefaultValue(v6, v10, 0);
  }
  return v7;
}

+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  id v6 = [v5 stringByAppendingString:@"_CategoryCapitalized"];

  if (v6
    || (objc_msgSend(MEMORY[0x263F0E708], "hf_userFriendlyLocalizedCapitalizedDescription:", v4),
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x263F0B0D0]);
    uint64_t v9 = [v8 stringByAppendingString:@"_CategoryCapitalized"];
    id v10 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    id v7 = _HFLocalizedStringWithDefaultValue(v6, v10, 0);
  }
  return v7;
}

+ (id)hf_userFriendlyLocalizedLowercaseDescription:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  id v6 = [v5 stringByAppendingString:@"_CategoryLowercase"];

  if (v6
    || (objc_msgSend(MEMORY[0x263F0E708], "hf_userFriendlyLocalizedLowercaseDescription:", v4),
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x263F0B0D0]);
    uint64_t v9 = [v8 stringByAppendingString:@"_CategoryLowercase"];
    id v10 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    id v7 = _HFLocalizedStringWithDefaultValue(v6, v10, 0);
  }
  return v7;
}

- (id)hf_userFriendlyLocalizedCapitalizedDescription
{
  v1 = objc_msgSend(a1, "hf_categoryOrPrimaryServiceType");
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "hf_userFriendlyLocalizedCapitalizedDescription:", v1);

  return v2;
}

- (id)hf_userFriendlyLocalizedLowercaseDescription
{
  v1 = objc_msgSend(a1, "hf_categoryOrPrimaryServiceType");
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "hf_userFriendlyLocalizedLowercaseDescription:", v1);

  return v2;
}

+ (uint64_t)hf_isSuspendedStateSupported:()HFAdditions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 < 4) {
    return (0xEu >> (a3 & 0xF)) & 1;
  }
  uint64_t v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Unknown HMAccessorySuspendedState %lu", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (uint64_t)hf_needsOnboarding
{
  v1 = objc_msgSend(a1, "hf_siriEndpointProfile");
  uint64_t v2 = [v1 isNeedsOnboarding];

  return v2;
}

- (id)hf_errorForCurrentSessionState
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(a1, "hf_needsOnboarding");
  if ((v2 & 1) != 0
    || (objc_msgSend(a1, "hf_siriEndpointProfile"),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 supportsOnboarding],
        v3,
        !v4))
  {
    uint64_t v6 = -1;
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "hf_siriEndpointProfile");
    uint64_t v6 = [v5 sessionState];
  }
  unint64_t v7 = HFLogForCategory(0x3DuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v2 ^ 1;
    uint64_t v9 = objc_msgSend(a1, "hf_siriEndpointProfile");
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 1024;
    int v15 = [v9 supportsOnboarding];
    __int16 v16 = 2112;
    v17 = a1;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "accessoryIsOnboarded %{BOOL}d supportsOnBoarding %{BOOL}d sessionState from accessory [%@] = %ld", (uint8_t *)v13, 0x22u);
  }
  switch(v6)
  {
    case 0:
      uint64_t v10 = 70;
      goto LABEL_13;
    case 3:
      uint64_t v10 = 72;
      goto LABEL_13;
    case 2:
      uint64_t v10 = 71;
LABEL_13:
      id v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", v10);
      goto LABEL_15;
  }
  id v11 = 0;
LABEL_15:
  return v11;
}

- (void)hf_onboardSiriEndpointIfNeededWithSettingKeyPath:()HFAdditions settingValue:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(a1, "hf_siriEndpointProfile");
  if (v8 && (objc_msgSend(a1, "hf_needsOnboarding") & 1) != 0)
  {
    uint64_t v9 = objc_msgSend(a1, "hf_siriEndpointProfile");
    int v10 = [v9 supportsOnboarding];

    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x263F0E7B0]);
      objc_opt_class();
      id v12 = v7;
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      objc_opt_class();
      id v15 = v12;
      if (objc_opt_isKindOfClass()) {
        __int16 v16 = v15;
      }
      else {
        __int16 v16 = 0;
      }
      id v17 = v16;

      if ([v6 isEqualToString:HFAllowHeySiriSettingKeyPath] && v14)
      {
        -[NSObject setAllowHeySiri:](v11, "setAllowHeySiri:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFSiriLanguageSettingKeyPath] && v17)
      {
        [v11 setLanguageValue:v17];
      }
      else if ([v6 isEqualToString:HFLightWhenUsingSiriSettingKeyPath] && v14)
      {
        -[NSObject setLightWhenUsingSiriEnabled:](v11, "setLightWhenUsingSiriEnabled:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFAirPlayEnabledSettingKeyPath] && v14)
      {
        -[NSObject setAirPlayEnabled:](v11, "setAirPlayEnabled:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFAllowExplicitContentKeyPath] && v14)
      {
        -[NSObject setExplicitContentAllowed:](v11, "setExplicitContentAllowed:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFShareSiriAnalyticsKeyPath] && v14)
      {
        -[NSObject setShareSiriAnalyticsEnabled:](v11, "setShareSiriAnalyticsEnabled:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFDoorbellChimeEnabledKeyPath] && v14)
      {
        -[NSObject setDoorbellChimeEnabled:](v11, "setDoorbellChimeEnabled:", [v14 BOOLValue]);
      }
      else if ([v6 isEqualToString:HFAnnounceEnabledKeyPath] && v14)
      {
        -[NSObject setAnnounceEnabled:](v11, "setAnnounceEnabled:", [v14 BOOLValue]);
      }
      uint64_t v20 = objc_msgSend(a1, "hf_siriEndpointProfile");
      [v20 applyOnboardingSelections:v11 completionHandler:&__block_literal_global_216_1];

      goto LABEL_38;
    }
  }
  else
  {
  }
  id v11 = HFLogForCategory(0x3DuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = objc_msgSend(a1, "hf_needsOnboarding");
    uint64_t v19 = objc_msgSend(a1, "hf_siriEndpointProfile");
    int v21 = 138412802;
    v22 = a1;
    __int16 v23 = 1024;
    int v24 = v18;
    __int16 v25 = 1024;
    int v26 = [v19 supportsOnboarding];
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "NOT Implicitly Onboarding accessory:[%@], hf_needsOnboarding = %{BOOL}d, supportsOnboarding = %{BOOL}d", (uint8_t *)&v21, 0x18u);
  }
LABEL_38:
}

- (uint64_t)hf_shouldHideNearbyAccessoryService:()HFAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 accessory];
  if (objc_msgSend(v5, "hf_isHomePod") & 1) != 0 || (objc_msgSend(v5, "hf_isAppleTV")) {
    goto LABEL_9;
  }
  if (![v5 isEqual:a1])
  {
    if ((objc_msgSend(v5, "hf_isCamera") & 1) == 0)
    {
      int v8 = [v4 serviceType];
      char v9 = [v8 isEqual:*MEMORY[0x263F0D7A8]];

      if ((v9 & 1) == 0)
      {
        id v11 = [v4 serviceType];
        char v12 = [v11 isEqualToString:*MEMORY[0x263F0D7D8]];

        if (v12) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = objc_msgSend(v4, "hf_isInGroup");
        }
        goto LABEL_10;
      }
    }
LABEL_9:
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  id v6 = HFLogForCategory(0x30uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Camera-associated filtering for camera:%@ services:%@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v7 = objc_msgSend(v4, "hf_isDisplayableSensor") ^ 1;
LABEL_10:

  return v7;
}

- (id)hf_allConnectedHomeToCHIPAccessoryPairingFuture
{
  if ([a1 supportsCHIP])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke;
    v9[3] = &unk_26408CD78;
    void v9[4] = a1;
    id v4 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v9];
    uint64_t v5 = [v4 flatMap:&__block_literal_global_220_1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_4;
    v8[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSError_8l;
    v8[4] = a2;
    id v6 = [v5 recover:v8];
  }
  else
  {
    id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];
  }
  return v6;
}

- (id)hf_minimumDescription
{
  int v2 = NSString;
  uint64_t v3 = [a1 name];
  id v4 = [a1 uniqueIdentifier];
  uint64_t v5 = [v2 stringWithFormat:@"<HMAccessory Name:'%@', id: %@>", v3, v4];

  return v5;
}

@end