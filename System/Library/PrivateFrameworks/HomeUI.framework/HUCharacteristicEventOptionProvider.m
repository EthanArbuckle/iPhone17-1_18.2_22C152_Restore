@interface HUCharacteristicEventOptionProvider
+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3;
+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3 allowingSensors:(BOOL)a4;
+ (BOOL)hasOptionsForServiceVendingItem:(id)a3 outCharacteristicType:(id *)a4;
+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4;
+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4 allowingSensors:(BOOL)a5;
+ (BOOL)homeHubUpdateRequiredForServices:(id)a3 forHome:(id)a4;
+ (id)_characteristicTypesRequiringUpdatedHomeHubs;
+ (id)_supportedCharacteristicTypes;
+ (id)characteristicTypeWithOptionsForServices:(id)a3;
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFCharacteristicValueSource)overrideValueSource;
- (HFServiceVendor)serviceVendingItem;
- (HMHome)home;
- (HUCharacteristicEventOptionProvider)init;
- (HUCharacteristicEventOptionProvider)initWithServiceVendingItem:(id)a3 home:(id)a4;
- (NSMutableSet)optionItems;
- (id)_notifyingCharacteristicsKeyedByTypeForServices:(id)a3;
- (id)_optionsForCharacteristicType:(id)a3 characteristics:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (id)valueSource;
- (void)setEventBuilderItem:(id)a3;
- (void)setFilter:(id)a3;
- (void)setOptionItems:(id)a3;
- (void)setOverrideValueSource:(id)a3;
- (void)setServiceVendingItem:(id)a3;
@end

@implementation HUCharacteristicEventOptionProvider

- (HUCharacteristicEventOptionProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithServiceVendingItem_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCharacteristicEventOptionProvider.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUCharacteristicEventOptionProvider init]",
    v5);

  return 0;
}

- (HUCharacteristicEventOptionProvider)initWithServiceVendingItem:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventOptionProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_serviceVendingItem, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    optionItems = v10->_optionItems;
    v10->_optionItems = (NSMutableSet *)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUCharacteristicEventOptionProvider *)self serviceVendingItem];
  v6 = [(HUCharacteristicEventOptionProvider *)self home];
  id v7 = (void *)[v4 initWithServiceVendingItem:v5 home:v6];

  return v7;
}

- (id)reloadItems
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(HUCharacteristicEventOptionProvider *)self serviceVendingItem];
  v5 = [v4 services];

  v6 = [(HUCharacteristicEventOptionProvider *)self serviceVendingItem];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HUCharacteristicEventOptionProvider *)self serviceVendingItem];
    int v9 = [v8 shouldReduceOptionItemsForNotifyingCharacteristics];
  }
  else
  {
    int v9 = 1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6392028;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  uint64_t v11 = (void (**)(void, void))v10;
  if (v9)
  {
    (*((void (**)(void *, void *))v10 + 2))(v10, v5);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v3 unionSet:v12];
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v33 = self;
      v34 = v5;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", *(void *)(*((void *)&v35 + 1) + 8 * i), v33, v34, (void)v35);
          v18 = ((void (**)(void, void *))v11)[2](v11, v17);
          [v3 unionSet:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v14);
      self = v33;
      v5 = v34;
    }
  }

  v19 = [(HUCharacteristicEventOptionProvider *)self filter];

  if (v19)
  {
    v20 = [(HUCharacteristicEventOptionProvider *)self filter];
    v21 = objc_msgSend(v3, "na_filter:", v20);
    uint64_t v22 = [v21 mutableCopy];

    v3 = (void *)v22;
  }
  v23 = (void *)MEMORY[0x1E4F69570];
  v24 = [(HUCharacteristicEventOptionProvider *)self optionItems];
  v25 = [v23 diffFromSet:v24 toSet:v3];

  id v26 = objc_alloc(MEMORY[0x1E4F69210]);
  v27 = [v25 additions];
  v28 = [v25 deletions];
  v29 = [v25 updates];
  v30 = (void *)[v26 initWithAddedItems:v27 removedItems:v28 existingItems:v29];

  [(HUCharacteristicEventOptionProvider *)self setOptionItems:v3];
  v31 = [MEMORY[0x1E4F7A0D8] futureWithResult:v30];

  return v31;
}

