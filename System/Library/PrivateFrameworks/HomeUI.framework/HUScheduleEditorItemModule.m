@interface HUScheduleEditorItemModule
- (BOOL)updateScheduleBuilder:(id)a3;
- (BOOL)updateSelectedScheduleType:(id)a3;
- (HFItem)addScheduleRuleItem;
- (HFItemProvider)staticItemProvider;
- (HFScheduleBuilder)originalScheduleBuilder;
- (HFScheduleBuilder)updatedScheduleBuilder;
- (HFScheduleRuleItemProvider)scheduleRuleItemProvider;
- (HFScheduleTypeItemProvider)scheduleTypeItemProvider;
- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3;
- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3 scheduleBuilder:(id)a4;
- (HUScheduleEditorItemModuleDelegate)delegate;
- (HUScheduleRuleEditorItemModule)ruleEditorItemModule;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (unint64_t)selectedScheduleType;
- (void)_buildItemProviders;
- (void)setAddScheduleRuleItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRuleEditorItemModule:(id)a3;
- (void)setScheduleRuleItemProvider:(id)a3;
- (void)setScheduleTypeItemProvider:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setUpdatedScheduleBuilder:(id)a3;
@end

@implementation HUScheduleEditorItemModule

- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3 scheduleBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUScheduleEditorItemModule.m", 29, @"Invalid parameter not satisfying: %@", @"itemUpdater" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUScheduleEditorItemModule.m", 30, @"Invalid parameter not satisfying: %@", @"scheduleBuilder" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUScheduleEditorItemModule;
  v10 = [(HFItemModule *)&v18 initWithItemUpdater:v7];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    originalScheduleBuilder = v10->_originalScheduleBuilder;
    v10->_originalScheduleBuilder = (HFScheduleBuilder *)v11;

    uint64_t v13 = [v9 copy];
    updatedScheduleBuilder = v10->_updatedScheduleBuilder;
    v10->_updatedScheduleBuilder = (HFScheduleBuilder *)v13;

    [(HUScheduleEditorItemModule *)v10 _buildItemProviders];
  }

  return v10;
}

- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_scheduleBuilder_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUScheduleEditorItemModule.m", 43, @"%s is unavailable; use %@ instead",
    "-[HUScheduleEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  v5 = [(HUScheduleEditorItemModule *)self scheduleRuleItemProvider];
  v6 = [(HUScheduleEditorItemModule *)self staticItemProvider];
  id v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);
  id v8 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  v9 = [v8 itemProviders];
  v10 = [v7 setByAddingObjectsFromSet:v9];

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  id v7 = [v6 items];
  int v8 = [v4 intersectsSet:v7];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleEditorTypesItemSectionIdentifier"];
    v10 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
    uint64_t v11 = [v10 items];
    v12 = [v11 allObjects];
    uint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_90];

    [v9 setItems:v13];
    [v5 addObject:v9];
  }
  v14 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  v15 = [v14 buildSectionsWithDisplayedItems:v4];

  v35 = v5;
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v15);
  v16 = objc_opt_new();
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleEditorRulesItemSectionIdentifier"];
  objc_super v18 = [(HUScheduleEditorItemModule *)self updatedScheduleBuilder];
  v19 = [v18 rules];
  unint64_t v20 = [v19 count];

  if (v20 >= 2)
  {
    if ([(HUScheduleEditorItemModule *)self selectedScheduleType] == 2) {
      v21 = @"HUScheduleRuleEditor_Times_Title";
    }
    else {
      v21 = @"HUScheduleRuleEditor_Dates_Title";
    }
    v22 = _HULocalizedStringWithDefaultValue(v21, v21, 1);
    [v17 setHeaderTitle:v22];
  }
  v23 = [(HUScheduleEditorItemModule *)self scheduleRuleItemProvider];
  v24 = [v23 items];
  int v25 = [v4 intersectsSet:v24];

  if (v25 && v20 >= 2)
  {
    v26 = [(HUScheduleEditorItemModule *)self scheduleRuleItemProvider];
    v27 = [v26 items];
    v28 = [v27 allObjects];
    v29 = [MEMORY[0x1E4F694D8] sortComparatorForScheduleRules];
    v30 = [v28 sortedArrayUsingComparator:v29];
    [v16 addObjectsFromArray:v30];
  }
  v31 = [(HUScheduleEditorItemModule *)self addScheduleRuleItem];
  int v32 = [v4 containsObject:v31];

  if (v32)
  {
    v33 = [(HUScheduleEditorItemModule *)self addScheduleRuleItem];
    [v16 addObject:v33];
  }
  if ((objc_msgSend(v16, "hmf_isEmpty") & 1) == 0)
  {
    [v17 setItems:v16];
    [v35 addObject:v17];
  }

  return v35;
}

