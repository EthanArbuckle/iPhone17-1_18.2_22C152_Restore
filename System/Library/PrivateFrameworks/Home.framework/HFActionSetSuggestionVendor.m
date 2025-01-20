@interface HFActionSetSuggestionVendor
+ (NSSet)supportedBuiltInActionSetTypes;
- (HFActionSetSuggestionFilter)filter;
- (HFActionSetSuggestionVendor)init;
- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4;
- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4 filter:(id)a5;
- (HMActionSet)actionSet;
- (HMHome)home;
- (NSArray)services;
- (id)_actionBuildersForBuiltInActionSetWithType:(id)a3 outDependentServiceTypes:(id *)a4;
- (id)_actionBuildersForCustomActionSet;
- (id)_actionBuildersForCustomActionSetWithService:(id)a3;
- (id)_actionBuildersToSetLightbulbBrightness:(double)a3;
- (id)_actionBuildersToSetLightbulbColorWithPaletteColor:(id)a3;
- (id)_actionBuildersToSetPowerState:(BOOL)a3 forServicesOfTypes:(id)a4;
- (id)_actionBuildersToSetTargetBlindsPositionOpen:(BOOL)a3;
- (id)_actionBuildersToSetTargetDoorState:(int64_t)a3 forServicesOfTypes:(id)a4;
- (id)_actionBuildersToSetTargetLockState:(int64_t)a3 forServicesOfTypes:(id)a4;
- (id)_actionBuildersToSetTargetSecuritySystemState:(int64_t)a3;
- (id)_controlItemValueSourceForService:(id)a3;
- (id)_deriveActionForPrimaryCharacteristic:(id)a3;
- (id)_deriveActionForPrimaryCharacteristic:(id)a3 candidateServices:(id)a4 targetThreshold:(double)a5;
- (id)_deriveActionForSecondaryCharacteristic:(id)a3 candidateServices:(id)a4;
- (id)build;
- (id)buildWithOutDependentServiceTypes:(id *)a3;
@end

@implementation HFActionSetSuggestionVendor

+ (NSSet)supportedBuiltInActionSetTypes
{
  if (_MergedGlobals_297 != -1) {
    dispatch_once(&_MergedGlobals_297, &__block_literal_global_3_26);
  }
  v2 = (void *)qword_26AB2FAA8;
  return (NSSet *)v2;
}

void __61__HFActionSetSuggestionVendor_supportedBuiltInActionSetTypes__block_invoke_2()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0B938];
  v6[0] = *MEMORY[0x263F0B960];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0B908];
  v6[2] = *MEMORY[0x263F0B918];
  v6[3] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_26AB2FAA8;
  qword_26AB2FAA8 = v4;
}

- (HFActionSetSuggestionVendor)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_actionSet_filter_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFActionSetSuggestionVendor.m", 49, @"%s is unavailable; use %@ instead",
    "-[HFActionSetSuggestionVendor init]",
    v5);

  return 0;
}

- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4
{
  return [(HFActionSetSuggestionVendor *)self initWithHome:a3 actionSet:a4 filter:0];
}

- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4 filter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFActionSetSuggestionVendor;
  v12 = [(HFActionSetSuggestionVendor *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a3);
    objc_storeStrong((id *)&v13->_actionSet, a4);
    if (v11)
    {
      uint64_t v14 = [v11 services];
      services = v13->_services;
      v13->_services = (NSArray *)v14;
    }
    else
    {
      services = [v9 accessories];
      uint64_t v16 = objc_msgSend(services, "na_flatMap:", &__block_literal_global_14_9);
      v17 = v13->_services;
      v13->_services = (NSArray *)v16;
    }
  }

  return v13;
}

id __61__HFActionSetSuggestionVendor_initWithHome_actionSet_filter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "hf_visibleServices");
  v3 = [v2 allObjects];

  return v3;
}

- (id)build
{
  return [(HFActionSetSuggestionVendor *)self buildWithOutDependentServiceTypes:0];
}

