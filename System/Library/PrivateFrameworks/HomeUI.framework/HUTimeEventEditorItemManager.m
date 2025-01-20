@interface HUTimeEventEditorItemManager
- (BOOL)datePickerShown;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFStaticItem)datePickerItem;
- (HFStaticItem)recurrencesItem;
- (HFStaticItem)sunriseOptionItem;
- (HFStaticItem)sunsetOptionItem;
- (HFStaticItem)timeOptionItem;
- (HFTimeEventBuilder)timeEvent;
- (HUInstructionsItem)instructionsItem;
- (HUInstructionsItem)recurrencesInstructionsItem;
- (HUTimeEventEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUTimeEventEditorItemManager)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4 delegate:(id)a5;
- (NSDateComponents)defaultFireTimeComponents;
- (NSMutableDictionary)significantEventToDefaultOffsetMap;
- (NSSet)dateOptionsItems;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)defaultOffsetForSignificantEvent:(id)a3;
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

@implementation HUTimeEventEditorItemManager

- (HUTimeEventEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTimeEvent_triggerBuilder_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTimeEventEditorItemManager.m", 45, @"%s is unavailable; use %@ instead",
    "-[HUTimeEventEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUTimeEventEditorItemManager)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4 delegate:(id)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"HUTimeEventEditorItemManager.m", 50, @"Invalid parameter not satisfying: %@", @"triggerBuilder != nil" object file lineNumber description];
  }
  v53.receiver = self;
  v53.super_class = (Class)HUTimeEventEditorItemManager;
  v12 = [(HFItemManager *)&v53 initWithDelegate:v11 sourceItem:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_triggerBuilder, a4);
    objc_storeStrong((id *)&v13->_timeEvent, a3);
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    significantEventToDefaultOffsetMap = v13->_significantEventToDefaultOffsetMap;
    v13->_significantEventToDefaultOffsetMap = (NSMutableDictionary *)v14;

    v16 = [HUInstructionsItem alloc];
    v17 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorInstructionsTitle", @"HUTimerTriggerEditorInstructionsTitle", 1);
    uint64_t v18 = [(HUInstructionsItem *)v16 initWithStyle:3 title:v17 description:0];
    instructionsItem = v13->_instructionsItem;
    v13->_instructionsItem = (HUInstructionsItem *)v18;

    objc_initWeak(&location, v13);
    id v20 = objc_alloc(MEMORY[0x1E4F695C0]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke;
    v49[3] = &unk_1E638F718;
    v21 = v13;
    v50 = v21;
    objc_copyWeak(&v51, &location);
    uint64_t v22 = [v20 initWithResultsBlock:v49];
    sunriseOptionItem = v21->_sunriseOptionItem;
    v21->_sunriseOptionItem = (HFStaticItem *)v22;

    id v24 = objc_alloc(MEMORY[0x1E4F695C0]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke_2;
    v46[3] = &unk_1E638F718;
    v25 = v21;
    v47 = v25;
    objc_copyWeak(&v48, &location);
    uint64_t v26 = [v24 initWithResultsBlock:v46];
    sunsetOptionItem = v25->_sunsetOptionItem;
    v25->_sunsetOptionItem = (HFStaticItem *)v26;

    id v28 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v54 = *MEMORY[0x1E4F68AB8];
    v29 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorTimeOption", @"HUTimerTriggerEditorTimeOption", 1);
    v55[0] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    uint64_t v31 = [v28 initWithResults:v30];
    timeOptionItem = v25->_timeOptionItem;
    v25->_timeOptionItem = (HFStaticItem *)v31;

    id v33 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v34 = [v33 initWithResults:MEMORY[0x1E4F1CC08]];
    datePickerItem = v25->_datePickerItem;
    v25->_datePickerItem = (HFStaticItem *)v34;

    v36 = [HUInstructionsItem alloc];
    v37 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorRepeatSectionTitle", @"HUTimerTriggerEditorRepeatSectionTitle", 1);
    uint64_t v38 = [(HUInstructionsItem *)v36 initWithStyle:2 title:v37 description:0];
    recurrencesInstructionsItem = v25->_recurrencesInstructionsItem;
    v25->_recurrencesInstructionsItem = (HUInstructionsItem *)v38;

    id v40 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v41 = [v40 initWithResults:MEMORY[0x1E4F1CC08]];
    recurrencesItem = v25->_recurrencesItem;
    v25->_recurrencesItem = (HFStaticItem *)v41;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&location);
  }

  return v13;
}

id __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) timeEvent];
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

  v8 = [v4 significantEvent];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = [v4 significantEventOffset];

    v7 = (void *)v10;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F2EB98], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v16 = *MEMORY[0x1E4F68AB8];
  v17[0] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = [v12 futureWithResult:v13];

  return v14;
}

id __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) timeEvent];
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

  v8 = [v4 significantEvent];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = [v4 significantEventOffset];

    v7 = (void *)v10;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F2EB98], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v16 = *MEMORY[0x1E4F68AB8];
  v17[0] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = [v12 futureWithResult:v13];

  return v14;
}

