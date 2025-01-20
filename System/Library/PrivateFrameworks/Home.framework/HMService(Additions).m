@interface HMService(Additions)
+ (id)_hf_allowedChildServicesTypeMap;
+ (id)hf_alarmSensorServiceTypes;
+ (id)hf_defaultServiceSubtypeForServiceType:()Additions;
+ (id)hf_descriptionForServiceSubtype:()Additions;
+ (id)hf_fanServiceTypes;
+ (id)hf_getUserFriendlyDescriptionKey:()Additions;
+ (id)hf_roomsForServices:()Additions;
+ (id)hf_sensorServiceTypes;
+ (id)hf_serviceTypesHiddenFromScenesOrAutomations;
+ (id)hf_standardServiceTypes;
+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()Additions;
+ (id)hf_userFriendlyLocalizedLowercaseDescription:()Additions;
+ (uint64_t)hf_characteristicsInServices:()Additions;
+ (void)hf_serviceComparator;
- (BOOL)hf_isChildService;
- (BOOL)hf_isInGroup;
- (HFServiceDescriptor)hf_serviceDescriptor;
- (id)hf_characteristicEqualToType:()Additions forServiceType:;
- (id)hf_characteristicOfType:()Additions;
- (id)hf_childServices;
- (id)hf_childServicesOfType:()Additions;
- (id)hf_effectiveServiceSubtype;
- (id)hf_effectiveServiceType;
- (id)hf_iconDescriptor;
- (id)hf_lightProfiles;
- (id)hf_parentService;
- (id)hf_serviceGroup;
- (id)hf_updateIconDescriptor:()Additions;
- (id)hf_userFriendlyLocalizedCapitalizedDescription;
- (id)hf_userFriendlyLocalizedLowercaseDescription;
- (uint64_t)_hf_isDirectlyOrIndirectlyLinkedToService:()Additions;
- (uint64_t)hf_canGroupWithService:()Additions;
- (uint64_t)hf_isAlarmSensorService;
- (uint64_t)hf_isCameraContainedMotionSensor;
- (uint64_t)hf_isDisplayableSensor;
- (uint64_t)hf_isFan;
- (uint64_t)hf_isLegacyService;
- (uint64_t)hf_isNetworkRouter;
- (uint64_t)hf_isNetworkRouterSatellite;
- (uint64_t)hf_isSensorService;
- (uint64_t)hf_isTelevision;
- (uint64_t)hf_isVisible;
- (uint64_t)hf_requiresDeviceUnlock;
- (uint64_t)hf_showsAsServiceInControlCentre;
- (uint64_t)hf_supportsGroups;
- (uint64_t)hf_supportsNaturalLighting;
@end

@implementation HMService(Additions)

