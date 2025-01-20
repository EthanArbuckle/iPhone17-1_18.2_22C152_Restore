@interface HFCharacteristicTriggerBuilderInterface
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (NSSet)characteristics;
- (id)thresholdValueForCharacteristic:(id)a3 thresholdValueRange:(id)a4;
- (id)triggerValueForCharacteristic:(id)a3;
- (void)removeAllCharacteristics;
- (void)removeCharacteristic:(id)a3;
- (void)setCharacteristic:(id)a3 triggerValue:(id)a4;
- (void)setCharacteristic:(id)a3 triggerValueRange:(id)a4;
@end

@implementation HFCharacteristicTriggerBuilderInterface

- (NSSet)characteristics
{
  v2 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  v3 = [v2 characteristics];

  return (NSSet *)v3;
}

- (void)setCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  id v8 = v17;
  id v9 = v7;
  if (!v17)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFEventTriggerBuilder+LegacyInterfaces.m", 88, @"Invalid parameter not satisfying: %@", @"characteristic" object file lineNumber description];

    id v8 = 0;
  }
  [(HFCharacteristicTriggerBuilderInterface *)self removeCharacteristic:v8];
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x263F0E310], "hf_allTriggerValuesForCharacteristic:similarToValue:", v17, v9);
    uint64_t v11 = [v10 count];
    v12 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    if (v11 == 1)
    {
      v13 = [HFCharacteristicValueEventBuilder alloc];
      v14 = [v10 anyObject];
      v15 = [(HFCharacteristicValueEventBuilder *)v13 initWithCharacteristic:v17 triggerValue:v14];
      [(HFCharacteristicValueEventBuilder *)v12 addEventBuilder:v15];
    }
    else
    {
      v14 = [[HFCharacteristicMultiValueEventBuilder alloc] initWithCharacteristic:v17 values:v10];
      [(HFCharacteristicValueEventBuilder *)v12 addEventBuilder:v14];
    }
  }
  else
  {
    v10 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    v12 = [[HFCharacteristicValueEventBuilder alloc] initWithCharacteristic:v17 triggerValue:0];
    [v10 addEventBuilder:v12];
  }
}

- (void)setCharacteristic:(id)a3 triggerValueRange:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFEventTriggerBuilder+LegacyInterfaces.m", 106, @"Invalid parameter not satisfying: %@", @"characteristic" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"HFEventTriggerBuilder+LegacyInterfaces.m", 107, @"Invalid parameter not satisfying: %@", @"triggerValueRange" object file lineNumber description];

LABEL_3:
  [(HFCharacteristicTriggerBuilderInterface *)self removeCharacteristic:v12];
  id v8 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v9 = [[HFCharacteristicThresholdRangeEventBuilder alloc] initWithCharacteristic:v12 thresholdRange:v7];
  [v8 addEventBuilder:v9];
}

- (void)removeCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  v6 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v7 = [v6 eventBuilders];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke;
  v11[3] = &unk_264093A38;
  id v12 = v4;
  id v13 = v5;
  id v8 = v5;
  id v9 = v4;
  objc_msgSend(v7, "na_each:", v11);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke_2;
  v10[3] = &unk_26408EED0;
  v10[4] = self;
  objc_msgSend(v8, "na_each:", v10);
}

void __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = v8;
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    v6 = [v5 characteristic];
    int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

void __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

- (void)removeAllCharacteristics
{
  id v3 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v4 = [v3 eventBuilders];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_205);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke_2;
  v6[3] = &unk_26408EED0;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);
}

uint64_t __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C1021D8];
}

void __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v9 = [v8 eventBuilders];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__HFCharacteristicTriggerBuilderInterface_wouldFireForCharacteristic_value___block_invoke;
  v14[3] = &unk_26409AAE0;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  char v12 = objc_msgSend(v9, "na_any:", v14);

  return v12;
}

uint64_t __76__HFCharacteristicTriggerBuilderInterface_wouldFireForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (!v6) {
    goto LABEL_10;
  }
  id v10 = [v6 characteristic];
  if (([v10 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {

    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v11 = [v6 triggerValue];
  char v12 = [v11 isEqual:*(void *)(a1 + 40)];

  if ((v12 & 1) == 0)
  {
LABEL_10:
    if (!v9) {
      goto LABEL_15;
    }
LABEL_13:
    if (objc_msgSend(v9, "hf_wouldFireForValue:", *(void *)(a1 + 40))) {
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v13 = 0;
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v13 = 1;
LABEL_16:

  return v13;
}

- (id)thresholdValueForCharacteristic:(id)a3 thresholdValueRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v9 = [v8 eventBuilders];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __95__HFCharacteristicTriggerBuilderInterface_thresholdValueForCharacteristic_thresholdValueRange___block_invoke;
  v22 = &unk_26409AAE0;
  id v10 = v7;
  id v23 = v10;
  id v11 = v6;
  id v24 = v11;
  char v12 = objc_msgSend(v9, "na_firstObjectPassingTest:", &v19);

  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v16 = objc_msgSend(v15, "thresholdRange", v19, v20, v21, v22, v23);
    id v17 = objc_msgSend(v11, "hf_thresholdValueForRange:", v16);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

BOOL __95__HFCharacteristicTriggerBuilderInterface_thresholdValueForCharacteristic_thresholdValueRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 32) minValue];
  if (!v7) {
    goto LABEL_10;
  }
  id v8 = (void *)v7;
  id v9 = [*(id *)(a1 + 32) minValue];
  id v10 = objc_msgSend(*(id *)(a1 + 40), "hf_minimumTriggerValue");
  uint64_t v11 = [v9 compare:v10];

  if (!v11)
  {
LABEL_10:
    if (v6)
    {
      v18 = [v6 thresholdRange];
      uint64_t v19 = [v18 maxValue];
      if (v19)
      {
        uint64_t v20 = [v6 thresholdRange];
        v21 = [v20 maxValue];
        uint64_t v22 = objc_msgSend(*(id *)(a1 + 40), "hf_maximumTriggerValue");
LABEL_16:
        id v23 = (void *)v22;
        BOOL v17 = [v21 compare:v22] == 0;

LABEL_19:
        goto LABEL_20;
      }
LABEL_18:
      BOOL v17 = 1;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  uint64_t v12 = [*(id *)(a1 + 32) maxValue];
  if (!v12)
  {
    if (v6) {
      goto LABEL_14;
    }
LABEL_17:
    BOOL v17 = 0;
    goto LABEL_20;
  }
  id v13 = (void *)v12;
  v14 = [*(id *)(a1 + 32) maxValue];
  id v15 = objc_msgSend(*(id *)(a1 + 40), "hf_maximumTriggerValue");
  uint64_t v16 = [v14 compare:v15];

  BOOL v17 = 0;
  if (!v16 && v6)
  {
LABEL_14:
    v18 = [v6 thresholdRange];
    uint64_t v19 = [v18 minValue];
    if (v19)
    {
      uint64_t v20 = [v6 thresholdRange];
      v21 = [v20 minValue];
      uint64_t v22 = objc_msgSend(*(id *)(a1 + 40), "hf_minimumTriggerValue");
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (id)triggerValueForCharacteristic:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  id v5 = [v4 eventBuilders];
  id v6 = [v3 setWithArray:v5];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_104_1);

  return v7;
}

id __73__HFCharacteristicTriggerBuilderInterface_triggerValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v5)
  {
    uint64_t v9 = [v5 triggerValue];
LABEL_11:
    id v10 = (void *)v9;
    goto LABEL_12;
  }
  if (v8)
  {
    uint64_t v9 = [v8 thresholdRange];
    goto LABEL_11;
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

@end