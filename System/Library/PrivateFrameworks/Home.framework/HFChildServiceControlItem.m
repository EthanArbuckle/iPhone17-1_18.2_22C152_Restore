@interface HFChildServiceControlItem
+ (Class)valueClass;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (HFChildServiceControlItem)initWithBaseValueSource:(id)a3 parentService:(id)a4 childServiceFilter:(id)a5 displayResults:(id)a6;
- (HFChildServiceControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFChildServiceFilter)childServiceFilter;
- (HMService)parentService;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFChildServiceControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFChildServiceControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithBaseValueSource_parentService_childServiceFilter_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFChildServiceControlItem.m", 48, @"%s is unavailable; use %@ instead",
    "-[HFChildServiceControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFChildServiceControlItem)initWithBaseValueSource:(id)a3 parentService:(id)a4 childServiceFilter:(id)a5 displayResults:(id)a6
{
  id v11 = a4;
  v12 = (HFChildServiceFilter *)a5;
  id v13 = a6;
  id v14 = a3;
  v15 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v16 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v17 = objc_msgSend(v11, "hf_childServices");
  v18 = objc_msgSend(v11, "hf_serviceDescriptor");
  v19 = [(HFSimpleAggregatedCharacteristicValueSource *)v16 initWithValueSource:v14 services:v17 primaryServiceDescriptor:v18];

  v23.receiver = self;
  v23.super_class = (Class)HFChildServiceControlItem;
  v20 = [(HFControlItem *)&v23 initWithValueSource:v19 characteristicOptions:v15 displayResults:v13];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_parentService, a4);
    v21 = v12;
    if (!v12) {
      v21 = [[HFChildServiceFilter alloc] initWithChildServiceTypes:0];
    }
    objc_storeStrong((id *)&v20->_childServiceFilter, v21);
    if (!v12) {
  }
    }
  return v20;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = [v5 valueSource];

  v8 = [(HFChildServiceControlItem *)self parentService];
  v9 = [(HFChildServiceControlItem *)self childServiceFilter];
  v10 = [(HFControlItem *)self displayResults];
  id v11 = (void *)[v6 initWithBaseValueSource:v7 parentService:v8 childServiceFilter:v9 displayResults:v10];

  [v11 copyLatestResultsFromItem:self];
  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke;
  v20[3] = &unk_264092890;
  v20[4] = self;
  v4 = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke((uint64_t)v20);
  id v5 = [HFCharacteristicBatchReadResponse alloc];
  id v6 = [MEMORY[0x263EFFA08] set];
  v7 = [(HFCharacteristicBatchReadResponse *)v5 initWithReadResponses:v6 contextProvider:0];
  v8 = [(HFControlItem *)self resultsForBatchReadResponse:v7];
  v9 = (void *)[v8 mutableCopy];

  [v9 setObject:v4 forKeyedSubscript:@"childServices"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_2640928B8;
  id v18 = v9;
  id v19 = v4;
  id v10 = v4;
  id v11 = v9;
  v12 = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v17);
  [v11 setObject:v12 forKeyedSubscript:@"dependentHomeKitObjects"];

  id v13 = (void *)MEMORY[0x263F58190];
  id v14 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  v15 = [v13 futureWithResult:v14];

  return v15;
}

id __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) childServiceFilter];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = [v3 childServiceFilter];
    id v5 = [*(id *)(a1 + 32) parentService];
    id v6 = [v4 filteredChildServicesForParentService:v5];
  }
  else
  {
    v4 = [v3 parentService];
    id v6 = objc_msgSend(v4, "hf_childServices");
  }

  return v6;
}

id __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)[v2 mutableCopy];
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
    v4 = (void *)[v5 mutableCopy];
  }
  [v4 unionSet:*(void *)(a1 + 40)];
  return v4;
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
  id v5 = [(HFChildServiceControlItem *)self parentService];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (HMService)parentService
{
  return self->_parentService;
}

- (HFChildServiceFilter)childServiceFilter
{
  return self->_childServiceFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServiceFilter, 0);
  objc_storeStrong((id *)&self->_parentService, 0);
}

@end