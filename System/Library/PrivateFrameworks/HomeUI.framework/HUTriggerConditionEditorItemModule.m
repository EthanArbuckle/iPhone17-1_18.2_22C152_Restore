@interface HUTriggerConditionEditorItemModule
- (BOOL)_isConditionOptionItem:(id)a3 ofType:(unint64_t)a4;
- (BOOL)doesConditionOptionItemRequireInitialConfiguration:(id)a3;
- (BOOL)isConditionOptionItem:(id)a3;
- (BOOL)isCustomConditionSwitchItem:(id)a3;
- (BOOL)isShowConditionOptionsItem:(id)a3;
- (BOOL)shouldShowConditionOptionsForType:(unint64_t)a3;
- (HFConditionCollection)conditionCollection;
- (HMHome)home;
- (HUTriggerConditionEditorExpandingSectionModule)locationConditionModule;
- (HUTriggerConditionEditorExpandingSectionModule)timeConditionModule;
- (HUTriggerConditionEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 conditionCollection:(id)a5 disallowedConditionTypes:(id)a6;
- (HUTriggerCustomConditionEditorSectionModule)customConditionsModule;
- (NSSet)disallowedConditionTypes;
- (NSSet)itemProviders;
- (id)_allSectionModules;
- (id)_expandingSectionModuleForConditionType:(unint64_t)a3;
- (id)_expandingSectionModules;
- (id)_moduleForConditionOptionItem:(id)a3;
- (id)_sectionModuleForItem:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)conditionForOptionItem:(id)a3;
- (unint64_t)conditionTypeForItem:(id)a3;
- (void)_buildItemProviders;
- (void)_reloadConditionForExpandingSectionModule:(id)a3 remainingConditions:(id)a4;
- (void)_reloadConditionsFromConditionCollection;
- (void)conditionCollectionDidChange;
- (void)setCustomConditionEnabled:(BOOL)a3 forItem:(id)a4;
- (void)setCustomConditionsModule:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setLocationConditionModule:(id)a3;
- (void)setSelectedConditionOptionItem:(id)a3 forType:(unint64_t)a4;
- (void)setShowConditionOptions:(BOOL)a3 forType:(unint64_t)a4;
- (void)setTimeConditionModule:(id)a3;
- (void)updateCondition:(id)a3 forOptionItem:(id)a4;
@end

@implementation HUTriggerConditionEditorItemModule

- (HUTriggerConditionEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 conditionCollection:(id)a5 disallowedConditionTypes:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUTriggerConditionEditorItemModule;
  v14 = [(HFItemModule *)&v17 initWithItemUpdater:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a4);
    objc_storeStrong((id *)&v15->_conditionCollection, a5);
    objc_storeStrong((id *)&v15->_disallowedConditionTypes, a6);
    [(HUTriggerConditionEditorItemModule *)v15 _buildItemProviders];
  }

  return v15;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v20 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(HUTriggerConditionEditorItemModule *)self _allSectionModules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = [(HUTriggerConditionEditorItemModule *)self disallowedConditionTypes];
        id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "conditionType"));
        char v12 = [v10 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          id v13 = [v9 buildSectionsWithDisplayedItems:v21];
          v14 = objc_msgSend(v13, "na_flatMap:", &__block_literal_global_198);
          [v20 addObjectsFromArray:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Conditions"];
  [v15 setItems:v20];
  v16 = (void *)MEMORY[0x1E4F69220];
  v26 = v15;
  objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v18 = [v16 filterSections:v17 toDisplayedItems:v21];

  return v18;
}

uint64_t __70__HUTriggerConditionEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (BOOL)isConditionOptionItem:(id)a3
{
  v3 = [(HUTriggerConditionEditorItemModule *)self _moduleForConditionOptionItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)doesConditionOptionItemRequireInitialConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUTriggerConditionEditorItemModule *)self _moduleForConditionOptionItem:v4];
  char v6 = [v5 doesOptionItemRequireInitialUserConfiguration:v4];

  return v6;
}

- (id)conditionForOptionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUTriggerConditionEditorItemModule *)self _moduleForConditionOptionItem:v4];
  if (!v5) {
    NSLog(&cfstr_UnrecognizedOp.isa, v4);
  }
  char v6 = [v5 conditionForOptionItem:v4];

  return v6;
}

- (void)updateCondition:(id)a3 forOptionItem:(id)a4
{
  id v19 = a3;
  uint64_t v7 = [(HUTriggerConditionEditorItemModule *)self _moduleForConditionOptionItem:a4];
  v8 = [v7 selectedOptionItem];

  if (v8)
  {
    v9 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
    v10 = [v7 selectedOptionItem];
    id v11 = [v7 conditionForOptionItem:v10];
    [v9 removeCondition:v11];
  }
  char v12 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
  [v12 addCondition:v19];

  id v13 = (id)[v7 updateSelectionWithCondition:v19];
  v14 = (void *)MEMORY[0x1E4F69230];
  v15 = [v7 itemProviders];
  v16 = [v14 requestToReloadItemProviders:v15 senderSelector:a2];

  objc_super v17 = [(HFItemModule *)self itemUpdater];
  id v18 = (id)[v17 performItemUpdateRequest:v16];
}