- (id)buildWithOutDependentServiceTypes:(id *)a3
{
  v5 = [(HFActionSetSuggestionVendor *)self actionSet];
  v6 = [v5 actionSetType];

  v7 = [HFActionSetBuilder alloc];
  v8 = [(HFActionSetSuggestionVendor *)self actionSet];
  id v9 = [(HFActionSetSuggestionVendor *)self home];
  id v10 = [(HFActionSetBuilder *)v7 initWithExistingObject:v8 inHome:v9];

  if ([v6 isEqualToString:*MEMORY[0x263F0B958]]) {
    [(HFActionSetSuggestionVendor *)self _actionBuildersForCustomActionSet];
  }
  else {
  id v11 = [(HFActionSetSuggestionVendor *)self _actionBuildersForBuiltInActionSetWithType:v6 outDependentServiceTypes:a3];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__HFActionSetSuggestionVendor_buildWithOutDependentServiceTypes___block_invoke;
  v14[3] = &unk_264090B88;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "na_each:", v14);

  return v12;
}

uint64_t __65__HFActionSetSuggestionVendor_buildWithOutDependentServiceTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2];
}

- (id)_actionBuildersForBuiltInActionSetWithType:(id)a3 outDependentServiceTypes:(id *)a4
{
  v72[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF9C0] set];
  if ([v6 isEqualToString:*MEMORY[0x263F0B960]])
  {
    uint64_t v9 = *MEMORY[0x263F0D708];
    v72[0] = *MEMORY[0x263F0D780];
    v72[1] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
    id v11 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetPowerState:1 forServicesOfTypes:v10];
    [v7 addObjectsFromArray:v11];

    v12 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetLightbulbBrightness:0.3];
    [v7 addObjectsFromArray:v12];

    v13 = +[HFColorPalette warmWhiteColor];
    uint64_t v14 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetLightbulbColorWithPaletteColor:v13];
    [v7 addObjectsFromArray:v14];

    v15 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetBlindsPositionOpen:1];
    [v7 addObjectsFromArray:v15];

    uint64_t v71 = *MEMORY[0x263F0D8B8];
    uint64_t v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = &v71;
    uint64_t v18 = 1;
LABEL_3:
    id v19 = [v16 arrayWithObjects:v17 count:v18];
    [v8 addObjectsFromArray:v19];
LABEL_13:

    goto LABEL_14;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0B938]])
  {
    v58 = a4;
    if (qword_26AB2FAB0 != -1) {
      dispatch_once(&qword_26AB2FAB0, &__block_literal_global_23_4);
    }
    id v19 = (id)qword_26AB2FAB8;
    v20 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetPowerState:0 forServicesOfTypes:v19];
    [v7 addObjectsFromArray:v20];

    uint64_t v70 = *MEMORY[0x263F0D6F8];
    uint64_t v21 = v70;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
    v23 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetDoorState:1 forServicesOfTypes:v22];
    [v7 addObjectsFromArray:v23];

    uint64_t v69 = *MEMORY[0x263F0D798];
    uint64_t v24 = v69;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
    v26 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetLockState:1 forServicesOfTypes:v25];
    [v7 addObjectsFromArray:v26];

    v27 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetBlindsPositionOpen:0];
    [v7 addObjectsFromArray:v27];

    uint64_t v28 = *MEMORY[0x263F0D7D0];
    v68[0] = *MEMORY[0x263F0D780];
    v68[1] = v28;
    v68[2] = v24;
    v68[3] = v21;
    v68[4] = *MEMORY[0x263F0D8B8];
    v29 = (void *)MEMORY[0x263EFF8C0];
    v30 = v68;
    uint64_t v31 = 5;