+ (id)hf_defaultServiceSubtypeForServiceType:()Additions
{
  if ([a3 isEqualToString:*MEMORY[0x263F0D880]]) {
    id v3 = (id)*MEMORY[0x263F0D5B8];
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (HFServiceDescriptor)hf_serviceDescriptor
{
  objc_initWeak(&location, val);
  v2 = [HFServiceDescriptor alloc];
  id v3 = [val serviceType];
  v4 = objc_msgSend(val, "hf_effectiveServiceSubtype");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HMService_Additions__hf_serviceDescriptor__block_invoke;
  v7[3] = &unk_264096B28;
  objc_copyWeak(&v8, &location);
  v5 = [(HFServiceDescriptor *)v2 initWithServiceType:v3 serviceSubtype:v4 parentServiceDescriptorGenerator:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_effectiveServiceSubtype
{
  v2 = [a1 serviceSubtype];
  id v3 = v2;
  if (!v2 || [v2 isEqualToString:*MEMORY[0x263F0D5E8]])
  {
    v4 = objc_opt_class();
    v5 = [a1 serviceType];
    uint64_t v6 = objc_msgSend(v4, "hf_defaultServiceSubtypeForServiceType:", v5);

    id v3 = (void *)v6;
  }
  return v3;
}

- (uint64_t)hf_isSensorService
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sensorServiceTypes");
  id v3 = [a1 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)hf_sensorServiceTypes
{
  if (qword_26AB2F280 != -1) {
    dispatch_once(&qword_26AB2F280, &__block_literal_global_46_2);
  }
  v0 = (void *)qword_26AB2F288;
  return v0;
}

- (uint64_t)hf_isAlarmSensorService
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_alarmSensorServiceTypes");
  id v3 = [a1 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)hf_alarmSensorServiceTypes
{
  if (qword_26AB2F290 != -1) {
    dispatch_once(&qword_26AB2F290, &__block_literal_global_50_0);
  }
  v0 = (void *)qword_26AB2F298;
  return v0;
}

- (id)hf_effectiveServiceType
{
  v2 = [a1 associatedServiceType];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 serviceType];
  }
  v5 = v4;

  return v5;
}

- (id)hf_lightProfiles
{
  v2 = [a1 accessory];
  id v3 = [v2 lightProfiles];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HMService_Additions__hf_lightProfiles__block_invoke;
  v6[3] = &unk_264096B50;
  v6[4] = a1;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

- (uint64_t)hf_isLegacyService
{
  if (!objc_msgSend(a1, "hf_isVisible")) {
    return 0;
  }
  v2 = objc_msgSend(a1, "hf_requiredCharacteristicTypesForDisplayMetadata");
  id v3 = [a1 characteristics];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HMService_Additions__hf_isLegacyService__block_invoke;
  v8[3] = &unk_2640903A0;
  id v9 = v2;
  id v4 = v2;
  v5 = objc_msgSend(v3, "na_filter:", v8);

  uint64_t v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_36_1);
  return v6;
}

- (uint64_t)hf_isVisible
{
  v2 = [a1 accessory];
  id v3 = objc_msgSend(v2, "hf_visibleServices");
  uint64_t v4 = [v3 containsObject:a1];

  return v4;
}

- (id)hf_iconDescriptor
{
  v2 = [a1 applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"HFApplicationDataServiceIconID"];

  if (v3) {
    +[HFServiceIconFactory iconDescriptorWithIdentifier:v3 forService:a1];
  }
  else {
  uint64_t v4 = +[HFServiceIconFactory defaultIconDescriptorForService:a1];
  }

  return v4;
}

- (id)hf_characteristicOfType:()Additions
{
  id v4 = a3;
  v5 = [a1 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMService_Additions__hf_characteristicOfType___block_invoke;
  v9[3] = &unk_2640903A0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (BOOL)hf_isChildService
{
  v1 = objc_msgSend(a1, "hf_parentService");
  BOOL v2 = v1 != 0;

  return v2;
}

+ (id)hf_standardServiceTypes
{
  if (_MergedGlobals_271 != -1) {
    dispatch_once(&_MergedGlobals_271, &__block_literal_global_4_10);
  }
  v0 = (void *)qword_26AB2F248;
  return v0;
}

- (id)hf_parentService
{
  BOOL v2 = [a1 accessory];
  id v3 = objc_msgSend(v2, "hf_standardServices");
  id v4 = (void *)[v3 mutableCopy];

  v5 = [a1 accessory];
  id v6 = objc_msgSend(v5, "hf_owningBridgeAccessory");

  if (v6)
  {
    v7 = objc_msgSend(v6, "hf_standardServices");
    [v4 unionSet:v7];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__HMService_Additions__hf_parentService__block_invoke;
  v11[3] = &unk_26408E0E8;
  v11[4] = a1;
  id v8 = objc_msgSend(v4, "na_filter:", v11);
  if ((unint64_t)[v8 count] < 2)
  {
    id v9 = [v8 anyObject];
  }
  else
  {
    NSLog(&cfstr_FoundMultipleM.isa, a1, v8);
    id v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_isTelevision
{
  v1 = [a1 serviceType];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F0D850]];

  return v2;
}

- (BOOL)hf_isInGroup
{
  v1 = objc_msgSend(a1, "hf_serviceGroup");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)hf_serviceGroup
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__HMService_Additions__hf_serviceGroup__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  id v4 = _Block_copy(aBlock);
  v5 = +[HFHomePropertyCacheManager sharedManager];
  id v6 = NSStringFromSelector(a2);
  v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:2 recalculationBlock:v4];

  return v7;
}

- (id)hf_childServices
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HMService_Additions__hf_childServices__block_invoke;
  aBlock[3] = &unk_264091718;
  aBlock[4] = a1;
  id v4 = _Block_copy(aBlock);
  v5 = +[HFHomePropertyCacheManager sharedManager];
  id v6 = NSStringFromSelector(a2);
  v7 = [v5 valueForObject:a1 key:v6 invalidationReasons:3 recalculationBlock:v4];

  return v7;
}

- (id)hf_childServicesOfType:()Additions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_childServices");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HMService_Additions__hf_childServicesOfType___block_invoke;
  v9[3] = &unk_26408E0E8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

+ (id)hf_fanServiceTypes
{
  if (qword_26AB2F270 != -1) {
    dispatch_once(&qword_26AB2F270, &__block_literal_global_40_2);
  }
  v0 = (void *)qword_26AB2F278;
  return v0;
}

- (uint64_t)hf_isNetworkRouter
{
  BOOL v2 = [a1 serviceType];
  if ([v2 isEqualToString:*MEMORY[0x263F0D898]]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(a1, "hf_isNetworkRouterSatellite");
  }

  return v3;
}

- (uint64_t)hf_isNetworkRouterSatellite
{
  v1 = [a1 serviceType];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F0D8A0]];

  return v2;
}

