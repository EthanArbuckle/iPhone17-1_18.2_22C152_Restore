@interface HFAirQualitySensorStatusItem
+ (NSSet)serviceTypes;
- (BOOL)canRepresentAbnormalAndNormalHomeKitObjectsTogether;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFAirQualitySensorStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() serviceTypes];
  v6 = [v5 anyObject];

  v7 = [(id)objc_opt_class() characteristicTypesForServiceType:v6 includingAssociatedTypes:1];
  v20[0] = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v9 = [v7 allObjects];
  v10 = [(HFStatusItem *)self filteredServicesOfTypes:v8 containingCharacteristicTypes:v9];

  objc_initWeak(&location, self);
  v11 = [(HFStatusItem *)self valueSource];
  v12 = [v11 readValuesForCharacteristicTypes:v7 inServices:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__HFAirQualitySensorStatusItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_264090328;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  v14 = [v12 flatMap:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D630]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  id v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"aqi.medium" configuration:v3];

  return v4;
}

- (BOOL)canRepresentAbnormalAndNormalHomeKitObjectsTogether
{
  return 1;
}

id __60__HFAirQualitySensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
    v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
    v7 = (void *)[v6 mutableCopy];

    v8 = [v7 objectForKeyedSubscript:@"hidden"];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      v10 = (void *)MEMORY[0x263F58190];
      v11 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v12 = [v10 futureWithResult:v11];
    }
    else
    {
      uint64_t v15 = *MEMORY[0x263F0BF40];
      v30 = [v3 servicesWithValuesPassingTest:&__block_literal_global_223 forCharacteristicType:*MEMORY[0x263F0BF40]];
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __60__HFAirQualitySensorStatusItem__subclass_updateWithOptions___block_invoke_3;
      v31[3] = &unk_264090300;
      id v16 = v3;
      id v32 = v16;
      v33 = &v34;
      objc_msgSend(v30, "na_each:", v31);
      if (v35[3])
      {
        id v17 = [v16 responseForCharacteristicType:v15];
        v29 = [v17 characteristic];

        id v18 = objc_msgSend(MEMORY[0x263F08878], "hf_valueFormatterForCharacteristic:options:", v29, 0);
        v19 = [NSNumber numberWithInteger:v35[3]];
        v20 = [v18 stringForObjectValue:v19];

        [v7 setObject:v20 forKeyedSubscript:@"description"];
        [v7 setObject:&unk_26C0F7BA8 forKeyedSubscript:@"statusItemCategory"];
        v21 = [NSNumber numberWithInteger:6 - v35[3]];
        v22 = +[HFNumberRange valueWithValue:v21];
        [v7 setObject:v22 forKeyedSubscript:@"statusCurrentValue"];

        v23 = +[HFNumberRange rangeWithMaxValue:&unk_26C0F7BC0 minValue:&unk_26C0F7BD8];
        [v7 setObject:v23 forKeyedSubscript:@"statusPossibleValues"];
      }
      v24 = [v7 objectForKeyedSubscript:@"title"];
      BOOL v25 = v24 == 0;

      if (v25) {
        [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
      }
      v26 = (void *)MEMORY[0x263F58190];
      v27 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v12 = [v26 futureWithResult:v27];

      _Block_object_dispose(&v34, 8);
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F58190];
    v38 = @"hidden";
    v39[0] = MEMORY[0x263EFFA88];
    v7 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v14 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    v12 = [v13 futureWithResult:v14];
  }
  return v12;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAirQuality", @"HFStatusTitleAirQuality", 1);
}

BOOL __60__HFAirQualitySensorStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 != 0;
}

void __60__HFAirQualitySensorStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) responseForCharacteristicType:*MEMORY[0x263F0BF40] inService:a2];
  id v7 = [v3 valueWithExpectedClass:objc_opt_class()];

  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v5 = [v7 integerValue];
  if (v4 <= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

@end