id __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v5 = [*(id *)(a1 + 32) _notifyingCharacteristicsKeyedByTypeForServices:v3];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6392000;
  v10[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  char v7 = v11;
  id v8 = v6;

  return v8;
}

void __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) eventBuilderItem];
  char v7 = [v6 characteristics];
  uint64_t v8 = [v7 count];

  if (!v8
    || ([*(id *)(a1 + 32) eventBuilderItem],
        int v9 = objc_claimAutoreleasedReturnValue(),
        [v9 characteristics],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v5 intersectsSet:v10],
        v10,
        v9,
        v11))
  {
    id v12 = [*(id *)(a1 + 32) _optionsForCharacteristicType:v13 characteristics:v5];
    if (v12) {
      [*(id *)(a1 + 40) unionSet:v12];
    }
  }
}

- (id)invalidationReasons
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUCharacteristicEventOptionProvider;
  v2 = [(HFItemProvider *)&v8 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686E8];
  v9[0] = *MEMORY[0x1E4F686E0];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F686B0];
  v9[2] = *MEMORY[0x1E4F686F8];
  v9[3] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  id v6 = [v2 setByAddingObjectsFromArray:v5];

  return v6;
}

+ (BOOL)hasOptionsForServiceVendingItem:(id)a3 outCharacteristicType:(id *)a4
{
  id v6 = [a3 services];
  LOBYTE(a4) = [a1 hasOptionsForServices:v6 outCharacteristicType:a4];

  return (char)a4;
}

+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3
{
  return [a1 hasOptionsForAnyServiceInHome:a3 allowingSensors:1];
}

+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3 allowingSensors:(BOOL)a4
{
  id v6 = [a3 accessories];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__HUCharacteristicEventOptionProvider_hasOptionsForAnyServiceInHome_allowingSensors___block_invoke;
  v9[3] = &__block_descriptor_41_e21_B16__0__HMAccessory_8l;
  v9[4] = a1;
  BOOL v10 = a4;
  char v7 = objc_msgSend(v6, "na_any:", v9);

  return v7;
}

uint64_t __85__HUCharacteristicEventOptionProvider_hasOptionsForAnyServiceInHome_allowingSensors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [a2 services];
  id v6 = [v4 setWithArray:v5];
  uint64_t v7 = [v3 hasOptionsForServices:v6 outCharacteristicType:0 allowingSensors:*(unsigned __int8 *)(a1 + 40)];

  return v7;
}

+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4
{
  return [a1 hasOptionsForServices:a3 outCharacteristicType:a4 allowingSensors:1];
}

+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4 allowingSensors:(BOOL)a5
{
  id v8 = a3;
  int v9 = [a1 _supportedCharacteristicTypes];
  if (!a5)
  {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    uint64_t v11 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);

    int v9 = (void *)v11;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__34;
  uint64_t v22 = __Block_byref_object_dispose__34;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke;
  v15[3] = &unk_1E6392098;
  id v12 = v9;
  id v16 = v12;
  v17 = &v18;
  char v13 = objc_msgSend(v8, "na_any:", v15);
  if (a4) {
    *a4 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke_2;
  v8[3] = &unk_1E6392070;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  uint64_t v6 = objc_msgSend(v3, "na_any:", v8);

  return v6;
}

uint64_t __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 characteristicType];
  uint64_t v6 = [v4 containsObject:v5];
  if (v6)
  {
    uint64_t v7 = [v3 properties];
    int v8 = [v7 containsObject:*MEMORY[0x1E4F2CE40]];

    if (!v8)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = [v3 characteristicType];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

LABEL_6:
  return v6;
}

