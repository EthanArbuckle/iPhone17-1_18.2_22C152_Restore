@interface HFSensorServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFSensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263F0E708], "hf_sensorServiceTypes");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x263F0E708];
  id v5 = a3;
  v6 = [(HFServiceItem *)self service];
  v7 = [v6 serviceType];
  v8 = objc_msgSend(v4, "hf_sensorCharacteristicTypeForServiceType:", v7);

  v9 = [MEMORY[0x263EFFA08] setWithObject:v8];
  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v5];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__HFSensorServiceItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_26408F700;
  id v15 = v8;
  v16 = self;
  id v11 = v8;
  v12 = [v10 flatMap:v14];

  return v12;
}

id __51__HFSensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 readResponse];
  id v5 = [v4 responseForCharacteristicType:*(void *)(a1 + 32)];

  v6 = [v3 standardResults];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v5 value];

  if (v8)
  {
    v9 = [v3 displayMetadata];
    uint64_t v10 = [v9 primaryState];

    if (v10 == 2)
    {
      id v11 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAbnormalSensor", @"HFServiceDescriptionAbnormalSensor", 1);
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = *MEMORY[0x263F0C008];
    v28[0] = *MEMORY[0x263F0BF40];
    v28[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    int v14 = [v13 containsObject:*(void *)(a1 + 32)];

    if (v14)
    {
      id v15 = *(void **)(a1 + 40);
      v16 = [v5 characteristic];
      v17 = [v5 value];
      uint64_t v18 = [v15 descriptionForCharacteristic:v16 withValue:v17];

      id v11 = (void *)v18;
    }
    if (v11)
    {
      v19 = [v7 objectForKeyedSubscript:@"description"];

      if (!v19) {
        [v7 setObject:v11 forKeyedSubscript:@"description"];
      }
    }
    v20 = *(void **)(a1 + 40);
    v21 = [v5 characteristic];
    v22 = [v5 value];
    v23 = [v20 controlDescriptionForCharacteristic:v21 withValue:v22];

    objc_msgSend(v7, "na_safeSetObject:forKey:", v23, @"controlDescription");
  }
  [*(id *)(a1 + 40) applyInflectionToDescriptions:v7];
  v24 = (void *)MEMORY[0x263F58190];
  v25 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v26 = [v24 futureWithResult:v25];

  return v26;
}

@end