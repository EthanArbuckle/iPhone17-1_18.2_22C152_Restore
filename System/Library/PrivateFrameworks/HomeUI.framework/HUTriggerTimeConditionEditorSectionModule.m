@interface HUTriggerTimeConditionEditorSectionModule
- (BOOL)conditionIsDisabled;
- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3;
- (HFItem)anyTimeOptionItem;
- (HFTransformItem)customOptionItem;
- (HFTransformItem)onlyDayOptionItem;
- (HFTransformItem)onlyNightOptionItem;
- (HFTransformItem)specificTimesOptionItem;
- (id)_conditionItemForType:(unint64_t)a3;
- (id)_createConditionItemForType:(unint64_t)a3;
- (id)buildConditionOptionItems;
- (id)conditionForOptionItem:(id)a3;
- (id)conditionTitle;
- (id)noConditionSummaryTitle;
- (id)preferredConditionFromConditions:(id)a3;
- (id)selectOptionItemForCondition:(id)a3;
- (void)setAnyTimeOptionItem:(id)a3;
- (void)setCustomOptionItem:(id)a3;
- (void)setOnlyDayOptionItem:(id)a3;
- (void)setOnlyNightOptionItem:(id)a3;
- (void)setSpecificTimesOptionItem:(id)a3;
@end

@implementation HUTriggerTimeConditionEditorSectionModule

- (id)conditionForOptionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self anyTimeOptionItem];

  if (v5 == v4)
  {
    v12 = 0;
  }
  else
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8
      && ([(HUTriggerConditionEditorExpandingSectionModule *)self optionItems],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 containsObject:v8],
          v9,
          v10))
    {
      v11 = [v8 sourceItem];
      v12 = [v11 condition];

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E4F69680];
        v14 = [v8 sourceItem];
        v12 = objc_msgSend(v13, "defaultConditionForType:", objc_msgSend(v14, "type"));
      }
    }
    else
    {
      NSLog(&cfstr_UnknownOptionI.isa, v6);
      v12 = 0;
    }
  }

  return v12;
}

- (id)selectOptionItemForCondition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = -[HUTriggerTimeConditionEditorSectionModule _conditionItemForType:](self, "_conditionItemForType:", [v7 timeConditionType]);
      v9 = [v8 sourceItem];
      [v9 setCondition:v7];
    }
    else
    {
      NSLog(&cfstr_UnexpectedCond.isa, v5);
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(HUTriggerTimeConditionEditorSectionModule *)self anyTimeOptionItem];
  }

  return v8;
}

- (id)preferredConditionFromConditions:(id)a3
{
  v3 = objc_msgSend(a3, "na_filter:", &__block_literal_global_119);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_8);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 firstObject];
  }
  id v7 = v6;

  return v7;
}

uint64_t __78__HUTriggerTimeConditionEditorSectionModule_preferredConditionFromConditions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __78__HUTriggerTimeConditionEditorSectionModule_preferredConditionFromConditions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 timeConditionType] != 3;
}

- (id)conditionTitle
{
  return _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionTitle", @"HUTriggerTimeConditionTitle", 1);
}

- (id)noConditionSummaryTitle
{
  return _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionNoSelectedConditionSummary", @"HUTriggerTimeConditionNoSelectedConditionSummary", 1);
}

- (BOOL)conditionIsDisabled
{
  return 0;
}

