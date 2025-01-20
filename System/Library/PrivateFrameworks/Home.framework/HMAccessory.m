@interface HMAccessory
@end

@implementation HMAccessory

uint64_t __51__HMAccessory_HFAdditions__hf_isProgrammableSwitch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

id __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_standardServices");
  v3 = objc_msgSend(*(id *)(a1 + 32), "hf_owningBridgeAccessory");
  v4 = objc_msgSend(v3, "hf_standardServices");
  v5 = [v2 setByAddingObjectsFromSet:v4];

  v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_58_0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_3;
  v9[3] = &unk_26408E0E8;
  v9[4] = *(void *)(a1 + 32);
  v7 = objc_msgSend(v6, "na_filter:", v9);

  return v7;
}

uint64_t __50__HMAccessory_HFAdditions__hf_siriEndpointProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __66__HMAccessory_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(void *)(a1 + 32));
}

uint64_t __63__HMAccessory_HFIncludedContextProtocol___areAllSensorServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

uint64_t __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_childServices");
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrimaryService];
}

uint64_t __53__HMAccessory_HFAdditions__hf_areAllServicesInGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isInGroup");
}

id __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x263F0E708], "hf_standardServiceTypes");
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = [*(id *)(a1 + 32) services];
  v5 = [v3 setWithArray:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke_2;
  v9[3] = &unk_26408E0E8;
  id v10 = v2;
  id v6 = v2;
  v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

uint64_t __55__HMAccessory_HFAdditions__hf_irrigationSystemServices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D740]];

  return v3;
}

uint64_t __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifiersForBridgedAccessories];
  v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

id __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  uint64_t v3 = objc_msgSend(v2, "hf_allBridgeAccessories");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke_2;
  v6[3] = &unk_26408D968;
  v6[4] = *(void *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);

  return v4;
}

id __60__HMAccessory_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_rootAccessoryLikeHomeKitObject");
  if (v3 == *(void **)(a1 + 32))
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:v3];
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_msgSend(v3, "hf_accessoryLikeObject");
LABEL_5:
    id v6 = (void *)v5;
    v7 = [v4 setWithObject:v5];

    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    v7 = objc_msgSend(v3, "hf_accessoryLikeObjects");
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = *(void *)(a1 + 48);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v10 handleFailureInMethod:v11, WeakRetained, @"HomeKit+Abstraction.m", 134, @"%@-%@: root HomeKit object (%@) does not confirm to HFAccessoryLikeObjectVendor or HFAccessoryLikeObjectContainer", v13, v14, v3 object file lineNumber description];

    v7 = 0;
  }
LABEL_6:

  return v7;
}

id __46__HMAccessory_HFAdditions__hf_visibleServices__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_standardServices");
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "hf_componentServices");
  v4 = objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);

  return v4;
}

uint64_t __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __49__HMAccessory_HFAdditions__hf_bridgedAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __83__HMAccessory_HFIncludedContextProtocol__hf_anyNonSensorServiceIsOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isSensorService")) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(v3, "hf_shouldBeOnForContextType:", *(void *)(a1 + 32));
  }

  return v4;
}

void __52__HMAccessory_HFAdditions__hf_isMatterOnlyAccessory__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  _MergedGlobals_256 = [v0 BOOLForKey:@"forceNativeMatter"];
}

uint64_t __43__HMAccessory_HFAdditions__hf_isPowerStrip__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D7D0]];

  return v3;
}

id __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "hf_bridgedAccessories");
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_72_2);
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __53__HMAccessory_AbstractionAdditions__hf_accessoryType__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 associatedServiceType];
  uint64_t v4 = [*(id *)(a1 + 32) associatedServiceType];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __64__HMAccessory_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

void __51__HMAccessory_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  [v5 assignAccessory:*(void *)(a1 + 32) toRoom:*(void *)(a1 + 40) completionHandler:v4];
}

id __59__HMAccessory_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  id v5 = objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);
  id v6 = v5;
  if (!v5) {
    id v5 = v3;
  }
  id v7 = v5;

  return v7;
}

void __51__HMAccessory_HFMediaAdditions__hf_identifyHomePod__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[HFErrorHandler sharedHandler];
    [v5 logError:v4 operationDescription:@"Identify for HomePod"];
  }
  else
  {
    id v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent identify message to accessory: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __51__HMAccessory_HFMediaAdditions___pushSymptomUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 symptoms];
    [v5 symptomsHandler:v3 didUpdateSymptoms:v4];
  }
}