+ (id)characteristicTypeWithOptionsForServices:(id)a3
{
  id v8 = 0;
  int v3 = [a1 hasOptionsForServices:a3 outCharacteristicType:&v8];
  id v4 = v8;
  uint64_t v5 = v4;
  if (!v3) {
    id v4 = 0;
  }
  id v6 = v4;

  return v6;
}

+ (BOOL)homeHubUpdateRequiredForServices:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _characteristicTypesRequiringUpdatedHomeHubs];
  LOBYTE(a1) = objc_msgSend(v7, "hf_supportsSharedEventAutomation");

  if (a1)
  {
    char v9 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke;
    v11[3] = &unk_1E6387048;
    id v12 = v8;
    char v9 = objc_msgSend(v6, "na_any:", v11);
  }
  return v9;
}

uint64_t __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke_2;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_notifyingCharacteristicsKeyedByTypeForServices:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    uint64_t v5 = *MEMORY[0x1E4F2CE40];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = [v7 characteristics];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              char v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v14 = [v13 properties];
              int v15 = [v14 containsObject:v5];

              if (v15)
              {
                id v16 = [v13 characteristicType];
                if (v16)
                {
                  v17 = [v4 objectForKeyedSubscript:v16];

                  if (v17)
                  {
                    uint64_t v18 = [v4 objectForKeyedSubscript:v16];
                    [v18 addObject:v13];
                  }
                  else
                  {
                    uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithObject:v13];
                    [v4 setObject:v18 forKeyedSubscript:v16];
                  }
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

  return v4;
}

- (id)_optionsForCharacteristicType:(id)a3 characteristics:(id)a4
{
  v66[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] set];
  v49 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke;
  v64[3] = &unk_1E6387020;
  id v10 = v6;
  id v65 = v10;
  v50 = objc_msgSend(v7, "na_firstObjectPassingTest:", v64);
  int v11 = objc_msgSend(v7, "na_any:", &__block_literal_global_288);
  uint64_t v12 = objc_opt_class();
  char v13 = [(HUCharacteristicEventOptionProvider *)self valueSource];
  uint64_t v14 = *MEMORY[0x1E4F2CF58];
  v66[0] = *MEMORY[0x1E4F2CF38];
  v66[1] = v14;
  v66[2] = *MEMORY[0x1E4F2CE88];
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  int v16 = [v15 containsObject:v10];

  if (v16) {
    goto LABEL_2;
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_valueRangeCharacteristicTypes");
  int v19 = [v18 containsObject:v10];

  if (v19)
  {
    uint64_t v20 = objc_msgSend(v50, "hf_maximumTriggerValue");
    uint64_t v21 = objc_msgSend(v50, "hf_valueBeforeTriggerValue:", v20);

    uint64_t v22 = [MEMORY[0x1E4F2E9C8] numberRangeWithMaxValue:v21];
    [v9 addObject:v22];

    uint64_t v23 = objc_msgSend(v50, "hf_minimumTriggerValue");
    long long v24 = objc_msgSend(v50, "hf_valueAfterTriggerValue:", v23);

    long long v25 = [MEMORY[0x1E4F2E9C8] numberRangeWithMinValue:v24];
    [v9 addObject:v25];

    goto LABEL_8;
  }
  long long v26 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_alarmCharacteristicTypes");
  int v27 = [v26 containsObject:v10];

  if (v27)
  {
    long long v28 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_abnormalValueForAlarmCharacteristicType:", v10);
    [v8 addObject:v28];

    goto LABEL_8;
  }
  v44 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_powerStateCharacteristicTypes");
  int v45 = [v44 containsObject:v10];

  if (v45)
  {
LABEL_2:
    [v8 addObject:MEMORY[0x1E4F1CC38]];
    v17 = (void *)MEMORY[0x1E4F1CC28];
LABEL_3:
    [v8 addObject:v17];
    goto LABEL_8;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F2CEB0]])
  {
    [v8 addObject:&unk_1F19B5318];
    v17 = &unk_1F19B5330;
    goto LABEL_3;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F2CE90]])
  {
    [v8 addObject:&unk_1F19B5330];
    v17 = &unk_1F19B5318;
    goto LABEL_3;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F2CED0]])
  {
    [v8 addObject:&unk_1F19B5318];
    [v8 addObject:&unk_1F19B5348];
    v17 = &unk_1F19B5360;
    goto LABEL_3;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F2CEC0]])
  {
    [v8 addObject:&unk_1F19B5378];
    v46 = [MEMORY[0x1E4F2E9C8] numberRangeWithMinValue:&unk_1F19B5390];
    [v49 addObject:v46];
  }
  else
  {
    if (([v10 isEqualToString:*MEMORY[0x1E4F2CF08]] & v11) != 1) {
      goto LABEL_8;
    }
    v46 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_39_4);
    v47 = objc_msgSend(v46, "hf_programmableSwitchValidValueSet");
    uint64_t v12 = objc_opt_class();
    v48 = [v47 sortedValues];
    [v8 addObjectsFromArray:v48];
  }