- (unint64_t)conditionTypeForItem:(id)a3
{
  id v5 = a3;
  char v6 = [(HUTriggerConditionEditorItemModule *)self _sectionModuleForItem:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 conditionType];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorItemModule.m", 96, @"Unknown item %@", v5 object file lineNumber description];

    unint64_t v8 = 2;
  }

  return v8;
}

- (void)conditionCollectionDidChange
{
  [(HUTriggerConditionEditorItemModule *)self _reloadConditionsFromConditionCollection];
  id v4 = (void *)MEMORY[0x1E4F69230];
  id v5 = [(HUTriggerConditionEditorItemModule *)self itemProviders];
  id v8 = [v4 requestToReloadItemProviders:v5 senderSelector:a2];

  char v6 = [(HFItemModule *)self itemUpdater];
  id v7 = (id)[v6 performItemUpdateRequest:v8];
}

- (BOOL)shouldShowConditionOptionsForType:(unint64_t)a3
{
  v3 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModuleForConditionType:a3];
  char v4 = [v3 showOptions];

  return v4;
}

- (void)setShowConditionOptions:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v4 = a3;
  id v7 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModuleForConditionType:a4];
  if ([v7 showOptions] != v4)
  {
    [v7 setShowOptions:v4];
    id v8 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModules];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__HUTriggerConditionEditorItemModule_setShowConditionOptions_forType___block_invoke;
    v14[3] = &unk_1E638E908;
    id v15 = v7;
    objc_msgSend(v8, "na_each:", v14);

    v9 = (void *)MEMORY[0x1E4F69230];
    v10 = [(HUTriggerConditionEditorItemModule *)self itemProviders];
    id v11 = [v9 requestToReloadItemProviders:v10 senderSelector:a2];

    char v12 = [(HFItemModule *)self itemUpdater];
    id v13 = (id)[v12 performItemUpdateRequest:v11];
  }
}

uint64_t __70__HUTriggerConditionEditorItemModule_setShowConditionOptions_forType___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2) {
    return [a2 setShowOptions:0];
  }
  return result;
}

- (void)setSelectedConditionOptionItem:(id)a3 forType:(unint64_t)a4
{
  id v19 = a3;
  if (v19
    && ![(HUTriggerConditionEditorItemModule *)self _isConditionOptionItem:v19 ofType:a4])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorItemModule.m", 134, @"Invalid parameter not satisfying: %@", @"!item || [self _isConditionOptionItem:item ofType:type]" object file lineNumber description];
  }
  id v7 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModuleForConditionType:a4];
  id v8 = [v7 selectedOptionItem];

  if (v8 != v19)
  {
    v9 = [v7 condition];
    v10 = [v7 selectOptionItem:v19];
    if (v9)
    {
      id v11 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
      [v11 removeCondition:v9];
    }
    if (v10)
    {
      char v12 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
      [v12 addCondition:v10];
    }
    id v13 = (void *)MEMORY[0x1E4F69230];
    v14 = [v7 itemProviders];
    id v15 = [v13 requestToReloadItemProviders:v14 senderSelector:a2];

    v16 = [(HFItemModule *)self itemUpdater];
    id v17 = (id)[v16 performItemUpdateRequest:v15];
  }
}

- (BOOL)isShowConditionOptionsItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModules];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__HUTriggerConditionEditorItemModule_isShowConditionOptionsItem___block_invoke;
  v9[3] = &unk_1E638E930;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

BOOL __65__HUTriggerConditionEditorItemModule_isShowConditionOptionsItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 showOptionsItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)setCustomConditionEnabled:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  char v7 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
  id v8 = [v7 conditionForItem:v19];

  v9 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
  int v10 = [v9 isConditionEnabled:v8];

  if (v10 != v4)
  {
    id v11 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
    [v11 setConditionEnabled:v4 forCondition:v8];

    char v12 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
    id v13 = v12;
    if (v4) {
      [v12 addCondition:v8];
    }
    else {
      [v12 removeCondition:v8];
    }

    v14 = (void *)MEMORY[0x1E4F69230];
    id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v19];
    v16 = [v14 requestToUpdateItems:v15 senderSelector:a2];

    id v17 = [(HFItemModule *)self itemUpdater];
    id v18 = (id)[v17 performItemUpdateRequest:v16];
  }
}

- (BOOL)isCustomConditionSwitchItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
  char v6 = [v5 containsItem:v4];

  return v6;
}

