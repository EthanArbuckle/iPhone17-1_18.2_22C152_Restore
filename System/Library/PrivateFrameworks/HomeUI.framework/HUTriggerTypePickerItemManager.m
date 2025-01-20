@interface HUTriggerTypePickerItemManager
- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3;
- (BOOL)_hasMinimumRequiredTriggeringServices:(int64_t)a3;
- (BOOL)showSuggestedAutomations;
- (HFItemModule)suggestedAutomationsModule;
- (HFStaticItem)alarmTriggerItem;
- (HFStaticItem)arrivingAtLocationTriggerItem;
- (HFStaticItem)characteristicTriggerItem;
- (HFStaticItem)customAutomationItem;
- (HFStaticItem)leavingLocationTriggerItem;
- (HFStaticItem)timerTriggerItem;
- (HUInstructionsItem)eventsInstructionsItem;
- (HUInstructionsItem)suggestionsInstructionsItem;
- (HUTriggerTypePickerItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_createCharacteristicItemForSource:(unint64_t)a3;
- (id)_createCustomItem;
- (id)_createLocationItemForType:(unint64_t)a3;
- (id)_createTimeItem;
- (id)_itemsToHideInSet:(id)a3;
- (void)setAlarmTriggerItem:(id)a3;
- (void)setArrivingAtLocationTriggerItem:(id)a3;
- (void)setCharacteristicTriggerItem:(id)a3;
- (void)setCustomAutomationItem:(id)a3;
- (void)setEventsInstructionsItem:(id)a3;
- (void)setLeavingLocationTriggerItem:(id)a3;
- (void)setShowSuggestedAutomations:(BOOL)a3;
- (void)setSuggestedAutomationsModule:(id)a3;
- (void)setSuggestionsInstructionsItem:(id)a3;
- (void)setTimerTriggerItem:(id)a3;
@end

@implementation HUTriggerTypePickerItemManager

- (HUTriggerTypePickerItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUTriggerTypePickerItemManager;
  result = [(HFItemManager *)&v5 initWithDelegate:a3 sourceItem:a4];
  if (result) {
    result->_showSuggestedAutomations = 0;
  }
  return result;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [[HURecommendedTriggerItemModule alloc] initWithItemUpdater:self home:v4];

  [(HURecommendedTriggerItemModule *)v5 setHideSectionHeaderTitle:1];
  [(HURecommendedTriggerItemModule *)v5 setMaximumNumberOfShownRecommendations:0x7FFFFFFFFFFFFFFFLL];
  [(HURecommendedTriggerItemModule *)v5 setFilter:&__block_literal_global_296];
  [(HURecommendedTriggerItemModule *)v5 setConfigureBlock:&__block_literal_global_13_5];
  [(HURecommendedTriggerItemModule *)v5 setEngineOptions:[(HURecommendedTriggerItemModule *)v5 engineOptions] | 0x10];
  suggestedAutomationsModule = self->_suggestedAutomationsModule;
  self->_suggestedAutomationsModule = &v5->super;
  v7 = v5;

  v8 = [(HUTriggerTypePickerItemManager *)self suggestedAutomationsModule];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

uint64_t __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hu_asTriggerRecommendation");
  v3 = [v2 triggerBuilders];
  uint64_t v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_10_2);

  return v4;
}