- (void)setDatePickerShown:(BOOL)a3
{
  if (self->_datePickerShown != a3)
  {
    self->_datePickerShown = a3;
    v5 = [(HFItemManager *)self allItems];
    uint64_t v6 = [(HUTimeEventEditorItemManager *)self datePickerItem];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      id v11 = [(HUTimeEventEditorItemManager *)self datePickerItem];
      int v9 = [v8 setWithObject:v11];
      id v10 = [(HFItemManager *)self updateResultsForItems:v9 senderSelector:a2];
    }
  }
}

- (NSSet)dateOptionsItems
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUTimeEventEditorItemManager *)self sunriseOptionItem];
  v5 = [(HUTimeEventEditorItemManager *)self sunsetOptionItem];
  uint64_t v6 = [(HUTimeEventEditorItemManager *)self timeOptionItem];
  int v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);

  return (NSSet *)v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C8]);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(HUTimeEventEditorItemManager *)self instructionsItem];
  int v7 = [(HUTimeEventEditorItemManager *)self sunriseOptionItem];
  v8 = [(HUTimeEventEditorItemManager *)self sunsetOptionItem];
  int v9 = [(HUTimeEventEditorItemManager *)self timeOptionItem];
  id v10 = [(HUTimeEventEditorItemManager *)self datePickerItem];
  id v11 = [(HUTimeEventEditorItemManager *)self recurrencesInstructionsItem];
  v12 = [(HUTimeEventEditorItemManager *)self recurrencesItem];
  v13 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, 0);
  uint64_t v14 = (void *)[v4 initWithItems:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(HUTimeEventEditorItemManager *)self instructionsItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimeEventEditorSectionIdentifierInstructions"];
    int v9 = [(HUTimeEventEditorItemManager *)self instructionsItem];
    v39[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    [v8 setItems:v10];

    [v5 addObject:v8];
  }
  id v11 = [(HUTimeEventEditorItemManager *)self sunriseOptionItem];
  v38[0] = v11;
  v12 = [(HUTimeEventEditorItemManager *)self sunsetOptionItem];
  v38[1] = v12;
  v13 = [(HUTimeEventEditorItemManager *)self timeOptionItem];
  v38[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];

  if ([(HUTimeEventEditorItemManager *)self datePickerShown])
  {
    v15 = [(HUTimeEventEditorItemManager *)self datePickerItem];
    uint64_t v16 = [v14 arrayByAddingObject:v15];

    uint64_t v14 = (void *)v16;
  }
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  id v33 = __65__HUTimeEventEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
  uint64_t v34 = &unk_1E6386108;
  id v17 = v4;
  id v35 = v17;
  uint64_t v18 = objc_msgSend(v14, "na_filter:", &v31);

  if (objc_msgSend(v18, "count", v31, v32, v33, v34))
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimeEventEditorSectionIdentifierDate"];
    [v19 setItems:v18];
    [v5 addObject:v19];
  }
  id v20 = [(HUTimeEventEditorItemManager *)self recurrencesInstructionsItem];
  int v21 = [v17 containsObject:v20];

  if (v21)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimeEventEditorSectionIdentifierRepeatInstructions"];
    v23 = [(HUTimeEventEditorItemManager *)self recurrencesInstructionsItem];
    v37 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v22 setItems:v24];

    [v5 addObject:v22];
  }
  v25 = [(HUTimeEventEditorItemManager *)self recurrencesItem];
  int v26 = [v17 containsObject:v25];

  if (v26)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTimeEventEditorSectionIdentifierRepeat"];
    id v28 = [(HUTimeEventEditorItemManager *)self recurrencesItem];
    v36 = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    [v27 setItems:v29];

    [v5 addObject:v27];
  }

  return v5;
}

uint64_t __65__HUTimeEventEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_itemsToHideInSet:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HUTimeEventEditorItemManager;
  id v4 = [(HFItemManager *)&v9 _itemsToHideInSet:a3];
  v5 = (void *)[v4 mutableCopy];

  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    uint64_t v6 = [(HUTimeEventEditorItemManager *)self datePickerItem];
    v10[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v5 addObjectsFromArray:v7];
  }

  return v5;
}

- (void)updateForSignificantEventOffsetChange
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(HUTimeEventEditorItemManager *)self sunriseOptionItem];
  uint64_t v6 = [(HUTimeEventEditorItemManager *)self sunsetOptionItem];
  int v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, 0);
  v8 = [(HFItemManager *)self allItems];
  objc_msgSend(v7, "na_setByIntersectingWithSet:", v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(HFItemManager *)self updateResultsForItems:v10 senderSelector:a2];
}

- (id)defaultOffsetForSignificantEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HUTimeEventEditorItemManager *)self significantEventToDefaultOffsetMap];
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
  id v8 = [(HUTimeEventEditorItemManager *)self significantEventToDefaultOffsetMap];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (NSDateComponents)defaultFireTimeComponents
{
  return self->_defaultFireTimeComponents;
}

- (void)setDefaultFireTimeComponents:(id)a3
{
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFTimeEventBuilder)timeEvent
{
  return self->_timeEvent;
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
  objc_storeStrong((id *)&self->_timeEvent, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_defaultFireTimeComponents, 0);
}

@end