@interface HREMotionSensorLightsTemplate
- (HREMotionSensorLightsTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREMotionSensorLightsTemplate

- (HREMotionSensorLightsTemplate)init
{
  v38[2] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)HREMotionSensorLightsTemplate;
  v2 = [(HRECharacteristicTriggerTemplate *)&v31 init];
  if (v2)
  {
    v3 = [HRETypeValueTuple alloc];
    uint64_t v4 = *MEMORY[0x263F0C2C0];
    v5 = [(HRETypeValueTuple *)v3 initWithType:*MEMORY[0x263F0C2C0] value:&unk_26EAB8A58];
    v38[0] = v5;
    v6 = [HRETypeValueTuple alloc];
    uint64_t v7 = *MEMORY[0x263F0C288];
    v8 = [(HRETypeValueTuple *)v6 initWithType:*MEMORY[0x263F0C288] value:MEMORY[0x263EFFA88]];
    v38[1] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    [(HRECharacteristicTriggerTemplate *)v2 setTriggerCharacteristicValues:v9];

    v37[0] = v4;
    v37[1] = v7;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    [(HRECharacteristicTriggerTemplate *)v2 setCharacteristicTypePriority:v10];

    v11 = (void *)MEMORY[0x263EFFA08];
    v12 = +[HRERecommendableObjectTypeRule ruleWithRequiredType:*MEMORY[0x263F0D780]];
    v36[0] = v12;
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = *MEMORY[0x263F0D7A8];
    v35[0] = *MEMORY[0x263F0D7B8];
    uint64_t v30 = v35[0];
    v35[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    v16 = [v13 setWithArray:v15];
    v17 = +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:v16];
    v36[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v19 = [v11 setWithArray:v18];
    [(HRETemplate *)v2 setRules:v19];

    [(HRETemplate *)v2 setIdentifier:@"motionSensorLights"];
    [(HRECharacteristicTriggerTemplate *)v2 setEnforcePriority:1];
    [(HRECharacteristicTriggerTemplate *)v2 setAllowMultipleEventsFeature:_os_feature_enabled_impl()];
    [(HRETemplate *)v2 setSplitStrategy:1];
    [(HRECharacteristicTriggerTemplate *)v2 setSingleRecommendationPerSplit:1];
    [(HRETemplate *)v2 setSortingPriority:2.0];
    [(HRETemplate *)v2 setStarterRank:0.4];
    id v20 = objc_alloc(MEMORY[0x263F47AF0]);
    v21 = (void *)MEMORY[0x263F478F8];
    v22 = (void *)[v20 initWithPackageIdentifier:*MEMORY[0x263F478C0] state:*MEMORY[0x263F478F8]];
    id v23 = objc_alloc(MEMORY[0x263F47AF0]);
    v24 = (void *)[v23 initWithPackageIdentifier:*MEMORY[0x263F478C8] state:*v21];
    [(HRETriggerTemplate *)v2 setDefaultIconDescriptor:v22];
    v33[0] = v7;
    v33[1] = v4;
    v34[0] = v22;
    v34[1] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [(HRETriggerTemplate *)v2 setIconDescriptorsByTriggerCharacteristic:v25];

    v26 = (void *)MEMORY[0x263EFFA08];
    v32[0] = v30;
    v32[1] = v14;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    v28 = [v26 setWithArray:v27];
    [(HREActionTemplate *)v2 setExtraInvolvedTypes:v28];
  }
  return v2;
}

- (id)_lazy_actionMap
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F0D780];
  uint64_t v2 = *MEMORY[0x263F0BF68];
  v8[0] = *MEMORY[0x263F0C328];
  v8[1] = v2;
  v9[0] = MEMORY[0x263EFFA88];
  v9[1] = &unk_26EAB8A70;
  uint64_t v3 = *MEMORY[0x263F0C398];
  v8[2] = *MEMORY[0x263F0C1C0];
  v8[3] = v3;
  v9[2] = &unk_26EAB8A88;
  v9[3] = &unk_26EAB8A88;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v11[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (id)_lazy_allowedVariance
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HREActionRangeVarianceRule rangeVarianceWithType:*MEMORY[0x263F0BF68] min:1];
  uint64_t v3 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x263F0C1C0], v2);
  v8[1] = v3;
  uint64_t v4 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:*MEMORY[0x263F0C398]];
  v8[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  v6 = +[HREActionVarianceCollection varianceRuleCollectionWithRules:v5];

  return v6;
}

@end