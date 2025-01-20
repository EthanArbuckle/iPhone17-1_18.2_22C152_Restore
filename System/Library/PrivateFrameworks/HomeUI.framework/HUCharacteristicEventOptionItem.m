@interface HUCharacteristicEventOptionItem
- (BOOL)isValidThresholdValue:(id)a3;
- (HMCharacteristic)mainCharacteristic;
- (HMNumberRange)thresholdValueRange;
- (HMNumberRange)triggerValueRange;
- (HMNumberRange)triggerValueRangeByApplyingThreshold;
- (HUCharacteristicEventOptionItem)childItem;
- (HUCharacteristicEventOptionItem)init;
- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4;
- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4;
- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4;
- (NSArray)validTriggerValues;
- (NSArray)visibleTriggerValues;
- (NSCopying)triggerValue;
- (NSNumber)thresholdValue;
- (NSSet)characteristics;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)localizedDescriptionForThresholdValue:(id)a3;
- (id)localizedListDescriptionForThresholdValue:(id)a3;
- (id)representativeTriggerValue;
- (void)setChildItem:(id)a3;
- (void)setThresholdValue:(id)a3;
@end

@implementation HUCharacteristicEventOptionItem

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = [(HUCharacteristicEventOptionItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    uint64_t v11 = [v8 copyWithZone:0];
    triggerValue = v10->_triggerValue;
    v10->_triggerValue = (NSCopying *)v11;
  }
  return v10;
}

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = [(HUCharacteristicEventOptionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    objc_storeStrong((id *)&v10->_triggerValueRange, a4);
  }

  return v10;
}

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = [(HUCharacteristicEventOptionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    objc_storeStrong((id *)&v10->_thresholdValueRange, a4);
  }

  return v10;
}

- (HUCharacteristicEventOptionItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HUCharacteristicEventOptionItem.m" lineNumber:56 description:@"Use -initWithCharacteristics:triggerValue:"];

  return 0;
}

- (void)setThresholdValue:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_thresholdValue, a3);
  v5 = [(HUCharacteristicEventOptionItem *)self childItem];

  if (v5)
  {
    v6 = [(HUCharacteristicEventOptionItem *)self childItem];
    [v6 setThresholdValue:v7];
  }
}

- (HMCharacteristic)mainCharacteristic
{
  v3 = [(HUCharacteristicEventOptionItem *)self characteristics];
  v4 = [v3 anyObject];

  v5 = [v4 characteristicType];
  v6 = [(HUCharacteristicEventOptionItem *)self characteristics];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HUCharacteristicEventOptionItem_mainCharacteristic__block_invoke;
  v12[3] = &unk_1E6387020;
  id v13 = v5;
  id v7 = v5;
  int v8 = objc_msgSend(v6, "na_any:", v12);

  if (v8) {
    v9 = 0;
  }
  else {
    v9 = v4;
  }
  v10 = v9;

  return v10;
}

uint64_t __53__HUCharacteristicEventOptionItem_mainCharacteristic__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (NSArray)validTriggerValues
{
  v3 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
  if (v3)
  {
    uint64_t v4 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
    v5 = objc_msgSend(v4, "hf_triggerValues");
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)visibleTriggerValues
{
  v3 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
  uint64_t v4 = objc_msgSend(v3, "hf_visibleTriggerValues");

  v5 = (void *)MEMORY[0x1E4F2E7A8];
  v6 = [(HUCharacteristicEventOptionItem *)self characteristics];
  id v7 = objc_msgSend(v5, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v6);

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F1CA80] set];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HUCharacteristicEventOptionItem_visibleTriggerValues__block_invoke;
    v12[3] = &unk_1E638AE98;
    id v13 = v7;
    id v14 = v8;
    id v9 = v8;
    uint64_t v10 = objc_msgSend(v4, "na_filter:", v12);

    uint64_t v4 = (void *)v10;
  }

  return (NSArray *)v4;
}

uint64_t __55__HUCharacteristicEventOptionItem_visibleTriggerValues__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) stringForObjectValue:a2];
  int v4 = [*(id *)(a1 + 40) containsObject:v3];
  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return v4 ^ 1u;
}