BOOL __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 trigger];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setAccessoryCountType:1];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v34[8] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [HUInstructionsItem alloc];
  objc_super v5 = _HULocalizedStringWithDefaultValue(@"HUTriggerTypePickerEventsSectionTitle", @"HUTriggerTypePickerEventsSectionTitle", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUTriggerTypePickerEventsSectionDescription", @"HUTriggerTypePickerEventsSectionDescription", 1);
  v7 = [(HUInstructionsItem *)v4 initWithStyle:0 title:v5 description:v6];
  [(HUTriggerTypePickerItemManager *)self setEventsInstructionsItem:v7];

  v8 = [HUInstructionsItem alloc];
  v9 = _HULocalizedStringWithDefaultValue(@"HUTriggerTypePickerSuggestionsSectionTitle", @"HUTriggerTypePickerSuggestionsSectionTitle", 1);
  v10 = _HULocalizedStringWithDefaultValue(@"HUTriggerTypePickerSuggestionsSectionDescription", @"HUTriggerTypePickerSuggestionsSectionDescription", 1);
  v11 = [(HUInstructionsItem *)v8 initWithStyle:0 title:v9 description:v10];
  [(HUTriggerTypePickerItemManager *)self setSuggestionsInstructionsItem:v11];

  v12 = [(HUTriggerTypePickerItemManager *)self _createLocationItemForType:1];
  [(HUTriggerTypePickerItemManager *)self setLeavingLocationTriggerItem:v12];

  v13 = [(HUTriggerTypePickerItemManager *)self _createLocationItemForType:0];
  [(HUTriggerTypePickerItemManager *)self setArrivingAtLocationTriggerItem:v13];

  v14 = [(HUTriggerTypePickerItemManager *)self _createTimeItem];
  [(HUTriggerTypePickerItemManager *)self setTimerTriggerItem:v14];

  v15 = [(HUTriggerTypePickerItemManager *)self _createCharacteristicItemForSource:1];
  [(HUTriggerTypePickerItemManager *)self setCharacteristicTriggerItem:v15];

  v16 = [(HUTriggerTypePickerItemManager *)self _createCharacteristicItemForSource:0];
  [(HUTriggerTypePickerItemManager *)self setAlarmTriggerItem:v16];

  v17 = [(HUTriggerTypePickerItemManager *)self _createCustomItem];
  [(HUTriggerTypePickerItemManager *)self setCustomAutomationItem:v17];

  id v31 = objc_alloc(MEMORY[0x1E4F695C8]);
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v32 = [(HUTriggerTypePickerItemManager *)self eventsInstructionsItem];
  v34[0] = v32;
  v19 = [(HUTriggerTypePickerItemManager *)self leavingLocationTriggerItem];
  v34[1] = v19;
  v20 = [(HUTriggerTypePickerItemManager *)self arrivingAtLocationTriggerItem];
  v34[2] = v20;
  v21 = [(HUTriggerTypePickerItemManager *)self timerTriggerItem];
  v34[3] = v21;
  v22 = [(HUTriggerTypePickerItemManager *)self characteristicTriggerItem];
  v34[4] = v22;
  v23 = [(HUTriggerTypePickerItemManager *)self alarmTriggerItem];
  v34[5] = v23;
  v24 = [(HUTriggerTypePickerItemManager *)self customAutomationItem];
  v34[6] = v24;
  v25 = [(HUTriggerTypePickerItemManager *)self suggestionsInstructionsItem];
  v34[7] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:8];
  v27 = [v18 setWithArray:v26];
  v28 = (void *)[v31 initWithItems:v27];

  v33 = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];

  return v29;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerTypePickerSectionIdentifierEventsInstructions"];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerTypePickerSectionIdentifierTriggerTypes"];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerTypePickerSectionIdentifierSuggestionsInstructions"];
  v6 = [(HUTriggerTypePickerItemManager *)self suggestedAutomationsModule];

  v24 = v4;
  if (v6)
  {
    v7 = [(HUTriggerTypePickerItemManager *)self suggestedAutomationsModule];
    v23 = [v7 buildSectionsWithDisplayedItems:v4];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v8 = [(HUTriggerTypePickerItemManager *)self eventsInstructionsItem];
  v30[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v5 setItems:v9];

  v10 = [(HUTriggerTypePickerItemManager *)self arrivingAtLocationTriggerItem];
  v29[0] = v10;
  v11 = [(HUTriggerTypePickerItemManager *)self leavingLocationTriggerItem];
  v29[1] = v11;
  v12 = [(HUTriggerTypePickerItemManager *)self timerTriggerItem];
  v29[2] = v12;
  v13 = [(HUTriggerTypePickerItemManager *)self characteristicTriggerItem];
  v29[3] = v13;
  v14 = [(HUTriggerTypePickerItemManager *)self alarmTriggerItem];
  v29[4] = v14;
  v15 = [(HUTriggerTypePickerItemManager *)self customAutomationItem];
  v29[5] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
  [v26 setItems:v16];

  v17 = [(HUTriggerTypePickerItemManager *)self suggestionsInstructionsItem];
  v28 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v25 setItems:v18];

  v27[0] = v5;
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v23;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  v20 = objc_msgSend(v19, "na_arrayByFlattening");

  v21 = [MEMORY[0x1E4F69220] filterSections:v20 toDisplayedItems:v24];

  return v21;
}

