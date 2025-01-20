@interface HUTriggerSummaryItemManager
- (BOOL)_isInEditMode;
- (BOOL)_shouldShowDeleteItem;
- (BOOL)_shouldShowDurationItems;
- (BOOL)_shouldShowTestItem;
- (BOOL)_showActionSetsInstructionItem;
- (BOOL)_showEnableSwitch;
- (BOOL)_showTriggerSummary;
- (HFItem)createActionButtonItem;
- (HFItem)deleteTriggerItem;
- (HFItem)enableItem;
- (HFItem)testTriggerItem;
- (HFStaticItem)namingRowItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFStaticItemProvider)unsupportedItemProvider;
- (HFTriggerBuilder)triggerBuilder;
- (HUTriggerActionFlow)currentFlow;
- (HUTriggerActionSetsItemModule)actionsModule;
- (HUTriggerConditionEditorItemModule)conditionModule;
- (HUTriggerDurationItemModule)durationModule;
- (HUTriggerEventsItemModule)eventsModule;
- (HUTriggerMediaItemModule)mediaModule;
- (HUTriggerSummaryItemManager)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5;
- (NSArray)overviewItemModules;
- (NSSet)prioritizedAccessories;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)_staticItemsForHome:(id)a3;
- (id)_triggerDeleteInstructionItemString;
- (id)_triggerServiceActionsInstructionDescription;
- (id)_triggerTestActionsInstructionDescription;
- (id)_unsupportedTriggers;
- (id)instructionSections;
- (id)triggerCurrentDisplayedName;
- (int64_t)actionSetsSection;
- (int64_t)serviceActionsSection;
- (int64_t)unsupportedItemSectionIndex;
- (void)setActionsModule:(id)a3;
- (void)setConditionModule:(id)a3;
- (void)setCreateActionButtonItem:(id)a3;
- (void)setCurrentFlow:(id)a3;
- (void)setDeleteTriggerItem:(id)a3;
- (void)setDurationModule:(id)a3;
- (void)setEnableItem:(id)a3;
- (void)setEventsModule:(id)a3;
- (void)setMediaModule:(id)a3;
- (void)setNamingRowItem:(id)a3;
- (void)setPrioritizedAccessories:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setTestTriggerItem:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)setUnsupportedItemProvider:(id)a3;
- (void)triggerBuilderDidChange;
@end

@implementation HUTriggerSummaryItemManager

- (HUTriggerSummaryItemManager)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [[HUTriggerBuilderItem alloc] initWithTriggerBuilder:v9 nameType:4];
  v15.receiver = self;
  v15.super_class = (Class)HUTriggerSummaryItemManager;
  v13 = [(HFItemManager *)&v15 initWithDelegate:v11 sourceItem:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_triggerBuilder, a3);
    objc_storeStrong((id *)&v13->_currentFlow, a4);
  }

  return v13;
}

