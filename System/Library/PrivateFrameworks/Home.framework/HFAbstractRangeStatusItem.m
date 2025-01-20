@interface HFAbstractRangeStatusItem
+ (BOOL)isPercentRange;
+ (BOOL)shouldShowAverageForRange:(id)a3;
+ (NSSet)serviceTypes;
+ (id)_defaultValueFormatter;
+ (id)controllableServiceTypes;
+ (id)currentModeCharacteristicTypes;
+ (id)currentValueCharacteristicType;
+ (id)customValueFormatter;
+ (id)descriptionStringForCharacteristicType:(id)a3 withResponses:(id)a4;
+ (id)displayValueComparator;
+ (id)formatValue:(id)a3 forCharacteristic:(id)a4;
+ (id)maximumTargetValueCharacteristicType;
+ (id)minimumTargetValueCharacteristicType;
+ (id)overrideValueDisplayRange;
+ (id)sensorServiceTypes;
+ (id)targetModeCharacteristicTypes;
+ (id)targetValueCharacteristicType;
+ (id)unknownValueDescriptionString;
+ (id)valueRangeForCharacteristicType:(id)a3 withResponses:(id)a4;
+ (unint64_t)abstractCurrentModeInResponse:(id)a3;
+ (unint64_t)abstractTargetModeInResponse:(id)a3;
+ (unint64_t)statusItemCategory;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFAbstractRangeStatusItem

id __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 responseForCharacteristicType:*(void *)(a1 + 32)];
  v3 = [v2 valueWithExpectedClass:objc_opt_class()];

  return v3;
}

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 allCharacteristics];
}

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) batchResponseForService:a2];
}

id __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() characteristicTypesForServiceType:v2 includingAssociatedTypes:1];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() controllableServiceTypes];
  v6 = [(id)objc_opt_class() sensorServiceTypes];
  v7 = [v5 setByAddingObjectsFromSet:v6];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke;
  v34[3] = &unk_26408CEC0;
  v34[4] = self;
  v8 = objc_msgSend(v7, "na_flatMap:", v34);
  v9 = (void *)[v8 mutableCopy];

  v10 = [(id)objc_opt_class() currentValueCharacteristicType];
  [v9 addObject:v10];

  v11 = [(id)objc_opt_class() targetValueCharacteristicType];
  objc_msgSend(v9, "na_safeAddObject:", v11);

  v12 = [(id)objc_opt_class() minimumTargetValueCharacteristicType];
  [v9 addObject:v12];

  v13 = [(id)objc_opt_class() maximumTargetValueCharacteristicType];
  [v9 addObject:v13];

  v14 = [(id)objc_opt_class() currentModeCharacteristicTypes];
  [v9 unionSet:v14];

  v15 = [(id)objc_opt_class() targetModeCharacteristicTypes];
  [v9 unionSet:v15];

  v16 = [(id)objc_opt_class() controllableServiceTypes];
  v17 = [v16 allObjects];
  v18 = [(HFStatusItem *)self filteredServicesOfTypes:v17];

  v19 = [(id)objc_opt_class() sensorServiceTypes];
  v20 = [v19 allObjects];
  v21 = [(HFStatusItem *)self filteredServicesOfTypes:v20];

  v22 = [v18 setByAddingObjectsFromSet:v21];
  objc_initWeak(&location, self);
  v23 = [(HFStatusItem *)self valueSource];
  v24 = [v23 readValuesForCharacteristicTypes:v9 inServices:v22];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_2;
  v29[3] = &unk_264091CB0;
  objc_copyWeak(&v32, &location);
  id v25 = v7;
  id v30 = v25;
  id v26 = v22;
  id v31 = v26;
  v27 = [v24 flatMap:v29];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v27;
}

BOOL __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 allReadResponses];
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_13_4);

  return v3;
}

