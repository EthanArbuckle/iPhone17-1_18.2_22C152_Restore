@interface HREMovieTimeTemplate
- (HREMovieTimeTemplate)init;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
@end

@implementation HREMovieTimeTemplate

- (HREMovieTimeTemplate)init
{
  v18[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HREMovieTimeTemplate;
  v2 = [(HREActionSetTemplate *)&v16 init];
  if (v2)
  {
    v3 = _HRELocalizedStringWithDefaultValue(@"HRETemplateTitleMovieTime", @"HRETemplateTitleMovieTime", 1);
    [(HREActionSetTemplate *)v2 setActionSetName:v3];

    id v4 = objc_alloc(MEMORY[0x263F47B68]);
    v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x263F47980]];
    [(HREActionSetTemplate *)v2 setIconDescriptor:v5];

    [(HRETemplate *)v2 setSplitStrategy:1];
    v6 = (void *)MEMORY[0x263EFFA08];
    v7 = HRETelevisionProfileType();
    uint64_t v8 = *MEMORY[0x263F0D850];
    v17[0] = v7;
    v17[1] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v10 = [v6 setWithArray:v9];
    v11 = +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:v10];
    v18[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v13 = [v6 setWithArray:v12];
    [(HRETemplate *)v2 setRules:v13];

    if (_MergedGlobals_18 != -1) {
      dispatch_once(&_MergedGlobals_18, &__block_literal_global_7);
    }
    id v14 = (id)qword_268944B78;
    [(HRETemplate *)v2 setIdentifier:v14];

    [(HRETemplate *)v2 setSortingPriority:3.0];
    [(HRETemplate *)v2 setStarterRank:0.2];
  }
  return v2;
}

void __28__HREMovieTimeTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944B78;
  qword_268944B78 = @"movieTime";
}

- (id)_lazy_actionMap
{
  v32[4] = *MEMORY[0x263EF8340];
  objc_super v16 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_14];
  v19 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v16];
  v21 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  v31[0] = v21;
  v20 = +[HREMediaPlaybackActionMap actionMapWithState:2 volume:0 playbackArchive:0];
  v32[0] = v20;
  v31[1] = *MEMORY[0x263F0D780];
  uint64_t v28 = *MEMORY[0x263F0C328];
  uint64_t v2 = v28;
  uint64_t v29 = MEMORY[0x263EFFA80];
  v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v17 = +[HRECharacteristicActionMap conditonalCharacteristicActionMap:v18 condition:v19];
  v30[0] = v17;
  uint64_t v3 = *MEMORY[0x263F0BF68];
  v26[0] = v2;
  v26[1] = v3;
  v27[0] = MEMORY[0x263EFFA88];
  v27[1] = &unk_26EAB8938;
  v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v4 = +[HRECharacteristicActionMap conditonalCharacteristicActionMap:v15 condition:v16];
  v30[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  v6 = +[HREActionMap actionMapWithChildMaps:v5];
  v32[1] = v6;
  v31[2] = *MEMORY[0x263F0D850];
  uint64_t v24 = *MEMORY[0x263F0BEF8];
  uint64_t v7 = v24;
  v25 = &unk_26EAB8950;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v9 = +[HRECharacteristicActionMap characteristicActionMap:v8];
  v32[2] = v9;
  v10 = HRETelevisionProfileType();
  v31[3] = v10;
  uint64_t v22 = v7;
  v23 = &unk_26EAB8950;
  v11 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v12 = +[HRECharacteristicActionMap characteristicActionMap:v11];
  v32[3] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

  return v13;
}

uint64_t __39__HREMovieTimeTemplate__lazy_actionMap__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EABF440]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  v5 = objc_msgSend(v4, "hre_characteristics");

  uint64_t v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_87);
  return v6;
}

uint64_t __39__HREMovieTimeTemplate__lazy_actionMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0BF68]];

  return v3;
}

- (id)_lazy_allowedVariance
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = +[HREActionRangeVarianceRule rangeVarianceWithType:*MEMORY[0x263F0BF68] min:1];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = +[HREActionVarianceCollection varianceRuleCollectionWithRules:v3];

  return v4;
}

@end