- (id)_itemsToHideInSet:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HUTriggerTypePickerItemManager;
  id v4 = [(HFItemManager *)&v13 _itemsToHideInSet:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  if (![(HUTriggerTypePickerItemManager *)self showSuggestedAutomations])
  {
    v6 = [(HUTriggerTypePickerItemManager *)self suggestedAutomationsModule];
    v7 = [v6 allItems];
    [v5 unionSet:v7];
  }
  v8 = [(HUTriggerTypePickerItemManager *)self suggestedAutomationsModule];
  v9 = [v8 allItems];
  v10 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v5);

  if (![v10 count])
  {
    v11 = [(HUTriggerTypePickerItemManager *)self suggestionsInstructionsItem];
    [v5 addObject:v11];
  }

  return v5;
}

- (id)_createCustomItem
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4F695C0]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__HUTriggerTypePickerItemManager__createCustomItem__block_invoke;
  v5[3] = &unk_1E6384FD0;
  objc_copyWeak(&v6, &location);
  BOOL v3 = (void *)[v2 initWithResultsBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __51__HUTriggerTypePickerItemManager__createCustomItem__block_invoke(uint64_t a1)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = *MEMORY[0x1E4F68AB8];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerCustomButtonTitle", @"HUEventTypePickerCustomButtonTitle", 1);
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F68980];
  BOOL v3 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerCustomButtonDescription", @"HUEventTypePickerCustomButtonDescription", 1);
  v13[1] = v3;
  v12[2] = *MEMORY[0x1E4F689E8];
  id v4 = objc_alloc(MEMORY[0x1E4F691D0]);
  objc_super v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x1E4F685D0]];
  v13[2] = v5;
  v12[3] = *MEMORY[0x1E4F68A08];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v13[3] = v6;
  v12[4] = *MEMORY[0x1E4F68900];
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v13[4] = v7;
  v12[5] = *MEMORY[0x1E4F68B10];
  v8 = [NSNumber numberWithInt:_os_feature_enabled_impl() ^ 1];
  v13[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v9];

  return v10;
}