LABEL_8:
  long long v29 = [(HUCharacteristicEventOptionProvider *)self optionItems];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2_41;
  v59[3] = &unk_1E63920C0;
  id v30 = v29;
  id v60 = v30;
  id v31 = v7;
  id v62 = v13;
  uint64_t v63 = v12;
  id v61 = v31;
  id v32 = v13;
  v33 = objc_msgSend(v8, "na_map:", v59);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_3;
  v56[3] = &unk_1E63920E8;
  id v34 = v30;
  id v57 = v34;
  id v35 = v31;
  id v58 = v35;
  long long v36 = objc_msgSend(v49, "na_map:", v56);
  long long v37 = [v33 setByAddingObjectsFromSet:v36];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_4;
  v51[3] = &unk_1E6392110;
  id v52 = v34;
  id v53 = v35;
  v54 = self;
  id v55 = v10;
  id v38 = v10;
  id v39 = v35;
  id v40 = v34;
  uint64_t v41 = objc_msgSend(v9, "na_map:", v51);
  v42 = [v37 setByAddingObjectsFromSet:v41];

  return v42;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  uint64_t v3 = objc_msgSend(v2, "hf_isProgrammableSwitch");

  return v3;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_37(uint64_t a1, void *a2)
{
  v2 = [a2 characteristicType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2CF08]];

  return v3;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v10 = objc_msgSend(v9, "characteristics", (void)v18);
      if (![v10 isEqualToSet:*(void *)(a1 + 40)]) {
        goto LABEL_11;
      }
      int v11 = [v9 triggerValue];
      if (([v11 isEqual:v3] & 1) == 0)
      {

LABEL_11:
        continue;
      }
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v14 = v9;

        goto LABEL_17;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v6);