- (void)triggerBuilderDidChange
{
  v4 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  uint64_t v5 = [v4 naturalLanguageNameOfType:2];
  v6 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  [v6 setDisplayName:v5];

  v7 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  LOBYTE(v5) = [v7 nameIsConfigured];

  if ((v5 & 1) == 0)
  {
    v8 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    id v9 = [v8 naturalLanguageNameOfType:0];
    id v10 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    [v10 setName:v9];
  }
  id v11 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (int64_t)unsupportedItemSectionIndex
{
  return [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:@"HUTriggerSummarySectionIdentifierUnsupportedItems"];
}

- (int64_t)actionSetsSection
{
  return [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierActionSets"];
}

- (int64_t)serviceActionsSection
{
  return [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierServiceActions"];
}

- (id)instructionSections
{
  return (id)[MEMORY[0x1E4F28D60] indexSet];
}

- (id)triggerCurrentDisplayedName
{
  v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v4 = [v3 nameIsConfigured];
  uint64_t v5 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  v6 = v5;
  if (v4) {
    [v5 name];
  }
  else {
  v7 = [v5 displayName];
  }

  return v7;
}

- (void)setPrioritizedAccessories:(id)a3
{
  id v8 = a3;
  char v4 = [(HUTriggerSummaryItemManager *)self actionsModule];

  if (v4)
  {
    uint64_t v5 = [(HUTriggerSummaryItemManager *)self actionsModule];
    [v5 setPrioritizedAccessories:v8];

    prioritizedAccessories = self->_prioritizedAccessories;
    self->_prioritizedAccessories = 0;
  }
  else
  {
    v7 = (NSSet *)v8;
    prioritizedAccessories = self->_prioritizedAccessories;
    self->_prioritizedAccessories = v7;
  }
}

- (NSSet)prioritizedAccessories
{
  v3 = [(HUTriggerSummaryItemManager *)self actionsModule];
  prioritizedAccessories = [v3 prioritizedAccessories];
  uint64_t v5 = prioritizedAccessories;
  if (!prioritizedAccessories) {
    prioritizedAccessories = self->_prioritizedAccessories;
  }
  v6 = prioritizedAccessories;

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self home];
  int v6 = objc_msgSend(v5, "hf_supportsSharedEventAutomation");

  v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = [(HFItemManager *)self home];
    id v10 = objc_msgSend(v9, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_INFO, "Home %@ supports shared event automation", buf, 0xCu);
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = [(HFItemManager *)self home];
    id v10 = objc_msgSend(v9, "hf_prettyDescription");
    id v11 = [(HFItemManager *)self home];
    v12 = [v11 residentDevices];
    v13 = objc_msgSend(v12, "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_INFO, "No resident on home %@ supports shared event automation; residents: %@",
      buf,
      0x16u);
  }
LABEL_7:

  v14 = [MEMORY[0x1E4F1CA48] array];
  objc_super v15 = [(HUTriggerSummaryItemManager *)self _staticItemsForHome:v4];
  if ([v15 count])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v15];
    objc_msgSend(v14, "na_safeAddObject:", v16);
  }
  v17 = [(HUTriggerSummaryItemManager *)self _unsupportedTriggers];
  if ([v17 count])
  {
    BOOL v18 = [(HUTriggerSummaryItemManager *)self _isInEditMode];

    if (!v18) {
      goto LABEL_13;
    }
    id v19 = objc_alloc(MEMORY[0x1E4F695C8]);
    v20 = [(HUTriggerSummaryItemManager *)self _unsupportedTriggers];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__HUTriggerSummaryItemManager__buildItemProvidersForHome___block_invoke;
    v25[3] = &unk_1E6391508;
    id v26 = v4;
    v21 = objc_msgSend(v20, "na_map:", v25);
    v22 = (void *)[v19 initWithItems:v21];
    [(HUTriggerSummaryItemManager *)self setUnsupportedItemProvider:v22];

    v23 = [(HUTriggerSummaryItemManager *)self unsupportedItemProvider];
    objc_msgSend(v14, "na_safeAddObject:", v23);

    v17 = v26;
  }

LABEL_13:

  return v14;
}

id __58__HUTriggerSummaryItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F696D8];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithHome:*(void *)(a1 + 32) trigger:v4];

  return v5;
}

