@interface HREActionSetDerivingRecommendationGenerator
- (Class)generationProcessClass;
- (unint64_t)disablingOptions;
- (void)setupProcess:(id)a3;
@end

@implementation HREActionSetDerivingRecommendationGenerator

- (unint64_t)disablingOptions
{
  return 16;
}

- (void)setupProcess:(id)a3
{
  id v4 = a3;
  v5 = [v4 sourceItems];
  if ([v5 count])
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v4 typeGroup];
    BOOL v6 = v7 == 0;
  }
  v8 = [v4 sourceItems];
  v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_0);
  [v4 setSourceItems:v9];

  v21.receiver = self;
  v21.super_class = (Class)HREActionSetDerivingRecommendationGenerator;
  [(HREStandardAsyncRecommendationSource *)&v21 setupProcess:v4];
  objc_opt_class();
  id v10 = v4;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v6)
  {
    v13 = [v10 homeRecommendableObjects];
    [v10 setSourceRecommendableObjects:v13];
  }
  v14 = [v10 sourceRecommendableObjects];
  v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_49);
  [v10 setSourceRecommendableObjects:v15];

  v16 = objc_opt_new();
  v17 = [v10 sourceRecommendableObjects];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_5;
  v19[3] = &unk_264CF3A70;
  id v20 = v16;
  id v18 = v16;
  objc_msgSend(v17, "na_each:", v19);

  [v12 setSourceCharacteristics:v18];
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EAC9378]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 containsActions];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "hf_containedServices");
  if ([v3 count])
  {
    id v4 = objc_msgSend(v2, "hf_containedServices");
    int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_52);
  }
  else
  {
    int v5 = 1;
  }

  uint64_t v6 = objc_msgSend(v2, "hf_containedProfiles");
  if (![v6 count])
  {

    goto LABEL_8;
  }
  v7 = objc_msgSend(v2, "hf_containedProfiles");
  int v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_55);

  if ((v5 | v8) == 1)
  {
LABEL_8:
    uint64_t v9 = objc_msgSend(v2, "hre_isActionable");
    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hf_isVisibleAccessory");

  return v3;
}

void __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hre_characteristics");
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_6;
  v4[3] = &unk_264CF3A48;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 characteristicType];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v6 = objc_opt_new();
    v7 = *(void **)(a1 + 32);
    int v8 = [v9 characteristicType];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  [v6 addObject:v9];
}

- (Class)generationProcessClass
{
  return (Class)objc_opt_class();
}

@end