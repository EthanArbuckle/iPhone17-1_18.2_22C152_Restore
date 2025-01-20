@interface HFAccessoryBatteryLevelItem
- (HFAccessoryBatteryLevelItem)initWithAccessory:(id)a3 valueSource:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HMAccessory)accessory;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFAccessoryBatteryLevelItem

- (HFAccessoryBatteryLevelItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryBatteryLevelItem;
  v9 = [(HFAccessoryBatteryLevelItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFAccessoryBatteryLevelItem *)self accessory];
  v6 = [v5 services];
  id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_25);

  id v8 = [v4 objectForKeyedSubscript:@"accessoryBatteryDesiredKeys"];
  v9 = [MEMORY[0x263EFF9C0] set];
  v10 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0BF58]);
  if (!v8 || [v8 containsObject:@"batteryPercentage"]) {
    objc_msgSend(v9, "na_safeAddObject:", v10);
  }
  uint64_t v11 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0BFE8]);
  if (!v8 || [v8 containsObject:@"batteryCharging"]) {
    objc_msgSend(v9, "na_safeAddObject:", v11);
  }
  v30 = (void *)v11;
  uint64_t v12 = *MEMORY[0x263F0C430];
  v13 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C430]);
  if (!v13)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = [(HFAccessoryBatteryLevelItem *)self accessory];
    v15 = [v14 services];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v28 = v10;
      id v29 = v4;
      uint64_t v18 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "hf_characteristicOfType:", v12);
          if (v20)
          {
            v13 = (void *)v20;
            goto LABEL_20;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      v13 = 0;
LABEL_20:
      v10 = v28;
      id v4 = v29;
    }
    else
    {
      v13 = 0;
    }

    if (!v8) {
      goto LABEL_24;
    }
LABEL_23:
    if (![v8 containsObject:@"batteryLow"]) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v8) {
    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v9, "na_safeAddObject:", v13);
LABEL_25:
  v21 = [v4 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    v23 = (void *)MEMORY[0x263F58190];
    v38[0] = @"dependentHomeKitObjects";
    v38[1] = @"hidden";
    v39[0] = v9;
    v39[1] = MEMORY[0x263EFFA88];
    v38[2] = @"readsSkipped";
    v39[2] = MEMORY[0x263EFFA88];
    v24 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    v25 = +[HFItemUpdateOutcome outcomeWithResults:v24];
    v26 = [v23 futureWithResult:v25];
  }
  else
  {
    v24 = [(HFAccessoryBatteryLevelItem *)self valueSource];
    v25 = [v24 readValuesForCharacteristics:v9];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_2;
    v31[3] = &unk_26408DAE8;
    id v32 = v10;
    id v33 = v9;
    v26 = [v25 flatMap:v31];
  }
  return v26;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

uint64_t __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D640]];

  return v3;
}

id __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v5 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C430]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  uint64_t v7 = MEMORY[0x263EFFA80];
  uint64_t v8 = MEMORY[0x263EFFA88];
  if (v6)
  {
    id v21 = v6;
    if ([v21 unsignedIntegerValue] == 1) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    [(HFMutableItemUpdateOutcome *)v4 setObject:v9 forKeyedSubscript:@"batteryLow"];
  }
  v10 = [v3 responseForCharacteristicType:*MEMORY[0x263F0BFE8]];
  uint64_t v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  if (v11)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    id v20 = v11;
    if (objc_msgSend(v20, "unsignedIntegerValue", v19, 3221225472, __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_4, &unk_26408ECD0) == 1)uint64_t v12 = MEMORY[0x263EFFA88]; {
    else
    }
      uint64_t v12 = v7;
    [(HFMutableItemUpdateOutcome *)v4 setObject:v12 forKeyedSubscript:@"batteryCharging"];
  }
  v13 = [v3 responseForCharacteristicType:*MEMORY[0x263F0BF58]];
  v14 = [v13 valueWithExpectedClass:objc_opt_class()];

  if (v14)
  {
    v15 = [*(id *)(a1 + 32) metadata];
    uint64_t v16 = objc_msgSend(v15, "hf_percentageForCharacteristicValue:", v14);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v16 forKeyedSubscript:@"batteryPercentage"];
  }
  if (![*(id *)(a1 + 40) count]) {
    [(HFMutableItemUpdateOutcome *)v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  [(HFMutableItemUpdateOutcome *)v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"dependentHomeKitObjects"];
  uint64_t v17 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFAccessoryBatteryLevelItem *)self accessory];
  v6 = [(HFAccessoryBatteryLevelItem *)self valueSource];
  uint64_t v7 = (void *)[v4 initWithAccessory:v5 valueSource:v6];

  return v7;
}

uint64_t __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) unsignedIntegerValue] == 1) {
    return MEMORY[0x263EFFA88];
  }
  else {
    return MEMORY[0x263EFFA80];
  }
}

uint64_t __59__HFAccessoryBatteryLevelItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) unsignedIntegerValue] == 1) {
    return MEMORY[0x263EFFA88];
  }
  else {
    return MEMORY[0x263EFFA80];
  }
}

@end