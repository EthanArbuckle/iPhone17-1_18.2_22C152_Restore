@interface HRERecommendationItem
- (BOOL)isSelected;
- (HRERecommendation)recommendation;
- (HRERecommendationItem)initWithRecommendation:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)accessoryCountType;
- (void)setAccessoryCountType:(unint64_t)a3;
- (void)setRecommendation:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HRERecommendationItem

- (HRERecommendationItem)initWithRecommendation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendationItem;
  v6 = [(HRERecommendationItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recommendation, a3);
    v7->_selected = 0;
    v7->_accessoryCountType = 0;
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = [(HRERecommendationItem *)self recommendation];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F47A50]];

  v6 = [MEMORY[0x263EFF9C0] set];
  v7 = [(HRERecommendationItem *)self recommendation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v9 = [(HRERecommendationItem *)self recommendation];
  v10 = v9;
  if (isKindOfClass)
  {
    v11 = [v9 selectedTriggerBuilder];
    v12 = [v11 naturalLanguageNameOfType:2];
    [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F47A38]];

    v13 = [v10 selectedTriggerBuilder];
    v14 = [v13 triggerActionSets];
    v15 = [v14 anonymousActionBuilder];

    id v16 = objc_alloc(MEMORY[0x263F47C50]);
    v17 = [v10 selectedTriggerBuilder];
    v18 = [v17 trigger];
    v19 = [v10 home];
    v20 = (void *)[v16 initWithTrigger:v18 inHome:v19 forceDisabled:0 ignoringDisabled:1];

    [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x263F47A58]];
    v21 = [v20 triggerIconDescriptor];
    uint64_t v22 = *MEMORY[0x263F47A18];
    [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x263F47A18]];

    v23 = [v10 iconDescriptor];

    if (v23)
    {
      v24 = [v10 iconDescriptor];
      [v4 setObject:v24 forKeyedSubscript:v22];
    }
    v25 = [v10 triggerBuilders];
    v26 = objc_msgSend(v25, "na_flatMap:", &__block_literal_global_2);
    [v6 unionSet:v26];

    goto LABEL_7;
  }
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  v28 = [(HRERecommendationItem *)self recommendation];
  v10 = v28;
  if (v27)
  {
    v29 = [v28 selectedActionSetBuilder];
    v30 = [v29 name];
    [v4 setObject:v30 forKeyedSubscript:*MEMORY[0x263F47A38]];

    v31 = [v10 selectedActionSetBuilder];
    v15 = [v31 actions];

    v32 = [v10 selectedActionSetBuilder];
    v33 = [v32 iconDescriptor];
    [v4 setObject:v33 forKeyedSubscript:*MEMORY[0x263F47A18]];

    v20 = [v10 actionSetBuilders];
    v25 = objc_msgSend(v20, "na_map:", &__block_literal_global_7_0);
    [v6 unionSet:v25];
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  objc_opt_class();
  char v47 = objc_opt_isKindOfClass();

  if (v47)
  {
    v10 = [(HRERecommendationItem *)self recommendation];
    v48 = [v10 name];
    [v4 setObject:v48 forKeyedSubscript:*MEMORY[0x263F47A38]];

    v20 = [v10 iconDescriptor];
    [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x263F47A18]];
    v15 = 0;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_9:
  id v34 = objc_alloc(MEMORY[0x263F47AC0]);
  v35 = [(HRERecommendationItem *)self recommendation];
  v36 = [v35 home];
  v37 = (void *)[v34 initWithHome:v36 formattingContext:2];

  objc_msgSend(v37, "setAccessoryCountType:", -[HRERecommendationItem accessoryCountType](self, "accessoryCountType"));
  v38 = objc_msgSend(v15, "na_map:", &__block_literal_global_12);
  v39 = objc_msgSend(v38, "na_filter:", &__block_literal_global_15);

  v40 = objc_msgSend(MEMORY[0x263F47AC8], "hf_naturalLanguageDescriptionForActions:withOptions:", v39, v37);
  [v4 setObject:v40 forKeyedSubscript:*MEMORY[0x263F47A10]];

  v41 = NSNumber;
  [(HRERecommendationItem *)self isSelected];
  v42 = [v41 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v4 setObject:v42 forKeyedSubscript:*MEMORY[0x263F47A48]];

  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F47A00]];
  v43 = (void *)MEMORY[0x263F58190];
  v44 = [MEMORY[0x263F47B88] outcomeWithResults:v4];
  v45 = [v43 futureWithResult:v44];

  return v45;
}

id __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  id v3 = a2;
  v4 = [v2 set];
  id v5 = [v3 trigger];

  objc_msgSend(v4, "na_safeAddObject:", v5);

  return v4;
}

uint64_t __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

uint64_t __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (HRERecommendation)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (unint64_t)accessoryCountType
{
  return self->_accessoryCountType;
}

- (void)setAccessoryCountType:(unint64_t)a3
{
  self->_accessoryCountType = a3;
}

- (void).cxx_destruct
{
}

@end