LABEL_12:
    v42 = objc_msgSend(v29, "arrayWithObjects:count:", v30, v31, v58);
    [v8 addObjectsFromArray:v42];

    a4 = v59;
    goto LABEL_13;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0B918]])
  {
    v58 = a4;
    if (qword_26AB2FAC0 != -1) {
      dispatch_once(&qword_26AB2FAC0, &__block_literal_global_30_8);
    }
    id v19 = (id)qword_26AB2FAC8;
    v32 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetPowerState:0 forServicesOfTypes:v19];
    [v7 addObjectsFromArray:v32];

    uint64_t v67 = *MEMORY[0x263F0D6F8];
    uint64_t v33 = v67;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
    v35 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetDoorState:1 forServicesOfTypes:v34];
    [v7 addObjectsFromArray:v35];

    uint64_t v66 = *MEMORY[0x263F0D798];
    uint64_t v36 = v66;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
    v38 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetLockState:1 forServicesOfTypes:v37];
    [v7 addObjectsFromArray:v38];

    v39 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetSecuritySystemState:1];
    [v7 addObjectsFromArray:v39];

    uint64_t v40 = *MEMORY[0x263F0D7D0];
    v65[0] = *MEMORY[0x263F0D780];
    v65[1] = v40;
    uint64_t v41 = *MEMORY[0x263F0D890];
    v65[2] = *MEMORY[0x263F0D6C8];
    v65[3] = v41;
    v65[4] = v36;
    v65[5] = v33;
    v65[6] = *MEMORY[0x263F0D7D8];
    v29 = (void *)MEMORY[0x263EFF8C0];
    v30 = v65;
    uint64_t v31 = 7;
    goto LABEL_12;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0B908]])
  {
    uint64_t v46 = *MEMORY[0x263F0D708];
    v64[0] = *MEMORY[0x263F0D780];
    uint64_t v45 = v64[0];
    v64[1] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
    v48 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetPowerState:1 forServicesOfTypes:v47];
    [v7 addObjectsFromArray:v48];

    v49 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetLightbulbBrightness:0.7];
    [v7 addObjectsFromArray:v49];

    v50 = +[HFColorPalette warmWhiteColor];
    v51 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetLightbulbColorWithPaletteColor:v50];
    [v7 addObjectsFromArray:v51];

    uint64_t v63 = *MEMORY[0x263F0D6F8];
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
    v53 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetDoorState:0 forServicesOfTypes:v52];
    [v7 addObjectsFromArray:v53];

    uint64_t v62 = *MEMORY[0x263F0D798];
    uint64_t v54 = v62;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    v56 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetLockState:0 forServicesOfTypes:v55];
    [v7 addObjectsFromArray:v56];

    v57 = [(HFActionSetSuggestionVendor *)self _actionBuildersToSetTargetSecuritySystemState:3];
    [v7 addObjectsFromArray:v57];

    v61[0] = v45;
    v61[1] = v54;
    v61[2] = *MEMORY[0x263F0D7D8];
    uint64_t v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v61;
    uint64_t v18 = 3;
    goto LABEL_3;
  }
LABEL_14:
  if (*a4) {
    *a4 = (id)[v8 copy];
  }
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_7;
  v60[3] = &unk_26408EA88;
  v60[4] = self;
  v43 = objc_msgSend(v7, "na_filter:", v60);

  return v43;
}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_2()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D7D0];
  v5[0] = *MEMORY[0x263F0D780];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0D708];
  v5[2] = *MEMORY[0x263F0D850];
  v5[3] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:4];
  uint64_t v3 = qword_26AB2FAB8;
  qword_26AB2FAB8 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_5()
{
  v6[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D7D0];
  v6[0] = *MEMORY[0x263F0D780];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0D890];
  v6[2] = *MEMORY[0x263F0D6C8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x263F0D708];
  v6[4] = *MEMORY[0x263F0D850];
  void v6[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  uint64_t v4 = qword_26AB2FAC8;
  qword_26AB2FAC8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) actionSet];
  v5 = [v4 actions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_8;
  v9[3] = &unk_264090490;
  id v10 = v3;
  id v6 = v3;
  int v7 = objc_msgSend(v5, "na_any:", v9);

  return v7 ^ 1u;
}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasSameTargetAsAction:a2];
}

- (id)_actionBuildersToSetPowerState:(BOOL)a3 forServicesOfTypes:(id)a4
{
  id v6 = a4;
  int v7 = [(HFActionSetSuggestionVendor *)self services];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HFActionSetSuggestionVendor__actionBuildersToSetPowerState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_264099468;
  id v12 = v6;
  v13 = self;
  BOOL v14 = a3;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

HFCharacteristicWriteActionBuilder *__81__HFActionSetSuggestionVendor__actionBuildersToSetPowerState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 associatedServiceType];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 serviceType];
  }
  int v7 = v6;

  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes", 0);
    uint64_t v9 = (HFCharacteristicWriteActionBuilder *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (HFCharacteristicWriteActionBuilder *)((char *)i + 1))
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = objc_msgSend(v3, "hf_characteristicOfType:", *(void *)(*((void *)&v18 + 1) + 8 * i));
          v13 = v12;
          if (v12 && (objc_msgSend(v12, "hf_isWritable") & 1) != 0)
          {

            BOOL v14 = [HFCharacteristicWriteActionBuilder alloc];
            v15 = [*(id *)(a1 + 40) home];
            uint64_t v9 = [(HFItemBuilder *)v14 initWithHome:v15];

            [(HFCharacteristicWriteActionBuilder *)v9 setCharacteristic:v13];
            uint64_t v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
            [(HFCharacteristicWriteActionBuilder *)v9 setTargetValue:v16];

            id v8 = v13;
            goto LABEL_17;
          }
        }
        uint64_t v9 = (HFCharacteristicWriteActionBuilder *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_actionBuildersToSetLightbulbColorWithPaletteColor:(id)a3
{
  id v4 = a3;
  v5 = [(HFActionSetSuggestionVendor *)self services];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke;
  v9[3] = &unk_264095448;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "na_flatMap:", v9);

  return v7;
}

