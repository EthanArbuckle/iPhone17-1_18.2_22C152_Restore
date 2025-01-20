@interface HREAutoLightsOnUnlockTemplate
- (HREAutoLightsOnUnlockTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREAutoLightsOnUnlockTemplate

- (HREAutoLightsOnUnlockTemplate)init
{
  v41[4] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)HREAutoLightsOnUnlockTemplate;
  v2 = [(HRECharacteristicTriggerTemplate *)&v36 init];
  if (v2)
  {
    v3 = [HRETypeValueTuple alloc];
    uint64_t v35 = *MEMORY[0x263F0C0B0];
    v4 = -[HRETypeValueTuple initWithType:value:](v3, "initWithType:value:");
    v41[0] = v4;
    v5 = [HRETypeValueTuple alloc];
    uint64_t v6 = *MEMORY[0x263F0C040];
    v7 = [(HRETypeValueTuple *)v5 initWithType:*MEMORY[0x263F0C040] value:&unk_26EAB89E0];
    v41[1] = v7;
    v8 = [HRETypeValueTuple alloc];
    uint64_t v9 = *MEMORY[0x263F0C0D0];
    v10 = [MEMORY[0x263F0E600] numberRangeWithMinValue:&unk_26EAB89F8];
    v11 = [(HRETypeValueTuple *)v8 initWithType:v9 value:v10];
    v41[2] = v11;
    v12 = [HRETypeValueTuple alloc];
    uint64_t v13 = *MEMORY[0x263F0C008];
    v14 = [(HRETypeValueTuple *)v12 initWithType:*MEMORY[0x263F0C008] value:&unk_26EAB8A10];
    v41[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
    [(HRECharacteristicTriggerTemplate *)v2 setTriggerCharacteristicValues:v15];

    v40[0] = v9;
    v40[1] = v6;
    v40[2] = v35;
    v40[3] = v13;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [(HRECharacteristicTriggerTemplate *)v2 setCharacteristicTypePriority:v16];

    v17 = (void *)MEMORY[0x263EFFA08];
    v18 = +[HRERecommendableObjectTypeRule ruleWithRequiredType:*MEMORY[0x263F0D780]];
    v39[0] = v18;
    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = *MEMORY[0x263F0D798];
    uint64_t v21 = *MEMORY[0x263F0D6A8];
    v38[0] = *MEMORY[0x263F0D798];
    v38[1] = v21;
    uint64_t v22 = *MEMORY[0x263F0D6F8];
    v38[2] = *MEMORY[0x263F0D6F8];
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
    v24 = [v19 setWithArray:v23];
    v25 = +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:v24];
    v39[1] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v27 = [v17 setWithArray:v26];
    [(HRETemplate *)v2 setRules:v27];

    [(HRETemplate *)v2 setSplitStrategy:1];
    [(HRECharacteristicTriggerTemplate *)v2 setCharacteristicPerServiceRule:1];
    [(HRECharacteristicTriggerTemplate *)v2 setSingleRecommendationPerSplit:1];
    [(HRETemplate *)v2 setSortingPriority:4.0];
    [(HRETemplate *)v2 setStarterRank:-1.4];
    id v28 = objc_alloc(MEMORY[0x263F47B68]);
    v29 = (void *)[v28 initWithImageIdentifier:*MEMORY[0x263F479A8]];
    [(HRETriggerTemplate *)v2 setDefaultIconDescriptor:v29];

    if (_MergedGlobals_21 != -1) {
      dispatch_once(&_MergedGlobals_21, &__block_literal_global_15_0);
    }
    id v30 = (id)qword_268944BB8;
    [(HRETemplate *)v2 setIdentifier:v30];

    v31 = (void *)MEMORY[0x263EFFA08];
    v37[0] = v20;
    v37[1] = v21;
    v37[2] = v22;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
    v33 = [v31 setWithArray:v32];
    [(HREActionTemplate *)v2 setExtraInvolvedTypes:v33];
  }
  return v2;
}

void __37__HREAutoLightsOnUnlockTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944BB8;
  qword_268944BB8 = @"autoLightsOnUnlock";
}

- (id)_lazy_actionMap
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F0D780];
  uint64_t v2 = *MEMORY[0x263F0BF68];
  v8[0] = *MEMORY[0x263F0C328];
  v8[1] = v2;
  v9[0] = MEMORY[0x263EFFA88];
  v9[1] = &unk_26EAB8A28;
  uint64_t v3 = *MEMORY[0x263F0C398];
  v8[2] = *MEMORY[0x263F0C1C0];
  v8[3] = v3;
  v9[2] = &unk_26EAB8A40;
  v9[3] = &unk_26EAB8A40;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v11[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (id)_lazy_allowedVariance
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HREActionRangeVarianceRule rangeVarianceWithType:*MEMORY[0x263F0BF68] min:1];
  uint64_t v3 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x263F0C1C0], v2);
  v8[1] = v3;
  v4 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:*MEMORY[0x263F0C398]];
  v8[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  uint64_t v6 = +[HREActionVarianceCollection varianceRuleCollectionWithRules:v5];

  return v6;
}

@end