- (id)_staticItemsForHome:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  id v5 = objc_alloc(MEMORY[0x1E4F696A8]);
  int v6 = [(HFItemManager *)self sourceItem];
  v7 = (void *)[v6 copy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke;
  v29[3] = &unk_1E6391530;
  v29[4] = self;
  BOOL v8 = (void *)[v5 initWithSourceItem:v7 transformationBlock:v29];
  [(HUTriggerSummaryItemManager *)self setEnableItem:v8];

  id v9 = [(HUTriggerSummaryItemManager *)self enableItem];
  [v4 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_2;
  v28[3] = &unk_1E6385000;
  v28[4] = self;
  id v11 = (void *)[v10 initWithResultsBlock:v28];
  [(HUTriggerSummaryItemManager *)self setNamingRowItem:v11];

  v12 = [(HUTriggerSummaryItemManager *)self namingRowItem];
  [v4 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_3;
  v27[3] = &unk_1E6385000;
  v27[4] = self;
  v14 = (void *)[v13 initWithResultsBlock:v27];
  [(HUTriggerSummaryItemManager *)self setCreateActionButtonItem:v14];

  objc_super v15 = [(HUTriggerSummaryItemManager *)self createActionButtonItem];
  [v4 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F695C0]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_4;
  v26[3] = &unk_1E6385000;
  v26[4] = self;
  v17 = (void *)[v16 initWithResultsBlock:v26];
  [(HUTriggerSummaryItemManager *)self setTestTriggerItem:v17];

  BOOL v18 = [(HUTriggerSummaryItemManager *)self testTriggerItem];
  [v4 addObject:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F695C0]);
  v30[0] = *MEMORY[0x1E4F68AB8];
  v20 = [(HUTriggerSummaryItemManager *)self _triggerDeleteInstructionItemString];
  v31[0] = v20;
  v30[1] = *MEMORY[0x1E4F68B10];
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[HUTriggerSummaryItemManager _shouldShowDeleteItem](self, "_shouldShowDeleteItem") ^ 1);
  v31[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  v23 = (void *)[v19 initWithResults:v22];
  [(HUTriggerSummaryItemManager *)self setDeleteTriggerItem:v23];

  v24 = [(HUTriggerSummaryItemManager *)self deleteTriggerItem];
  [v4 addObject:v24];

  return v4;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = 1;
  v7 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryEnableSwitchTitle", @"HUTriggerSummaryEnableSwitchTitle", 1);
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v5 setObject:@"HUTriggerSummaryEnableSwitchTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  BOOL v8 = NSNumber;
  id v9 = [v4 objectForKeyedSubscript:@"activeForceDisableReasons"];

  uint64_t v10 = [v9 integerValue];
  if (!v10)
  {
    v2 = [*(id *)(a1 + 32) home];
    uint64_t v6 = objc_msgSend(v2, "hf_currentUserIsAdministrator") ^ 1;
  }
  id v11 = [v8 numberWithInt:v6];
  [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  if (!v10) {
  v12 = NSNumber;
  }
  if ([*(id *)(a1 + 32) _isInEditMode]) {
    uint64_t v13 = [*(id *)(a1 + 32) _showEnableSwitch] ^ 1;
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = [v12 numberWithInt:v13];
  [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  return v5;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) triggerBuilder];
  int v4 = [v3 nameIsConfigured];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) triggerBuilder];
    uint64_t v6 = [v5 name];
    [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  v7 = [*(id *)(a1 + 32) triggerBuilder];
  BOOL v8 = [v7 displayName];
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68AC8]];

  id v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) currentFlow];
  id v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isStandalone"));
  [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v13 = (void *)[v2 copy];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_3(id *a1)
{
  v2 = a1;
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = *MEMORY[0x1E4F68AB8];
  int v4 = [a1[4] _triggerServiceActionsInstructionDescription];
  v13[1] = *MEMORY[0x1E4F68B10];
  v14[0] = v4;
  id v5 = NSNumber;
  int v6 = [v2[4] _isInEditMode];
  if (v6)
  {
    v1 = [v2[4] home];
    if (objc_msgSend(v1, "hf_currentUserIsAdministrator"))
    {
      v2 = [v2[4] triggerBuilder];
      uint64_t v7 = [v2 isShortcutOwned];
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
      uint64_t v7 = 1;
    }
  }
  else
  {
    int v8 = 0;
    uint64_t v7 = 1;
  }
  id v9 = [v5 numberWithInt:v7];
  v14[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = [v3 futureWithResult:v10];

  if (v8) {
  if (v6)
  }

  return v11;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_4(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = *MEMORY[0x1E4F68AB8];
  v3 = [*(id *)(a1 + 32) _triggerTestActionsInstructionDescription];
  v8[1] = *MEMORY[0x1E4F68B10];
  v9[0] = v3;
  int v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowTestItem") ^ 1);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  int v6 = [v2 futureWithResult:v5];

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = [HUTriggerEventsItemModule alloc];
  int v6 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  uint64_t v7 = [(HUTriggerEventsItemModule *)v5 initWithTriggerBuilder:v6 itemUpdater:self];
  [(HUTriggerSummaryItemManager *)self setEventsModule:v7];

  BOOL v8 = [(HUTriggerSummaryItemManager *)self _isInEditMode];
  if (v8)
  {
    int v6 = [(HFItemManager *)self home];
    uint64_t v9 = objc_msgSend(v6, "hf_currentUserIsAdministrator") ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [(HUTriggerSummaryItemManager *)self eventsModule];
  [v10 setHideAddEventButton:v9];

  if (v8) {
  id v11 = [(HUTriggerSummaryItemManager *)self eventsModule];
  }
  objc_msgSend(v4, "na_safeAddObject:", v11);

  v12 = [HUTriggerDurationItemModule alloc];
  uint64_t v13 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  v14 = [(HUTriggerDurationItemModule *)v12 initWithTriggerBuilder:v13 itemUpdater:self];
  [(HUTriggerSummaryItemManager *)self setDurationModule:v14];

  objc_super v15 = [(HUTriggerSummaryItemManager *)self durationModule];
  [v15 setItemManager:self];

  id v16 = [(HUTriggerSummaryItemManager *)self durationModule];
  objc_msgSend(v4, "na_safeAddObject:", v16);

  v17 = [HUTriggerActionSetsItemModule alloc];
  BOOL v18 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  id v19 = [(HUTriggerSummaryItemManager *)self currentFlow];
  v20 = [(HUTriggerActionSetsItemModule *)v17 initWithTriggerBuilder:v18 flow:v19 itemUpdater:self];
  [(HUTriggerSummaryItemManager *)self setActionsModule:v20];

  prioritizedAccessories = self->_prioritizedAccessories;
  v22 = [(HUTriggerSummaryItemManager *)self actionsModule];
  [v22 setPrioritizedAccessories:prioritizedAccessories];

  v23 = self->_prioritizedAccessories;
  self->_prioritizedAccessories = 0;

  v24 = [(HUTriggerSummaryItemManager *)self actionsModule];
  objc_msgSend(v4, "na_safeAddObject:", v24);

  v25 = [HUTriggerMediaItemModule alloc];
  id v26 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  v27 = [(HUTriggerMediaItemModule *)v25 initWithTriggerBuilder:v26 itemUpdater:self];
  [(HUTriggerSummaryItemManager *)self setMediaModule:v27];

  v28 = [(HUTriggerSummaryItemManager *)self mediaModule];
  objc_msgSend(v4, "na_safeAddObject:", v28);

  objc_opt_class();
  __int16 v29 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  if (_os_feature_enabled_impl() && v31)
  {
    v32 = [MEMORY[0x1E4F1CA80] set];
    v33 = [v31 eventTypes];
    uint64_t v34 = [v33 count];

    if (v34 == 1)
    {
      v35 = [v31 eventTypes];
      char v36 = [v35 containsObject:*MEMORY[0x1E4F68458]];

      if (v36)
      {
        v37 = &unk_1F19B5258;
LABEL_16:
        [v32 addObject:v37];
        goto LABEL_17;
      }
      v38 = [v31 eventTypes];
      int v39 = [v38 containsObject:*MEMORY[0x1E4F68450]];

      if (v39)
      {
        v37 = &unk_1F19B5270;
        goto LABEL_16;
      }
    }
LABEL_17:
    v40 = [HUTriggerConditionEditorItemModule alloc];
    v41 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    v42 = [v41 home];
    v43 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    v44 = [v43 conditionCollection];
    v45 = [(HUTriggerConditionEditorItemModule *)v40 initWithItemUpdater:self home:v42 conditionCollection:v44 disallowedConditionTypes:v32];
    [(HUTriggerSummaryItemManager *)self setConditionModule:v45];

    v46 = [(HUTriggerSummaryItemManager *)self conditionModule];
    objc_msgSend(v4, "na_safeAddObject:", v46);
  }

  return v4;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v49[11] = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v48 = [v4 array];
  int v6 = [(HUTriggerSummaryItemManager *)self eventsModule];
  v45 = [v6 buildSectionsWithDisplayedItems:v5];

  uint64_t v7 = [(HUTriggerSummaryItemManager *)self actionsModule];
  v42 = [v7 buildSectionsWithDisplayedItems:v5];

  BOOL v8 = [(HUTriggerSummaryItemManager *)self mediaModule];
  v46 = [v8 buildSectionsWithDisplayedItems:v5];

  uint64_t v9 = [(HUTriggerSummaryItemManager *)self durationModule];
  v47 = v5;
  v44 = [v9 buildSectionsWithDisplayedItems:v5];

  uint64_t v10 = [(HUTriggerSummaryItemManager *)self conditionModule];
  uint64_t v11 = [v10 buildSectionsWithDisplayedItems:v5];
  v12 = (void *)v11;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    uint64_t v13 = (void *)v11;
  }
  id v43 = v13;

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierEnable"];
  objc_super v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = [(HUTriggerSummaryItemManager *)self enableItem];
  v17 = objc_msgSend(v15, "na_arrayWithSafeObject:", v16);
  [v14 setItems:v17];

  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierNamingSection"];
  id v19 = (void *)MEMORY[0x1E4F1C978];
  v20 = [(HUTriggerSummaryItemManager *)self namingRowItem];
  v21 = objc_msgSend(v19, "na_arrayWithSafeObject:", v20);
  [v18 setItems:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierAdd"];
  v23 = (void *)MEMORY[0x1E4F1C978];
  v24 = [(HUTriggerSummaryItemManager *)self createActionButtonItem];
  v25 = objc_msgSend(v23, "na_arrayWithSafeObject:", v24);
  [v22 setItems:v25];

  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierTest"];
  v27 = (void *)MEMORY[0x1E4F1C978];
  v28 = [(HUTriggerSummaryItemManager *)self testTriggerItem];
  __int16 v29 = objc_msgSend(v27, "na_arrayWithSafeObject:", v28);
  [v26 setItems:v29];

  v30 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierUnsupportedItems"];
  id v31 = [(HUTriggerSummaryItemManager *)self unsupportedItemProvider];
  v32 = [v31 items];
  v33 = [v32 allObjects];
  [v30 setItems:v33];

  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerSummarySectionIdentifierDelete"];
  v35 = (void *)MEMORY[0x1E4F1C978];
  char v36 = [(HUTriggerSummaryItemManager *)self deleteTriggerItem];
  v37 = objc_msgSend(v35, "na_arrayWithSafeObject:", v36);
  [v34 setItems:v37];

  v49[0] = v14;
  v49[1] = v18;
  v49[2] = v45;
  v49[3] = v22;
  v49[4] = v42;
  v49[5] = v46;
  v49[6] = v26;
  v49[7] = v44;
  v49[8] = v43;
  v49[9] = v30;
  v49[10] = v34;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:11];
  int v39 = objc_msgSend(v38, "na_arrayByFlattening");
  [v48 addObjectsFromArray:v39];

  v40 = [MEMORY[0x1E4F69220] filterSections:v48 toDisplayedItems:v47];

  return v40;
}

- (id)_itemsToHideInSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTriggerSummaryItemManager;
  v3 = [(HFItemManager *)&v6 _itemsToHideInSet:a3];
  int v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  int v4 = [v3 home];
  id v5 = [v2 futureWithResult:v4];

  return v5;
}

- (NSArray)overviewItemModules
{
  v2 = [(HFItemManager *)self itemModules];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_263);

  return (NSArray *)v3;
}

id __50__HUTriggerSummaryItemManager_overviewItemModules__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1A1A088]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)_showTriggerSummary
{
  v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 context];
  if ([v4 showTriggerSummary])
  {
    id v5 = [(HUTriggerSummaryItemManager *)self currentFlow];
    int v6 = [v5 isStandalone] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_showEnableSwitch
{
  v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 context];
  if ([v4 showTriggerEnableSwitch])
  {
    id v5 = [(HUTriggerSummaryItemManager *)self currentFlow];
    int v6 = [v5 isStandalone] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_shouldShowDurationItems
{
  v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 context];
  if ([v4 allowDurationEditing])
  {
    id v5 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    int v6 = [v5 supportsEndEvents];

    if (!v6) {
      return 0;
    }
    v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    char v7 = [v3 areActionsAffectedByEndEvents];
  }
  else
  {

    char v7 = 0;
  }

  return v7;
}

- (BOOL)_isInEditMode
{
  id v2 = [(HUTriggerSummaryItemManager *)self currentFlow];
  char v3 = [v2 isSingleFlow];

  return v3;
}

- (BOOL)_shouldShowTestItem
{
  char v3 = [(HUTriggerSummaryItemManager *)self currentFlow];
  if ([v3 isStandalone])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
    int v6 = [v5 triggerActionSets];
    char v7 = [v6 allActionBuilders];
    BOOL v4 = [v7 count] != 0;
  }
  return v4;
}

