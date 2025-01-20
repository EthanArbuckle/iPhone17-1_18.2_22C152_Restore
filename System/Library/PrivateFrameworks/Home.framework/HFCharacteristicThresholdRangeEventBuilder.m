@interface HFCharacteristicThresholdRangeEventBuilder
+ (BOOL)_wouldFireForValue:(id)a3 thresholdRange:(id)a4 characteristic:(id)a5;
- (BOOL)hf_wouldFireForValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (HFCharacteristicThresholdRangeEventBuilder)initWithCharacteristic:(id)a3 thresholdRange:(id)a4;
- (HFCharacteristicThresholdRangeEventBuilder)initWithEvent:(id)a3;
- (HMNumberRange)thresholdRange;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)triggeringValues;
- (unint64_t)hash;
- (void)copyValuesFromCharacteristicEventBuilder:(id)a3;
- (void)setThresholdRange:(id)a3;
@end

@implementation HFCharacteristicThresholdRangeEventBuilder

- (HFCharacteristicThresholdRangeEventBuilder)initWithEvent:(id)a3
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFCharacteristicEventBuilder.m", 241, @"Event must be characteristic threshold range event: %@", v5 object file lineNumber description];

    v9 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
    v6 = [(HFCharacteristicEventBuilder *)&v12 _initWithEvent:v5];
    if (v6)
    {
      uint64_t v7 = [v5 thresholdRange];
      v8 = (void *)v6[3];
      v6[3] = v7;
    }
    self = v6;
    v9 = self;
  }

  return v9;
}

- (HFCharacteristicThresholdRangeEventBuilder)initWithCharacteristic:(id)a3 thresholdRange:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  v8 = [(HFCharacteristicEventBuilder *)&v11 _initWithCharacteristic:a3];
  v9 = (HFCharacteristicThresholdRangeEventBuilder *)v8;
  if (v8) {
    objc_storeStrong(v8 + 3, a4);
  }

  return v9;
}

- (BOOL)hf_wouldFireForValue:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v6 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
  id v7 = [(HFCharacteristicEventBuilder *)self characteristic];
  LOBYTE(v5) = [v5 _wouldFireForValue:v4 thresholdRange:v6 characteristic:v7];

  return (char)v5;
}

- (id)triggeringValues
{
  v3 = [(HFCharacteristicEventBuilder *)self characteristic];
  id v4 = [v3 metadata];

  id v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [v4 validValues];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HFCharacteristicThresholdRangeEventBuilder_triggeringValues__block_invoke;
  v10[3] = &unk_26408D850;
  v10[4] = self;
  id v7 = objc_msgSend(v6, "na_filter:", v10);
  v8 = [v5 setWithArray:v7];

  return v8;
}

uint64_t __62__HFCharacteristicThresholdRangeEventBuilder_triggeringValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) thresholdRange];
  id v5 = [v4 minValue];
  if (v5)
  {
    [v3 doubleValue];
    double v7 = v6;
    v8 = [*(id *)(a1 + 32) thresholdRange];
    v9 = [v8 minValue];
    [v9 doubleValue];
    BOOL v11 = v7 > v10;
  }
  else
  {
    BOOL v11 = 1;
  }

  objc_super v12 = [*(id *)(a1 + 32) thresholdRange];
  v13 = [v12 maxValue];
  if (v13)
  {
    [v3 doubleValue];
    double v15 = v14;
    v16 = [*(id *)(a1 + 32) thresholdRange];
    v17 = [v16 maxValue];
    [v17 doubleValue];
    BOOL v19 = v15 < v18;
  }
  else
  {
    BOOL v19 = 1;
  }

  return v11 & v19;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HFCharacteristicEventBuilder *)self characteristic];
  int v9 = [v7 isEqual:v8];

  if (v9) {
    BOOL v10 = [(HFCharacteristicThresholdRangeEventBuilder *)self hf_wouldFireForValue:v6];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)comparisonKey
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  id v4 = [(HFEventBuilder *)&v10 comparisonKey];
  id v5 = [(HFCharacteristicEventBuilder *)self characteristic];
  id v6 = [v5 uniqueIdentifier];
  id v7 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
  v8 = [v3 stringWithFormat:@"%@-%@:%@", v4, v6, v7];

  return v8;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  [(HFCharacteristicEventBuilder *)&v10 copyValuesFromCharacteristicEventBuilder:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 thresholdRange];
    thresholdRange = self->_thresholdRange;
    self->_thresholdRange = v8;
  }
}