+ (id)descriptionStringForCharacteristicType:(id)a3 withResponses:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 anyObject];
  v9 = [v8 responseForCharacteristicType:v7];
  v10 = [v9 characteristic];

  v11 = [(id)objc_opt_class() valueRangeForCharacteristicType:v7 withResponses:v6];

  v12 = [v11 midValue];
  uint64_t v13 = [v12 integerValue];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [(id)objc_opt_class() unknownValueDescriptionString];
    goto LABEL_12;
  }
  if ([a1 shouldShowAverageForRange:v11])
  {
    v15 = [v11 midValue];
    v14 = [a1 formatValue:v15 forCharacteristic:v10];

    goto LABEL_12;
  }
  v16 = [(id)objc_opt_class() customValueFormatter];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
LABEL_10:
    v20 = v18;
    goto LABEL_11;
  }
  if (([(id)objc_opt_class() isPercentRange] & 1) == 0)
  {
    id v18 = [(id)objc_opt_class() _defaultValueFormatter];
    goto LABEL_10;
  }
  v19 = +[HFFormatterManager sharedInstance];
  v20 = [v19 percentFormatter];

LABEL_11:
  v21 = [[HFNumberRangeFormatter alloc] initWithNumberFormatter:v20];
  [(HFNumberRangeFormatter *)v21 setConsolidatesUnit:1];
  [(HFNumberRangeFormatter *)v21 setSimplifiesEqualValues:1];
  v14 = [(HFNumberRangeFormatter *)v21 stringForNumberRange:v11];

LABEL_12:
  return v14;
}

id __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v37[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:*(void *)(a1 + 32)];
    id v7 = (void *)[v6 mutableCopy];

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"tempreatureUnitDependency"];
    v8 = [v7 objectForKeyedSubscript:@"hidden"];
    int v9 = [v8 BOOLValue];

    if (!v9)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_3;
      v34[3] = &unk_264091C28;
      id v35 = v3;
      v14 = objc_msgSend(v13, "na_map:", v34);
      v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_59);
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "statusItemCategory"));
      [v7 setObject:v16 forKeyedSubscript:@"statusItemCategory"];

      v17 = objc_opt_class();
      id v18 = [(id)objc_opt_class() currentValueCharacteristicType];
      v19 = [v17 descriptionStringForCharacteristicType:v18 withResponses:v15];
      [v7 setObject:v19 forKeyedSubscript:@"description"];

      v20 = objc_opt_class();
      v21 = [(id)objc_opt_class() currentValueCharacteristicType];
      v22 = [v20 valueRangeForCharacteristicType:v21 withResponses:v15];
      [v7 setObject:v22 forKeyedSubscript:@"statusCurrentValue"];

      v23 = objc_msgSend(v15, "na_flatMap:", &__block_literal_global_17_4);
      v24 = +[HFCharacteristicBatchReadResponse aggregatedMetadataForCharacteristics:v23];
      id v25 = [(id)objc_opt_class() overrideValueDisplayRange];
      if (v25)
      {
        [v7 setObject:v25 forKeyedSubscript:@"statusPossibleValues"];
      }
      else
      {
        id v32 = v15;
        id v26 = [v24 maximumValue];
        [v24 minimumValue];
        v27 = v33 = v14;
        v28 = +[HFNumberRange rangeWithMaxValue:v26 minValue:v27];
        [v7 setObject:v28 forKeyedSubscript:@"statusPossibleValues"];

        v15 = v32;
        v14 = v33;
      }
      [v7 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"representedHomeKitObjects"];
      v29 = (void *)MEMORY[0x263F58190];
      id v30 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      v12 = [v29 futureWithResult:v30];

      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x263F58190];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F58190];
    v36 = @"hidden";
    v37[0] = MEMORY[0x263EFFA88];
    id v7 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  }
  v11 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v12 = [v10 futureWithResult:v11];

LABEL_10:
  return v12;
}

