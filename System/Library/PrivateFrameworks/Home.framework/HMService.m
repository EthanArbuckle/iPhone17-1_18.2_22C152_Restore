@interface HMService
@end

@implementation HMService

uint64_t __48__HMService_Additions__hf_characteristicOfType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __39__HMService_Additions__hf_serviceGroup__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) home];
  v3 = [v2 serviceGroups];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__HMService_Additions__hf_serviceGroup__block_invoke_2;
  v6[3] = &unk_264092010;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);

  return v4;
}

uint64_t __42__HMService_Additions__hf_isLegacyService__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __40__HMService_Additions__hf_lightProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 services];
  if ([v4 containsObject:*(void *)(a1 + 32)]) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t __42__HMService_Additions__hf_isLegacyService__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 properties];
  uint64_t v3 = [v2 containsObject:*MEMORY[0x263F0BEE8]] ^ 1;

  return v3;
}

id __44__HMService_Additions__hf_serviceDescriptor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "hf_parentService");
  uint64_t v3 = objc_msgSend(v2, "hf_serviceDescriptor");

  return v3;
}

uint64_t __40__HMService_Additions__hf_parentService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_childServices");
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void __47__HMService_Additions__hf_standardServiceTypes__block_invoke_2()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(id)objc_opt_class() _serviceTypeToServiceItemClassMap];
  v1 = [v4 allKeys];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2F248;
  qword_26AB2F248 = v2;
}

uint64_t __55__HMService_AbstractionAdditions__hf_containedProfiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 services];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

id __40__HMService_Additions__hf_childServices__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = [*(id *)(a1 + 32) linkedServices];
  uint64_t v4 = [v2 setWithArray:v3];

  v5 = [*(id *)(a1 + 32) serviceType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0D740]];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) accessory];
    v8 = objc_msgSend(v7, "hf_servicesBehindBridge");
    [v4 unionSet:v8];
  }
  v9 = [*(id *)(a1 + 32) serviceType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0D850]];

  if (v10)
  {
    v11 = (void *)MEMORY[0x263EFFA08];
    v12 = [*(id *)(a1 + 32) accessory];
    v13 = [v12 services];
    v14 = [v11 setWithArray:v13];
    v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_59_2);
    [v4 unionSet:v15];
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__HMService_Additions__hf_childServices__block_invoke_3;
  v20[3] = &unk_26408E0E8;
  v20[4] = *(void *)(a1 + 32);
  v16 = objc_msgSend(v4, "na_filter:", v20);
  [v4 setSet:v16];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __40__HMService_Additions__hf_childServices__block_invoke_4;
  v19[3] = &unk_26408E0E8;
  v19[4] = *(void *)(a1 + 32);
  v17 = objc_msgSend(v4, "na_filter:", v19);

  return v17;
}

uint64_t __77__HMService_HFProgrammableSwitchAdditions__hf_programmableSwitchServiceTypes__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D820], 0);
  uint64_t v1 = qword_26AB2F2D8;
  qword_26AB2F2D8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __42__HMService_Additions__hf_fanServiceTypes__block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D890];
  v5[0] = *MEMORY[0x263F0D6C8];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2F278;
  qword_26AB2F278 = v3;
}

void __50__HMService_Additions__hf_alarmSensorServiceTypes__block_invoke_2()
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D688];
  v6[0] = *MEMORY[0x263F0D670];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D7F8];
  v6[2] = *MEMORY[0x263F0D758];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_26AB2F298;
  qword_26AB2F298 = v4;
}

void __45__HMService_Additions__hf_sensorServiceTypes__block_invoke_2()
{
  v9[11] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D670];
  v9[0] = *MEMORY[0x263F0D630];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D698];
  v9[2] = *MEMORY[0x263F0D688];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D758];
  v9[4] = *MEMORY[0x263F0D730];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0D7A8];
  v9[6] = *MEMORY[0x263F0D768];
  v9[7] = v4;
  uint64_t v5 = *MEMORY[0x263F0D7F8];
  v9[8] = *MEMORY[0x263F0D7B8];
  v9[9] = v5;
  v9[10] = *MEMORY[0x263F0D858];
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:11];
  uint64_t v7 = [v0 setWithArray:v6];
  v8 = (void *)qword_26AB2F288;
  qword_26AB2F288 = v7;
}