id __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serviceType];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0D780]];

  if (v5)
  {
    id v6 = [HFColorControlItem alloc];
    int v7 = [*(id *)(a1 + 32) _controlItemValueSourceForService:v3];
    id v8 = [(HFColorControlItem *)v6 initWithValueSource:v7 displayResults:0];

    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:v3];
    BOOL v10 = [(HFColorControlItem *)v8 supportsItemRepresentingServices:v9];

    id v11 = 0;
    if (v10)
    {
      id v12 = [*(id *)(a1 + 40) colorValue];
      v13 = [(HFColorControlItem *)v8 characteristicValuesForValue:v12];

      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      long long v18 = __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke_2;
      long long v19 = &unk_264099490;
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = v3;
      BOOL v14 = objc_msgSend(v13, "na_dictionaryByMappingValues:", &v16);
      id v11 = objc_msgSend(v14, "allValues", v16, v17, v18, v19, v20);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

HFCharacteristicWriteActionBuilder *__82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  int v7 = [HFCharacteristicWriteActionBuilder alloc];
  id v8 = [*(id *)(a1 + 32) home];
  uint64_t v9 = [(HFItemBuilder *)v7 initWithHome:v8];

  BOOL v10 = objc_msgSend(*(id *)(a1 + 40), "hf_characteristicOfType:", v6);

  [(HFCharacteristicWriteActionBuilder *)v9 setCharacteristic:v10];
  [(HFCharacteristicWriteActionBuilder *)v9 setTargetValue:v5];

  return v9;
}

- (id)_actionBuildersToSetLightbulbBrightness:(double)a3
{
  id v5 = [(HFActionSetSuggestionVendor *)self services];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbBrightness___block_invoke;
  v8[3] = &unk_2640994B8;
  *(double *)&v8[5] = a3;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "na_map:", v8);

  return v6;
}

HFCharacteristicWriteActionBuilder *__71__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbBrightness___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serviceType];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0D780]];

  if (v5)
  {
    id v6 = objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x263F0BF68]);
    if (objc_msgSend(v6, "hf_isWritable"))
    {
      int v7 = [v6 metadata];
      id v8 = objc_msgSend(v7, "hf_characteristicValueForPercentage:", *(double *)(a1 + 40));
      if (v8)
      {
        uint64_t v9 = [HFCharacteristicWriteActionBuilder alloc];
        BOOL v10 = [*(id *)(a1 + 32) home];
        id v11 = [(HFItemBuilder *)v9 initWithHome:v10];

        [(HFCharacteristicWriteActionBuilder *)v11 setCharacteristic:v6];
        [(HFCharacteristicWriteActionBuilder *)v11 setTargetValue:v8];
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_actionBuildersToSetTargetDoorState:(int64_t)a3 forServicesOfTypes:(id)a4
{
  id v6 = a4;
  int v7 = [(HFActionSetSuggestionVendor *)self services];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HFActionSetSuggestionVendor__actionBuildersToSetTargetDoorState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_2640994E0;
  id v12 = v6;
  v13 = self;
  int64_t v14 = a3;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

HFCharacteristicWriteActionBuilder *__86__HFActionSetSuggestionVendor__actionBuildersToSetTargetDoorState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  int v5 = [v3 serviceType];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x263F0C4A8]);
    int v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      id v8 = [HFCharacteristicWriteActionBuilder alloc];
      uint64_t v9 = [*(id *)(a1 + 40) home];
      BOOL v10 = [(HFItemBuilder *)v8 initWithHome:v9];

      [(HFCharacteristicWriteActionBuilder *)v10 setCharacteristic:v7];
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [(HFCharacteristicWriteActionBuilder *)v10 setTargetValue:v11];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetLockState:(int64_t)a3 forServicesOfTypes:(id)a4
{
  id v6 = a4;
  int v7 = [(HFActionSetSuggestionVendor *)self services];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HFActionSetSuggestionVendor__actionBuildersToSetTargetLockState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_2640994E0;
  id v12 = v6;
  v13 = self;
  int64_t v14 = a3;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

HFCharacteristicWriteActionBuilder *__86__HFActionSetSuggestionVendor__actionBuildersToSetTargetLockState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  int v5 = [v3 serviceType];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x263F0C510]);
    int v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      id v8 = [HFCharacteristicWriteActionBuilder alloc];
      uint64_t v9 = [*(id *)(a1 + 40) home];
      BOOL v10 = [(HFItemBuilder *)v8 initWithHome:v9];

      [(HFCharacteristicWriteActionBuilder *)v10 setCharacteristic:v7];
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [(HFCharacteristicWriteActionBuilder *)v10 setTargetValue:v11];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetSecuritySystemState:(int64_t)a3
{
  int v5 = [(HFActionSetSuggestionVendor *)self services];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__HFActionSetSuggestionVendor__actionBuildersToSetTargetSecuritySystemState___block_invoke;
  v8[3] = &unk_2640994B8;
  v8[4] = self;
  v8[5] = a3;
  id v6 = objc_msgSend(v5, "na_map:", v8);

  return v6;
}

