@interface HUTimerTriggerEditorItemManager
- (BOOL)datePickerShown;
- (HFStaticItem)datePickerItem;
- (HFStaticItem)recurrencesItem;
- (HFStaticItem)sunriseOptionItem;
- (HFStaticItem)sunsetOptionItem;
- (HFStaticItem)timeOptionItem;
- (HFTimerTriggerBuilder)timerTriggerBuilder;
- (HUInstructionsItem)instructionsItem;
- (HUInstructionsItem)recurrencesInstructionsItem;
- (HUTimerTriggerEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUTimerTriggerEditorItemManager)initWithTimerTriggerBuilder:(id)a3 delegate:(id)a4;
- (HUTriggerConditionEditorItemModule)conditionModule;
- (NSDateComponents)defaultFireTimeComponents;
- (NSMutableDictionary)significantEventToDefaultOffsetMap;
- (NSSet)dateOptionsItems;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)defaultOffsetForSignificantEvent:(id)a3;
- (void)setConditionModule:(id)a3;
- (void)setDatePickerItem:(id)a3;
- (void)setDatePickerShown:(BOOL)a3;
- (void)setDefaultFireTimeComponents:(id)a3;
- (void)setDefaultOffset:(id)a3 forSignificantEvent:(id)a4;
- (void)setInstructionsItem:(id)a3;
- (void)setRecurrencesInstructionsItem:(id)a3;
- (void)setRecurrencesItem:(id)a3;
- (void)setSunriseOptionItem:(id)a3;
- (void)setSunsetOptionItem:(id)a3;
- (void)setTimeOptionItem:(id)a3;
- (void)updateForSignificantEventOffsetChange;
@end

@implementation HUTimerTriggerEditorItemManager

- (HUTimerTriggerEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTimerTriggerBuilder_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTimerTriggerEditorItemManager.m", 46, @"%s is unavailable; use %@ instead",
    "-[HUTimerTriggerEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUTimerTriggerEditorItemManager)initWithTimerTriggerBuilder:(id)a3 delegate:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"HUTimerTriggerEditorItemManager.m", 51, @"Invalid parameter not satisfying: %@", @"timerTriggerBuilder != nil" object file lineNumber description];
  }
  v55.receiver = self;
  v55.super_class = (Class)HUTimerTriggerEditorItemManager;
  v10 = [(HFItemManager *)&v55 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_timerTriggerBuilder, a3);
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    significantEventToDefaultOffsetMap = v11->_significantEventToDefaultOffsetMap;
    v11->_significantEventToDefaultOffsetMap = (NSMutableDictionary *)v12;

    v14 = [HUTriggerConditionEditorItemModule alloc];
    v15 = [v8 home];
    v16 = [v8 conditionCollection];
    v17 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F19B4F10];
    uint64_t v18 = [(HUTriggerConditionEditorItemModule *)v14 initWithItemUpdater:v11 home:v15 conditionCollection:v16 disallowedConditionTypes:v17];
    conditionModule = v11->_conditionModule;
    v11->_conditionModule = (HUTriggerConditionEditorItemModule *)v18;

    v20 = [HUInstructionsItem alloc];
    v21 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorInstructionsTitle", @"HUTimerTriggerEditorInstructionsTitle", 1);
    uint64_t v22 = [(HUInstructionsItem *)v20 initWithStyle:3 title:v21 description:0];
    instructionsItem = v11->_instructionsItem;
    v11->_instructionsItem = (HUInstructionsItem *)v22;

    objc_initWeak(&location, v11);
    id v24 = objc_alloc(MEMORY[0x1E4F695C0]);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke;
    v51[3] = &unk_1E638F718;
    id v25 = v8;
    id v52 = v25;
    objc_copyWeak(&v53, &location);
    uint64_t v26 = [v24 initWithResultsBlock:v51];
    sunriseOptionItem = v11->_sunriseOptionItem;
    v11->_sunriseOptionItem = (HFStaticItem *)v26;

    id v28 = objc_alloc(MEMORY[0x1E4F695C0]);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke_2;
    v48[3] = &unk_1E638F718;
    id v49 = v25;
    objc_copyWeak(&v50, &location);
    uint64_t v29 = [v28 initWithResultsBlock:v48];
    sunsetOptionItem = v11->_sunsetOptionItem;
    v11->_sunsetOptionItem = (HFStaticItem *)v29;

    id v31 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v56 = *MEMORY[0x1E4F68AB8];
    v32 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorTimeOption", @"HUTimerTriggerEditorTimeOption", 1);
    v57[0] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    uint64_t v34 = [v31 initWithResults:v33];
    timeOptionItem = v11->_timeOptionItem;
    v11->_timeOptionItem = (HFStaticItem *)v34;

    id v36 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v37 = [v36 initWithResults:MEMORY[0x1E4F1CC08]];
    datePickerItem = v11->_datePickerItem;
    v11->_datePickerItem = (HFStaticItem *)v37;

    v39 = [HUInstructionsItem alloc];
    v40 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorRepeatSectionTitle", @"HUTimerTriggerEditorRepeatSectionTitle", 1);
    uint64_t v41 = [(HUInstructionsItem *)v39 initWithStyle:2 title:v40 description:0];
    recurrencesInstructionsItem = v11->_recurrencesInstructionsItem;
    v11->_recurrencesInstructionsItem = (HUInstructionsItem *)v41;

    id v43 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v44 = [v43 initWithResults:MEMORY[0x1E4F1CC08]];
    recurrencesItem = v11->_recurrencesItem;
    v11->_recurrencesItem = (HFStaticItem *)v44;

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&location);
  }

  return v11;
}

