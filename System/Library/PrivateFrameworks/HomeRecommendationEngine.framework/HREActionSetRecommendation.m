@interface HREActionSetRecommendation
- (BOOL)containsMeaningfulChanges;
- (BOOL)containsRecommendableContent;
- (BOOL)includesObjects:(id)a3;
- (HFActionSetBuilder)selectedActionSetBuilder;
- (HREActionSetRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4;
- (HREActionVarianceCollection)allowedVariance;
- (NSMutableSet)mutableActionSetBuilders;
- (NSSet)actionSetBuilders;
- (NSSet)actions;
- (NSSet)addedActions;
- (id)changedInvolvedObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilder;
- (id)existingActionBuilder:(id)a3 inSet:(id)a4;
- (id)involvedObjects;
- (void)addAction:(id)a3;
- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4;
- (void)addActions:(id)a3;
- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4;
- (void)removeAction:(id)a3;
- (void)removeActions:(id)a3;
- (void)setAllowedVariance:(id)a3;
- (void)setMutableActionSetBuilders:(id)a3;
- (void)setSelectedActionSetBuilder:(id)a3;
@end

@implementation HREActionSetRecommendation

- (HREActionSetRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HREActionSetRecommendation;
  v4 = [(HRERecommendation *)&v11 initWithHome:a3 uniqueIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    mutableActionSetBuilders = v4->_mutableActionSetBuilders;
    v4->_mutableActionSetBuilders = (NSMutableSet *)v5;

    selectedActionSetBuilder = v4->_selectedActionSetBuilder;
    v4->_selectedActionSetBuilder = 0;

    if (_MergedGlobals_2_1 != -1) {
      dispatch_once(&_MergedGlobals_2_1, &__block_literal_global_3_8);
    }
    id v8 = (id)qword_268944CC8;
    v9 = [(HRERecommendation *)v4 defaultAnalyticsData];
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F47890]];
  }
  return v4;
}

void __60__HREActionSetRecommendation_initWithHome_uniqueIdentifier___block_invoke_2()
{
  v0 = (void *)qword_268944CC8;
  qword_268944CC8 = @"action-set";
}

- (void)setSelectedActionSetBuilder:(id)a3
{
  if (self->_selectedActionSetBuilder != a3) {
    objc_storeStrong((id *)&self->_selectedActionSetBuilder, a3);
  }

  MEMORY[0x270F9A758]();
}

- (HFActionSetBuilder)selectedActionSetBuilder
{
  selectedActionSetBuilder = self->_selectedActionSetBuilder;
  if (!selectedActionSetBuilder)
  {
    v4 = [(HREActionSetRecommendation *)self actionSetBuilders];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      v6 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
      v7 = [v6 anyObject];

      goto LABEL_6;
    }
    selectedActionSetBuilder = self->_selectedActionSetBuilder;
  }
  v7 = selectedActionSetBuilder;
LABEL_6:

  return v7;
}

- (NSSet)actionSetBuilders
{
  v2 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSSet)actions
{
  v3 = [(HREActionSetRecommendation *)self selectedActionSetBuilder];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = [(HREActionSetRecommendation *)self selectedActionSetBuilder];
    v6 = [v5 actions];
    v7 = [v4 setWithArray:v6];
  }
  else
  {
    uint64_t v5 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
    v7 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_8_2);
  }

  return (NSSet *)v7;
}

id __37__HREActionSetRecommendation_actions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a2 actions];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HREActionSetRecommendation *)self selectedActionSetBuilder];
  v9 = [v8 existingActionBuilder:v7 inSet:v6];

  return v9;
}

- (void)addAction:(id)a3
{
}

- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HREActionSetRecommendation *)self selectedActionSetBuilder];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 actionBuilders];
    v10 = [v9 toSet];
    objc_super v11 = [(HREActionSetRecommendation *)self existingActionBuilder:v6 inSet:v10];

    if (v11)
    {
      v12 = [v11 compareToObject:v6];
      char v13 = [v12 hasNoDifferencesHigherThanPriority:0];

      if (v13)
      {
        char v14 = 1;
      }
      else
      {
        v19 = [(HREActionSetRecommendation *)self allowedVariance];
        char v14 = [v19 anyRulePassesForAction:v11];
      }
    }
    else
    {
      v15 = [v6 recommendableObjectsInvolved];
      v16 = [v8 actionBuilders];
      v17 = [v16 fromSet];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __68__HREActionSetRecommendation_addAction_allowEditingExistingActions___block_invoke;
      v21[3] = &unk_264CF3CA0;
      id v22 = v15;
      id v18 = v15;
      objc_super v11 = objc_msgSend(v17, "na_firstObjectPassingTest:", v21);

      char v14 = 0;
      if (!v11) {
        goto LABEL_9;
      }
    }
    if (!v4)
    {
LABEL_14:

      goto LABEL_15;
    }
LABEL_9:
    if (v11)
    {
      if ([v11 updateWithActionBuilder:v6])
      {
        v20 = [v8 actionBuilders];
        [v20 updateObject:v11];
      }
    }
    else if ((v14 & 1) == 0)
    {
      [v8 addAction:v6];
    }
    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __68__HREActionSetRecommendation_addAction_allowEditingExistingActions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recommendableObjectsInvolved];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(HREActionSetRecommendation *)self selectedActionSetBuilder];
  [v5 removeAction:v4];
}

