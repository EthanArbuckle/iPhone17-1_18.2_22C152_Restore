@interface HFCharacteristicStateItemProvider
+ (id)_createBatteryItemWithSourceItem:(id)a3 characteristicType:(id)a4 valueFormatBlock:(id)a5;
+ (id)_setupCharacteristicStateItemForCharacteristic:(id)a3 valueSource:(id)a4 serviceType:(id)a5;
+ (id)standardCharacteristicTypes;
- (HFCharacteristicStateItemProvider)init;
- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4;
- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4 service:(id)a5;
- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 service:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HMAccessory)accessory;
- (HMService)service;
- (NSSet)batteryItems;
- (NSSet)characteristicStateItems;
- (id)_reloadBatteryItems;
- (id)_reloadCharacteristicStateItems;
- (id)characteristicStateItemComparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setBatteryItems:(id)a3;
- (void)setCharacteristicStateItems:(id)a3;
@end

@implementation HFCharacteristicStateItemProvider

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4
{
  return [(HFCharacteristicStateItemProvider *)self initWithValueSource:a3 accessory:a4 service:0];
}

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 accessory];
  v9 = [(HFCharacteristicStateItemProvider *)self initWithValueSource:v7 accessory:v8 service:v6];

  return v9;
}

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4 service:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFCharacteristicStateItemProvider;
  v12 = [(HFItemProvider *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a4);
    objc_storeStrong((id *)&v13->_service, a5);
    objc_storeStrong((id *)&v13->_valueSource, a3);
    uint64_t v14 = [MEMORY[0x263EFFA08] set];
    characteristicStateItems = v13->_characteristicStateItems;
    v13->_characteristicStateItems = (NSSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFFA08] set];
    batteryItems = v13->_batteryItems;
    v13->_batteryItems = (NSSet *)v16;
  }
  return v13;
}

- (HFCharacteristicStateItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithValueSource_accessory_service_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicStateItemProvider.m", 61, @"%s is unavailable; use %@ instead",
    "-[HFCharacteristicStateItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFCharacteristicStateItemProvider *)self valueSource];
  id v6 = [(HFCharacteristicStateItemProvider *)self accessory];
  id v7 = [(HFCharacteristicStateItemProvider *)self service];
  v8 = (void *)[v4 initWithValueSource:v5 accessory:v6 service:v7];

  return v8;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFCharacteristicStateItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:@"service"];

  return v3;
}

