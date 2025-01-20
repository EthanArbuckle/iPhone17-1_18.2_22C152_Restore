@interface HFAbstractAlarmStatusItem
+ (NSSet)serviceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)iconDescription;
- (id)statusDescriptionAllNormal;
- (id)statusDescriptionMultipleTriggered:(unint64_t)a3;
- (id)statusDescriptionOneTriggered;
@end

@implementation HFAbstractAlarmStatusItem

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
  v16[2] = __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_264090328;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  v14 = [v12 flatMap:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

id __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    v12 = (void *)MEMORY[0x263F58190];
    v24 = @"hidden";
    v25[0] = MEMORY[0x263EFFA88];
    id v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v14 = +[HFItemUpdateOutcome outcomeWithResults:v13];
    v11 = [v12 futureWithResult:v14];

    goto LABEL_18;
  }
  v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectForKeyedSubscript:@"hidden"];
  LODWORD(v6) = [v8 BOOLValue];

  if (!v6)
  {
    v15 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorCharacteristicTypeForServiceType:", *(void *)(a1 + 32));
    v10 = [v3 servicesWithValuesPassingTest:&__block_literal_global_165 forCharacteristicType:v15];

    v16 = [WeakRetained iconDescription];
    [v7 setObject:v16 forKeyedSubscript:@"description"];

    if ([v10 count])
    {
      [v7 setObject:&unk_26C0F7320 forKeyedSubscript:@"badge"];
      [v7 setObject:&unk_26C0F7338 forKeyedSubscript:@"statusItemCategory"];
      [v7 setObject:v10 forKeyedSubscript:@"statusRepresentedHomeKitObjects"];
      id v17 = objc_msgSend(MEMORY[0x263F0E708], "hf_roomsForServices:", v10);
      if ([v17 count] == 1)
      {
        id v18 = [WeakRetained room];
        if (v18)
        {
          v19 = [WeakRetained statusDescriptionOneTriggered];
        }
        else
        {
          v20 = [v17 anyObject];
          v19 = [v20 name];
        }
      }
      else
      {
        v19 = objc_msgSend(WeakRetained, "statusDescriptionMultipleTriggered:", objc_msgSend(v17, "count"));
      }
      [v7 setObject:v19 forKeyedSubscript:@"description"];
    }
    else
    {
      if ([v10 count])
      {
LABEL_16:
        v21 = (void *)MEMORY[0x263F58190];
        v22 = +[HFItemUpdateOutcome outcomeWithResults:v7];
        v11 = [v21 futureWithResult:v22];

        goto LABEL_17;
      }
      id v17 = [WeakRetained statusDescriptionAllNormal];
      [v7 setObject:v17 forKeyedSubscript:@"description"];
    }

    goto LABEL_16;
  }
  v9 = (void *)MEMORY[0x263F58190];
  v10 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v11 = [v9 futureWithResult:v10];
LABEL_17:

LABEL_18:
  return v11;
}

BOOL __57__HFAbstractAlarmStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 integerValue] > 0;
}

+ (NSSet)serviceTypes
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAlarmStatusItem.m", 80, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractAlarmStatusItem serviceTypes]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)iconDescription
{
  return 0;
}

- (id)statusDescriptionAllNormal
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAlarmStatusItem.m", 91, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractAlarmStatusItem statusDescriptionAllNormal]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)statusDescriptionOneTriggered
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAlarmStatusItem.m", 97, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractAlarmStatusItem statusDescriptionOneTriggered]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFAlarmStatusItem.m", 103, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractAlarmStatusItem statusDescriptionMultipleTriggered:]", objc_opt_class() object file lineNumber description];

  return 0;
}

@end