uint64_t __62__HUScheduleEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  int v8 = [v4 latestResults];

  v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  objc_super v18 = v10;
  id v11 = v9;
  v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __62__HUScheduleEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    v15 = v19;
  }

  return v13;
}

uint64_t __62__HUScheduleEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

- (void)_buildItemProviders
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F694D0]);
  id v4 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  v5 = (void *)[v3 initWithScheduleBuilder:v4];
  [(HUScheduleEditorItemModule *)self setScheduleTypeItemProvider:v5];

  uint64_t v6 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  uint64_t v7 = [v6 estimatedScheduleType];

  int v8 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  [v8 updateSelectedType:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F694C0]);
  id v10 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  id v11 = (void *)[v9 initWithScheduleBuilder:v10];
  [(HUScheduleEditorItemModule *)self setScheduleRuleItemProvider:v11];

  v12 = [HUScheduleRuleEditorItemModule alloc];
  uint64_t v13 = [(HFItemModule *)self itemUpdater];
  BOOL v14 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  uint64_t v15 = [v14 estimatedScheduleType];
  v16 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  uint64_t v17 = [v16 rules];
  objc_super v18 = [v17 anyObject];
  id v19 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  unint64_t v20 = [(HUScheduleRuleEditorItemModule *)v12 initWithItemUpdater:v13 scheduleType:v15 scheduleRule:v18 scheduleBuilder:v19];
  [(HUScheduleEditorItemModule *)self setRuleEditorItemModule:v20];

  v21 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  [v21 setShowAsInlineModule:1];

  objc_initWeak(&location, self);
  id v22 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __49__HUScheduleEditorItemModule__buildItemProviders__block_invoke;
  int v32 = &unk_1E6384FD0;
  objc_copyWeak(&v33, &location);
  v23 = (void *)[v22 initWithResultsBlock:&v29];
  -[HUScheduleEditorItemModule setAddScheduleRuleItem:](self, "setAddScheduleRuleItem:", v23, v29, v30, v31, v32);

  v24 = [(HUScheduleEditorItemModule *)self addScheduleRuleItem];
  v35[0] = v24;
  int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

  id v26 = objc_alloc(MEMORY[0x1E4F695C8]);
  v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v25];
  v28 = (void *)[v26 initWithItems:v27];
  [(HUScheduleEditorItemModule *)self setStaticItemProvider:v28];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

id __49__HUScheduleEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_AddRule_Title", @"HUScheduleRuleEditor_AddRule_Title", 1);
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v11[0] = *MEMORY[0x1E4F68AB8];
  v11[1] = v4;
  v12[0] = v2;
  v12[1] = @"Home.ScheduleRule.Editor.AddMore";
  v11[2] = *MEMORY[0x1E4F68B10];
  v5 = NSNumber;
  uint64_t v6 = [WeakRetained scheduleTypeItemProvider];
  uint64_t v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "selectedType") == 0);
  v12[2] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v9 = [v3 futureWithResult:v8];

  return v9;
}

- (unint64_t)selectedScheduleType
{
  v2 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  unint64_t v3 = [v2 selectedType];

  return v3;
}