- (void)_buildItemProviders
{
  v3 = [(HFItemModule *)self itemUpdater];
  id v4 = [(HUTriggerConditionEditorItemModule *)self home];
  id v5 = +[HUTriggerConditionEditorExpandingSectionModule sectionModuleForConditionType:0 itemUpdater:v3 home:v4];
  [(HUTriggerConditionEditorItemModule *)self setTimeConditionModule:v5];

  char v6 = [(HFItemModule *)self itemUpdater];
  char v7 = [(HUTriggerConditionEditorItemModule *)self home];
  id v8 = +[HUTriggerConditionEditorExpandingSectionModule sectionModuleForConditionType:1 itemUpdater:v6 home:v7];
  [(HUTriggerConditionEditorItemModule *)self setLocationConditionModule:v8];

  v9 = [HUTriggerCustomConditionEditorSectionModule alloc];
  int v10 = [(HFItemModule *)self itemUpdater];
  id v11 = [(HUTriggerConditionEditorItemModule *)self home];
  char v12 = [(HUTriggerCustomConditionEditorSectionModule *)v9 initWithItemUpdater:v10 home:v11];
  [(HUTriggerConditionEditorItemModule *)self setCustomConditionsModule:v12];

  [(HUTriggerConditionEditorItemModule *)self _reloadConditionsFromConditionCollection];
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = [(HUTriggerConditionEditorItemModule *)self _allSectionModules];
  v14 = [v13 setWithArray:v16];
  id v15 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_30_2);
  [(HUTriggerConditionEditorItemModule *)self setItemProviders:v15];
}

uint64_t __57__HUTriggerConditionEditorItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemProviders];
}

- (void)_reloadConditionsFromConditionCollection
{
  v3 = [(HUTriggerConditionEditorItemModule *)self conditionCollection];
  id v4 = [v3 conditions];
  id v10 = (id)[v4 mutableCopy];

  id v5 = [(HUTriggerConditionEditorItemModule *)self timeConditionModule];
  [(HUTriggerConditionEditorItemModule *)self _reloadConditionForExpandingSectionModule:v5 remainingConditions:v10];

  char v6 = [(HUTriggerConditionEditorItemModule *)self locationConditionModule];
  [(HUTriggerConditionEditorItemModule *)self _reloadConditionForExpandingSectionModule:v6 remainingConditions:v10];

  char v7 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  v9 = [MEMORY[0x1E4F1CAD0] set];
  [v7 updateEnabledConditions:v8 disabledConditions:v9];
}

- (void)_reloadConditionForExpandingSectionModule:(id)a3 remainingConditions:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  char v6 = [v8 preferredConditionFromConditions:v5];
  if (v6) {
    [v5 removeObject:v6];
  }
  id v7 = (id)[v8 updateSelectionWithCondition:v6];
}

- (id)_allSectionModules
{
  v3 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModules];
  id v4 = [(HUTriggerConditionEditorItemModule *)self customConditionsModule];
  id v5 = [v3 arrayByAddingObject:v4];

  return v5;
}

- (id)_expandingSectionModules
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HUTriggerConditionEditorItemModule *)self timeConditionModule];
  v7[0] = v3;
  id v4 = [(HUTriggerConditionEditorItemModule *)self locationConditionModule];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)_expandingSectionModuleForConditionType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(HUTriggerConditionEditorItemModule *)self locationConditionModule];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(HUTriggerConditionEditorItemModule *)self timeConditionModule];
  }

  return v3;
}

- (id)_moduleForConditionOptionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModules];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HUTriggerConditionEditorItemModule__moduleForConditionOptionItem___block_invoke;
  v9[3] = &unk_1E638E930;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __68__HUTriggerConditionEditorItemModule__moduleForConditionOptionItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 optionItems];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)_sectionModuleForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerConditionEditorItemModule *)self _allSectionModules];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HUTriggerConditionEditorItemModule__sectionModuleForItem___block_invoke;
  v9[3] = &unk_1E638E958;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__HUTriggerConditionEditorItemModule__sectionModuleForItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (BOOL)_isConditionOptionItem:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HUTriggerConditionEditorItemModule *)self _expandingSectionModuleForConditionType:a4];
  if ([v7 containsItem:v6])
  {
    id v8 = [v7 showOptionsItem];
    BOOL v9 = v8 != v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)disallowedConditionTypes
{
  return self->_disallowedConditionTypes;
}

- (HUTriggerConditionEditorExpandingSectionModule)timeConditionModule
{
  return self->_timeConditionModule;
}

- (void)setTimeConditionModule:(id)a3
{
}

- (HUTriggerConditionEditorExpandingSectionModule)locationConditionModule
{
  return self->_locationConditionModule;
}

- (void)setLocationConditionModule:(id)a3
{
}

- (HUTriggerCustomConditionEditorSectionModule)customConditionsModule
{
  return self->_customConditionsModule;
}

- (void)setCustomConditionsModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customConditionsModule, 0);
  objc_storeStrong((id *)&self->_locationConditionModule, 0);
  objc_storeStrong((id *)&self->_timeConditionModule, 0);
  objc_storeStrong((id *)&self->_disallowedConditionTypes, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end