HFCharacteristicWriteActionBuilder *__77__HFActionSetSuggestionVendor__actionBuildersToSetTargetSecuritySystemState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_characteristicOfType:", *MEMORY[0x263F0C548]);
  id v4 = v3;
  if (v3 && objc_msgSend(v3, "hf_isWritable"))
  {
    int v5 = [v4 metadata];
    if (v5
      && ([NSNumber numberWithInteger:*(void *)(a1 + 40)],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = objc_msgSend(v5, "hf_isValidValue:", v6),
          v6,
          !v7))
    {
      BOOL v10 = 0;
    }
    else
    {
      id v8 = [HFCharacteristicWriteActionBuilder alloc];
      uint64_t v9 = [*(id *)(a1 + 32) home];
      BOOL v10 = [(HFItemBuilder *)v8 initWithHome:v9];

      [(HFCharacteristicWriteActionBuilder *)v10 setCharacteristic:v4];
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
      [(HFCharacteristicWriteActionBuilder *)v10 setTargetValue:v11];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetBlindsPositionOpen:(BOOL)a3
{
  int v5 = [(HFActionSetSuggestionVendor *)self services];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HFActionSetSuggestionVendor__actionBuildersToSetTargetBlindsPositionOpen___block_invoke;
  v8[3] = &unk_264099508;
  BOOL v9 = a3;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "na_map:", v8);

  return v6;
}

HFCharacteristicWriteActionBuilder *__76__HFActionSetSuggestionVendor__actionBuildersToSetTargetBlindsPositionOpen___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serviceType];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0D8B8]];

  if (v5)
  {
    id v6 = objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x263F0C520]);
    int v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      int v8 = *(unsigned __int8 *)(a1 + 40);
      BOOL v9 = [v7 metadata];
      BOOL v10 = v9;
      if (v8) {
        [v9 maximumValue];
      }
      else {
      id v12 = [v9 minimumValue];
      }

      if (!v12)
      {
        if (*(unsigned char *)(a1 + 40)) {
          v13 = &unk_26C0F8048;
        }
        else {
          v13 = &unk_26C0F8058;
        }
        id v12 = v13;
      }
      int64_t v14 = [HFCharacteristicWriteActionBuilder alloc];
      v15 = [*(id *)(a1 + 32) home];
      id v11 = [(HFItemBuilder *)v14 initWithHome:v15];

      [(HFCharacteristicWriteActionBuilder *)v11 setCharacteristic:v7];
      [(HFCharacteristicWriteActionBuilder *)v11 setTargetValue:v12];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_actionBuildersForCustomActionSet
{
  id v3 = [(HFActionSetSuggestionVendor *)self services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HFActionSetSuggestionVendor__actionBuildersForCustomActionSet__block_invoke;
  v6[3] = &unk_264099530;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_flatMap:", v6);

  return v4;
}

uint64_t __64__HFActionSetSuggestionVendor__actionBuildersForCustomActionSet__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _actionBuildersForCustomActionSetWithService:a2];
}