- (HMNumberRange)triggerValueRangeByApplyingThreshold
{
  uint64_t v3 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
  if (!v3) {
    goto LABEL_8;
  }
  int v4 = (void *)v3;
  uint64_t v5 = [(HUCharacteristicEventOptionItem *)self thresholdValue];
  if (!v5)
  {

    goto LABEL_8;
  }
  v6 = (void *)v5;
  id v7 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  int v8 = [v7 minValue];
  id v9 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  uint64_t v10 = [v9 maxValue];

  if (v8 == v10) {
    goto LABEL_8;
  }
  uint64_t v11 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  objc_super v12 = [v11 maxValue];

  if (!v12)
  {
    v26 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
    v27 = [(HUCharacteristicEventOptionItem *)self thresholdValue];
    v17 = objc_msgSend(v26, "hf_valueBeforeTriggerValue:", v27);

    v28 = (void *)MEMORY[0x1E4F2E9C8];
    v19 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
    v20 = objc_msgSend(v19, "hf_minimumTriggerValue");
    v21 = v28;
    v22 = v20;
    v23 = v17;
    goto LABEL_13;
  }
  id v13 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  id v14 = [v13 minValue];

  if (v14)
  {
LABEL_8:
    v24 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
    goto LABEL_9;
  }
  v15 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
  v16 = [(HUCharacteristicEventOptionItem *)self thresholdValue];
  v17 = objc_msgSend(v15, "hf_valueAfterTriggerValue:", v16);

  v18 = (void *)MEMORY[0x1E4F2E9C8];
  v19 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
  v20 = objc_msgSend(v19, "hf_maximumTriggerValue");
  v21 = v18;
  v22 = v17;
  v23 = v20;
LABEL_13:
  v24 = [v21 numberRangeWithMinValue:v22 maxValue:v23];

LABEL_9:

  return (HMNumberRange *)v24;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  int v4 = [(HUCharacteristicEventOptionItem *)self characteristics];
  uint64_t v5 = [v4 count];

  if (!v5) {
    NSLog(&cfstr_MustHaveCharac.isa);
  }
  v6 = [(HUCharacteristicEventOptionItem *)self characteristics];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    int v8 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];

    if (!v8)
    {
      v17 = (void *)MEMORY[0x1E4F2E7A8];
      v18 = [(HUCharacteristicEventOptionItem *)self characteristics];
      id v19 = [(HUCharacteristicEventOptionItem *)self representativeTriggerValue];
      v20 = objc_msgSend(v17, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v18, v19);
      v21 = 0;
LABEL_21:

      if (v20)
      {
        [v7 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        v37 = [NSString stringWithFormat:@"AccessoryDetails.%@", v20];
        [v7 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68928]];
      }
      else
      {
        [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
      }
      v38 = [(HUCharacteristicEventOptionItem *)self childItem];
      if (v38)
      {
        v39 = (void *)MEMORY[0x1E4F1CAD0];
        v40 = [(HUCharacteristicEventOptionItem *)self childItem];
        v41 = [v39 setWithObject:v40];
        [v7 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F688E0]];
      }
      else
      {
        [v7 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F688E0]];
      }

      v42 = [(HUCharacteristicEventOptionItem *)self visibleTriggerValues];
      [v7 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F68C98]];

      objc_msgSend(v7, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E4F68990]);
      v43 = (void *)MEMORY[0x1E4F7A0D8];
      v44 = [MEMORY[0x1E4F69228] outcomeWithResults:v7];
      v16 = [v43 futureWithResult:v44];

      goto LABEL_28;
    }
    id v9 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
    uint64_t v10 = [v9 minValue];

    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F2E9C8];
      objc_super v12 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
      id v13 = [v12 minValue];
      uint64_t v14 = [v11 numberRangeWithMinValue:v13];
    }
    else
    {
      v22 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
      v23 = [v22 maxValue];

      if (!v23)
      {
        v18 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
        goto LABEL_12;
      }
      v24 = (void *)MEMORY[0x1E4F2E9C8];
      objc_super v12 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
      id v13 = [v12 maxValue];
      uint64_t v14 = [v24 numberRangeWithMaxValue:v13];
    }
    v18 = (void *)v14;

