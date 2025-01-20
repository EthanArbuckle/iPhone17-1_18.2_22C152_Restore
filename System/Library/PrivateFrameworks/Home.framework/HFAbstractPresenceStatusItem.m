@interface HFAbstractPresenceStatusItem
+ (NSSet)serviceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)descriptionStringForTriggeredServices:(id)a3;
- (id)titleStringForTriggeredServices:(id)a3;
@end

@implementation HFAbstractPresenceStatusItem

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
  v16[2] = __60__HFAbstractPresenceStatusItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_264090328;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  v14 = [v12 flatMap:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

id __60__HFAbstractPresenceStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
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
      v16 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorCharacteristicTypeForServiceType:", *(void *)(a1 + 32));
      v11 = [v3 servicesWithValuesPassingTest:&__block_literal_global_87 forCharacteristicType:v16];

      id v17 = objc_msgSend(MEMORY[0x263F0E708], "hf_roomsForServices:", v11);
      [v7 setObject:v17 forKeyedSubscript:@"triggeredRooms"];
      id v18 = [WeakRetained titleStringForTriggeredServices:v11];
      [v7 setObject:v18 forKeyedSubscript:@"title"];

      v19 = [WeakRetained descriptionStringForTriggeredServices:v11];
      [v7 setObject:v19 forKeyedSubscript:@"description"];

      v20 = [v7 objectForKeyedSubscript:@"title"];

      if (!v20) {
        [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
      }
      v21 = (void *)MEMORY[0x263F58190];
      v22 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v12 = [v21 futureWithResult:v22];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F58190];
    v24 = @"hidden";
    v25[0] = MEMORY[0x263EFFA88];
    v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v15 = +[HFItemUpdateOutcome outcomeWithResults:v14];
    v12 = [v13 futureWithResult:v15];
  }
  return v12;
}

BOOL __60__HFAbstractPresenceStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 integerValue] > 0;
}

+ (NSSet)serviceTypes
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFPresenceStatusItem.m", 73, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractPresenceStatusItem serviceTypes]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)titleStringForTriggeredServices:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFPresenceStatusItem.m", 79, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPresenceStatusItem titleStringForTriggeredServices:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)descriptionStringForTriggeredServices:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFPresenceStatusItem.m", 85, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPresenceStatusItem descriptionStringForTriggeredServices:]", objc_opt_class() object file lineNumber description];

  return 0;
}

@end