- (id)_actionBuildersForCustomActionSetWithService:(id)a3
{
  id v4 = a3;
  int v5 = [v4 serviceType];
  id v6 = +[HFActionSetServiceSuggestionMetadata metadataForServiceType:v5];

  if (v6)
  {
    int v7 = [v6 primaryCharacteristicType];
    int v8 = objc_msgSend(v4, "hf_characteristicOfType:", v7);

    if (v8 && objc_msgSend(v8, "hf_isWritable"))
    {
      BOOL v9 = [(HFActionSetSuggestionVendor *)self actionSet];
      BOOL v10 = objc_msgSend(v9, "hf_characteristicWriteActions");
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke;
      v28[3] = &unk_264099298;
      id v11 = v4;
      id v29 = v11;
      char v12 = objc_msgSend(v10, "na_any:", v28);

      if (v12)
      {
        v13 = 0;
      }
      else
      {
        int64_t v14 = [(HFActionSetSuggestionVendor *)self _deriveActionForPrimaryCharacteristic:v8];
        if (v14)
        {
          v15 = [MEMORY[0x263EFF980] arrayWithObject:v14];
          if (([v14 isMutuallyExclusiveAction] & 1) == 0)
          {
            uint64_t v16 = [v14 matchingExistingActions];
            uint64_t v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_48_4);

            long long v18 = [v6 secondaryCharacteristicTypes];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_3;
            v24[3] = &unk_264099558;
            id v25 = v11;
            v26 = self;
            id v27 = v17;
            id v19 = v17;
            uint64_t v20 = objc_msgSend(v18, "na_map:", v24);
            [v15 addObjectsFromArray:v20];
          }
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_4;
          v22[3] = &unk_264099580;
          v22[4] = self;
          id v23 = v11;
          v13 = objc_msgSend(v15, "na_map:", v22);
        }
        else
        {
          v13 = 0;
        }
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristic];
  id v4 = [v3 service];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

id __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 characteristic];
  id v3 = [v2 service];

  return v3;
}

id __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_characteristicOfType:", a2);
  id v4 = [*(id *)(a1 + 40) _deriveActionForSecondaryCharacteristic:v3 candidateServices:*(void *)(a1 + 48)];

  return v4;
}

HFCharacteristicWriteActionBuilder *__76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HFCharacteristicWriteActionBuilder alloc];
  uint64_t v5 = [*(id *)(a1 + 32) home];
  id v6 = [(HFItemBuilder *)v4 initWithHome:v5];

  int v7 = *(void **)(a1 + 40);
  int v8 = [v3 characteristic];
  BOOL v9 = [v8 characteristicType];
  BOOL v10 = objc_msgSend(v7, "hf_characteristicOfType:", v9);
  [(HFCharacteristicWriteActionBuilder *)v6 setCharacteristic:v10];

  id v11 = [v3 targetValue];

  [(HFCharacteristicWriteActionBuilder *)v6 setTargetValue:v11];
  return v6;
}

- (id)_deriveActionForPrimaryCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(HFActionSetSuggestionVendor *)self home];
  int v7 = [v6 accessories];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke;
  v23[3] = &unk_2640995A8;
  id v8 = v4;
  id v24 = v8;
  BOOL v9 = objc_msgSend(v7, "na_map:", v23);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_2;
  v22[3] = &unk_26408E0E8;
  v22[4] = self;
  BOOL v10 = objc_msgSend(v9, "na_filter:", v22);
  id v11 = [v5 setWithArray:v10];

  char v12 = [v8 service];
  v13 = [v12 accessory];
  int64_t v14 = [v13 room];
  v15 = [v14 uniqueIdentifier];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_3;
  v20[3] = &unk_26408E0E8;
  id v21 = v15;
  id v16 = v15;
  uint64_t v17 = objc_msgSend(v11, "na_filter:", v20);
  long long v18 = [(HFActionSetSuggestionVendor *)self _deriveActionForPrimaryCharacteristic:v8 candidateServices:v17 targetThreshold:0.5];
  if (!v18)
  {
    long long v18 = [(HFActionSetSuggestionVendor *)self _deriveActionForPrimaryCharacteristic:v8 candidateServices:v11 targetThreshold:0.5];
  }

  return v18;
}

