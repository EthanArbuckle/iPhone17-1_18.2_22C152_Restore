@interface HFContactSensorStatusItem
+ (NSSet)serviceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFContactSensorStatusItem

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
  v16[2] = __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke;
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
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D698]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"contact.sensor.fill"];
  return v3;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleContactSensor_One", @"HFStatusTitleContactSensor_One", 1);
LABEL_5:
    v12 = (void *)v4;
    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v5 = [v3 count];
    uint64_t v4 = HFLocalizedStringWithFormat(@"HFStatusTitleContactSensor_Multiple", @"%lu", v6, v7, v8, v9, v10, v11, v5);
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

id __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v9 = (void *)MEMORY[0x263F58190];
    v39 = @"hidden";
    v40[0] = MEMORY[0x263EFFA88];
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    goto LABEL_5;
  }
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  uint64_t v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"hidden"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F58190];
LABEL_5:
    uint64_t v10 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    uint64_t v11 = [v9 futureWithResult:v10];

    goto LABEL_23;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v14 = [v3 allServices];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke_2;
  v35[3] = &unk_264097790;
  id v36 = v3;
  id v15 = v12;
  id v37 = v15;
  id v16 = v13;
  id v38 = v16;
  [v14 enumerateObjectsUsingBlock:v35];

  if ([v15 count])
  {
    if ([v15 count] == 1) {
      id v17 = @"HFStatusTitleContactSensor_One";
    }
    else {
      id v17 = @"HFStatusTitleContactSensor_Multiple";
    }
    id v18 = _HFLocalizedStringWithDefaultValue(v17, v17, 1);
    v19 = @"HFStatusDescriptionContactSensor_Open";
    v20 = v15;
  }
  else
  {
    if (![v16 count])
    {
      id v18 = 0;
      id v30 = 0;
      v29 = 0;
      goto LABEL_17;
    }
    if ([v16 count] == 1) {
      v21 = @"HFStatusTitleContactSensor_One";
    }
    else {
      v21 = @"HFStatusTitleContactSensor_Multiple";
    }
    id v18 = _HFLocalizedStringWithDefaultValue(v21, v21, 1);
    v19 = @"HFStatusDescriptionContactSensor_Closed";
    v20 = v16;
  }
  uint64_t v22 = [v20 count];
  v29 = HFLocalizedStringWithFormat(v19, @"%lu", v23, v24, v25, v26, v27, v28, v22);
  id v30 = v20;
LABEL_17:
  [v7 setObject:v15 forKeyedSubscript:@"openServices"];
  [v7 setObject:v16 forKeyedSubscript:@"closedServices"];
  if (v18)
  {
    if ([v30 count] == 1)
    {
      [v7 setObject:v18 forKeyedSubscript:@"title"];
    }
    else
    {
      v31 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, @"%lu", 0, objc_msgSend(v30, "count"));
      [v7 setObject:v31 forKeyedSubscript:@"title"];
    }
    [v7 setObject:v29 forKeyedSubscript:@"description"];
  }
  v32 = (void *)MEMORY[0x263F58190];
  v33 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  uint64_t v11 = [v32 futureWithResult:v33];

LABEL_23:
  return v11;
}

void __57__HFContactSensorStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id v6 = a2;
  id v3 = [a1[4] batchResponseForService:v6];
  uint64_t v4 = +[HFCharacteristicValueDisplayMetadata displayMetadataForService:v6 characteristicReadResponse:v3];

  if ([v4 primaryState] == 2)
  {
    uint64_t v5 = a1 + 5;
  }
  else
  {
    if ([v4 primaryState] != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = a1 + 6;
  }
  [*v5 addObject:v6];
LABEL_6:
}

@end