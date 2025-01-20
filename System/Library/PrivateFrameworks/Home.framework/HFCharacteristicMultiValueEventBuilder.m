@interface HFCharacteristicMultiValueEventBuilder
- (BOOL)isEqual:(id)a3;
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (HFCharacteristicMultiValueEventBuilder)initWithCharacteristic:(id)a3 values:(id)a4;
- (NSCopying)representativeTargetValue;
- (NSSet)triggerValues;
- (id)buildNewEventsFromCurrentState;
- (id)comparisonKey;
- (id)hf_representativeTriggerValue;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (unint64_t)hash;
- (void)copyValuesFromCharacteristicEventBuilder:(id)a3;
- (void)setRepresentativeTargetValue:(id)a3;
- (void)setTriggerValues:(id)a3;
@end

@implementation HFCharacteristicMultiValueEventBuilder

- (HFCharacteristicMultiValueEventBuilder)initWithCharacteristic:(id)a3 values:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  v7 = [(HFCharacteristicEventBuilder *)&v12 _initWithCharacteristic:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    triggerValues = v7->_triggerValues;
    v7->_triggerValues = (NSSet *)v8;

    representativeTargetValue = v7->_representativeTargetValue;
    v7->_representativeTargetValue = 0;
  }
  return v7;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
  char v7 = [v6 containsObject:v5];

  return v7;
}

- (id)comparisonKey
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  v4 = [(HFEventBuilder *)&v12 comparisonKey];
  id v5 = [(HFCharacteristicEventBuilder *)self characteristic];
  id v6 = [v5 uniqueIdentifier];
  char v7 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
  uint64_t v8 = [v7 allObjects];
  v9 = [v8 componentsJoinedByString:@","];
  v10 = [v3 stringWithFormat:@"%@-%@:(%@)", v4, v6, v9];

  return v10;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
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
    uint64_t v8 = [v7 triggerValues];
    triggerValues = self->_triggerValues;
    self->_triggerValues = v8;
  }
}

- (id)buildNewEventsFromCurrentState
{
  v3 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__HFCharacteristicMultiValueEventBuilder_buildNewEventsFromCurrentState__block_invoke;
  v6[3] = &unk_26408D878;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

id __72__HFCharacteristicMultiValueEventBuilder_buildNewEventsFromCurrentState__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0E258];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) characteristic];
  id v7 = (void *)[v5 initWithCharacteristic:v6 triggerValue:v4];

  return v7;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E310];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [(HFCharacteristicEventBuilder *)self characteristic];
  uint64_t v8 = [v5 setWithObject:v7];
  v9 = [(HFCharacteristicMultiValueEventBuilder *)self hf_representativeTriggerValue];
  objc_super v10 = objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);

  return v10;
}

- (id)hf_representativeTriggerValue
{
  v3 = [(HFCharacteristicMultiValueEventBuilder *)self representativeTargetValue];

  if (v3)
  {
    id v4 = [(HFCharacteristicMultiValueEventBuilder *)self representativeTargetValue];
  }
  else
  {
    id v5 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
    id v4 = [v5 anyObject];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (HFCharacteristicMultiValueEventBuilder *)v4;
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
    v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
    char v8 = 0;
    if ([(HFCharacteristicEventBuilder *)&v12 isEqual:v5] && v7)
    {
      v9 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
      objc_super v10 = [(HFCharacteristicMultiValueEventBuilder *)v7 triggerValues];
      char v8 = [v9 isEqualToSet:v10];
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  unint64_t v3 = [(HFCharacteristicEventBuilder *)&v7 hash];
  id v4 = [(HFCharacteristicMultiValueEventBuilder *)self triggerValues];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSSet)triggerValues
{
  return self->_triggerValues;
}

- (void)setTriggerValues:(id)a3
{
}

- (NSCopying)representativeTargetValue
{
  return self->_representativeTargetValue;
}

- (void)setRepresentativeTargetValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeTargetValue, 0);
  objc_storeStrong((id *)&self->_triggerValues, 0);
}

@end