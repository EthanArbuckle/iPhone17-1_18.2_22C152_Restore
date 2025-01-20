@interface HRETriggerRecommendation
- (BOOL)containsMeaningfulChanges;
- (BOOL)containsRecommendableContent;
- (BOOL)includesObjects:(id)a3;
- (HFIconDescriptor)iconDescriptor;
- (HFTriggerBuilder)selectedTriggerBuilder;
- (HREActionVarianceCollection)allowedVariance;
- (HRETriggerRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4;
- (NSMutableSet)mutableTriggerBuilders;
- (NSSet)actions;
- (NSSet)addedActions;
- (id)changedInvolvedObjects;
- (id)compareForMatchingToTrigger:(id)a3;
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
- (void)replaceTriggerBuilder:(id)a3 withTriggerBuilder:(id)a4 allowEditingExistingActions:(BOOL)a5;
- (void)setAllowedVariance:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setMutableTriggerBuilders:(id)a3;
- (void)setSelectedTriggerBuilder:(id)a3;
@end

@implementation HRETriggerRecommendation

- (HRETriggerRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HRETriggerRecommendation;
  v4 = [(HRERecommendation *)&v9 initWithHome:a3 uniqueIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    [(HRETriggerRecommendation *)v4 setMutableTriggerBuilders:v5];

    if (_MergedGlobals_2_0 != -1) {
      dispatch_once(&_MergedGlobals_2_0, &__block_literal_global_3_4);
    }
    id v6 = (id)qword_268944BC8;
    v7 = [(HRERecommendation *)v4 defaultAnalyticsData];
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F47890]];
  }
  return v4;
}

void __58__HRETriggerRecommendation_initWithHome_uniqueIdentifier___block_invoke_2()
{
  v0 = (void *)qword_268944BC8;
  qword_268944BC8 = @"trigger";
}

- (void)setSelectedTriggerBuilder:(id)a3
{
  if (self->_selectedTriggerBuilder != a3) {
    objc_storeStrong((id *)&self->_selectedTriggerBuilder, a3);
  }

  MEMORY[0x270F9A758]();
}

- (HFTriggerBuilder)selectedTriggerBuilder
{
  selectedTriggerBuilder = self->_selectedTriggerBuilder;
  if (!selectedTriggerBuilder)
  {
    v4 = [(HRETriggerRecommendation *)self triggerBuilders];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      id v6 = [(HRETriggerRecommendation *)self triggerBuilders];
      v7 = [v6 anyObject];

      goto LABEL_6;
    }
    selectedTriggerBuilder = self->_selectedTriggerBuilder;
  }
  v7 = selectedTriggerBuilder;
LABEL_6:

  return v7;
}

- (NSSet)actions
{
  v3 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
    id v6 = [v5 triggerActionSets];
    v7 = [v6 anonymousActionBuilder];
    v8 = [v4 setWithArray:v7];
  }
  else
  {
    uint64_t v5 = [(HRETriggerRecommendation *)self triggerBuilders];
    v8 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_8_1);
  }

  return (NSSet *)v8;
}

id __35__HRETriggerRecommendation_actions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a2 triggerActionSets];
  v4 = [v3 anonymousActionBuilder];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  objc_super v9 = [v8 triggerActionSets];
  v10 = [v9 anonymousActionSetBuilder];
  v11 = [v10 existingActionBuilder:v7 inSet:v6];

  return v11;
}

- (void)addAction:(id)a3
{
}

- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 triggerActionSets];
    v10 = [v9 anonymousActionSetBuilder];

    v11 = [v10 actionBuilders];
    v12 = [v11 toSet];
    v13 = [(HRETriggerRecommendation *)self existingActionBuilder:v6 inSet:v12];

    if (!v13)
    {
      v14 = [v6 recommendableObjectsInvolved];
      v15 = [v10 actionBuilders];
      v16 = [v15 fromSet];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __66__HRETriggerRecommendation_addAction_allowEditingExistingActions___block_invoke;
      v25[3] = &unk_264CF3CA0;
      id v26 = v14;
      id v17 = v14;
      v13 = objc_msgSend(v16, "na_firstObjectPassingTest:", v25);

      if (!v13) {
        goto LABEL_7;
      }
    }
    if (v4)
    {
LABEL_7:
      if (v13)
      {
        v18 = [v13 compareToObject:v6];
        char v19 = [v18 hasNoDifferencesHigherThanPriority:0];
        v20 = [(HRETriggerRecommendation *)self allowedVariance];
        char v21 = [v20 anyRulePassesForAction:v13];

        if ((v19 & 1) == 0 && (v21 & 1) == 0 && [v13 updateWithActionBuilder:v6])
        {
          v22 = [v8 triggerActionSets];
          [v22 updateAnonymousActionBuilder:v13];
        }
      }
      else
      {
        v18 = [v8 triggerActionSets];
        [v18 addAnonymousActionBuilder:v6];
      }

      v23 = [v8 triggerActionSets];
      v24 = objc_msgSend(v23, "hre_recommendedActions");
      [v24 addObject:v6];
    }
  }
  else
  {
    v10 = [(HRERecommendation *)self identifierBuilder];
    v13 = [v10 composedString];
    NSLog(&cfstr_Recommendation.isa, v13);
  }
}

uint64_t __66__HRETriggerRecommendation_addAction_allowEditingExistingActions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recommendableObjectsInvolved];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 triggerActionSets];
    [v6 removeAnonymousActionBuilder:v7];
  }
}

- (void)addActions:(id)a3
{
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__HRETriggerRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_264CF3CC8;
  v4[4] = self;
  BOOL v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __67__HRETriggerRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 40)];
}

- (void)removeActions:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__HRETriggerRecommendation_removeActions___block_invoke;
  v3[3] = &unk_264CF3CF0;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __42__HRETriggerRecommendation_removeActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeAction:a2];
}

- (BOOL)containsMeaningfulChanges
{
  int v3 = [(HRETriggerRecommendation *)self containsRecommendableContent];
  if (v3)
  {
    uint64_t v4 = [(HRETriggerRecommendation *)self triggerBuilders];
    char v5 = objc_msgSend((id)v4, "na_any:", &__block_literal_global_16);

    id v6 = [(HRETriggerRecommendation *)self triggerBuilders];
    LOBYTE(v4) = objc_msgSend(v6, "na_any:", &__block_literal_global_18);

    LOBYTE(v3) = v5 | v4;
  }
  return v3;
}

uint64_t __53__HRETriggerRecommendation_containsMeaningfulChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 triggerActionSets];
  uint64_t v4 = [v3 namedActionSetsDiff];
  char v5 = [v4 additions];
  if ([v5 count])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v2 triggerActionSets];
    v8 = [v7 namedActionSetsDiff];
    objc_super v9 = [v8 deletions];
    if ([v9 count])
    {
      uint64_t v6 = 1;
    }
    else
    {
      v16 = [v2 triggerActionSets];
      v10 = [v16 namedActionSetsDiff];
      v11 = [v10 updates];
      if ([v11 count])
      {
        uint64_t v6 = 1;
      }
      else
      {
        v15 = [v2 triggerActionSets];
        v14 = [v15 anonymousActionSetBuilder];
        v13 = [v14 actionBuilders];
        uint64_t v6 = [v13 hasChanges];
      }
    }
  }
  return v6;
}

uint64_t __53__HRETriggerRecommendation_containsMeaningfulChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 enabled];
  uint64_t v4 = [v2 trigger];

  uint64_t v5 = v3 ^ [v4 isEnabled];
  return v5;
}

- (BOOL)containsRecommendableContent
{
  int v3 = [(HRETriggerRecommendation *)self triggerBuilders];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_20);

  uint64_t v5 = [(HRETriggerRecommendation *)self triggerBuilders];
  char v6 = objc_msgSend(v5, "na_all:", &__block_literal_global_22);

  id v7 = [(HRETriggerRecommendation *)self triggerBuilders];
  char v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_24);

  objc_super v9 = [(HRETriggerRecommendation *)self triggerBuilders];
  uint64_t v10 = [v9 count];
  char v11 = v4 | v8;
  if (!v10) {
    char v11 = 0;
  }
  char v12 = v11 & v6;

  return v12;
}

uint64_t __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 triggerActionSets];
  int v3 = objc_msgSend(v2, "hre_recommendedActions");
  uint64_t v4 = [v3 hasChanges];

  return v4;
}

