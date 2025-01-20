@interface HFAccessoryControlItem
+ (Class)valueClass;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (HFAccessoryControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFAccessoryControlItem)initWithValueSource:(id)a3 parentAccessory:(id)a4 displayResults:(id)a5;
- (HMAccessory)accessory;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFAccessoryControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFAccessoryControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithValueSource_parentAccessory_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryControlItem.m", 27, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFAccessoryControlItem)initWithValueSource:(id)a3 parentAccessory:(id)a4 displayResults:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v13 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v14 = objc_msgSend(v9, "hf_visibleServices");
  v15 = objc_msgSend(v9, "hf_primaryService");
  v16 = objc_msgSend(v15, "hf_serviceDescriptor");
  v17 = [(HFSimpleAggregatedCharacteristicValueSource *)v13 initWithValueSource:v11 services:v14 primaryServiceDescriptor:v16];

  v20.receiver = self;
  v20.super_class = (Class)HFAccessoryControlItem;
  v18 = [(HFControlItem *)&v20 initWithValueSource:v17 characteristicOptions:v12 displayResults:v10];

  if (v18) {
    objc_storeStrong((id *)&v18->_accessory, a4);
  }

  return v18;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  v5 = [HFAccessoryControlItem alloc];
  v6 = [(HFControlItem *)self valueSource];
  v7 = [v6 valueSource];
  v8 = [(HFAccessoryControlItem *)self accessory];
  id v9 = [(HFControlItem *)self displayResults];
  id v10 = [(HFAccessoryControlItem *)v5 initWithValueSource:v7 parentAccessory:v8 displayResults:v9];

  [(HFItem *)v10 copyLatestResultsFromItem:self];
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HFAccessoryControlItem *)self accessory];
  v5 = objc_msgSend(v4, "hf_visibleServices");

  v6 = [HFCharacteristicBatchReadResponse alloc];
  v7 = [MEMORY[0x263EFFA08] set];
  v8 = [(HFCharacteristicBatchReadResponse *)v6 initWithReadResponses:v7 contextProvider:0];
  id v9 = [(HFControlItem *)self resultsForBatchReadResponse:v8];
  id v10 = (void *)[v9 mutableCopy];

  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke;
  v25 = &unk_2640928B8;
  id v11 = v10;
  id v26 = v11;
  id v12 = v5;
  id v27 = v12;
  v13 = __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke((uint64_t)&v22);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, @"dependentHomeKitObjects", v22, v23, v24, v25);

  v14 = NSNumber;
  v15 = [v11 objectForKeyedSubscript:@"actionRequiresDeviceUnlock"];
  if ([v15 BOOLValue]) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = objc_msgSend(v12, "na_any:", &__block_literal_global_171);
  }
  v17 = [v14 numberWithInt:v16];
  [v11 setObject:v17 forKeyedSubscript:@"actionRequiresDeviceUnlock"];

  v18 = (void *)MEMORY[0x263F58190];
  v19 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  objc_super v20 = [v18 futureWithResult:v19];

  return v20;
}

id __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)[v2 mutableCopy];
  }
  else
  {
    v5 = [MEMORY[0x263EFFA08] set];
    v4 = (void *)[v5 mutableCopy];
  }
  [v4 unionSet:*(void *)(a1 + 40)];
  return v4;
}

uint64_t __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresDeviceUnlock");
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)normalizedValueForValue:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryControlItem *)self accessory];
  v6 = objc_msgSend(v5, "hf_visibleServices");
  char v7 = [v4 isSubsetOfSet:v6];

  return v7;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
}

@end