void __102__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_sensorCharacteristicTypeForServiceType___block_invoke_2()
{
  v18[11] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BF40];
  uint64_t v1 = *MEMORY[0x263F0D670];
  v17[0] = *MEMORY[0x263F0D630];
  v17[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0BF80];
  v18[0] = v0;
  v18[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0BFB0];
  uint64_t v4 = *MEMORY[0x263F0D698];
  v17[2] = *MEMORY[0x263F0D688];
  v17[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0C008];
  v18[2] = v3;
  v18[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C0E0];
  uint64_t v7 = *MEMORY[0x263F0D758];
  v17[4] = *MEMORY[0x263F0D730];
  v17[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0C238];
  v18[4] = v6;
  v18[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0C0A0];
  uint64_t v10 = *MEMORY[0x263F0D7A8];
  v17[6] = *MEMORY[0x263F0D768];
  v17[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0C288];
  v18[6] = v9;
  v18[7] = v11;
  uint64_t v12 = *MEMORY[0x263F0C2C0];
  uint64_t v13 = *MEMORY[0x263F0D7F8];
  v17[8] = *MEMORY[0x263F0D7B8];
  v17[9] = v13;
  uint64_t v14 = *MEMORY[0x263F0C3F0];
  v18[8] = v12;
  v18[9] = v14;
  v17[10] = *MEMORY[0x263F0D858];
  v18[10] = *MEMORY[0x263F0C110];
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:11];
  v16 = (void *)qword_26AB2F068;
  qword_26AB2F068 = v15;
}

void __49__HMService_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 home];
  uint64_t v5 = [*(id *)(a1 + 32) accessory];
  [v6 assignAccessory:v5 toRoom:*(void *)(a1 + 40) completionHandler:v4];
}

id __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2F070 != -1) {
    dispatch_once(&qword_26AB2F070, block);
  }
  uint64_t v1 = (void *)qword_26AB2F078;
  return v1;
}

void __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hf_standardServiceTypes");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_3;
  v6[3] = &__block_descriptor_40_e25___NSSet_16__0__NSString_8l;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(v2, "na_map:", v6);
  uint64_t v4 = objc_msgSend(v3, "na_setByFlattening");
  uint64_t v5 = (void *)qword_26AB2F078;
  qword_26AB2F078 = v4;
}

uint64_t __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", a2);
}

void __70__HMService_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

uint64_t __44__HMService_Additions__hf_roomsForServices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_parentRoom");
}

uint64_t __44__HMService_Additions__hf_roomsForServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __44__HMService_Additions__hf_serviceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 isPrimaryService];
  if (v6 == [v4 isPrimaryService])
  {
    uint64_t v9 = [v5 instanceID];

    uint64_t v10 = [v4 instanceID];
    uint64_t v8 = [v9 compare:v10];
  }
  else
  {
    int v7 = [v5 isPrimaryService];

    if (v7) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 1;
    }
  }

  return v8;
}

uint64_t __68__HMService_Additions__hf_serviceTypesHiddenFromScenesOrAutomations__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D740], *MEMORY[0x263F0D6D8], *MEMORY[0x263F0D880], 0);
  uint64_t v1 = qword_26AB2F258;
  qword_26AB2F258 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __48__HMService_Additions__hf_updateIconDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __48__HMService_Additions__hf_updateIconDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

void __41__HMService_Additions__hf_supportsGroups__block_invoke_2()
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D7D0];
  v7[0] = *MEMORY[0x263F0D780];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D6C8];
  v7[2] = *MEMORY[0x263F0D828];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D8B8];
  v7[4] = *MEMORY[0x263F0D890];
  v7[5] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  uint64_t v5 = [v0 setWithArray:v4];
  int v6 = (void *)qword_26AB2F268;
  qword_26AB2F268 = v5;
}