- (id)items
{
  v3 = [(HFCharacteristicStateItemProvider *)self characteristicStateItems];
  id v4 = [(HFCharacteristicStateItemProvider *)self batteryItems];
  objc_super v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (id)reloadItems
{
  v3 = [(HFCharacteristicStateItemProvider *)self _reloadCharacteristicStateItems];
  id v4 = [(HFCharacteristicStateItemProvider *)self _reloadBatteryItems];
  objc_super v5 = [v3 resultsByMergingWithResults:v4];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v6;
}

- (id)_reloadBatteryItems
{
  v3 = [(HFCharacteristicStateItemProvider *)self batteryItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [HFItemProviderReloadResults alloc];
    id v6 = [MEMORY[0x263EFFA08] set];
    id v7 = [MEMORY[0x263EFFA08] set];
    v8 = [(HFCharacteristicStateItemProvider *)self batteryItems];
    id v9 = [(HFItemProviderReloadResults *)v5 initWithAddedItems:v6 removedItems:v7 existingItems:v8];
  }
  else
  {
    id v10 = [HFAccessoryBatteryLevelItem alloc];
    id v11 = [(HFCharacteristicStateItemProvider *)self accessory];
    v12 = [(HFCharacteristicStateItemProvider *)self valueSource];
    id v6 = [(HFAccessoryBatteryLevelItem *)v10 initWithAccessory:v11 valueSource:v12];

    id v7 = [MEMORY[0x263EFF9C0] set];
    v8 = [(id)objc_opt_class() _createBatteryItemWithSourceItem:v6 characteristicType:*MEMORY[0x263F0BF58] valueFormatBlock:&__block_literal_global_225];
    [v7 addObject:v8];
    v13 = [(id)objc_opt_class() _createBatteryItemWithSourceItem:v6 characteristicType:*MEMORY[0x263F0BFE8] valueFormatBlock:&__block_literal_global_17_10];
    [v7 addObject:v13];
    [(HFCharacteristicStateItemProvider *)self setBatteryItems:v7];
    uint64_t v14 = [HFItemProviderReloadResults alloc];
    v15 = [MEMORY[0x263EFFA08] set];
    uint64_t v16 = [MEMORY[0x263EFFA08] set];
    id v9 = [(HFItemProviderReloadResults *)v14 initWithAddedItems:v7 removedItems:v15 existingItems:v16];
  }
  return v9;
}

id __56__HFCharacteristicStateItemProvider__reloadBatteryItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[HFFormatterManager sharedInstance];
  uint64_t v4 = [v3 percentFormatter];

  [v4 setMaximumValue:&unk_26C0F8078];
  objc_super v5 = [v2 objectForKeyedSubscript:@"batteryPercentage"];

  if (v5)
  {
    id v6 = [v4 stringForObjectValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __56__HFCharacteristicStateItemProvider__reloadBatteryItems__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[HFFormatterManager sharedInstance];
  uint64_t v4 = [v3 BOOLeanFormatter];

  objc_super v5 = [v2 objectForKeyedSubscript:@"batteryCharging"];

  if (v5)
  {
    id v6 = [v4 stringForObjectValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_reloadCharacteristicStateItems
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v3 = [(HFCharacteristicStateItemProvider *)self characteristicStateItems];
  v53 = objc_msgSend(v3, "na_map:", &__block_literal_global_20_9);

  uint64_t v4 = [(id)objc_opt_class() standardCharacteristicTypes];
  objc_super v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(HFCharacteristicStateItemProvider *)self service];
  if (v6)
  {
    id v7 = [(HFCharacteristicStateItemProvider *)self service];
    v8 = objc_msgSend(v7, "hf_childServices");
    id v9 = [(HFCharacteristicStateItemProvider *)self service];
    id v10 = [v8 setByAddingObject:v9];
  }
  else
  {
    id v10 = [MEMORY[0x263EFFA08] set];
  }
  v52 = self;

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v10;
  uint64_t v57 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v75;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v75 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v11;
        v12 = *(void **)(*((void *)&v74 + 1) + 8 * v11);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v13 = [v12 characteristics];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v71 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              uint64_t v19 = [v18 characteristicType];
              if (v19)
              {
                v20 = (void *)v19;
                v21 = [v18 characteristicType];
                int v22 = [v4 containsObject:v21];

                if (v22)
                {
                  v23 = [v18 characteristicType];
                  v24 = [v5 objectForKeyedSubscript:v23];

                  if (v24)
                  {
                    v25 = (void *)MEMORY[0x263F0E248];
                    v26 = [v18 characteristicType];
                    v27 = [v25 localizedDescriptionForCharacteristicType:v26];
                    NSLog(&cfstr_AlreadyHaveACh.isa, v27);
                  }
                  v28 = [v18 characteristicType];
                  [v5 setObject:v18 forKeyedSubscript:v28];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v70 objects:v78 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v59 + 1;
      }
      while (v59 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v57);
  }

  v29 = (void *)MEMORY[0x263EFFA08];
  v30 = [v5 allKeys];
  v58 = [v29 setWithArray:v30];

  v31 = (void *)MEMORY[0x263EFFA08];
  v32 = [v5 allValues];
  v60 = [v31 setWithArray:v32];

  v33 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v34 = [(HFCharacteristicStateItemProvider *)v52 valueSource];
  v35 = [(HFCharacteristicStateItemProvider *)v52 service];
  v36 = objc_msgSend(v35, "hf_serviceDescriptor");
  v37 = [(HFSimpleAggregatedCharacteristicValueSource *)v33 initWithValueSource:v34 characteristics:v60 primaryServiceDescriptor:v36];

  v38 = +[HFSetDiff diffFromSet:v53 toSet:v58];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_2;
  aBlock[3] = &unk_26409BBB8;
  aBlock[4] = v52;
  v39 = _Block_copy(aBlock);
  v40 = [v38 additions];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_4;
  v65[3] = &unk_26409BBE0;
  id v66 = v5;
  v67 = v52;
  v68 = v37;
  v56 = v37;
  id v41 = v5;
  v42 = objc_msgSend(v40, "na_map:", v65);

  v43 = [v38 deletions];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_5;
  v63[3] = &unk_26409BC08;
  id v44 = v39;
  id v64 = v44;
  v45 = objc_msgSend(v43, "na_map:", v63);

  v46 = [v38 updates];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_6;
  v61[3] = &unk_26409BC08;
  id v62 = v44;
  id v47 = v44;
  v48 = objc_msgSend(v46, "na_map:", v61);

  v49 = [v48 setByAddingObjectsFromSet:v42];
  [(HFCharacteristicStateItemProvider *)v52 setCharacteristicStateItems:v49];

  v50 = [[HFItemProviderReloadResults alloc] initWithAddedItems:v42 removedItems:v45 existingItems:v48];
  return v50;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

id __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) characteristicStateItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_3;
  v8[3] = &unk_26409BB90;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4) {
    NSLog(&cfstr_MissingCharact.isa, v3);
  }
  id v5 = objc_opt_class();
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v4 service];
  v8 = [v7 serviceType];
  id v9 = [v5 _setupCharacteristicStateItemForCharacteristic:v4 valueSource:v6 serviceType:v8];

  return v9;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)characteristicStateItemComparator
{
  return &__block_literal_global_35_4;
}

uint64_t __70__HFCharacteristicStateItemProvider_characteristicStateItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"title"];
  id v7 = [v4 latestResults];

  v8 = [v7 objectForKeyedSubscript:@"title"];
  uint64_t v9 = [v6 localizedStandardCompare:v8];

  return v9;
}

+ (id)standardCharacteristicTypes
{
  if (_MergedGlobals_4_3 != -1) {
    dispatch_once(&_MergedGlobals_4_3, &__block_literal_global_41_5);
  }
  id v2 = (void *)qword_2676B6B30;
  return v2;
}