- (id)_createTimeItem
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4F695C0]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HUTriggerTypePickerItemManager__createTimeItem__block_invoke;
  v5[3] = &unk_1E6384FD0;
  objc_copyWeak(&v6, &location);
  BOOL v3 = (void *)[v2 initWithResultsBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __49__HUTriggerTypePickerItemManager__createTimeItem__block_invoke(uint64_t a1)
{
  v12[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = *MEMORY[0x1E4F68AB8];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerTimerButtonTitle", @"HUEventTypePickerTimerButtonTitle", 1);
  v12[0] = v2;
  v11[1] = *MEMORY[0x1E4F68980];
  BOOL v3 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerTimerButtonDescription", @"HUEventTypePickerTimerButtonDescription", 1);
  v12[1] = v3;
  void v11[2] = *MEMORY[0x1E4F689E8];
  id v4 = objc_alloc(MEMORY[0x1E4F691D0]);
  objc_super v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x1E4F68690]];
  v12[2] = v5;
  v11[3] = *MEMORY[0x1E4F68A08];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v12[3] = v6;
  v11[4] = *MEMORY[0x1E4F68900];
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v12[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

  return v9;
}

- (id)_createLocationItemForType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke;
  v7[3] = &unk_1E6386A68;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  objc_super v5 = (void *)[v4 initWithResultsBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v5;
}

id __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = objc_opt_new();
  if (*(void *)(a1 + 40) == 1) {
    id v4 = @"HUEventTypePickerLeavingLocationButtonTitle";
  }
  else {
    id v4 = @"HUEventTypePickerArrivingAtLocationButtonTitle";
  }
  uint64_t v5 = 1;
  id v6 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if (*(void *)(a1 + 40) == 1) {
    v7 = @"HUEventTypePickerLeavingLocationButtonDescription";
  }
  else {
    v7 = @"HUEventTypePickerArrivingAtLocationButtonDescription";
  }
  v8 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v9 = (id *)MEMORY[0x1E4F68620];
  if (*(void *)(a1 + 40) != 1) {
    v9 = (id *)MEMORY[0x1E4F685F8];
  }
  id v10 = *v9;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithImageIdentifier:v10];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2;
  v18[3] = &unk_1E638D280;
  v18[4] = WeakRetained;
  int v13 = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2((uint64_t)v18);
  v14 = NSNumber;
  if (v13) {
    uint64_t v5 = [WeakRetained _hasMinimumRequiredTriggerableServices:1] ^ 1;
  }
  v15 = [v14 numberWithInt:v5];
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v16;
}

uint64_t __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F69758] supportsBeingCurrentLocationDevice])
  {
    id v2 = [MEMORY[0x1E4F69250] sharedDispatcher];
    int v3 = [v2 authorizationStatus];

    unsigned int v4 = HFLocationServicesAvailableForAuthorizationStatus();
    uint64_t v5 = (void *)MEMORY[0x1E4F2EA28];
    id v6 = [*(id *)(a1 + 32) home];
    LOBYTE(v5) = objc_msgSend(v5, "hf_presenceDisableReasonsForHome:", v6);

    unint64_t v7 = v5 & 2;
    if ((v5 & 2) != 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v4;
    }
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109888;
      v11[1] = v8;
      __int16 v12 = 1024;
      int v13 = v3;
      __int16 v14 = 1024;
      unsigned int v15 = v4;
      __int16 v16 = 1024;
      int v17 = v7 >> 1;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Location automations allowed=%{BOOL}d, locationServicesAuthStatus=%d, locationServicesEnabled=%{BOOL}d, homeKitLocationServicesDisabled=%{BOOL}d", (uint8_t *)v11, 0x1Au);
    }
  }
  else
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Location automations disabled because supportsBeingCurrentLocationDevice us false", (uint8_t *)v11, 2u);
    }
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)_createCharacteristicItemForSource:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HUTriggerTypePickerItemManager__createCharacteristicItemForSource___block_invoke;
  v7[3] = &unk_1E6386A68;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  uint64_t v5 = (void *)[v4 initWithResultsBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v5;
}

id __69__HUTriggerTypePickerItemManager__createCharacteristicItemForSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = @"HUEventTypePickerCharacteristicButtonTitle";
  }
  else {
    uint64_t v5 = @"HUEventTypePickerAlarmButtonTitle";
  }
  if (v4) {
    id v6 = @"HUEventTypePickerCharacteristicButtonDescription";
  }
  else {
    id v6 = @"HUEventTypePickerAlarmButtonDescription";
  }
  if (v4) {
    unint64_t v7 = (id *)MEMORY[0x1E4F68680];
  }
  else {
    unint64_t v7 = (id *)MEMORY[0x1E4F68688];
  }
  uint64_t v8 = 1;
  v9 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v10 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v11 = (objc_class *)MEMORY[0x1E4F691D0];
  id v12 = *v7;
  int v13 = (void *)[[v11 alloc] initWithImageIdentifier:v12];

  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  __int16 v14 = NSNumber;
  uint64_t v15 = *(void *)(a1 + 40);
  __int16 v16 = [WeakRetained home];
  if (+[HUCharacteristicTriggerServicePickerViewController canPickServicesFromSource:v15 home:v16])
  {
    uint64_t v8 = 1;
    if ([WeakRetained _hasMinimumRequiredTriggeringServices:1]) {
      uint64_t v8 = [WeakRetained _hasMinimumRequiredTriggerableServices:2] ^ 1;
    }
  }
  int v17 = [v14 numberWithInt:v8];
  [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v21;
}