+ (id)hf_roomsForServices:()Additions
{
  uint64_t v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_8_5);
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_11_5);

  return v4;
}

+ (void)hf_serviceComparator
{
  return &__block_literal_global_15_6;
}

+ (id)hf_serviceTypesHiddenFromScenesOrAutomations
{
  if (qword_26AB2F250 != -1) {
    dispatch_once(&qword_26AB2F250, &__block_literal_global_19_5);
  }
  v0 = (void *)qword_26AB2F258;
  return v0;
}

- (id)hf_updateIconDescriptor:()Additions
{
  id v4 = a3;
  v5 = +[HFServiceIconFactory allIconDescriptorsForService:a1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__HMService_Additions__hf_updateIconDescriptor___block_invoke;
  v15[3] = &unk_26408EBD8;
  id v16 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v15);

  if (v7)
  {
    id v8 = [v6 identifier];
    id v9 = [a1 applicationData];
    [v9 setObject:v8 forKeyedSubscript:@"HFApplicationDataServiceIconID"];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__HMService_Additions__hf_updateIconDescriptor___block_invoke_2;
    v14[3] = &unk_26408CD50;
    v14[4] = a1;
    uint64_t v10 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v14];
  }
  else
  {
    v11 = (void *)MEMORY[0x263F58190];
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    uint64_t v10 = [v11 futureWithError:v8];
  }
  v12 = (void *)v10;

  return v12;
}