uint64_t __39__HMService_Additions__hf_serviceGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 services];
  if ([v4 containsObject:*(void *)(a1 + 32)]) {
    uint64_t v5 = objc_msgSend(v3, "hf_isSupported");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __47__HMService_Additions__hf_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

uint64_t __47__HMService_Additions__hf_childServicesOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __55__HMService_Additions___hf_allowedChildServicesTypeMap__block_invoke_2()
{
  v37[6] = *MEMORY[0x263EF8340];
  v32[0] = *MEMORY[0x263F0D618];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = *MEMORY[0x263F0D6E8];
  v30[0] = *MEMORY[0x263F0D890];
  uint64_t v1 = v30[0];
  v30[1] = v2;
  uint64_t v31 = *MEMORY[0x263F0D7E8];
  uint64_t v3 = v31;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  v23 = [v0 setWithArray:v24];
  v37[0] = v23;
  v32[1] = *MEMORY[0x263F0D720];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  v29[0] = v1;
  v29[1] = v3;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v5 = [v4 setWithArray:v22];
  v37[1] = v5;
  uint64_t v33 = *MEMORY[0x263F0D708];
  uint64_t v6 = v33;
  int v7 = (void *)MEMORY[0x263EFFA08];
  v28[0] = v1;
  v28[1] = v3;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  v37[2] = v9;
  uint64_t v34 = *MEMORY[0x263F0D740];
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = *MEMORY[0x263F0D880];
  uint64_t v11 = v27;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  uint64_t v13 = [v10 setWithArray:v12];
  v37[3] = v13;
  uint64_t v35 = *MEMORY[0x263F0D6D8];
  uint64_t v14 = (void *)MEMORY[0x263EFFA08];
  v26[0] = v6;
  v26[1] = v11;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v16 = [v14 setWithArray:v15];
  v37[4] = v16;
  uint64_t v36 = *MEMORY[0x263F0D850];
  v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = *MEMORY[0x263F0D738];
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v19 = [v17 setWithArray:v18];
  v37[5] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v37 forKeys:v32 count:6];
  v21 = (void *)qword_26AB2F2A8;
  qword_26AB2F2A8 = v20;
}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D738]];

  return v3;
}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "_hf_allowedChildServicesTypeMap");
  uint64_t v5 = [*(id *)(a1 + 32) serviceType];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = [v3 serviceType];
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __40__HMService_Additions__hf_childServices__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_hf_isDirectlyOrIndirectlyLinkedToService:", *(void *)(a1 + 32)) ^ 1;
}

uint64_t __56__HMService_Additions__hf_descriptionForServiceSubtype___block_invoke_2()
{
  void v6[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D5B8];
  v5[0] = *MEMORY[0x263F0D5E8];
  v5[1] = v0;
  v6[0] = @"Unknown";
  v6[1] = @"GenericValve";
  uint64_t v1 = *MEMORY[0x263F0D5D8];
  v5[2] = *MEMORY[0x263F0D5C0];
  void v5[3] = v1;
  v6[2] = @"IrrigationValve";
  v6[3] = @"ShowerheadValve";
  v5[4] = *MEMORY[0x263F0D5F0];
  v6[4] = @"WaterFaucetValve";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  uint64_t v3 = qword_26AB2F2B8;
  qword_26AB2F2B8 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

id __53__HMService_Additions__hf_characteristicsInServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [a2 characteristics];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __50__HMService_Additions__hf_supportsNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 settings];
  uint64_t v3 = [v2 supportedFeatures] & 1;

  return v3;
}