uint64_t __64__HFCharacteristicStateItemProvider_standardCharacteristicTypes__block_invoke_2()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C2B8], *MEMORY[0x263F0C080], *MEMORY[0x263F0C128], *MEMORY[0x263F0C0E0], *MEMORY[0x263F0C408], *MEMORY[0x263F0C438], *MEMORY[0x263F0C0A0], *MEMORY[0x263F0C2D8], *MEMORY[0x263F0BF40], *MEMORY[0x263F0BF18], *MEMORY[0x263F0BF30], *MEMORY[0x263F0BF80], *MEMORY[0x263F0BF90], *MEMORY[0x263F0BFA0], *MEMORY[0x263F0BFB0], *MEMORY[0x263F0BFC0], *MEMORY[0x263F0BFD0],
    *MEMORY[0x263F0C2F0],
    *MEMORY[0x263F0C2B0],
    *MEMORY[0x263F0C448],
    *MEMORY[0x263F0C318],
    *MEMORY[0x263F0C300],
    *MEMORY[0x263F0C598],
    *MEMORY[0x263F0C008],
    *MEMORY[0x263F0C238],
    *MEMORY[0x263F0C288],
    *MEMORY[0x263F0C2C0],
    *MEMORY[0x263F0C3F0],
    *MEMORY[0x263F0C168],
    *MEMORY[0x263F0C178],
    *MEMORY[0x263F0C5B8],
  uint64_t v0 = 0);
  uint64_t v1 = qword_2676B6B30;
  qword_2676B6B30 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_setupCharacteristicStateItemForCharacteristic:(id)a3 valueSource:(id)a4 serviceType:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263F08878];
  v30 = @"serviceType";
  v31[0] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v12 = objc_msgSend(v10, "hf_valueFormatterForCharacteristic:options:", v7, v11);

  if (v12)
  {
    v13 = [v7 localizedDescription];
    uint64_t v14 = [v7 characteristicType];
    uint64_t v15 = +[HFCharacteristicGroup groupedTitleForCharacteristicType:v14];

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __108__HFCharacteristicStateItemProvider__setupCharacteristicStateItemForCharacteristic_valueSource_serviceType___block_invoke;
    v26 = &unk_26409BC30;
    id v27 = v13;
    id v28 = v15;
    id v29 = v12;
    id v16 = v15;
    id v17 = v13;
    v18 = _Block_copy(&v23);
    uint64_t v19 = [HFCharacteristicStateItem alloc];
    v20 = objc_msgSend(v7, "characteristicType", v23, v24, v25, v26);
    v21 = [(HFCharacteristicStateItem *)v19 initWithCharacteristicType:v20 valueSource:v8 resultsProvider:v18];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __108__HFCharacteristicStateItemProvider__setupCharacteristicStateItemForCharacteristic_valueSource_serviceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"title"];
  id v5 = [NSString stringWithFormat:@"AccessoryDetails.%@", *(void *)(a1 + 32)];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C081158];
  [v4 setObject:v6 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"groupedTitle"];
  }
  id v8 = [*(id *)(a1 + 48) stringForObjectValue:v3];
  if (!v8)
  {
    id v8 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicValueUnknownString", @"HFCharacteristicValueUnknownString", 1);
  }
  [v4 setObject:v8 forKeyedSubscript:@"description"];

  return v4;
}

+ (id)_createBatteryItemWithSourceItem:(id)a3 characteristicType:(id)a4 valueFormatBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [HFTransformItem alloc];
  uint64_t v11 = (void *)[v9 copy];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __106__HFCharacteristicStateItemProvider__createBatteryItemWithSourceItem_characteristicType_valueFormatBlock___block_invoke;
  v16[3] = &unk_26409BC58;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  uint64_t v14 = [(HFTransformItem *)v10 initWithSourceItem:v11 transformationBlock:v16];

  return v14;
}

id __106__HFCharacteristicStateItemProvider__createBatteryItemWithSourceItem_characteristicType_valueFormatBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [MEMORY[0x263F0E248] localizedDescriptionForCharacteristicType:*(void *)(a1 + 32)];
  [v4 setObject:v5 forKeyedSubscript:@"title"];

  uint64_t v6 = +[HFCharacteristicGroup groupedTitleForCharacteristicType:*(void *)(a1 + 32)];
  [v4 setObject:v6 forKeyedSubscript:@"groupedTitle"];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  [v4 setObject:v7 forKeyedSubscript:@"characteristicTypes"];

  id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (void *)MEMORY[0x263EFFA88];
  }
  id v10 = HFResultHiddenKey;
  if (v8) {
    id v10 = HFResultDisplayDescriptionKey;
  }
  [v4 setObject:v9 forKeyedSubscript:*v10];

  return v4;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMService)service
{
  return self->_service;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)characteristicStateItems
{
  return self->_characteristicStateItems;
}

- (void)setCharacteristicStateItems:(id)a3
{
}

- (NSSet)batteryItems
{
  return self->_batteryItems;
}

- (void)setBatteryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryItems, 0);
  objc_storeStrong((id *)&self->_characteristicStateItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end