- (BOOL)_hasMinimumRequiredTriggeringServices:(int64_t)a3
{
  uint64_t v4 = [(HFItemManager *)self home];
  uint64_t v5 = objc_msgSend(v4, "hf_allVisibleServices");
  LOBYTE(a3) = [v5 count] >= (unint64_t)a3;

  return a3;
}

- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3
{
  uint64_t v5 = [(HFItemManager *)self home];
  if (objc_msgSend(v5, "hf_enabledResidentsSupportsMediaActions"))
  {
    id v6 = [(HFItemManager *)self home];
    unint64_t v7 = objc_msgSend(v6, "hf_mediaAccessories");
    uint64_t v8 = [v7 count];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = objc_msgSend(v5, "hf_allVisibleServices");
  unint64_t v10 = [v9 count] + v8;

  return v10 >= a3;
}

- (HFStaticItem)leavingLocationTriggerItem
{
  return self->_leavingLocationTriggerItem;
}

- (void)setLeavingLocationTriggerItem:(id)a3
{
}

- (HFStaticItem)arrivingAtLocationTriggerItem
{
  return self->_arrivingAtLocationTriggerItem;
}

- (void)setArrivingAtLocationTriggerItem:(id)a3
{
}

- (HFStaticItem)timerTriggerItem
{
  return self->_timerTriggerItem;
}

- (void)setTimerTriggerItem:(id)a3
{
}

- (HFStaticItem)characteristicTriggerItem
{
  return self->_characteristicTriggerItem;
}

- (void)setCharacteristicTriggerItem:(id)a3
{
}

- (HFStaticItem)alarmTriggerItem
{
  return self->_alarmTriggerItem;
}

- (void)setAlarmTriggerItem:(id)a3
{
}

- (HFStaticItem)customAutomationItem
{
  return self->_customAutomationItem;
}

- (void)setCustomAutomationItem:(id)a3
{
}

- (HFItemModule)suggestedAutomationsModule
{
  return self->_suggestedAutomationsModule;
}

- (void)setSuggestedAutomationsModule:(id)a3
{
}

- (BOOL)showSuggestedAutomations
{
  return self->_showSuggestedAutomations;
}

- (void)setShowSuggestedAutomations:(BOOL)a3
{
  self->_showSuggestedAutomations = a3;
}

- (HUInstructionsItem)eventsInstructionsItem
{
  return self->_eventsInstructionsItem;
}

- (void)setEventsInstructionsItem:(id)a3
{
}

- (HUInstructionsItem)suggestionsInstructionsItem
{
  return self->_suggestionsInstructionsItem;
}

- (void)setSuggestionsInstructionsItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInstructionsItem, 0);
  objc_storeStrong((id *)&self->_eventsInstructionsItem, 0);
  objc_storeStrong((id *)&self->_suggestedAutomationsModule, 0);
  objc_storeStrong((id *)&self->_customAutomationItem, 0);
  objc_storeStrong((id *)&self->_alarmTriggerItem, 0);
  objc_storeStrong((id *)&self->_characteristicTriggerItem, 0);
  objc_storeStrong((id *)&self->_timerTriggerItem, 0);
  objc_storeStrong((id *)&self->_arrivingAtLocationTriggerItem, 0);

  objc_storeStrong((id *)&self->_leavingLocationTriggerItem, 0);
}

@end