BOOL __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 triggerActionSets];
  int v3 = [v2 allActionBuilders];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 enabled];
  BOOL v4 = [v2 trigger];

  uint64_t v5 = v3 ^ [v4 isEnabled];
  return v5;
}

- (id)changedInvolvedObjects
{
  int v3 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  BOOL v4 = [v3 trigger];

  if (v4)
  {
    uint64_t v5 = [(HRETriggerRecommendation *)self mutableTriggerBuilders];
    char v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_26);
  }
  else
  {
    char v6 = [(HRETriggerRecommendation *)self involvedObjects];
  }

  return v6;
}

id __50__HRETriggerRecommendation_changedInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 triggerActionSets];
  int v3 = [v2 anonymousActionSetBuilder];
  BOOL v4 = [v3 actionBuilders];

  uint64_t v5 = [v4 additions];
  char v6 = [v4 updates];
  id v7 = [v5 setByAddingObjectsFromSet:v6];
  char v8 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_29);

  return v8;
}

uint64_t __50__HRETriggerRecommendation_changedInvolvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

- (id)involvedObjects
{
  int v3 = [(HRETriggerRecommendation *)self actions];
  BOOL v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_31);

  uint64_t v5 = [(HRETriggerRecommendation *)self triggerBuilders];
  char v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_33);

  id v7 = [v4 setByAddingObjectsFromSet:v6];

  return v7;
}

uint64_t __43__HRETriggerRecommendation_involvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

id __43__HRETriggerRecommendation_involvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    char v6 = (void *)MEMORY[0x263EFFA08];
    id v7 = [v5 eventBuilders];
    char v8 = [v6 setWithArray:v7];

    objc_super v9 = objc_msgSend(v8, "na_flatMap:", &__block_literal_global_37);
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

uint64_t __43__HRETriggerRecommendation_involvedObjects__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

- (BOOL)includesObjects:(id)a3
{
  BOOL v4 = objc_msgSend(a3, "na_flatMap:", &__block_literal_global_40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_2;
  v13[3] = &unk_264CF3DA8;
  v13[4] = self;
  id v5 = v4;
  id v14 = v5;
  char v6 = (uint64_t (**)(void))MEMORY[0x237E2AE20](v13);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_5;
  v11[3] = &unk_264CF3DA8;
  v11[4] = self;
  id v12 = v5;
  id v7 = v5;
  char v8 = (uint64_t (**)(void))MEMORY[0x237E2AE20](v11);
  if (v6[2](v6)) {
    char v9 = 1;
  }
  else {
    char v9 = v8[2](v8);
  }

  return v9;
}

id __44__HRETriggerRecommendation_includesObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "hf_containedServices");
  }
  else {
  id v3 = [MEMORY[0x263EFFA08] setWithObject:v2];
  }

  return v3;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) triggerBuilders];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_3;
  v5[3] = &unk_264CF3D80;
  id v6 = *(id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 eventBuilders];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_4;
    v10[3] = &unk_264CF3D58;
    id v11 = *(id *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 recommendableObjectsInvolved];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actions];
  id v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_45);

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_7;
  v6[3] = &unk_264CF3DD0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 recommendableObjectsInvolved];
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_8;
  v8[3] = &unk_264CF3DD0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  BOOL v5 = +[HRERecommendableObjectUtilities recommendableObject:v4 isEffectivelyEqualToObject:v3];
  LODWORD(v2) = +[HRERecommendableObjectUtilities recommendableObject:v4 containsObject:*(void *)(v2 + 32)];

  return v5 | v2;
}

- (id)compareForMatchingToTrigger:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  uint64_t v6 = [v5 trigger];
  id v7 = [v4 trigger];
  if ([v6 isEqual:v7])
  {
    BOOL v8 = [(HRETriggerRecommendation *)self containsMeaningfulChanges];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F47B20]);
      uint64_t v10 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
      id v11 = (id)[v9 initWithObjectA:v10 objectB:v4];