id __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 service];
  uint64_t v5 = [v4 serviceType];
  id v6 = objc_msgSend(v3, "hf_serviceOfType:", v5);

  return v6;
}

uint64_t __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 services];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

uint64_t __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  id v4 = [v3 room];
  int v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (id)_deriveActionForPrimaryCharacteristic:(id)a3 candidateServices:(id)a4 targetThreshold:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(HFActionSetSuggestionVendor *)self actionSet];
  id v11 = objc_msgSend(v10, "hf_characteristicWriteActions");
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __103__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic_candidateServices_targetThreshold___block_invoke;
  id v29 = &unk_264099228;
  id v12 = v9;
  id v30 = v12;
  id v13 = v8;
  id v31 = v13;
  int64_t v14 = objc_msgSend(v11, "na_filter:", &v26);

  if (objc_msgSend(v14, "count", v26, v27, v28, v29))
  {
    v15 = (void *)MEMORY[0x263F0E248];
    id v16 = [v13 characteristicType];
    uint64_t v17 = objc_msgSend(v15, "hf_suggestionVendorForCharacteristicType:", v16);

    long long v18 = [v17 suggestedActionForCharacteristic:v13 candidateActions:v14];
    id v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 matchingExistingActions];
      double v21 = (double)(unint64_t)[v20 count];
      double v22 = v21 / (double)(unint64_t)[v12 count];

      if (v22 < a5) {
        id v23 = 0;
      }
      else {
        id v23 = v19;
      }
      id v24 = v23;
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

uint64_t __103__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic_candidateServices_targetThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  int v5 = [v3 characteristic];
  uint64_t v6 = [v5 service];
  if ([v4 containsObject:v6])
  {
    int v7 = [v3 characteristic];
    id v8 = [v7 characteristicType];
    id v9 = [*(id *)(a1 + 40) characteristicType];
    uint64_t v10 = [v8 isEqualToString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_deriveActionForSecondaryCharacteristic:(id)a3 candidateServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && objc_msgSend(v6, "hf_isWritable"))
  {
    id v8 = [(HFActionSetSuggestionVendor *)self actionSet];
    id v9 = objc_msgSend(v8, "hf_characteristicWriteActions");
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    id v19 = __89__HFActionSetSuggestionVendor__deriveActionForSecondaryCharacteristic_candidateServices___block_invoke;
    uint64_t v20 = &unk_264099228;
    id v10 = v6;
    id v21 = v10;
    id v22 = v7;
    id v11 = objc_msgSend(v9, "na_filter:", &v17);

    if (objc_msgSend(v11, "count", v17, v18, v19, v20))
    {
      id v12 = (void *)MEMORY[0x263F0E248];
      id v13 = [v10 characteristicType];
      int64_t v14 = objc_msgSend(v12, "hf_suggestionVendorForCharacteristicType:", v13);

      v15 = [v14 suggestedActionForCharacteristic:v10 candidateActions:v11];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __89__HFActionSetSuggestionVendor__deriveActionForSecondaryCharacteristic_candidateServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristic];
  int v5 = [v4 service];
  id v6 = [v5 serviceType];
  id v7 = [*(id *)(a1 + 32) service];
  id v8 = [v7 serviceType];
  if ([v6 isEqualToString:v8])
  {
    id v9 = [v3 characteristic];
    id v10 = [v9 characteristicType];
    id v11 = [*(id *)(a1 + 32) characteristicType];
    if ([v10 isEqualToString:v11])
    {
      id v12 = *(void **)(a1 + 40);
      id v16 = [v3 characteristic];
      [v16 service];
      v13 = uint64_t v17 = v9;
      uint64_t v14 = [v12 containsObject:v13];

      id v9 = v17;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_controlItemValueSourceForService:(id)a3
{
  id v3 = a3;
  id v4 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  int v5 = objc_alloc_init(HFNullValueSource);
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [v3 characteristics];
  id v8 = [v6 setWithArray:v7];
  id v9 = objc_msgSend(v3, "hf_serviceDescriptor");

  id v10 = [(HFSimpleAggregatedCharacteristicValueSource *)v4 initWithValueSource:v5 characteristics:v8 primaryServiceDescriptor:v9];
  return v10;
}

- (HFActionSetSuggestionFilter)filter
{
  return self->_filter;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end