id __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) eventBuilder];
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *MEMORY[0x1E4F2DF70];
  v7 = [WeakRetained defaultOffsetForSignificantEvent:*MEMORY[0x1E4F2DF70]];

  id v8 = [v4 significantEvent];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = [v4 significantEventOffset];

    v7 = (void *)v10;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F2EB98], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v16 = *MEMORY[0x1E4F68AB8];
  v17[0] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

id __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) eventBuilder];
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *MEMORY[0x1E4F2DF78];
  v7 = [WeakRetained defaultOffsetForSignificantEvent:*MEMORY[0x1E4F2DF78]];

  id v8 = [v4 significantEvent];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = [v4 significantEventOffset];

    v7 = (void *)v10;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F2EB98], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v16 = *MEMORY[0x1E4F68AB8];
  v17[0] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

- (void)setDatePickerShown:(BOOL)a3
{
  if (self->_datePickerShown != a3)
  {
    self->_datePickerShown = a3;
    v5 = [(HFItemManager *)self allItems];
    uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self datePickerItem];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F1CAD0];
      id v11 = [(HUTimerTriggerEditorItemManager *)self datePickerItem];
      int v9 = [v8 setWithObject:v11];
      id v10 = [(HFItemManager *)self updateResultsForItems:v9 senderSelector:a2];
    }
  }
}

- (NSSet)dateOptionsItems
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUTimerTriggerEditorItemManager *)self sunriseOptionItem];
  v5 = [(HUTimerTriggerEditorItemManager *)self sunsetOptionItem];
  uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self timeOptionItem];
  int v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);

  return (NSSet *)v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C8]);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self instructionsItem];
  int v7 = [(HUTimerTriggerEditorItemManager *)self sunriseOptionItem];
  id v8 = [(HUTimerTriggerEditorItemManager *)self sunsetOptionItem];
  int v9 = [(HUTimerTriggerEditorItemManager *)self timeOptionItem];
  id v10 = [(HUTimerTriggerEditorItemManager *)self datePickerItem];
  id v11 = [(HUTimerTriggerEditorItemManager *)self recurrencesInstructionsItem];
  uint64_t v12 = [(HUTimerTriggerEditorItemManager *)self recurrencesItem];
  v13 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, 0);
  v14 = (void *)[v4 initWithItems:v13];

  v21[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v16 = [(HUTimerTriggerEditorItemManager *)self conditionModule];
  v17 = [v16 itemProviders];
  uint64_t v18 = [v17 allObjects];
  v19 = [v15 arrayByAddingObjectsFromArray:v18];

  return v19;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self instructionsItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimerTriggerEditorSectionIdentifierInstructions"];
    int v9 = [(HUTimerTriggerEditorItemManager *)self instructionsItem];
    v41[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v8 setItems:v10];

    [v5 addObject:v8];
  }
  id v11 = [(HUTimerTriggerEditorItemManager *)self sunriseOptionItem];
  v40[0] = v11;
  uint64_t v12 = [(HUTimerTriggerEditorItemManager *)self sunsetOptionItem];
  v40[1] = v12;
  v13 = [(HUTimerTriggerEditorItemManager *)self timeOptionItem];
  v40[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];

  if ([(HUTimerTriggerEditorItemManager *)self datePickerShown])
  {
    v15 = [(HUTimerTriggerEditorItemManager *)self datePickerItem];
    uint64_t v16 = [v14 arrayByAddingObject:v15];

    v14 = (void *)v16;
  }
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __68__HUTimerTriggerEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
  id v36 = &unk_1E6386108;
  id v17 = v4;
  id v37 = v17;
  uint64_t v18 = objc_msgSend(v14, "na_filter:", &v33);

  if (objc_msgSend(v18, "count", v33, v34, v35, v36))
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimerTriggerEditorSectionIdentifierDate"];
    [v19 setItems:v18];
    [v5 addObject:v19];
  }
  v20 = [(HUTimerTriggerEditorItemManager *)self recurrencesInstructionsItem];
  int v21 = [v17 containsObject:v20];

  if (v21)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimerTriggerEditorSectionIdentifierRepeatInstructions"];
    v23 = [(HUTimerTriggerEditorItemManager *)self recurrencesInstructionsItem];
    v39 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [v22 setItems:v24];

    [v5 addObject:v22];
  }
  id v25 = [(HUTimerTriggerEditorItemManager *)self recurrencesItem];
  int v26 = [v17 containsObject:v25];

  if (v26)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimerTriggerEditorSectionIdentifierRepeat"];
    id v28 = [(HUTimerTriggerEditorItemManager *)self recurrencesItem];
    v38 = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    [v27 setItems:v29];

    [v5 addObject:v27];
  }
  v30 = [(HUTimerTriggerEditorItemManager *)self conditionModule];
  id v31 = [v30 buildSectionsWithDisplayedItems:v17];
  [v5 addObjectsFromArray:v31];

  return v5;
}