+ (id)valueRangeForCharacteristicType:(id)a3 withResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke;
  v32[3] = &unk_264091CD8;
  id v8 = v6;
  id v33 = v8;
  int v9 = objc_msgSend(v7, "na_map:", v32);
  if ([v9 count])
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__9;
    id v30 = __Block_byref_object_dispose__9;
    id v31 = [v9 anyObject];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__9;
    v24 = __Block_byref_object_dispose__9;
    id v25 = [v9 anyObject];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_23;
    v19[3] = &unk_264091D00;
    v19[4] = &v26;
    v19[5] = &v20;
    objc_msgSend(v9, "na_each:", v19);
    v10 = +[HFNumberRange rangeWithMaxValue:v21[5] minValue:v27[5]];
    if ([a1 shouldShowAverageForRange:v10])
    {
      uint64_t v15 = 0;
      v16 = (double *)&v15;
      uint64_t v17 = 0x2020000000;
      uint64_t v18 = 0;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_2;
      v14[3] = &unk_264091D28;
      v14[4] = &v15;
      objc_msgSend(v9, "na_each:", v14);
      v11 = objc_msgSend(NSNumber, "numberWithDouble:", v16[3] / (double)(unint64_t)objc_msgSend(v9, "count"));
      id v12 = +[HFNumberRange valueWithValue:v11];

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      id v12 = v10;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v12 = +[HFNumberRange valueWithValue:&unk_26C0F65D0];
  }

  return v12;
}

+ (id)customValueFormatter
{
  return 0;
}

void __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_23(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 doubleValue];
  double v5 = v4;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
  if (v5 < v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  [v10 doubleValue];
  double v8 = v7;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) doubleValue];
  if (v8 > v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (unint64_t)statusItemCategory
{
  return 4;
}

+ (NSSet)serviceTypes
{
  id v3 = [a1 controllableServiceTypes];
  double v4 = [a1 sensorServiceTypes];
  double v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return 0;
}

+ (id)controllableServiceTypes
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 55, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem controllableServiceTypes]", objc_opt_class() object file lineNumber description];

  double v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

+ (id)sensorServiceTypes
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 62, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem sensorServiceTypes]", objc_opt_class() object file lineNumber description];

  double v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

+ (id)currentValueCharacteristicType
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 69, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem currentValueCharacteristicType]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)targetValueCharacteristicType
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 76, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem targetValueCharacteristicType]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)minimumTargetValueCharacteristicType
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 83, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem minimumTargetValueCharacteristicType]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)maximumTargetValueCharacteristicType
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 90, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem maximumTargetValueCharacteristicType]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)currentModeCharacteristicTypes
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 97, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem currentModeCharacteristicTypes]", objc_opt_class() object file lineNumber description];

  double v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

+ (id)targetModeCharacteristicTypes
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 104, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem targetModeCharacteristicTypes]", objc_opt_class() object file lineNumber description];

  double v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

+ (id)unknownValueDescriptionString
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 111, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem unknownValueDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)overrideValueDisplayRange
{
  return 0;
}

+ (id)displayValueComparator
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 124, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem displayValueComparator]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 136, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem abstractTargetModeInResponse:]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 142, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem abstractCurrentModeInResponse:]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (BOOL)isPercentRange
{
  return 0;
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, a1, @"HFAbstractRangeStatusItem.m", 155, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractRangeStatusItem shouldShowAverageForRange:]", objc_opt_class() object file lineNumber description];

  return 0;
}

double __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

+ (id)formatValue:(id)a3 forCharacteristic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [(id)objc_opt_class() customValueFormatter];
  if (v7)
  {

LABEL_5:
    id v12 = [(id)objc_opt_class() customValueFormatter];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(id)objc_opt_class() _defaultValueFormatter];
    }
    double v9 = v14;

    v11 = [v9 stringForObjectValue:v5];
    goto LABEL_9;
  }
  if (![(id)objc_opt_class() isPercentRange]) {
    goto LABEL_5;
  }
  double v8 = +[HFFormatterManager sharedInstance];
  double v9 = [v8 percentFormatter];

  id v10 = [[HFRelativePercentValue alloc] initWithValue:v5 forCharacteristic:v6];
  v11 = [v9 stringForRelativePercentValue:v10];

LABEL_9:
  return v11;
}

+ (id)_defaultValueFormatter
{
  if ([(id)objc_opt_class() isPercentRange])
  {
    id v2 = +[HFFormatterManager sharedInstance];
    id v3 = [v2 percentFormatter];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  }
  return v3;
}

@end