- (BOOL)updateSelectedScheduleType:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    int v22 = 138412802;
    v23 = self;
    __int16 v24 = 2112;
    int v25 = v7;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating selected schedule type to %@", (uint8_t *)&v22, 0x20u);
  }
  id v9 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
  uint64_t v10 = [v9 estimatedScheduleType];

  if (v10 == [v5 type])
  {
    id v11 = [(HUScheduleEditorItemModule *)self originalScheduleBuilder];
    v12 = (void *)[v11 copy];
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E4F694A8], "scheduleBuilderFromType:withDefaultRules:", objc_msgSend(v5, "type"), 1);
  }
  [(HUScheduleEditorItemModule *)self updateScheduleBuilder:v12];
  uint64_t v13 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  objc_msgSend(v13, "updateSelectedType:", objc_msgSend(v5, "type"));

  BOOL v14 = [(HUScheduleEditorItemModule *)self itemProviders];
  uint64_t v15 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  v16 = [v15 itemProviders];
  uint64_t v17 = [v14 setByAddingObjectsFromSet:v16];

  objc_super v18 = [MEMORY[0x1E4F69230] requestToReloadItemProviders:v17 senderSelector:a2];
  id v19 = [(HFItemModule *)self itemUpdater];
  id v20 = (id)[v19 performItemUpdateRequest:v18];

  return 1;
}

- (BOOL)updateScheduleBuilder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v24 = 138412802;
    int v25 = self;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating schedule builder to %@", (uint8_t *)&v24, 0x20u);
  }
  [(HUScheduleEditorItemModule *)self setUpdatedScheduleBuilder:v5];
  int v8 = [(HUScheduleEditorItemModule *)self updatedScheduleBuilder];
  id v9 = [(HUScheduleEditorItemModule *)self scheduleTypeItemProvider];
  [v9 setScheduleBuilder:v8];

  uint64_t v10 = [(HUScheduleEditorItemModule *)self updatedScheduleBuilder];
  id v11 = [(HUScheduleEditorItemModule *)self scheduleRuleItemProvider];
  [v11 setScheduleBuilder:v10];

  v12 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  uint64_t v13 = [(HUScheduleEditorItemModule *)self updatedScheduleBuilder];
  [v12 updateScheduleBuilder:v13];

  BOOL v14 = [(HUScheduleEditorItemModule *)self delegate];
  uint64_t v15 = [(HUScheduleEditorItemModule *)self updatedScheduleBuilder];
  [v14 scheduleEditorModule:self didUpdateScheduleBuilder:v15];

  v16 = [(HUScheduleEditorItemModule *)self itemProviders];
  uint64_t v17 = [(HUScheduleEditorItemModule *)self ruleEditorItemModule];
  objc_super v18 = [v17 itemProviders];
  id v19 = [v16 setByAddingObjectsFromSet:v18];

  id v20 = [MEMORY[0x1E4F69230] requestToReloadItemProviders:v19 senderSelector:a2];
  v21 = [(HFItemModule *)self itemUpdater];
  id v22 = (id)[v21 performItemUpdateRequest:v20];

  return 1;
}

- (HFScheduleBuilder)originalScheduleBuilder
{
  return self->_originalScheduleBuilder;
}

- (HFScheduleBuilder)updatedScheduleBuilder
{
  return self->_updatedScheduleBuilder;
}

- (void)setUpdatedScheduleBuilder:(id)a3
{
}

- (HUScheduleRuleEditorItemModule)ruleEditorItemModule
{
  return self->_ruleEditorItemModule;
}

- (void)setRuleEditorItemModule:(id)a3
{
}

- (HFItem)addScheduleRuleItem
{
  return self->_addScheduleRuleItem;
}

- (void)setAddScheduleRuleItem:(id)a3
{
}

- (HUScheduleEditorItemModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUScheduleEditorItemModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFScheduleTypeItemProvider)scheduleTypeItemProvider
{
  return self->_scheduleTypeItemProvider;
}

- (void)setScheduleTypeItemProvider:(id)a3
{
}

- (HFScheduleRuleItemProvider)scheduleRuleItemProvider
{
  return self->_scheduleRuleItemProvider;
}

- (void)setScheduleRuleItemProvider:(id)a3
{
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, 0);
  objc_storeStrong((id *)&self->_scheduleTypeItemProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addScheduleRuleItem, 0);
  objc_storeStrong((id *)&self->_ruleEditorItemModule, 0);
  objc_storeStrong((id *)&self->_updatedScheduleBuilder, 0);

  objc_storeStrong((id *)&self->_originalScheduleBuilder, 0);
}

@end