- (BOOL)_shouldShowDeleteItem
{
  char v3 = [(HUTriggerSummaryItemManager *)self currentFlow];
  if ([v3 isStandalone])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [(HUTriggerSummaryItemManager *)self currentFlow];
    if ([v5 flowState] == 3)
    {
      int v6 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
      char v7 = [v6 context];
      if ([v7 showTriggerDeleteButton])
      {
        BOOL v8 = [(HFItemManager *)self home];
        char v4 = objc_msgSend(v8, "hf_currentUserIsAdministrator");
      }
      else
      {
        char v4 = 0;
      }
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_showActionSetsInstructionItem
{
  char v3 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v4 = [v3 context];
  if ([v4 showActionSetsInstructions])
  {
    id v5 = [(HUTriggerSummaryItemManager *)self currentFlow];
    int v6 = [v5 isStandalone] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_unsupportedTriggers
{
  id v2 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v3 = [v2 context];
  char v4 = [v3 unsupportedTriggers];

  return v4;
}

- (id)_triggerTestActionsInstructionDescription
{
  id v2 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v3 = [v2 context];
  char v4 = [v3 testActionsInstructionDescription];

  return v4;
}

- (id)_triggerServiceActionsInstructionDescription
{
  id v2 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v3 = [v2 context];
  char v4 = [v3 serviceActionsInstructionDescription];

  return v4;
}

- (id)_triggerDeleteInstructionItemString
{
  id v2 = [(HUTriggerSummaryItemManager *)self triggerBuilder];
  char v3 = [v2 context];
  char v4 = [v3 deleteInstructionDescription];

  return v4;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HUTriggerActionFlow)currentFlow
{
  return self->_currentFlow;
}

- (void)setCurrentFlow:(id)a3
{
}

- (HFItem)enableItem
{
  return self->_enableItem;
}

- (void)setEnableItem:(id)a3
{
}

- (HFItem)testTriggerItem
{
  return self->_testTriggerItem;
}

- (void)setTestTriggerItem:(id)a3
{
}

- (HFItem)createActionButtonItem
{
  return self->_createActionButtonItem;
}

- (void)setCreateActionButtonItem:(id)a3
{
}

- (HFItem)deleteTriggerItem
{
  return self->_deleteTriggerItem;
}

- (void)setDeleteTriggerItem:(id)a3
{
}

- (HFStaticItem)namingRowItem
{
  return self->_namingRowItem;
}

- (void)setNamingRowItem:(id)a3
{
}

- (HUTriggerEventsItemModule)eventsModule
{
  return self->_eventsModule;
}

- (void)setEventsModule:(id)a3
{
}

- (HUTriggerDurationItemModule)durationModule
{
  return self->_durationModule;
}

- (void)setDurationModule:(id)a3
{
}

- (HUTriggerActionSetsItemModule)actionsModule
{
  return self->_actionsModule;
}

- (void)setActionsModule:(id)a3
{
}

- (HUTriggerMediaItemModule)mediaModule
{
  return self->_mediaModule;
}

- (void)setMediaModule:(id)a3
{
}

- (HFStaticItemProvider)unsupportedItemProvider
{
  return self->_unsupportedItemProvider;
}

- (void)setUnsupportedItemProvider:(id)a3
{
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (void)setConditionModule:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_unsupportedItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaModule, 0);
  objc_storeStrong((id *)&self->_actionsModule, 0);
  objc_storeStrong((id *)&self->_durationModule, 0);
  objc_storeStrong((id *)&self->_eventsModule, 0);
  objc_storeStrong((id *)&self->_namingRowItem, 0);
  objc_storeStrong((id *)&self->_deleteTriggerItem, 0);
  objc_storeStrong((id *)&self->_createActionButtonItem, 0);
  objc_storeStrong((id *)&self->_testTriggerItem, 0);
  objc_storeStrong((id *)&self->_enableItem, 0);
  objc_storeStrong((id *)&self->_currentFlow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);
}

@end