- (void)addActions:(id)a3
{
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__HREActionSetRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_264CF3CC8;
  v4[4] = self;
  BOOL v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __69__HREActionSetRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 40)];
}

- (void)removeActions:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__HREActionSetRecommendation_removeActions___block_invoke;
  v3[3] = &unk_264CF3CF0;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

void __44__HREActionSetRecommendation_removeActions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedActionSetBuilder];
  [v4 removeAction:v3];
}

- (BOOL)containsRecommendableContent
{
  id v3 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
  char v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_13_0);

  BOOL v5 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
  if ([v5 count]) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __58__HREActionSetRecommendation_containsRecommendableContent__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)containsMeaningfulChanges
{
  v2 = [(HREActionSetRecommendation *)self actionSetBuilders];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_15_1);

  return v3;
}

uint64_t __55__HREActionSetRecommendation_containsMeaningfulChanges__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actionBuilders];
  uint64_t v3 = [v2 hasChanges];

  return v3;
}

- (id)changedInvolvedObjects
{
  v2 = [(HREActionSetRecommendation *)self addedActions];
  uint64_t v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_18_0);

  return v3;
}

uint64_t __52__HREActionSetRecommendation_changedInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

- (id)involvedObjects
{
  v2 = [(HREActionSetRecommendation *)self actions];
  uint64_t v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_20_0);

  return v3;
}

uint64_t __45__HREActionSetRecommendation_involvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

- (BOOL)includesObjects:(id)a3
{
  char v4 = objc_msgSend(a3, "na_flatMap:", &__block_literal_global_23);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__HREActionSetRecommendation_includesObjects___block_invoke_2;
  v13[3] = &unk_264CF3DA8;
  v13[4] = self;
  id v14 = v4;
  id v5 = v4;
  BOOL v6 = (uint64_t (**)(void, void, void, void, void))MEMORY[0x237E2AE20](v13);
  char v11 = v6[2](v6, v7, v8, v9, v10);

  return v11;
}

id __46__HREActionSetRecommendation_includesObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "hf_containedServices");
  }
  else {
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithObject:v2];
  }

  return v3;
}

uint64_t __46__HREActionSetRecommendation_includesObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actions];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__HREActionSetRecommendation_includesObjects___block_invoke_3;
  v5[3] = &unk_264CF3CA0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

uint64_t __46__HREActionSetRecommendation_includesObjects___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recommendableObjectsInvolved];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (NSSet)addedActions
{
  id v2 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
  uint64_t v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_27);

  return (NSSet *)v3;
}

id __42__HREActionSetRecommendation_addedActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 actionBuilders];
  uint64_t v3 = [v2 additions];

  return v3;
}

- (id)descriptionBuilder
{
  v12.receiver = self;
  v12.super_class = (Class)HREActionSetRecommendation;
  uint64_t v3 = [(HRERecommendation *)&v12 descriptionBuilder];
  uint64_t v4 = [(HREActionSetRecommendation *)self actionSetBuilders];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_32);
  id v6 = (id)[v3 appendObject:v5 withName:@"actionSetNames"];

  uint64_t v7 = [(HREActionSetRecommendation *)self addedActions];
  uint64_t v8 = (void *)MEMORY[0x263F47AB8];
  uint64_t v9 = [v7 allObjects];
  uint64_t v10 = objc_msgSend(v8, "hre_sortActionBuilders:", v9);

  [v3 appendArraySection:v10 withName:@"actions" skipIfEmpty:1];

  return v3;
}

id __48__HREActionSetRecommendation_descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 actionSet];

  if (v3)
  {
    uint64_t v4 = NSString;
    id v5 = [v2 name];
    id v6 = [v2 actionSet];
    uint64_t v7 = [v6 uniqueIdentifier];
    uint64_t v8 = [v4 stringWithFormat:@"%@:%@", v5, v7];
  }
  else
  {
    uint64_t v8 = [v2 name];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HREActionSetRecommendation;
  id v5 = -[HRERecommendation copyWithZone:](&v22, sel_copyWithZone_);
  id v6 = self->_selectedActionSetBuilder;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v7 = [(HREActionSetRecommendation *)self mutableActionSetBuilders];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__HREActionSetRecommendation_copyWithZone___block_invoke;
  v12[3] = &unk_264CF4868;
  v15 = a3;
  uint64_t v8 = v6;
  char v13 = v8;
  id v14 = &v16;
  uint64_t v9 = objc_msgSend(v7, "na_map:", v12);
  uint64_t v10 = (void *)[v9 mutableCopy];
  [v5 setMutableActionSetBuilders:v10];

  objc_storeStrong(v5 + 10, (id)v17[5]);
  _Block_object_dispose(&v16, 8);

  return v5;
}

id __43__HREActionSetRecommendation_copyWithZone___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  id v5 = (void *)[v4 copyWithZone:v3];
  int v6 = [v4 isEqual:a1[4]];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v5);
  }

  return v5;
}

- (HREActionVarianceCollection)allowedVariance
{
  return self->allowedVariance;
}

- (void)setAllowedVariance:(id)a3
{
}

- (NSMutableSet)mutableActionSetBuilders
{
  return self->_mutableActionSetBuilders;
}

- (void)setMutableActionSetBuilders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableActionSetBuilders, 0);
  objc_storeStrong((id *)&self->_selectedActionSetBuilder, 0);

  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end