uint64_t __68__HUTimerTriggerEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_itemsToHideInSet:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HUTimerTriggerEditorItemManager;
  id v4 = [(HFItemManager *)&v9 _itemsToHideInSet:a3];
  v5 = (void *)[v4 mutableCopy];

  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self datePickerItem];
    v10[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v5 addObjectsFromArray:v7];
  }

  return v5;
}

- (void)updateForSignificantEventOffsetChange
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(HUTimerTriggerEditorItemManager *)self sunriseOptionItem];
  uint64_t v6 = [(HUTimerTriggerEditorItemManager *)self sunsetOptionItem];
  int v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, 0);
  id v8 = [(HFItemManager *)self allItems];
  objc_msgSend(v7, "na_setByIntersectingWithSet:", v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(HFItemManager *)self updateResultsForItems:v10 senderSelector:a2];
}

- (id)defaultOffsetForSignificantEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HUTimerTriggerEditorItemManager *)self significantEventToDefaultOffsetMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  }

  return v6;
}

- (void)setDefaultOffset:(id)a3 forSignificantEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUTimerTriggerEditorItemManager *)self significantEventToDefaultOffsetMap];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (NSDateComponents)defaultFireTimeComponents
{
  return self->_defaultFireTimeComponents;
}

- (void)setDefaultFireTimeComponents:(id)a3
{
}

- (HFTimerTriggerBuilder)timerTriggerBuilder
{
  return self->_timerTriggerBuilder;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (void)setConditionModule:(id)a3
{
}

- (BOOL)datePickerShown
{
  return self->_datePickerShown;
}

- (HFStaticItem)sunriseOptionItem
{
  return self->_sunriseOptionItem;
}

- (void)setSunriseOptionItem:(id)a3
{
}

- (HFStaticItem)sunsetOptionItem
{
  return self->_sunsetOptionItem;
}

- (void)setSunsetOptionItem:(id)a3
{
}

- (HFStaticItem)timeOptionItem
{
  return self->_timeOptionItem;
}

- (void)setTimeOptionItem:(id)a3
{
}

- (HFStaticItem)datePickerItem
{
  return self->_datePickerItem;
}

- (void)setDatePickerItem:(id)a3
{
}

- (HFStaticItem)recurrencesItem
{
  return self->_recurrencesItem;
}

- (void)setRecurrencesItem:(id)a3
{
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (HUInstructionsItem)recurrencesInstructionsItem
{
  return self->_recurrencesInstructionsItem;
}

- (void)setRecurrencesInstructionsItem:(id)a3
{
}

- (NSMutableDictionary)significantEventToDefaultOffsetMap
{
  return self->_significantEventToDefaultOffsetMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventToDefaultOffsetMap, 0);
  objc_storeStrong((id *)&self->_recurrencesInstructionsItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_recurrencesItem, 0);
  objc_storeStrong((id *)&self->_datePickerItem, 0);
  objc_storeStrong((id *)&self->_timeOptionItem, 0);
  objc_storeStrong((id *)&self->_sunsetOptionItem, 0);
  objc_storeStrong((id *)&self->_sunriseOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_timerTriggerBuilder, 0);

  objc_storeStrong((id *)&self->_defaultFireTimeComponents, 0);
}

@end