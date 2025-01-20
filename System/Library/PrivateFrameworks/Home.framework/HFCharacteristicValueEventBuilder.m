@interface HFCharacteristicValueEventBuilder
- (BOOL)isEqual:(id)a3;
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (HFCharacteristicValueEventBuilder)initWithCharacteristic:(id)a3 triggerValue:(id)a4;
- (HFCharacteristicValueEventBuilder)initWithEvent:(id)a3;
- (NSCopying)triggerValue;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)triggeringValues;
- (unint64_t)hash;
- (void)copyValuesFromCharacteristicEventBuilder:(id)a3;
- (void)setTriggerValue:(id)a3;
@end

@implementation HFCharacteristicValueEventBuilder

- (HFCharacteristicValueEventBuilder)initWithEvent:(id)a3
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFCharacteristicEventBuilder.m", 153, @"Event must be characteristic event: %@", v5 object file lineNumber description];

    v9 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicValueEventBuilder;
    v6 = [(HFCharacteristicEventBuilder *)&v12 _initWithEvent:v5];
    if (v6)
    {
      uint64_t v7 = [v5 triggerValue];
      v8 = (void *)v6[3];
      v6[3] = v7;
    }
    self = v6;
    v9 = self;
  }

  return v9;
}

- (HFCharacteristicValueEventBuilder)initWithCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicValueEventBuilder;
  v8 = [(HFCharacteristicEventBuilder *)&v11 _initWithCharacteristic:a3];
  v9 = (HFCharacteristicValueEventBuilder *)v8;
  if (v8) {
    objc_storeStrong(v8 + 3, a4);
  }

  return v9;
}

- (id)comparisonKey
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicValueEventBuilder;
  v4 = [(HFEventBuilder *)&v10 comparisonKey];
  id v5 = [(HFCharacteristicEventBuilder *)self characteristic];
  v6 = [v5 uniqueIdentifier];
  id v7 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  v8 = [v3 stringWithFormat:@"%@-%@:%@", v4, v6, v7];

  return v8;
}

- (id)triggeringValues
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v5 = a4;
  v6 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCharacteristicValueEventBuilder;
  [(HFCharacteristicEventBuilder *)&v9 copyValuesFromCharacteristicEventBuilder:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 triggerValue];
    [(HFCharacteristicValueEventBuilder *)self setTriggerValue:v8];
  }
}

- (id)buildNewEventsFromCurrentState
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = objc_alloc(MEMORY[0x263F0E258]);
  id v5 = [(HFCharacteristicEventBuilder *)self characteristic];
  v6 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  id v7 = (void *)[v4 initWithCharacteristic:v5 triggerValue:v6];
  v8 = [v3 setWithObject:v7];

  return v8;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E310];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [(HFCharacteristicEventBuilder *)self characteristic];
  v8 = [v5 setWithObject:v7];
  objc_super v9 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  objc_super v10 = objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (HFCharacteristicValueEventBuilder *)v4;
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
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicValueEventBuilder;
    char v8 = 0;
    if ([(HFCharacteristicEventBuilder *)&v12 isEqual:v5] && v7)
    {
      objc_super v9 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
      objc_super v10 = [(HFCharacteristicValueEventBuilder *)v7 triggerValue];
      char v8 = [v9 isEqual:v10];
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HFCharacteristicValueEventBuilder;
  unint64_t v3 = [(HFCharacteristicEventBuilder *)&v7 hash];
  id v4 = [(HFCharacteristicValueEventBuilder *)self triggerValue];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSCopying)triggerValue
{
  return self->_triggerValue;
}

- (void)setTriggerValue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicValueEventBuilder;
  unint64_t v5 = [(HFEventBuilder *)&v12 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke;
    v10[3] = &unk_264091060;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke_2;
    v8[3] = &unk_264091060;
    v8[4] = self;
    id v9 = v6;
  }
  return v5;
}

uint64_t __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) characteristic];
  unint64_t v3 = [*(id *)(a1 + 40) characteristic];
  uint64_t v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

uint64_t __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) triggerValue];
  unint64_t v3 = [*(id *)(a1 + 40) triggerValue];
  uint64_t v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

@end