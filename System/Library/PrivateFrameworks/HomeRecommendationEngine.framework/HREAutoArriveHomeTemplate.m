@interface HREAutoArriveHomeTemplate
- (HREAutoArriveHomeTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREAutoArriveHomeTemplate

- (HREAutoArriveHomeTemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HREAutoArriveHomeTemplate;
  v2 = [(HRETemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HREPresenceTriggerTemplate *)v2 setPresenceType:3];
    [(HREPresenceTriggerTemplate *)v3 setPresenceUserType:2];
    if (_MergedGlobals_26 != -1) {
      dispatch_once(&_MergedGlobals_26, &__block_literal_global_3_7);
    }
    id v4 = (id)qword_268944CB8;
    [(HRETemplate *)v3 setIdentifier:v4];

    [(HRETemplate *)v3 setSortingPriority:0.1];
    [(HRETemplate *)v3 setStarterRank:1.4];
    id v5 = objc_alloc(MEMORY[0x263F47B68]);
    v6 = (void *)[v5 initWithImageIdentifier:*MEMORY[0x263F47950]];
    [(HRETriggerTemplate *)v3 setDefaultIconDescriptor:v6];
  }
  return v3;
}

void __33__HREAutoArriveHomeTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944CB8;
  qword_268944CB8 = @"autoArriveHome";
}

- (id)_lazy_actionMap
{
  v30[5] = *MEMORY[0x263EF8340];
  v29[0] = *MEMORY[0x263F0D780];
  uint64_t v2 = *MEMORY[0x263F0BF68];
  v27[0] = *MEMORY[0x263F0C328];
  v27[1] = v2;
  v28[0] = MEMORY[0x263EFFA88];
  v28[1] = &unk_26EAB8AA0;
  uint64_t v3 = *MEMORY[0x263F0C398];
  v27[2] = *MEMORY[0x263F0C1C0];
  v27[3] = v3;
  v28[2] = &unk_26EAB8AB8;
  v28[3] = &unk_26EAB8AB8;
  v19 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  v18 = +[HRECharacteristicActionMap characteristicActionMap:v19];
  v30[0] = v18;
  v29[1] = *MEMORY[0x263F0D6A8];
  uint64_t v25 = *MEMORY[0x263F0C520];
  v26 = &unk_26EAB8AD0;
  v17 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v16 = +[HRECharacteristicActionMap characteristicActionMap:v17];
  v30[1] = v16;
  v29[2] = *MEMORY[0x263F0D6F8];
  uint64_t v23 = *MEMORY[0x263F0C4A8];
  v24 = &unk_26EAB8AE8;
  id v4 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v30[2] = v5;
  v29[3] = *MEMORY[0x263F0D7D8];
  uint64_t v21 = *MEMORY[0x263F0C548];
  v22 = &unk_26EAB8B00;
  v6 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v7 = +[HRECharacteristicActionMap characteristicActionMap:v6];
  v30[3] = v7;
  objc_super v8 = HREMatterRVCType();
  v29[4] = v8;
  v9 = [HREMatterCommandActionMap alloc];
  v10 = +[HREMatterCommandMap pauseCleaning];
  v20[0] = v10;
  v11 = +[HREMatterCommandMap goHome];
  v20[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v13 = [(HREMatterCommandActionMap *)v9 initWithCommands:v12];
  v30[4] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];

  return v14;
}

- (id)_lazy_allowedVariance
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HREActionRangeVarianceRule rangeVarianceWithType:*MEMORY[0x263F0BF68] min:1];
  uint64_t v3 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x263F0C1C0], v2);
  v8[1] = v3;
  id v4 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:*MEMORY[0x263F0C398]];
  v8[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  v6 = +[HREActionVarianceCollection varianceRuleCollectionWithRules:v5];

  return v6;
}

@end