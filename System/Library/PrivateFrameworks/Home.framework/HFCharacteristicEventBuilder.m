@interface HFCharacteristicEventBuilder
+ (id)characteristicEventBuildersForEvents:(id)a3 inHome:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (HMCharacteristic)characteristic;
- (id)_initWithCharacteristic:(id)a3;
- (id)_initWithEvent:(id)a3;
- (id)eventType;
- (id)triggeringValues;
- (unint64_t)hash;
- (void)copyValuesFromCharacteristicEventBuilder:(id)a3;
@end

@implementation HFCharacteristicEventBuilder

- (id)_initWithEvent:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && ([v5 conformsToProtocol:&unk_26C1021D8] & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HFCharacteristicEventBuilder.m", 29, @"Event must be characteristic event: %@", v6 object file lineNumber description];

    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFCharacteristicEventBuilder;
    v7 = [(HFEventBuilder *)&v13 initWithEvent:v6];
    if (v7)
    {
      uint64_t v8 = [v6 characteristic];
      characteristic = v7->_characteristic;
      v7->_characteristic = (HMCharacteristic *)v8;
    }
    self = v7;
    v10 = self;
  }

  return v10;
}

- (id)_initWithCharacteristic:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCharacteristicEventBuilder;
  v6 = [(HFEventBuilder *)&v9 initWithEvent:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_characteristic, a3);
  }

  return v7;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  v4 = [a3 characteristic];
  characteristic = self->_characteristic;
  self->_characteristic = v4;
  MEMORY[0x270F9A758](v4, characteristic);
}

- (id)triggeringValues
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFCharacteristicEventBuilder.m", 55, @"%s is an abstract method that must be overriden by subclass %@", "-[HFCharacteristicEventBuilder triggeringValues]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  return 0;
}

- (id)eventType
{
  return @"HFEventTypeCharacteristic";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (HFCharacteristicEventBuilder *)v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  v7 = v6;

  if (v5 == self)
  {
    char v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicEventBuilder;
    char v8 = 0;
    if ([(HFCharacteristicEventBuilder *)&v12 isEqual:v5] && v7)
    {
      objc_super v9 = [(HFCharacteristicEventBuilder *)self characteristic];
      v10 = [(HFCharacteristicEventBuilder *)v7 characteristic];
      char v8 = [v9 isEqual:v10];
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HFCharacteristicEventBuilder *)self characteristic];
  v3 = [v2 uniqueIdentifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

+ (id)characteristicEventBuildersForEvents:(id)a3 inHome:(id)a4
{
  unint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  v7 = objc_msgSend(v5, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_8);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_2;
  v10[3] = &unk_26408D828;
  id v8 = v6;
  id v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  return v8;
}

id __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristic];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

void __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_3;
  v8[3] = &unk_26408D7B8;
  id v9 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_4;
  v6[3] = &unk_26408D800;
  id v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "na_each:", v6);
}

id __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_3(uint64_t a1, void *a2)
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

  if (v6)
  {
    v10 = (void *)MEMORY[0x263F0E310];
    id v11 = [v7 characteristic];
    objc_super v12 = [v6 triggerValue];
    objc_super v13 = objc_msgSend(v10, "hf_representativeTriggerValueForCharacteristic:similarToValue:", v11, v12);
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    v14 = *(void **)(a1 + 32);
    v15 = [HFCharacteristicThresholdRangeEventBuilder alloc];
    id v11 = [v7 characteristic];
    objc_super v12 = [v9 thresholdRange];
    v16 = [(HFCharacteristicThresholdRangeEventBuilder *)v15 initWithCharacteristic:v11 thresholdRange:v12];
    [v14 addObject:v16];

    objc_super v13 = 0;
    goto LABEL_11;
  }
  objc_super v13 = 0;
LABEL_12:

  return v13;
}

void __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v5 count] == 1)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [HFCharacteristicValueEventBuilder alloc];
    id v8 = [v5 firstObject];

    id v9 = [(HFCharacteristicValueEventBuilder *)v7 initWithEvent:v8];
    [v6 addObject:v9];
  }
  else
  {
    v10 = [v5 firstObject];
    id v8 = [v10 characteristic];

    id v11 = [MEMORY[0x263EFFA08] setWithArray:v5];

    objc_msgSend(v11, "na_map:", &__block_literal_global_70_0);
    id v9 = (HFCharacteristicValueEventBuilder *)objc_claimAutoreleasedReturnValue();

    objc_super v12 = [[HFCharacteristicMultiValueEventBuilder alloc] initWithCharacteristic:v8 values:v9];
    [(HFCharacteristicMultiValueEventBuilder *)v12 setRepresentativeTargetValue:v13];
    [*(id *)(a1 + 32) addObject:v12];
  }
}

uint64_t __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 triggerValue];
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void).cxx_destruct
{
}

@end