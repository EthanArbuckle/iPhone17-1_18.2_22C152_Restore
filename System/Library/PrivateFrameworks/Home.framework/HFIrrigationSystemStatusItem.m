@interface HFIrrigationSystemStatusItem
+ (NSSet)serviceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFIrrigationSystemStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = (id)*MEMORY[0x263F0D740];
  v5 = [(id)objc_opt_class() characteristicTypesForServiceType:v4 includingAssociatedTypes:1];
  v15[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v7 = [v5 allObjects];
  v8 = [(HFStatusItem *)self filteredServicesOfTypes:v6 containingCharacteristicTypes:v7];

  v9 = [(HFStatusItem *)self valueSource];
  v10 = [v9 readValuesForCharacteristicTypes:v5 inServices:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__HFIrrigationSystemStatusItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408DAE8;
  v13[4] = self;
  id v14 = v4;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __60__HFIrrigationSystemStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  v6 = [v2 setWithObject:v4];
  v7 = [v3 standardResultsForBatchReadResponse:v5 serviceTypes:v6];

  v8 = (void *)[v7 mutableCopy];
  v9 = [v8 objectForKeyedSubscript:@"hidden"];
  LODWORD(v6) = [v9 BOOLValue];

  if (v6)
  {
    v10 = (void *)MEMORY[0x263F58190];
    v11 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v12 = [v10 futureWithResult:v11];
  }
  else
  {
    v11 = [v8 objectForKeyedSubscript:@"representedHomeKitObjects"];
    v13 = [v8 objectForKeyedSubscript:@"state"];
    uint64_t v14 = [v13 integerValue];

    if ((unint64_t)[v11 count] > 1)
    {
      uint64_t v15 = [v11 count];
      HFLocalizedStringWithFormat(@"HFStatusTitleIrrigationSystem_Multiple", @"%lu", v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(@"HFStatusTitleIrrigationSystem_One", @"HFStatusTitleIrrigationSystem_One", 1);
    v22 = };
    [v8 setObject:v22 forKeyedSubscript:@"title"];

    if (v14 == 2) {
      v23 = @"HFStatusDescriptionIrrigationSystem_Watering";
    }
    else {
      v23 = @"HFStatusDescriptionIrrigationSystem_Idle";
    }
    v24 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    [v8 setObject:v24 forKeyedSubscript:@"description"];

    v25 = (void *)MEMORY[0x263F58190];
    v26 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v12 = [v25 futureWithResult:v26];
  }
  return v12;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D740]];
}

@end