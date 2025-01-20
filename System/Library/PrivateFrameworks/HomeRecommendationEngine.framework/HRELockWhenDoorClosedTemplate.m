@interface HRELockWhenDoorClosedTemplate
- (HRELockWhenDoorClosedTemplate)init;
- (id)_lazy_actionMap;
@end

@implementation HRELockWhenDoorClosedTemplate

- (HRELockWhenDoorClosedTemplate)init
{
  v30[2] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)HRELockWhenDoorClosedTemplate;
  v2 = [(HRECharacteristicTriggerTemplate *)&v26 init];
  v3 = v2;
  if (v2)
  {
    [(HRETemplate *)v2 setSplitStrategy:1];
    uint64_t v4 = *MEMORY[0x263F0C008];
    v5 = +[HRETypeValueTuple type:*MEMORY[0x263F0C008] value:&unk_26EAB8B18];
    v30[0] = v5;
    uint64_t v6 = *MEMORY[0x263F0C0D0];
    v7 = +[HRETypeValueTuple type:*MEMORY[0x263F0C0D0] value:&unk_26EAB8B30];
    v30[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    [(HRECharacteristicTriggerTemplate *)v3 setTriggerCharacteristicValues:v8];

    v29[0] = v4;
    v29[1] = v6;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    [(HRECharacteristicTriggerTemplate *)v3 setCharacteristicTypePriority:v9];

    [(HRECharacteristicTriggerTemplate *)v3 setEnforcePriority:1];
    [(HRECharacteristicTriggerTemplate *)v3 setSingleRecommendationPerSplit:1];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = *MEMORY[0x263F0D798];
    v12 = +[HRERecommendableObjectTypeRule ruleWithRequiredType:*MEMORY[0x263F0D798]];
    v28[0] = v12;
    uint64_t v13 = *MEMORY[0x263F0D6A8];
    v14 = +[HRERecommendableObjectTypeRule ruleWithRequiredType:*MEMORY[0x263F0D6A8]];
    v28[1] = v14;
    v15 = +[HRERecommendableObjectCountRule ruleWithAccessoryType:allowedCount:](HRERecommendableObjectCountRule, "ruleWithAccessoryType:allowedCount:", v11, 1, 1);
    v28[2] = v15;
    v16 = +[HRERecommendableObjectCountRule ruleWithAccessoryType:allowedCount:](HRERecommendableObjectCountRule, "ruleWithAccessoryType:allowedCount:", v13, 0, 2);
    v28[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    v18 = [v10 setWithArray:v17];
    [(HRETemplate *)v3 setRules:v18];

    if (_MergedGlobals_28 != -1) {
      dispatch_once(&_MergedGlobals_28, &__block_literal_global_11_1);
    }
    id v19 = (id)qword_268944D38;
    [(HRETemplate *)v3 setIdentifier:v19];

    [(HRETemplate *)v3 setSortingPriority:4.0];
    [(HRETemplate *)v3 setStarterRank:-1.4];
    id v20 = objc_alloc(MEMORY[0x263F47AF0]);
    v21 = (void *)[v20 initWithPackageIdentifier:*MEMORY[0x263F478B8] state:*MEMORY[0x263F478F0]];
    [(HRETriggerTemplate *)v3 setDefaultIconDescriptor:v21];

    v22 = (void *)MEMORY[0x263EFFA08];
    v27[0] = v11;
    v27[1] = v13;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v24 = [v22 setWithArray:v23];
    [(HREActionTemplate *)v3 setExtraInvolvedTypes:v24];
  }
  return v3;
}

void __37__HRELockWhenDoorClosedTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944D38;
  qword_268944D38 = @"lockWhenDoorClosed";
}

- (id)_lazy_actionMap
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F0D798];
  uint64_t v6 = *MEMORY[0x263F0C510];
  v7 = &unk_26EAB8B48;
  v2 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v3 = +[HRECharacteristicActionMap characteristicActionMap:v2];
  v9[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

@end