uint64_t __53__HMAccessory_HFMediaAdditions__hf_fakeDebugSymptoms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_setGeneratedByHomeAppForDebuggingPurposes:", 1);
}

uint64_t __53__HMAccessory_HFAdditions__hf_requiresFirmwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isLegacyService"))
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [v2 serviceType];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F0D610]];

    if (v5)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v6 = [v2 characteristics];
      uint64_t v3 = objc_msgSend(v6, "na_any:", &__block_literal_global_4_5);
    }
  }

  return v3;
}

uint64_t __53__HMAccessory_HFAdditions__hf_requiresFirmwareUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263F0E708], "hf_allRequiredCharacteristicTypesForStandardServices");
  id v4 = [v2 characteristicType];
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    uint64_t v6 = [v2 properties];
    uint64_t v7 = [v6 containsObject:*MEMORY[0x263F0BEE8]] ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D780]];

  return v3;
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isFan");
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 serviceType];
  if ([v3 isEqualToString:*MEMORY[0x263F0D780]]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = objc_msgSend(v2, "hf_isFan");
  }

  return v4;
}

uint64_t __41__HMAccessory_HFAdditions__hf_isDoorbell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D6C0]];

  return v3;
}

uint64_t __46__HMAccessory_HFAdditions__hf_isNetworkRouter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

uint64_t __55__HMAccessory_HFAdditions__hf_isNetworkRouterSatellite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouterSatellite");
}

uint64_t __60__HMAccessory_HFAdditions__hf_isNotificationSupportedCamera__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 accessory];
  uint64_t v4 = objc_msgSend(v3, "hf_serviceOfType:", *MEMORY[0x263F0D6C0]);

  int v5 = [v2 accessory];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceOfType:", *MEMORY[0x263F0D7A8]);

  unsigned int v7 = objc_msgSend(v2, "hf_supportsRecordingEvents");
  if (v4) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = v7;
  }
  if (v6) {
    return 1;
  }
  else {
    return v8;
  }
}

uint64_t __77__HMAccessory_HFAdditions__hf_servicesWithBulletinBoardNotificationTurnedOff__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 bulletinBoardNotification];
  if (v3)
  {
    uint64_t v4 = [v2 bulletinBoardNotification];
    uint64_t v5 = [v4 isEnabled] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __58__HMAccessory_HFAdditions__hf_canShowAsIndividualServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService") ^ 1;
}

uint64_t __48__HMAccessory_HFAdditions__hf_isSensorAccessory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

void __59__HMAccessory_HFAdditions__hf_setShowAsIndividualServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

uint64_t __51__HMAccessory_HFAdditions__hf_linkedResidentDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [*(id *)(a1 + 32) device];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __48__HMAccessory_HFAdditions__hf_groupableServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "hf_standardServices");
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t __52__HMAccessory_HFAdditions__hf_hasInputSourceService__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D738]];

  return v3;
}

BOOL __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessory];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __58__HMAccessory_HFAdditions__hf_displayNamesForVisibleTiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

uint64_t __48__HMAccessory_HFAdditions__hf_appPunchOutReason__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isLegacyService");
}

uint64_t __59__HMAccessory_HFAdditions__hf_numberOfProgrammableSwitches__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

uint64_t __45__HMAccessory_HFAdditions__hf_serviceOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serviceType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __57__HMAccessory_HFAdditions__hf_programmableSwitchServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

void __66__HMAccessory_HFAdditions__hf_programmableSwitchNamespaceServices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_labelNamespaceCharacteristic");
  id v6 = [v3 service];

  uint64_t v4 = [v6 serviceType];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0D750]];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

uint64_t __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 services];
}

id __59__HMAccessory_HFAdditions__hf_networkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
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

uint64_t __58__HMAccessory_HFAdditions__hf_hasManagedNetworkCredential__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasManagedNetworkCredential");
}

