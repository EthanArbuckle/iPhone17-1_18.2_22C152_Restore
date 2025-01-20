@interface HREGoodMorningTemplate
- (HREGoodMorningTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREGoodMorningTemplate

- (HREGoodMorningTemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HREGoodMorningTemplate;
  v2 = [(HREActionSetTemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HREActionSetTemplate *)v2 setActionSetType:*MEMORY[0x263F0B960]];
    id v4 = objc_alloc(MEMORY[0x263F47B68]);
    v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x263F479A0]];
    [(HREActionSetTemplate *)v3 setIconDescriptor:v5];

    if (_MergedGlobals_29 != -1) {
      dispatch_once(&_MergedGlobals_29, &__block_literal_global_3_11);
    }
    id v6 = (id)qword_268944D58;
    [(HRETemplate *)v3 setIdentifier:v6];

    [(HRETemplate *)v3 setSortingPriority:3.0];
    [(HRETemplate *)v3 setStarterRank:1.8];
  }
  return v3;
}

void __30__HREGoodMorningTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944D58;
  qword_268944D58 = @"goodMorning";
}

- (id)_lazy_actionMap
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = *MEMORY[0x263F0D780];
  uint64_t v2 = *MEMORY[0x263F0BF68];
  v12[0] = *MEMORY[0x263F0C328];
  v12[1] = v2;
  v13[0] = MEMORY[0x263EFFA88];
  v13[1] = &unk_26EAB8B60;
  uint64_t v3 = *MEMORY[0x263F0C398];
  v12[2] = *MEMORY[0x263F0C1C0];
  v12[3] = v3;
  v13[2] = &unk_26EAB8B78;
  v13[3] = &unk_26EAB8B78;
  id v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v15[0] = v5;
  v14[1] = *MEMORY[0x263F0D8B8];
  uint64_t v10 = *MEMORY[0x263F0C520];
  v11 = &unk_26EAB8B90;
  id v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = +[HRECharacteristicActionMap characteristicActionMap:v6];
  v15[1] = v7;
  objc_super v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

- (id)_lazy_allowedVariance
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HREActionRangeVarianceRule rangeVarianceWithType:*MEMORY[0x263F0BF68] min:1];
  uint64_t v3 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x263F0C1C0], v2);
  v8[1] = v3;
  id v4 = +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:*MEMORY[0x263F0C398]];
  v8[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  id v6 = +[HREActionVarianceCollection varianceRuleCollectionWithRules:v5];

  return v6;
}

@end