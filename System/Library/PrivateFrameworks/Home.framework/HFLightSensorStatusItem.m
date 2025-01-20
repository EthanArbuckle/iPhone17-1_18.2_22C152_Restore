@interface HFLightSensorStatusItem
+ (NSSet)serviceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFLightSensorStatusItem

+ (NSSet)serviceTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D768]];
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLightSensor", @"HFStatusTitleLightSensor", 1);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"sun.max.circle.fill" configuration:v3];

  return v4;
}

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
  v16[2] = __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_264090328;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  v14 = [v12 flatMap:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

id __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
    v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
    v7 = (void *)[v6 mutableCopy];

    v8 = [v7 objectForKeyedSubscript:@"hidden"];
    LODWORD(v6) = [v8 BOOLValue];

    if (v6)
    {
      v9 = (void *)MEMORY[0x263F58190];
      v10 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v11 = [v9 futureWithResult:v10];
    }
    else
    {
      v14 = [v3 servicesWithValuesPassingTest:&__block_literal_global_43 forCharacteristicType:*MEMORY[0x263F0C0A0]];
      if ([v14 count])
      {
        uint64_t v29 = 0;
        v30 = (double *)&v29;
        uint64_t v31 = 0x2020000000;
        uint64_t v32 = 0;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_3;
        v26[3] = &unk_264090300;
        id v27 = v3;
        v28 = &v29;
        objc_msgSend(v14, "na_each:", v26);
        v15 = objc_msgSend(NSNumber, "numberWithDouble:", v30[3] / (double)(unint64_t)objc_msgSend(v14, "count"));
        v16 = +[HFFormatterManager sharedInstance];
        id v17 = [v16 luxFormatter];

        id v18 = [v17 numberFormatter];
        [v18 setUsesSignificantDigits:0];

        [v15 doubleValue];
        double v20 = v19;
        v21 = [v17 numberFormatter];
        [v21 setMaximumFractionDigits:v20 < 1.0];

        v22 = [v17 stringForObjectValue:v15];
        [v7 setObject:v22 forKeyedSubscript:@"description"];

        _Block_object_dispose(&v29, 8);
      }
      v23 = (void *)MEMORY[0x263F58190];
      v24 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v11 = [v23 futureWithResult:v24];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F58190];
    v33 = @"hidden";
    v34[0] = MEMORY[0x263EFFA88];
    v7 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v13 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    v11 = [v12 futureWithResult:v13];
  }
  return v11;
}

BOOL __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 != 0;
}

void __55__HFLightSensorStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) responseForCharacteristicType:*MEMORY[0x263F0C0A0] inService:a2];
  id v5 = [v3 valueWithExpectedClass:objc_opt_class()];

  [v5 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

@end