void __61__HMAccessory_HFAdditions__hf_getUserFriendlyDescriptionKey___block_invoke()
{
  v30[38] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0AFD8];
  v29[0] = *MEMORY[0x263F0AFC8];
  v29[1] = v0;
  v30[0] = @"AirConditioner";
  v30[1] = @"AirDehumidifier";
  uint64_t v1 = *MEMORY[0x263F0B000];
  v29[2] = *MEMORY[0x263F0AFE8];
  v29[3] = v1;
  v30[2] = @"AirHeater";
  v30[3] = @"AirHumidifier";
  uint64_t v2 = *MEMORY[0x263F0B010];
  v29[4] = *MEMORY[0x263F0B018];
  v29[5] = v2;
  v30[4] = @"AirPurifier";
  v30[5] = @"AirPort";
  uint64_t v3 = *MEMORY[0x263F0B038];
  v29[6] = *MEMORY[0x263F0B030];
  v29[7] = v3;
  v30[6] = @"AppleTV";
  v30[7] = @"AudioReceiver";
  uint64_t v4 = *MEMORY[0x263F0B048];
  v29[8] = *MEMORY[0x263F0B040];
  v29[9] = v4;
  v30[8] = @"Bridge";
  v30[9] = @"Door";
  uint64_t v5 = *MEMORY[0x263F0B070];
  v29[10] = *MEMORY[0x263F0B058];
  v29[11] = v5;
  v30[10] = @"DoorLock";
  v30[11] = @"Fan";
  uint64_t v6 = *MEMORY[0x263F0B088];
  v29[12] = *MEMORY[0x263F0B078];
  v29[13] = v6;
  v30[12] = @"Faucet";
  v30[13] = @"GarageDoorOpener";
  uint64_t v7 = *MEMORY[0x263F0B0A8];
  v29[14] = *MEMORY[0x263F0B0A0];
  v29[15] = v7;
  v30[14] = @"HomePod";
  v30[15] = @"IPCamera";
  uint64_t v8 = *MEMORY[0x263F0B0D0];
  v29[16] = *MEMORY[0x263F0B0B8];
  v29[17] = v8;
  v30[16] = @"Lightbulb";
  v30[17] = @"Other";
  uint64_t v9 = *MEMORY[0x263F0B0F0];
  v29[18] = *MEMORY[0x263F0B0E0];
  v29[19] = v9;
  v30[18] = @"Outlet";
  v30[19] = @"ProgrammableSwitch";
  uint64_t v10 = *MEMORY[0x263F0B0F8];
  v30[20] = @"RangeExtender";
  uint64_t v11 = *MEMORY[0x263F0B1C0];
  v29[20] = v10;
  v29[21] = v11;
  v12 = HFLocalizedWiFiStringKeyForKey(@"Router");
  uint64_t v13 = *MEMORY[0x263F0B100];
  v30[21] = v12;
  v30[22] = @"SecuritySystem";
  uint64_t v14 = *MEMORY[0x263F0B118];
  v29[22] = v13;
  v29[23] = v14;
  uint64_t v15 = *MEMORY[0x263F0B120];
  v30[23] = @"Sensor";
  v30[24] = @"ShowerHead";
  uint64_t v16 = *MEMORY[0x263F0B130];
  v29[24] = v15;
  v29[25] = v16;
  uint64_t v17 = *MEMORY[0x263F0B140];
  v30[25] = @"Speaker";
  v30[26] = @"Sprinkler";
  uint64_t v18 = *MEMORY[0x263F0B158];
  v29[26] = v17;
  v29[27] = v18;
  uint64_t v19 = *MEMORY[0x263F0B160];
  v30[27] = @"Switch";
  v30[28] = @"TargetController";
  uint64_t v20 = *MEMORY[0x263F0B170];
  v29[28] = v19;
  v29[29] = v20;
  uint64_t v21 = *MEMORY[0x263F0B188];
  v30[29] = @"Television";
  v30[30] = @"TelevisionSetTopBox";
  uint64_t v22 = *MEMORY[0x263F0B198];
  v29[30] = v21;
  v29[31] = v22;
  uint64_t v23 = *MEMORY[0x263F0B1A8];
  v30[31] = @"TelevisionStreamingStick";
  v30[32] = @"Thermostat";
  uint64_t v24 = *MEMORY[0x263F0B1B8];
  v29[32] = v23;
  v29[33] = v24;
  uint64_t v25 = *MEMORY[0x263F0B1C8];
  v30[33] = @"VideoDoorbell";
  v30[34] = @"Window";
  uint64_t v26 = *MEMORY[0x263F0B1E0];
  v29[34] = v25;
  v29[35] = v26;
  v30[35] = @"WindowCovering";
  v30[36] = @"PowerStrip";
  v29[36] = @"3047A1A5-8BFC-4112-9888-21314F438FF3";
  v29[37] = @"9D302CDA-1467-4E19-ABC9-9ED36BE34508";
  v30[37] = @"Fan";
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:38];
  v28 = (void *)qword_26AB2F130;
  qword_26AB2F130 = v27;
}