LABEL_18:
      v25 = v11;
      goto LABEL_21;
    }
  }
  else
  {
  }
  id v12 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  uint64_t v10 = [v12 compareToObject:v4];

  v13 = [v10 highestPriorityDifference];

  if (!v13)
  {
    id v11 = v10;
    uint64_t v10 = v11;
    goto LABEL_18;
  }
  objc_opt_class();
  id v14 = [v10 differences];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F47920]];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v18 = [v17 containedObjectResult];
    objc_opt_class();
    char v19 = [v18 differences];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F47910]];
    if (objc_opt_isKindOfClass()) {
      char v21 = v20;
    }
    else {
      char v21 = 0;
    }
    id v22 = v21;

    if (v22 && [v22 isASubsetOfB])
    {
      v23 = [v22 withPriority:0];
      [v18 add:v23];
    }
    id v24 = v10;
  }
  else
  {
    id v26 = v10;
  }

  v25 = v10;
LABEL_21:

  return v25;
}

- (NSSet)addedActions
{
  uint64_t v2 = [(HRETriggerRecommendation *)self triggerBuilders];
  uint64_t v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_52_0);

  return (NSSet *)v3;
}

id __40__HRETriggerRecommendation_addedActions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 triggerActionSets];
  uint64_t v3 = [v2 anonymousActionSetBuilder];
  id v4 = [v3 actionBuilders];
  BOOL v5 = [v4 additions];

  return v5;
}

- (void)replaceTriggerBuilder:(id)a3 withTriggerBuilder:(id)a4 allowEditingExistingActions:(BOOL)a5
{
  BOOL v8 = (HFTriggerBuilder *)a4;
  id v9 = a3;
  uint64_t v10 = [(HRETriggerRecommendation *)self mutableTriggerBuilders];
  [v10 removeObject:v9];

  id v11 = [(HRETriggerRecommendation *)self mutableTriggerBuilders];
  [v11 addObject:v8];

  id v12 = self->_selectedTriggerBuilder;
  selectedTriggerBuilder = self->_selectedTriggerBuilder;
  self->_selectedTriggerBuilder = v8;
  id v14 = v8;

  v15 = [v9 triggerActionSets];

  v16 = objc_msgSend(v15, "hre_recommendedActions");
  id v17 = [v16 additions];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97__HRETriggerRecommendation_replaceTriggerBuilder_withTriggerBuilder_allowEditingExistingActions___block_invoke;
  v20[3] = &unk_264CF3CC8;
  v20[4] = self;
  BOOL v21 = a5;
  objc_msgSend(v17, "na_each:", v20);

  v18 = self->_selectedTriggerBuilder;
  self->_selectedTriggerBuilder = v12;
  char v19 = v12;
}

uint64_t __97__HRETriggerRecommendation_replaceTriggerBuilder_withTriggerBuilder_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 40)];
}

- (id)descriptionBuilder
{
  v15.receiver = self;
  v15.super_class = (Class)HRETriggerRecommendation;
  uint64_t v3 = [(HRERecommendation *)&v15 descriptionBuilder];
  id v4 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  BOOL v5 = [v4 naturalLanguageNameOfType:2];
  [v3 appendString:v5 withName:@"name"];

  uint64_t v6 = [(HRETriggerRecommendation *)self selectedTriggerBuilder];
  id v7 = [v6 trigger];
  BOOL v8 = [v7 uniqueIdentifier];
  id v9 = (id)[v3 appendObject:v8 withName:@"trigger" skipIfNil:1];

  uint64_t v10 = [(HRETriggerRecommendation *)self addedActions];
  id v11 = (void *)MEMORY[0x263F47AB8];
  id v12 = [v10 allObjects];
  v13 = objc_msgSend(v11, "hre_sortActionBuilders:", v12);

  [v3 appendArraySection:v13 withName:@"+actions" skipIfEmpty:1];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HRETriggerRecommendation;
  id v4 = [(HRERecommendation *)&v7 copyWithZone:a3];
  BOOL v5 = [(HRETriggerRecommendation *)self iconDescriptor];
  [v4 setIconDescriptor:v5];

  return v4;
}

- (HREActionVarianceCollection)allowedVariance
{
  return self->allowedVariance;
}

- (void)setAllowedVariance:(id)a3
{
}

- (NSMutableSet)mutableTriggerBuilders
{
  return self->mutableTriggerBuilders;
}

- (void)setMutableTriggerBuilders:(id)a3
{
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->mutableTriggerBuilders, 0);
  objc_storeStrong((id *)&self->_selectedTriggerBuilder, 0);

  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end