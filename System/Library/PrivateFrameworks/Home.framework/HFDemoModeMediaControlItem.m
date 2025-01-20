@interface HFDemoModeMediaControlItem
+ (Class)valueClass;
- (HFDemoModeMediaControlItem)initWithDisplayResults:(id)a3;
- (HFDemoModeMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFNullValueSource)mediaValueSource;
- (HMAccessory)accessory;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)toggleValue;
- (id)valueForCharacteristicValues:(id)a3;
- (void)setAccessory:(id)a3;
@end

@implementation HFDemoModeMediaControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFDemoModeMediaControlItem)initWithDisplayResults:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HFNullValueSource);
  v6 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v7 = [MEMORY[0x263EFFA08] set];
  v8 = [(HFSimpleAggregatedCharacteristicValueSource *)v6 initWithValueSource:v5 characteristics:v7 primaryServiceDescriptor:0];

  v9 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v12.receiver = self;
  v12.super_class = (Class)HFDemoModeMediaControlItem;
  v10 = [(HFControlItem *)&v12 initWithValueSource:v8 characteristicOptions:v9 displayResults:v4];

  if (v10) {
    objc_storeStrong((id *)&v10->_mediaValueSource, v5);
  }

  return v10;
}

- (HFDemoModeMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithDisplayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDemoModeMediaControlItem.m", 51, @"%s is unavailable; use %@ instead",
    "-[HFDemoModeMediaControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFControlItem *)self displayResults];
  v7 = (void *)[v5 initWithDisplayResults:v6];

  return v7;
}

- (id)readValueAndPopulateStandardResults
{
  v22.receiver = self;
  v22.super_class = (Class)HFDemoModeMediaControlItem;
  v3 = [(HFControlItem *)&v22 readValueAndPopulateStandardResults];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [(HFDemoModeMediaControlItem *)self accessory];
  v6 = [v5 applicationData];
  v7 = [v6 objectForKeyedSubscript:@"primaryDisplayState"];

  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 integerValue];
  if (v11 == 2) {
    objc_super v12 = &unk_26C0F68D0;
  }
  else {
    objc_super v12 = &unk_26C0F68E8;
  }
  [v4 setObject:v12 forKeyedSubscript:@"value"];
  [v4 setObject:&unk_26C0F6900 forKeyedSubscript:@"controlItemPurpose"];
  v13 = [(HFDemoModeMediaControlItem *)self mediaValueSource];
  v14 = [v13 mediaProfileContainerForRouteID:&stru_26C081158];
  v15 = objc_msgSend(v14, "hf_serviceNameComponents");

  if (v15)
  {
    [v4 setObject:v15 forKeyedSubscript:@"serviceNameComponents"];
    v16 = [v15 composedString];
    if (v16) {
      [v4 setObject:v16 forKeyedSubscript:@"title"];
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__HFDemoModeMediaControlItem_readValueAndPopulateStandardResults__block_invoke;
  v20[3] = &unk_26408E098;
  id v21 = v4;
  id v17 = v4;
  v18 = [v3 flatMap:v20];

  return v18;
}

id __65__HFDemoModeMediaControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  id v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(NSDictionary, "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return &unk_26C0F6918;
}

- (id)normalizedValueForValue:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)toggleValue
{
  id v3 = [(HFDemoModeMediaControlItem *)self accessory];
  id v4 = [v3 applicationData];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"primaryDisplayState"];

  if (v5) {
    v6 = (void *)v5;
  }
  else {
    v6 = &unk_26C0F68E8;
  }
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 integerValue];
  if (v10 == 1) {
    uint64_t v11 = &unk_26C0F68D0;
  }
  else {
    uint64_t v11 = &unk_26C0F68E8;
  }
  objc_super v12 = [(HFDemoModeMediaControlItem *)self accessory];
  v13 = [v12 applicationData];
  [v13 setObject:v11 forKeyedSubscript:@"primaryDisplayState"];

  v14 = +[HFDemoModeAccessoryManager sharedManager];
  v15 = [(HFDemoModeMediaControlItem *)self accessory];
  [v14 dispatchUpdateMessageForAccessory:v15];

  v16 = [MEMORY[0x263F58190] futureWithNoResult];

  return v16;
}

- (HFNullValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end