uint64_t __44__HMAccessory_HFAdditions___hf_categoryType__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D6C0]];

  return v3;
}

void __90__HMAccessory_HFAdditions__hf_onboardSiriEndpointIfNeededWithSettingKeyPath_settingValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = HFLogForCategory(0x3DuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Implicit Onboarding failed to apply onboarding selections with error: [%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v4 = HFLogForCategory(0x3DuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMSiriEndpointOnboardingResultAsString();
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Implicit Onboarding succeeded with result: [%@]", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchCHIPPairingsWithCompletion:a2];
}

id __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "na_dictionaryWithKeyGenerator:", &__block_literal_global_223);
  uint64_t v3 = [MEMORY[0x263F58190] futureWithResult:v2];

  return v3;
}

uint64_t __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 home];
}

id __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HFLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ failed due to %@", (uint8_t *)&v8, 0x16u);
    }
  }
  int v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];

  return v6;
}

uint64_t __64__HMAccessory_HFAdditions__hf_minimumDescriptionsOfAccessories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldBeOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldBeOnForContextType:", *(void *)(a1 + 32));
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained home];
  char v3 = objc_msgSend(v2, "hf_currentUserIsRestrictedGuest");

  if (v3) {
    goto LABEL_11;
  }
  if (objc_msgSend(WeakRetained, "hf_showAsIndividualServices")) {
    goto LABEL_11;
  }
  if (objc_msgSend(WeakRetained, "hf_isPureBridge")) {
    goto LABEL_11;
  }
  if (objc_msgSend(WeakRetained, "hf_isNetworkRouter")) {
    goto LABEL_11;
  }
  uint64_t v4 = objc_msgSend(WeakRetained, "hf_visibleServices");
  int v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_122);

  if (v5)
  {
    if (!objc_msgSend(WeakRetained, "hf_isNonServiceBasedAccessory")) {
      goto LABEL_11;
    }
  }
  int v6 = [WeakRetained mediaProfile];

  if (!v6) {
    goto LABEL_13;
  }
  id v7 = [WeakRetained home];
  int v8 = objc_msgSend(v7, "hf_mediaSystemForAccessory:", WeakRetained);
  if (!v8)
  {
    uint64_t v9 = [WeakRetained mediaProfile];
    char v10 = [v9 isContainedWithinItemGroup];

    if (v10) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v11 = 1;
LABEL_12:

  return v11;
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

void __92__HMAccessory_HFIncludedContextProtocol__hf_updateValueForCurrentObjectOnly_forContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

uint64_t __65__HMAccessory_HFHomeContainedObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __69__HMAccessory_HFSoftwareUpdateAdditions__hf_softwareUpdateComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = objc_msgSend(a2, "hf_softwareUpdateVersion");
  int v6 = [v5 buildVersion];
  id v7 = objc_msgSend(v4, "hf_softwareUpdateVersion");

  int v8 = [v7 buildVersion];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

void __63__HMAccessory_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateApplicationData:*(void *)(a1 + 32)];
  }
}

void __89__HMAccessory_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    int v5 = [*(id *)(a1 + 32) home];
    int v6 = [v5 residentDevices];
    uint64_t v7 = [v6 count];

    int v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7) {
      int v8 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    int v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v9 = *(unsigned __int8 *)(a1 + 56);
  char v10 = *v8;
  uint64_t v11 = +[HFErrorHandler sharedHandler];
  uint64_t v12 = v11;
  if (v9) {
    [v11 handleError:v15 operationType:v10 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v11 logError:v15 operationDescription:v10];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v14 = [WeakRetained applicationData];
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v14);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke(uint64_t a1, void *a2)
{
  return HFUpdateDateAddedForApplicationDataContainer(a2, *(void **)(a1 + 32));
}

uint64_t __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

@end