- (id)buildNewEventsFromCurrentState
{
  id v3 = objc_alloc(MEMORY[0x263F0E288]);
  id v4 = [(HFCharacteristicEventBuilder *)self characteristic];
  id v5 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
  id v6 = (void *)[v3 initWithCharacteristic:v4 thresholdRange:v5];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  return v7;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E310];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [(HFCharacteristicEventBuilder *)self characteristic];
  v8 = [v5 setWithObject:v7];
  int v9 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
  objc_super v10 = objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (HFCharacteristicThresholdRangeEventBuilder *)v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v5 == self)
  {
    char v8 = 1;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
    char v8 = 0;
    if ([(HFCharacteristicEventBuilder *)&v25 isEqual:v5] && v7)
    {
      int v9 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
      objc_super v10 = [v9 minValue];
      BOOL v11 = [(HFCharacteristicThresholdRangeEventBuilder *)v7 thresholdRange];
      objc_super v12 = [v11 minValue];
      id v13 = v10;
      id v14 = v12;
      double v15 = v14;
      if (v13 == v14)
      {
        char v8 = 1;
        id v17 = v13;
        double v18 = v13;
      }
      else
      {
        if (v13)
        {
          char v16 = [v13 isEqual:v14];

          if (v16)
          {
            char v8 = 1;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {
        }
        v24 = v9;
        double v18 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
        BOOL v19 = [v18 maxValue];
        v20 = [(HFCharacteristicThresholdRangeEventBuilder *)v7 thresholdRange];
        v21 = [v20 maxValue];
        id v17 = v19;
        id v22 = v21;
        if (v17 == v22)
        {
          char v8 = 1;
        }
        else if (v17)
        {
          char v8 = [v17 isEqual:v22];
        }
        else
        {
          char v8 = 0;
        }

        int v9 = v24;
      }

      goto LABEL_21;
    }
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  unint64_t v3 = [(HFCharacteristicEventBuilder *)&v7 hash];
  id v4 = [(HFCharacteristicThresholdRangeEventBuilder *)self thresholdRange];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)_wouldFireForValue:(id)a3 thresholdRange:(id)a4 characteristic:(id)a5
{
  id v7 = a4;
  if (a3)
  {
    id v8 = a3;
    int v9 = [a5 metadata];
    objc_super v10 = objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v8);

    BOOL v11 = [v7 minValue];

    if (v11)
    {
      objc_super v12 = [v7 minValue];
      id v13 = objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v12);

      [v10 doubleValue];
      double v15 = v14;
      [v13 doubleValue];
      double v17 = v16 + -0.00000011920929;

      if (v15 < v17) {
        goto LABEL_8;
      }
    }
    double v18 = [v7 maxValue];

    if (!v18) {
      goto LABEL_6;
    }
    BOOL v19 = [v7 maxValue];
    v20 = objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v19);

    [v10 doubleValue];
    double v22 = v21;
    [v20 doubleValue];
    double v24 = v23 + 0.00000011920929;

    if (v22 > v24) {
LABEL_8:
    }
      BOOL v25 = 0;
    else {
LABEL_6:
    }
      BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (HMNumberRange)thresholdRange
{
  return self->_thresholdRange;
}

- (void)setThresholdRange:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  unint64_t v5 = [(HFEventBuilder *)&v12 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke;
    v10[3] = &unk_264091060;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke_2;
    v8[3] = &unk_264091060;
    v8[4] = self;
    id v9 = v6;
  }
  return v5;
}

uint64_t __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) characteristic];
  unint64_t v3 = [*(id *)(a1 + 40) characteristic];
  uint64_t v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

uint64_t __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) thresholdRange];
  unint64_t v3 = [v2 maxValue];
  uint64_t v4 = [*(id *)(a1 + 40) thresholdRange];
  unint64_t v5 = [v4 maxValue];
  id v6 = v3;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  if (!v6)
  {
    uint64_t v10 = 1;
    id v11 = v7;
LABEL_13:

    goto LABEL_14;
  }
  int v9 = [v6 isEqual:v7];

  if (v9)
  {
LABEL_6:
    id v11 = [*(id *)(a1 + 32) thresholdRange];
    objc_super v12 = [v11 minValue];
    id v13 = [*(id *)(a1 + 40) thresholdRange];
    double v14 = [v13 minValue];
    id v15 = v12;
    id v16 = v14;
    if (v15 == v16)
    {
      uint64_t v10 = 0;
    }
    else if (v15)
    {
      uint64_t v10 = [v15 isEqual:v16] ^ 1;
    }
    else
    {
      uint64_t v10 = 1;
    }

    goto LABEL_13;
  }
  uint64_t v10 = 1;
LABEL_14:

  return v10;
}

@end