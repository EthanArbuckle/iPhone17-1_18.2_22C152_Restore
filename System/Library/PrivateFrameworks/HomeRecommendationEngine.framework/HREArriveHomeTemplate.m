@interface HREArriveHomeTemplate
- (HREArriveHomeTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREArriveHomeTemplate

- (HREArriveHomeTemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HREArriveHomeTemplate;
  v2 = [(HREActionSetTemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HREActionSetTemplate *)v2 setActionSetType:*MEMORY[0x263F0B908]];
    id v4 = objc_alloc(MEMORY[0x263F47B68]);
    v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x263F47950]];
    [(HREActionSetTemplate *)v3 setIconDescriptor:v5];

    if (_MergedGlobals_19 != -1) {
      dispatch_once(&_MergedGlobals_19, &__block_literal_global_3_3);
    }
    id v6 = (id)qword_268944B88;
    [(HRETemplate *)v3 setIdentifier:v6];

    [(HRETemplate *)v3 setSortingPriority:0.0];
    [(HRETemplate *)v3 setStarterRank:2.0];
  }
  return v3;
}

void __29__HREArriveHomeTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944B88;
  qword_268944B88 = @"arriveHome";
}

- (id)_lazy_actionMap
{
  v27[5] = *MEMORY[0x263EF8340];
  v26[0] = *MEMORY[0x263F0D780];
  uint64_t v2 = *MEMORY[0x263F0BF68];
  v24[0] = *MEMORY[0x263F0C328];
  v24[1] = v2;
  v25[0] = MEMORY[0x263EFFA88];
  v25[1] = &unk_26EAB8968;
  uint64_t v3 = *MEMORY[0x263F0C398];
  v24[2] = *MEMORY[0x263F0C1C0];
  v24[3] = v3;
  v25[2] = &unk_26EAB8980;
  v25[3] = &unk_26EAB8980;
  v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v14 = +[HRECharacteristicActionMap characteristicActionMap:v15];
  v27[0] = v14;
  v26[1] = *MEMORY[0x263F0D6A8];
  uint64_t v22 = *MEMORY[0x263F0C520];
  v23 = &unk_26EAB8998;
  id v4 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v27[1] = v5;
  v26[2] = *MEMORY[0x263F0D6F8];
  uint64_t v20 = *MEMORY[0x263F0C4A8];
  v21 = &unk_26EAB89B0;
  id v6 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v7 = +[HRECharacteristicActionMap characteristicActionMap:v6];
  v27[2] = v7;
  v26[3] = *MEMORY[0x263F0D7D8];
  uint64_t v18 = *MEMORY[0x263F0C548];
  v19 = &unk_26EAB89C8;
  objc_super v8 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v9 = +[HRECharacteristicActionMap characteristicActionMap:v8];
  v27[3] = v9;
  v26[4] = *MEMORY[0x263F0D798];
  uint64_t v16 = *MEMORY[0x263F0C510];
  v17 = &unk_26EAB89B0;
  v10 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v11 = +[HRECharacteristicActionMap characteristicActionMap:v10];
  v27[4] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];

  return v12;
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