- (id)buildConditionOptionItems
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionOptionNoneTitle", @"HUTriggerTimeConditionOptionNoneTitle", 1);
  id v4 = [(HUTriggerConditionEditorExpandingSectionModule *)self createNoConditionOptionItemWithTitle:v3];
  [(HUTriggerTimeConditionEditorSectionModule *)self setAnyTimeOptionItem:v4];
  id v5 = -[HUTriggerTimeConditionEditorSectionModule _createConditionItemForType:](self, "_createConditionItemForType:", 0, v4);
  [(HUTriggerTimeConditionEditorSectionModule *)self setOnlyDayOptionItem:v5];
  v11[1] = v5;
  id v6 = [(HUTriggerTimeConditionEditorSectionModule *)self _createConditionItemForType:1];
  [(HUTriggerTimeConditionEditorSectionModule *)self setOnlyNightOptionItem:v6];
  v11[2] = v6;
  id v7 = [(HUTriggerTimeConditionEditorSectionModule *)self _createConditionItemForType:2];
  [(HUTriggerTimeConditionEditorSectionModule *)self setSpecificTimesOptionItem:v7];
  v11[3] = v7;
  id v8 = [(HUTriggerTimeConditionEditorSectionModule *)self _createConditionItemForType:3];
  [(HUTriggerTimeConditionEditorSectionModule *)self setCustomOptionItem:v8];
  v11[4] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];

  return v9;
}

- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self specificTimesOptionItem];

  if (v5 == v4)
  {
    id v7 = [(HUTriggerTimeConditionEditorSectionModule *)self specificTimesOptionItem];
    id v8 = [v7 sourceItem];
    v9 = [v8 condition];
    BOOL v6 = v9 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_conditionItemForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self onlyDayOptionItem];
      goto LABEL_9;
    case 1uLL:
      id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self onlyNightOptionItem];
      goto LABEL_9;
    case 2uLL:
      id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self specificTimesOptionItem];
      goto LABEL_9;
    case 3uLL:
      id v5 = [(HUTriggerTimeConditionEditorSectionModule *)self customOptionItem];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)_createConditionItemForType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F69688]) initWithConditionType:a3];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  id v20 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F696A8]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke_27;
  v11[3] = &unk_1E638B0B8;
  objc_copyWeak(v14, &location);
  v13 = &v15;
  v14[1] = (id)a3;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 initWithSourceItem:v6 updateOptionsTransformBlock:&__block_literal_global_22_0 resultsTransformBlock:v11];
  id v8 = (void *)v16[5];
  v16[5] = v7;

  id v9 = (id)v16[5];
  objc_destroyWeak(v14);
  _Block_object_dispose(&v15, 8);

  objc_destroyWeak(&location);

  return v9;
}

id __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  [v2 setObject:&unk_1F19B4580 forKeyedSubscript:*MEMORY[0x1E4F68708]];
  [v2 setObject:&unk_1F19B4598 forKeyedSubscript:*MEMORY[0x1E4F68718]];

  return v2;
}

id __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];

  [WeakRetained selectedOptionItem];
  uint64_t v7 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  if (*(void *)(a1 + 56) == 3)
  {
    id v8 = [*(id *)(a1 + 32) condition];

    if (!v8) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
  }

  return v6;
}

- (HFItem)anyTimeOptionItem
{
  return self->_anyTimeOptionItem;
}

- (void)setAnyTimeOptionItem:(id)a3
{
}

- (HFTransformItem)onlyDayOptionItem
{
  return self->_onlyDayOptionItem;
}

- (void)setOnlyDayOptionItem:(id)a3
{
}

- (HFTransformItem)onlyNightOptionItem
{
  return self->_onlyNightOptionItem;
}

- (void)setOnlyNightOptionItem:(id)a3
{
}

- (HFTransformItem)specificTimesOptionItem
{
  return self->_specificTimesOptionItem;
}

- (void)setSpecificTimesOptionItem:(id)a3
{
}

- (HFTransformItem)customOptionItem
{
  return self->_customOptionItem;
}

- (void)setCustomOptionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOptionItem, 0);
  objc_storeStrong((id *)&self->_specificTimesOptionItem, 0);
  objc_storeStrong((id *)&self->_onlyNightOptionItem, 0);
  objc_storeStrong((id *)&self->_onlyDayOptionItem, 0);

  objc_storeStrong((id *)&self->_anyTimeOptionItem, 0);
}

@end