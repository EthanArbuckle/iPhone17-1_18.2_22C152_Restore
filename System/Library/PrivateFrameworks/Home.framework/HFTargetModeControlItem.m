@interface HFTargetModeControlItem
- (HFMultiStateValueSet)targetModeValueSet;
- (HFPowerStateControlItem)primaryPowerStateControlItem;
- (HFTargetModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6;
- (HFTargetModeControlItem)initWithValueSource:(id)a3 targetModeCharacteristicType:(id)a4 targetModeValueSet:(id)a5 primaryPowerStateControlItem:(id)a6 displayResults:(id)a7;
- (NSString)targetModeCharacteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)toggleValue;
- (id)updateWithOptions:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFTargetModeControlItem

- (HFTargetModeControlItem)initWithValueSource:(id)a3 targetModeCharacteristicType:(id)a4 targetModeValueSet:(id)a5 primaryPowerStateControlItem:(id)a6 displayResults:(id)a7
{
  v35[1] = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v28 = a7;
  v14 = (void *)[v12 copy];
  v34 = @"title";
  v15 = _HFLocalizedStringWithDefaultValue(@"HFControlTargetModeOff", @"HFControlTargetModeOff", 1);
  v35[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  [v14 addValue:&unk_26C0F73E0 displayResults:v16 addOnlyIfValid:0];

  objc_initWeak(&location, v14);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __139__HFTargetModeControlItem_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults___block_invoke;
  v30[3] = &unk_264098D68;
  objc_copyWeak(&v32, &location);
  id v17 = v12;
  id v31 = v17;
  [v14 setValueComparator:v30];
  v18 = [v13 characteristicOptions];
  v19 = [MEMORY[0x263EFFA08] setWithObject:v11];
  v20 = [v18 optionsByAddingCharacteristicTypes:v19 forUsage:0];

  v29.receiver = self;
  v29.super_class = (Class)HFTargetModeControlItem;
  v21 = [(HFMultiStateControlItem *)&v29 initWithValueSource:v27 multiStateCharacteristicType:v11 allCharacteristicOptions:v20 possibleValueSet:v14 displayResults:v28];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_targetModeCharacteristicType, a4);
    objc_storeStrong((id *)&v22->_targetModeValueSet, a5);
    uint64_t v23 = [v13 copy];
    primaryPowerStateControlItem = v22->_primaryPowerStateControlItem;
    v22->_primaryPowerStateControlItem = (HFPowerStateControlItem *)v23;
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v22;
}

uint64_t __139__HFTargetModeControlItem_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && ([v5 isEqual:v6] & 1) == 0)
  {
    if ([v5 isEqual:&unk_26C0F73E0])
    {
      BOOL v9 = [WeakRetained count] == 2;
      uint64_t v10 = -1;
    }
    else
    {
      if (![v6 isEqual:&unk_26C0F73E0])
      {
        id v11 = [*(id *)(a1 + 32) valueComparator];
        uint64_t v8 = ((uint64_t (**)(void, id, id))v11)[2](v11, v5, v6);

        goto LABEL_12;
      }
      BOOL v9 = [WeakRetained count] == 2;
      uint64_t v10 = 1;
    }
    if (v9) {
      uint64_t v8 = v10;
    }
    else {
      uint64_t v8 = -v10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_12:

  return v8;
}

- (HFTargetModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  BOOL v9 = NSStringFromSelector(sel_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTargetModeControlItem.m", 66, @"%s is unavailable; use %@ instead",
    "-[HFTargetModeControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:]",
    v9);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
  v7 = (void *)[v6 copyWithValueSource:v5];

  id v8 = objc_alloc((Class)objc_opt_class());
  BOOL v9 = [(HFTargetModeControlItem *)self targetModeCharacteristicType];
  uint64_t v10 = [(HFTargetModeControlItem *)self targetModeValueSet];
  id v11 = (void *)[v10 copy];
  id v12 = [(HFControlItem *)self displayResults];
  id v13 = (void *)[v8 initWithValueSource:v5 targetModeCharacteristicType:v9 targetModeValueSet:v11 primaryPowerStateControlItem:v7 displayResults:v12];

  [v13 copyLatestResultsFromItem:self];
  return v13;
}

- (id)updateWithOptions:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
  id v6 = [v5 updateWithOptions:v4];

  v7 = (void *)MEMORY[0x263F58190];
  v13.receiver = self;
  v13.super_class = (Class)HFTargetModeControlItem;
  id v8 = [(HFItem *)&v13 updateWithOptions:v4];

  v14[0] = v8;
  v14[1] = v6;
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  uint64_t v10 = [v7 combineAllFutures:v9];
  id v11 = [v10 flatMap:&__block_literal_global_174];

  return v11;
}

id __45__HFTargetModeControlItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  v3 = [a2 firstObject];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
  id v6 = [v5 valueForCharacteristicValues:v4];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)HFTargetModeControlItem;
    id v8 = [(HFMultiStateControlItem *)&v10 valueForCharacteristicValues:v4];
  }
  else
  {
    id v8 = &unk_26C0F73E0;
  }

  return v8;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [NSDictionary dictionary];
    if ([v4 isEqual:&unk_26C0F73E0])
    {
      id v6 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
      uint64_t v7 = [v6 characteristicValuesForValue:&unk_26C0F73F8];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)HFTargetModeControlItem;
      uint64_t v9 = [(HFMultiStateControlItem *)&v12 characteristicValuesForValue:v4];

      objc_super v10 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
      uint64_t v7 = [v10 characteristicValuesForValue:&unk_26C0F7410];

      id v5 = (void *)v9;
    }
    id v8 = (void *)[v7 mutableCopy];
    [v8 addEntriesFromDictionary:v5];
  }
  else
  {
    NSLog(&cfstr_UnexpectedDisp.isa, v4);
    id v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

- (id)toggleValue
{
  v2 = [(HFTargetModeControlItem *)self primaryPowerStateControlItem];
  v3 = [v2 toggleValue];

  return v3;
}

- (NSString)targetModeCharacteristicType
{
  return self->_targetModeCharacteristicType;
}

- (HFMultiStateValueSet)targetModeValueSet
{
  return self->_targetModeValueSet;
}

- (HFPowerStateControlItem)primaryPowerStateControlItem
{
  return self->_primaryPowerStateControlItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryPowerStateControlItem, 0);
  objc_storeStrong((id *)&self->_targetModeValueSet, 0);
  objc_storeStrong((id *)&self->_targetModeCharacteristicType, 0);
}

@end