- (uint64_t)hf_supportsGroups
{
  if (qword_26AB2F260 != -1) {
    dispatch_once(&qword_26AB2F260, &__block_literal_global_31_2);
  }
  id v2 = (id)qword_26AB2F268;
  uint64_t v3 = objc_msgSend(a1, "hf_effectiveServiceType");
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)hf_showsAsServiceInControlCentre
{
  if ((objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isSensorService") & 1) != 0
    || (objc_msgSend(a1, "hf_isNetworkRouter") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "hf_isNetworkRouterSatellite") ^ 1;
  }
}

- (uint64_t)hf_isFan
{
  id v2 = objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
  uint64_t v3 = [a1 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)hf_isCameraContainedMotionSensor
{
  id v2 = [a1 accessory];
  if (objc_msgSend(v2, "hf_isCamera"))
  {
    uint64_t v3 = [a1 serviceType];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F0D7A8]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_requiresDeviceUnlock
{
  v1 = [a1 characteristics];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_42_1);

  return v2;
}

+ (id)_hf_allowedChildServicesTypeMap
{
  if (qword_26AB2F2A0 != -1) {
    dispatch_once(&qword_26AB2F2A0, &__block_literal_global_55_4);
  }
  v0 = (void *)qword_26AB2F2A8;
  return v0;
}

- (uint64_t)_hf_isDirectlyOrIndirectlyLinkedToService:()Additions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] setWithObject:a1];
  id v6 = [MEMORY[0x263EFF980] arrayWithObject:a1];
  char v7 = v6;
  while ([v6 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    [v7 removeObjectAtIndex:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = objc_msgSend(v8, "linkedServices", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 isEqual:v4])
          {

            uint64_t v15 = 1;
            goto LABEL_16;
          }
          if (([v5 containsObject:v14] & 1) == 0)
          {
            [v5 addObject:v14];
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v6 = v7;
  }
  uint64_t v15 = 0;
LABEL_16:

  return v15;
}

+ (id)hf_descriptionForServiceSubtype:()Additions
{
  id v3 = a3;
  if (qword_26AB2F2B0 != -1) {
    dispatch_once(&qword_26AB2F2B0, &__block_literal_global_67_0);
  }
  id v4 = (id)qword_26AB2F2B8;
  v5 = v4;
  if (v3) {
    [v4 objectForKeyedSubscript:v3];
  }
  else {
  id v6 = [NSString stringWithFormat:@"Custom(%@)", 0];
  }

  return v6;
}

- (uint64_t)hf_canGroupWithService:()Additions
{
  id v4 = a3;
  if (([v4 isEqual:a1] & 1) == 0
    && objc_msgSend(a1, "hf_supportsGroups")
    && objc_msgSend(v4, "hf_supportsGroups"))
  {
    v5 = objc_msgSend(v4, "hf_effectiveServiceType");
    id v6 = objc_msgSend(a1, "hf_effectiveServiceType");
    char v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v10 = objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
      uint64_t v11 = objc_msgSend(v4, "hf_effectiveServiceType");
      if ([v10 containsObject:v11])
      {
        uint64_t v12 = objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
        v13 = objc_msgSend(a1, "hf_effectiveServiceType");
        uint64_t v8 = [v12 containsObject:v13];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (uint64_t)hf_characteristicsInServices:()Additions
{
  return objc_msgSend(a3, "na_flatMap:", &__block_literal_global_92);
}

- (id)hf_characteristicEqualToType:()Additions forServiceType:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 serviceType];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(a1, "hf_characteristicOfType:", v6);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_supportsNaturalLighting
{
  if (+[HFUtilities isRunningInStoreDemoMode]
    || +[HFUtilities isPressDemoModeEnabled])
  {
    return 1;
  }
  id v3 = [a1 home];
  int v4 = objc_msgSend(v3, "hf_enabledResidentsSupportsNaturalLight");

  if (!v4) {
    return 0;
  }
  v5 = objc_msgSend(a1, "hf_lightProfiles");
  uint64_t v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_97_1);

  return v6;
}

- (uint64_t)hf_isDisplayableSensor
{
  uint64_t v2 = [a1 serviceType];
  if ([v2 isEqual:*MEMORY[0x263F0D7A8]])
  {
    uint64_t v3 = 0;
  }
  else
  {
    int v4 = [a1 serviceType];
    if ([v4 isEqual:*MEMORY[0x263F0D768]])
    {
      uint64_t v3 = 0;
    }
    else
    {
      v5 = [a1 serviceType];
      if ([v5 isEqual:*MEMORY[0x263F0D7B8]])
      {
        uint64_t v3 = 0;
      }
      else
      {
        uint64_t v6 = [a1 serviceType];
        if ([v6 isEqual:*MEMORY[0x263F0D630]])
        {
          uint64_t v3 = 0;
        }
        else
        {
          id v7 = [a1 serviceType];
          if ([v7 isEqual:*MEMORY[0x263F0D670]])
          {
            uint64_t v3 = 0;
          }
          else
          {
            uint64_t v8 = [a1 serviceType];
            if ([v8 isEqual:*MEMORY[0x263F0D688]])
            {
              uint64_t v3 = 0;
            }
            else
            {
              int v9 = [a1 serviceType];
              if ([v9 isEqual:*MEMORY[0x263F0D698]])
              {
                uint64_t v3 = 0;
              }
              else
              {
                uint64_t v10 = [a1 serviceType];
                uint64_t v11 = *MEMORY[0x263F0D730];
                if ([v10 isEqual:*MEMORY[0x263F0D730]])
                {
                  uint64_t v3 = 0;
                }
                else
                {
                  id v16 = [a1 serviceType];
                  if ([v16 isEqual:*MEMORY[0x263F0D758]])
                  {
                    uint64_t v3 = 0;
                  }
                  else
                  {
                    uint64_t v15 = [a1 serviceType];
                    if ([v15 isEqual:*MEMORY[0x263F0D7F8]])
                    {
                      uint64_t v3 = 0;
                    }
                    else
                    {
                      v14 = [a1 serviceType];
                      if ([v14 isEqual:*MEMORY[0x263F0D858]])
                      {
                        uint64_t v3 = 0;
                      }
                      else
                      {
                        v13 = [a1 serviceType];
                        uint64_t v3 = [v13 isEqual:v11] ^ 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

+ (id)hf_getUserFriendlyDescriptionKey:()Additions
{
  uint64_t v3 = qword_26AB2F2C8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2F2C8, &__block_literal_global_99);
  }
  v5 = [(id)qword_26AB2F2C0 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()Additions
{
  v1 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:");
  uint64_t v2 = [v1 stringByAppendingString:@"_ServiceTypeCapitalized"];

  uint64_t v3 = _HFLocalizedStringWithDefaultValue(v2, 0, 0);

  return v3;
}

+ (id)hf_userFriendlyLocalizedLowercaseDescription:()Additions
{
  v1 = objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:");
  uint64_t v2 = [v1 stringByAppendingString:@"_ServiceTypeLowercase"];

  uint64_t v3 = _HFLocalizedStringWithDefaultValue(v2, 0, 0);

  return v3;
}

- (id)hf_userFriendlyLocalizedCapitalizedDescription
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 serviceType];
  id v4 = objc_msgSend(v2, "hf_userFriendlyLocalizedCapitalizedDescription:", v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [a1 serviceType];
    id v6 = [v7 localizedCapitalizedString];
  }
  return v6;
}

- (id)hf_userFriendlyLocalizedLowercaseDescription
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 serviceType];
  id v4 = objc_msgSend(v2, "hf_userFriendlyLocalizedLowercaseDescription:", v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [a1 serviceType];
    id v6 = [v7 localizedLowercaseString];
  }
  return v6;
}

@end