void __57__HMService_Additions__hf_getUserFriendlyDescriptionKey___block_invoke()
{
  v25[45] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D618];
  v24[0] = *MEMORY[0x263F0D610];
  v24[1] = v0;
  v25[0] = @"AccessoryInformation";
  v25[1] = @"AirPurifier";
  uint64_t v1 = *MEMORY[0x263F0D640];
  v24[2] = *MEMORY[0x263F0D630];
  v24[3] = v1;
  v25[2] = @"AirQualitySensor";
  v25[3] = @"Battery";
  uint64_t v2 = *MEMORY[0x263F0D668];
  v24[4] = *MEMORY[0x263F0D648];
  v24[5] = v2;
  v25[4] = @"CameraControl";
  v25[5] = @"CameraRecordingManagement";
  uint64_t v3 = *MEMORY[0x263F0D670];
  v24[6] = *MEMORY[0x263F0D660];
  v24[7] = v3;
  v25[6] = @"CameraRTPStreamManagement";
  v25[7] = @"CarbonDioxideSensor";
  uint64_t v4 = *MEMORY[0x263F0D698];
  v24[8] = *MEMORY[0x263F0D688];
  v24[9] = v4;
  v25[8] = @"CarbonMonoxideSensor";
  v25[9] = @"ContactSensor";
  uint64_t v5 = *MEMORY[0x263F0D6C0];
  v24[10] = *MEMORY[0x263F0D6A8];
  v24[11] = v5;
  v25[10] = @"Door";
  v25[11] = @"Doorbell";
  uint64_t v6 = *MEMORY[0x263F0D6D8];
  v24[12] = *MEMORY[0x263F0D6C8];
  v24[13] = v6;
  v25[12] = @"Fan";
  v25[13] = @"Faucet";
  uint64_t v7 = *MEMORY[0x263F0D6F8];
  v24[14] = *MEMORY[0x263F0D6E8];
  v24[15] = v7;
  v25[14] = @"FilterMaintenance";
  v25[15] = @"GarageDoorOpener";
  uint64_t v8 = *MEMORY[0x263F0D720];
  v24[16] = *MEMORY[0x263F0D708];
  v24[17] = v8;
  v25[16] = @"HeaterCooler";
  v25[17] = @"HumidifierDehumidifier";
  uint64_t v9 = *MEMORY[0x263F0D738];
  v24[18] = *MEMORY[0x263F0D730];
  v24[19] = v9;
  v25[18] = @"HumiditySensor";
  v25[19] = @"InputSource";
  uint64_t v10 = *MEMORY[0x263F0D750];
  v24[20] = *MEMORY[0x263F0D740];
  v24[21] = v10;
  v25[20] = @"IrrigationSystem";
  v25[21] = @"Label";
  uint64_t v11 = *MEMORY[0x263F0D768];
  v24[22] = *MEMORY[0x263F0D758];
  v24[23] = v11;
  v25[22] = @"LeakSensor";
  v25[23] = @"LightSensor";
  uint64_t v12 = *MEMORY[0x263F0D788];
  v24[24] = *MEMORY[0x263F0D780];
  v24[25] = v12;
  v25[24] = @"Lightbulb";
  v25[25] = @"LockManagement";
  uint64_t v13 = *MEMORY[0x263F0D7A0];
  v24[26] = *MEMORY[0x263F0D798];
  v24[27] = v13;
  v25[26] = @"LockMechanism";
  v25[27] = @"Microphone";
  uint64_t v14 = *MEMORY[0x263F0D7B8];
  v24[28] = *MEMORY[0x263F0D7A8];
  v24[29] = v14;
  v25[28] = @"MotionSensor";
  v25[29] = @"OccupancySensor";
  uint64_t v15 = *MEMORY[0x263F0D7D8];
  v24[30] = *MEMORY[0x263F0D7D0];
  v24[31] = v15;
  v25[30] = @"Outlet";
  v25[31] = @"SecuritySystem";
  uint64_t v16 = *MEMORY[0x263F0D7F8];
  v24[32] = *MEMORY[0x263F0D7E8];
  v24[33] = v16;
  v25[32] = @"Slats";
  v25[33] = @"SmokeSensor";
  uint64_t v17 = *MEMORY[0x263F0D818];
  v24[34] = *MEMORY[0x263F0D808];
  v24[35] = v17;
  v25[34] = @"Speaker";
  v25[35] = @"StatefulProgrammableSwitch";
  uint64_t v18 = *MEMORY[0x263F0D828];
  v24[36] = *MEMORY[0x263F0D820];
  v24[37] = v18;
  v25[36] = @"StatelessProgrammableSwitch";
  v25[37] = @"Switch";
  uint64_t v19 = *MEMORY[0x263F0D858];
  v24[38] = *MEMORY[0x263F0D850];
  v24[39] = v19;
  v25[38] = @"Television";
  v25[39] = @"TemperatureSensor";
  uint64_t v20 = *MEMORY[0x263F0D880];
  v24[40] = *MEMORY[0x263F0D870];
  v24[41] = v20;
  v25[40] = @"Thermostat";
  v25[41] = @"Valve";
  uint64_t v21 = *MEMORY[0x263F0D8A8];
  v24[42] = *MEMORY[0x263F0D890];
  v24[43] = v21;
  v25[42] = @"VentilationFan";
  v25[43] = @"Window";
  v24[44] = *MEMORY[0x263F0D8B8];
  v25[44] = @"WindowCovering";
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:45];
  v23 = (void *)qword_26AB2F2C0;
  qword_26AB2F2C0 = v22;
}

uint64_t __78__HMService_HFProgrammableSwitchAdditions__hf_fallbackProgrammableSwitchIndex__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F0E708];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "hf_programmableSwitchServiceTypes");
  uint64_t v5 = [v3 serviceType];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

uint64_t __78__HMService_HFProgrammableSwitchAdditions__hf_fallbackProgrammableSwitchIndex__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v4 uniqueIdentifier];

  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __73__HMService_HFProgrammableSwitchAdditions___hf_firstLinkedServiceOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __59__HMService_HFApplicationData___hf_applicationDataUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) accessory];
    [v4 accessory:v3 didUpdateApplicationDataForService:*(void *)(a1 + 32)];
  }
}

void __87__HMService_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    uint64_t v5 = [*(id *)(a1 + 32) home];
    uint64_t v6 = [v5 residentDevices];
    uint64_t v7 = [v6 count];

    uint64_t v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7) {
      uint64_t v8 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    uint64_t v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v9 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v10 = *v8;
  uint64_t v11 = +[HFErrorHandler sharedHandler];
  uint64_t v12 = v11;
  if (v9) {
    [v11 handleError:v14 operationType:v10 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v11 logError:v14 operationDescription:v10];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_hf_applicationDataUpdated:", *(void *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end