LABEL_14:

  uint64_t v13 = *(void *)(a1 + 56);
  if (v13 == objc_opt_class())
  {
    int v15 = [HUProgrammableSwitchEventOptionItem alloc];
    int v16 = [*(id *)(a1 + 40) anyObject];
    uint64_t v14 = [(HUProgrammableSwitchEventOptionItem *)v15 initWithCharacteristic:v16 triggerValue:v3 valueSource:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v14 = [[HUCharacteristicEventOptionItem alloc] initWithCharacteristics:*(void *)(a1 + 40) triggerValue:v3];
  }
LABEL_17:

  return v14;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "characteristics", (void)v15);
        if ([v10 isEqualToSet:*(void *)(a1 + 40)])
        {
          int v11 = [v9 triggerValueRange];
          char v12 = objc_msgSend(v11, "hf_isEqual:", v3);

          if (v12)
          {
            uint64_t v13 = v9;

            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [[HUCharacteristicEventOptionItem alloc] initWithCharacteristics:*(void *)(a1 + 40) triggerValueRange:v3];
LABEL_13:

  return v13;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = (HUCharacteristicEventOptionItem *)*(id *)(a1 + 32);
  uint64_t v5 = [(HUCharacteristicEventOptionItem *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "characteristics", (void)v27);
        if ([v10 isEqualToSet:*(void *)(a1 + 40)])
        {
          int v11 = [v9 thresholdValueRange];
          char v12 = objc_msgSend(v11, "hf_isEqual:", v3);

          if (v12)
          {
            uint64_t v23 = v9;
            goto LABEL_22;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [(HUCharacteristicEventOptionItem *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v23 = [[HUCharacteristicEventOptionItem alloc] initWithCharacteristics:*(void *)(a1 + 40) thresholdValueRange:v3];
  id v4 = [[HUCharacteristicEventOptionItem alloc] initWithCharacteristics:*(void *)(a1 + 40) thresholdValueRange:v3];
  [(HUCharacteristicEventOptionItem *)v23 setChildItem:v4];
  uint64_t v13 = [*(id *)(a1 + 48) eventBuilderItem];
  uint64_t v14 = [v13 representativeEventBuilder];

  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    long long v16 = v15;
  }
  else {
    long long v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    long long v18 = [v15 characteristic];
    long long v19 = [v18 characteristicType];
    int v20 = [v19 isEqualToString:*(void *)(a1 + 56)];

    if (v20)
    {
      long long v21 = [v17 thresholdRange];
      uint64_t v22 = [v21 minValue];
      if (v22)
      {
        [(HUCharacteristicEventOptionItem *)v23 setThresholdValue:v22];
      }
      else
      {
        long long v24 = [v17 thresholdRange];
        long long v25 = [v24 maxValue];
        [(HUCharacteristicEventOptionItem *)v23 setThresholdValue:v25];
      }
    }
  }

LABEL_22:

  return v23;
}

+ (id)_supportedCharacteristicTypes
{
  if (_MergedGlobals_3_11 != -1) {
    dispatch_once(&_MergedGlobals_3_11, &__block_literal_global_51_1);
  }
  v2 = (void *)qword_1EA12E1F8;

  return v2;
}

void __68__HUCharacteristicEventOptionProvider__supportedCharacteristicTypes__block_invoke_2()
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2CF70], *MEMORY[0x1E4F2CE48], *MEMORY[0x1E4F2CE58], *MEMORY[0x1E4F2CEB0], *MEMORY[0x1E4F2CE90], *MEMORY[0x1E4F2CE88], *MEMORY[0x1E4F2CED0], *MEMORY[0x1E4F2CEC0], *MEMORY[0x1E4F2CF08], 0);
  v0 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
  uint64_t v1 = [v3 setByAddingObjectsFromSet:v0];
  v2 = (void *)qword_1EA12E1F8;
  qword_1EA12E1F8 = v1;
}

+ (id)_characteristicTypesRequiringUpdatedHomeHubs
{
  if (qword_1EA12E200 != -1) {
    dispatch_once(&qword_1EA12E200, &__block_literal_global_55_1);
  }
  v2 = (void *)qword_1EA12E208;

  return v2;
}

void __83__HUCharacteristicEventOptionProvider__characteristicTypesRequiringUpdatedHomeHubs__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2CEC0], 0);
  uint64_t v1 = (void *)qword_1EA12E208;
  qword_1EA12E208 = v0;
}

- (id)valueSource
{
  id v3 = [(HUCharacteristicEventOptionProvider *)self overrideValueSource];

  if (v3)
  {
    id v4 = [(HUCharacteristicEventOptionProvider *)self overrideValueSource];
  }
  else
  {
    uint64_t v5 = [(HUCharacteristicEventOptionProvider *)self home];
    id v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HFServiceVendor)serviceVendingItem
{
  return self->_serviceVendingItem;
}

- (void)setServiceVendingItem:(id)a3
{
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
}

- (NSMutableSet)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
  objc_storeStrong((id *)&self->_serviceVendingItem, 0);
  objc_storeStrong(&self->_filter, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end