LABEL_12:
    v25 = (void *)MEMORY[0x1E4F2E7A8];
    v26 = [(HUCharacteristicEventOptionItem *)self characteristics];
    v20 = objc_msgSend(v25, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v26, v18, 0);

    v27 = (void *)MEMORY[0x1E4F2E7A8];
    v28 = [(HUCharacteristicEventOptionItem *)self characteristics];
    v29 = objc_msgSend(v27, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v28);

    v30 = [(HUCharacteristicEventOptionItem *)self thresholdValue];
    v21 = [v29 stringForObjectValue:v30];

    id v19 = v29;
    if ([v19 conformsToProtocol:&unk_1F1AD9330]) {
      v31 = v19;
    }
    else {
      v31 = 0;
    }
    id v32 = v31;

    if (v32
      && ([v32 unitDescription], v33 = objc_claimAutoreleasedReturnValue(),
                                                v33,
                                                v33))
    {
      v34 = [v32 unitDescription];
      [v7 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F68AD0]];
    }
    else
    {
      v35 = [(HUCharacteristicEventOptionItem *)self mainCharacteristic];
      v34 = [v35 characteristicType];

      if ([v34 isEqualToString:*MEMORY[0x1E4F2CEA8]])
      {
        v36 = HFLocalizedString();
        [v7 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68AD0]];
      }
    }

    goto LABEL_21;
  }
  v15 = (void *)MEMORY[0x1E4F7A0D8];
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
  v16 = [v15 futureWithError:v7];
LABEL_28:

  return v16;
}

- (BOOL)isValidThresholdValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  v6 = [v5 minValue];

  id v7 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
  int v8 = [v7 maxValue];

  if (v6 && [v4 compare:v6] == -1)
  {
    BOOL v9 = 0;
  }
  else if (v8)
  {
    BOOL v9 = [v4 compare:v8] != 1;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)localizedDescriptionForThresholdValue:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F2E7A8];
  id v5 = a3;
  v6 = [(HUCharacteristicEventOptionItem *)self characteristics];
  id v7 = objc_msgSend(v4, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v6, v5);

  return v7;
}

- (id)localizedListDescriptionForThresholdValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCharacteristicEventOptionItem *)self latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68C98]];
  id v7 = (id)objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = (void *)MEMORY[0x1E4F2E7A8];
  uint64_t v11 = [(HUCharacteristicEventOptionItem *)self characteristics];
  if (v9) {
    objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:visibleTriggerValues:", v11, v4, v9);
  }
  else {
  objc_super v12 = objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v11, v4);
  }

  id v13 = [(HUCharacteristicEventOptionItem *)self latestResults];
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AD0]];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F2E7A8];
    v16 = [(HUCharacteristicEventOptionItem *)self characteristics];
    v17 = objc_msgSend(v15, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v16);

    id v18 = v17;
    if ([v18 conformsToProtocol:&unk_1F1AD9330]) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      uint64_t v21 = [v20 stringForObjectValue:v4 withUnit:0];

      objc_super v12 = (void *)v21;
    }
  }

  return v12;
}

- (id)representativeTriggerValue
{
  uint64_t v3 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];

  if (v3)
  {
    id v4 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
    id v5 = [v4 maxValue];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v9 = [(HUCharacteristicEventOptionItem *)self thresholdValueRange];
      id v7 = [v9 minValue];
    }
  }
  else
  {
    int v8 = [(HUCharacteristicEventOptionItem *)self triggerValue];
    if (v8)
    {
      id v4 = v8;
      id v7 = v4;
    }
    else
    {
      uint64_t v11 = [(HUCharacteristicEventOptionItem *)self triggerValueRange];
      objc_msgSend(v11, "hf_representativeValue");
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      id v4 = 0;
    }
  }

  return v7;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

- (NSCopying)triggerValue
{
  return self->_triggerValue;
}

- (HMNumberRange)triggerValueRange
{
  return self->_triggerValueRange;
}

- (HMNumberRange)thresholdValueRange
{
  return self->_thresholdValueRange;
}

- (HUCharacteristicEventOptionItem)childItem
{
  return self->_childItem;
}

- (void)setChildItem:(id)a3
{
}

- (NSNumber)thresholdValue
{
  return self->_thresholdValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdValue, 0);
  objc_storeStrong((id *)&self->_childItem, 0);
  objc_storeStrong((id *)&self->_thresholdValueRange, 0);
  objc_storeStrong((id *)&self->_triggerValueRange, 0);
  objc_storeStrong((id *)&self->_triggerValue, 0);

  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end