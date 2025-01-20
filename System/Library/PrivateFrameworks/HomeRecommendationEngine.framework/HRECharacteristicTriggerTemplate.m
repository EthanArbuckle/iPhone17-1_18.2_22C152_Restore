@interface HRECharacteristicTriggerTemplate
- (BOOL)allowMultipleEventsFeature;
- (BOOL)characteristicPerServiceRule;
- (BOOL)enforcePriority;
- (BOOL)singleRecommendationPerSplit;
- (HRECharacteristicTriggerTemplate)init;
- (NSArray)characteristicTypePriority;
- (NSArray)triggerCharacteristicValues;
- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4;
- (void)setAllowMultipleEventsFeature:(BOOL)a3;
- (void)setCharacteristicPerServiceRule:(BOOL)a3;
- (void)setCharacteristicTypePriority:(id)a3;
- (void)setEnforcePriority:(BOOL)a3;
- (void)setSingleRecommendationPerSplit:(BOOL)a3;
- (void)setTriggerCharacteristicValues:(id)a3;
@end

@implementation HRECharacteristicTriggerTemplate

- (HRECharacteristicTriggerTemplate)init
{
  v5.receiver = self;
  v5.super_class = (Class)HRECharacteristicTriggerTemplate;
  v2 = [(HRETemplate *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HRECharacteristicTriggerTemplate *)v2 setCharacteristicPerServiceRule:0];
    [(HRECharacteristicTriggerTemplate *)v3 setEnforcePriority:0];
    [(HRECharacteristicTriggerTemplate *)v3 setAllowMultipleEventsFeature:0];
    [(HRECharacteristicTriggerTemplate *)v3 setSingleRecommendationPerSplit:0];
  }
  return v3;
}

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  id v9 = objc_alloc(MEMORY[0x263F47B40]);
  v10 = [v6 home];
  v11 = (void *)[v9 initWithHome:v10 context:v8];

  v12 = [v6 splitCharacteristic];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263EFFA08];
    v14 = [v6 splitCharacteristic];
    v25[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v16 = [v13 setWithArray:v15];

LABEL_5:
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_4;
    v22[3] = &unk_264CF3B58;
    v22[4] = self;
    id v17 = v11;
    id v23 = v17;
    objc_msgSend(v16, "na_each:", v22);
    v18 = [v17 characteristics];
    uint64_t v19 = [v18 count];

    if (v19) {
      id v20 = v17;
    }
    else {
      id v20 = 0;
    }

    goto LABEL_9;
  }
  if ([(HRECharacteristicTriggerTemplate *)self allowMultipleEventsFeature])
  {
    v14 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_1);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_2;
    v24[3] = &unk_264CF37F8;
    v24[4] = self;
    v16 = objc_msgSend(v14, "na_filter:", v24);
    goto LABEL_5;
  }
  id v20 = 0;
LABEL_9:

  return v20;
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_characteristics");
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) triggerCharacteristicValues];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_3;
  v8[3] = &unk_264CF3B08;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 type];
  v4 = [*(id *)(a1 + 32) characteristicType];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isNotificationEnabled])
  {
    v4 = [*(id *)(a1 + 32) triggerCharacteristicValues];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_5;
    v15[3] = &unk_264CF3B08;
    id v5 = v3;
    id v16 = v5;
    uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v15);

    id v7 = [v6 value];
    v8 = [MEMORY[0x263EFF9C0] set];
    if (v7)
    {
      id v9 = objc_msgSend(MEMORY[0x263F0E310], "hf_allTriggerValuesForCharacteristic:similarToValue:", v5, v7);
      if ([v9 count]) {
        [v8 unionSet:v9];
      }
      [v8 addObject:v7];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_6;
    v11[3] = &unk_264CF3B30;
    id v12 = *(id *)(a1 + 40);
    id v13 = v5;
    id v14 = v7;
    id v10 = v7;
    objc_msgSend(v8, "na_each:", v11);
  }
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 type];
  v4 = [*(id *)(a1 + 32) characteristicType];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v7;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) characteristicInterface];
    [v6 setCharacteristic:*(void *)(a1 + 40) triggerValueRange:v5];
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v6 = [*(id *)(a1 + 32) characteristicInterface];
    [v6 setCharacteristic:*(void *)(a1 + 40) triggerValue:*(void *)(a1 + 48)];
  }

LABEL_9:
}

- (NSArray)triggerCharacteristicValues
{
  return self->_triggerCharacteristicValues;
}

- (void)setTriggerCharacteristicValues:(id)a3
{
}

- (NSArray)characteristicTypePriority
{
  return self->_characteristicTypePriority;
}

- (void)setCharacteristicTypePriority:(id)a3
{
}

- (BOOL)characteristicPerServiceRule
{
  return self->_characteristicPerServiceRule;
}

- (void)setCharacteristicPerServiceRule:(BOOL)a3
{
  self->_characteristicPerServiceRule = a3;
}

- (BOOL)enforcePriority
{
  return self->_enforcePriority;
}

- (void)setEnforcePriority:(BOOL)a3
{
  self->_enforcePriority = a3;
}

- (BOOL)singleRecommendationPerSplit
{
  return self->_singleRecommendationPerSplit;
}

- (void)setSingleRecommendationPerSplit:(BOOL)a3
{
  self->_singleRecommendationPerSplit = a3;
}

- (BOOL)allowMultipleEventsFeature
{
  return self->_allowMultipleEventsFeature;
}

- (void)setAllowMultipleEventsFeature:(BOOL)a3
{
  self->_allowMultipleEventsFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypePriority, 0);

  objc_storeStrong((id *)&self->_triggerCharacteristicValues, 0);
}

@end