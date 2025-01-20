@interface HUEventTypePickerItemManager
- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3;
- (BOOL)_hasMinimumRequiredTriggeringServices:(int64_t)a3;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFItem)instructionsItem;
- (HFStaticItem)alarmEventItem;
- (HFStaticItem)arrivingAtLocationEventItem;
- (HFStaticItem)characteristicEventItem;
- (HFStaticItem)leavingLocationEventItem;
- (HFStaticItem)timerEventItem;
- (HUEventTypePickerItemManager)initWithTriggerBuilder:(id)a3 delegate:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_createCharacteristicItemForSource:(unint64_t)a3;
- (id)_createLocationItemForType:(unint64_t)a3;
- (id)_createTimeItem;
- (void)setAlarmEventItem:(id)a3;
- (void)setArrivingAtLocationEventItem:(id)a3;
- (void)setCharacteristicEventItem:(id)a3;
- (void)setInstructionsItem:(id)a3;
- (void)setLeavingLocationEventItem:(id)a3;
- (void)setTimerEventItem:(id)a3;
@end

@implementation HUEventTypePickerItemManager

- (HUEventTypePickerItemManager)initWithTriggerBuilder:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUEventTypePickerItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
  }

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUEventTypePickerSectionIdentifierInstructions"];
  id v7 = [(HUEventTypePickerItemManager *)self instructionsItem];
  v22[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v6 setItems:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEventTypePickerSectionIdentifierTriggerTypes"];
  v10 = [(HUEventTypePickerItemManager *)self leavingLocationEventItem];
  v21[0] = v10;
  objc_super v11 = [(HUEventTypePickerItemManager *)self arrivingAtLocationEventItem];
  v21[1] = v11;
  v12 = [(HUEventTypePickerItemManager *)self timerEventItem];
  v21[2] = v12;
  v13 = [(HUEventTypePickerItemManager *)self characteristicEventItem];
  v21[3] = v13;
  v14 = [(HUEventTypePickerItemManager *)self alarmEventItem];
  v21[4] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  [v9 setItems:v15];

  v16 = (void *)MEMORY[0x1E4F69220];
  v20[0] = v6;
  v20[1] = v9;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v18 = [v16 filterSections:v17 toDisplayedItems:v5];

  return v18;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  v4 = [HUInstructionsItem alloc];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerInstructionsDescription", @"HUEventTypePickerInstructionsDescription", 1);
  v6 = [(HUInstructionsItem *)v4 initWithStyle:0 title:0 description:v5];
  [(HUEventTypePickerItemManager *)self setInstructionsItem:v6];

  id v7 = [(HUEventTypePickerItemManager *)self _createLocationItemForType:1];
  [(HUEventTypePickerItemManager *)self setLeavingLocationEventItem:v7];

  v8 = [(HUEventTypePickerItemManager *)self _createLocationItemForType:0];
  [(HUEventTypePickerItemManager *)self setArrivingAtLocationEventItem:v8];

  v9 = [(HUEventTypePickerItemManager *)self _createTimeItem];
  [(HUEventTypePickerItemManager *)self setTimerEventItem:v9];

  v10 = [(HUEventTypePickerItemManager *)self _createCharacteristicItemForSource:1];
  [(HUEventTypePickerItemManager *)self setCharacteristicEventItem:v10];

  objc_super v11 = [(HUEventTypePickerItemManager *)self _createCharacteristicItemForSource:0];
  [(HUEventTypePickerItemManager *)self setAlarmEventItem:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [(HUEventTypePickerItemManager *)self instructionsItem];
  v26[0] = v14;
  v15 = [(HUEventTypePickerItemManager *)self leavingLocationEventItem];
  v26[1] = v15;
  v16 = [(HUEventTypePickerItemManager *)self arrivingAtLocationEventItem];
  v26[2] = v16;
  v17 = [(HUEventTypePickerItemManager *)self timerEventItem];
  v26[3] = v17;
  v18 = [(HUEventTypePickerItemManager *)self characteristicEventItem];
  v26[4] = v18;
  v19 = [(HUEventTypePickerItemManager *)self alarmEventItem];
  v26[5] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
  v21 = [v13 setWithArray:v20];
  v22 = (void *)[v12 initWithItems:v21];

  v25 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];

  return v23;
}

- (id)_createTimeItem
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4F695C0]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HUEventTypePickerItemManager__createTimeItem__block_invoke;
  v5[3] = &unk_1E6384FD0;
  objc_copyWeak(&v6, &location);
  v3 = (void *)[v2 initWithResultsBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __47__HUEventTypePickerItemManager__createTimeItem__block_invoke(uint64_t a1)
{
  v12[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = *MEMORY[0x1E4F68AB8];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerTimerButtonTitle", @"HUEventTypePickerTimerButtonTitle", 1);
  v12[0] = v2;
  v11[1] = *MEMORY[0x1E4F68980];
  v3 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerTimerButtonDescription", @"HUEventTypePickerTimerButtonDescription", 1);
  v12[1] = v3;
  v11[2] = *MEMORY[0x1E4F689E8];
  id v4 = objc_alloc(MEMORY[0x1E4F691D0]);
  id v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x1E4F68690]];
  v12[2] = v5;
  v11[3] = *MEMORY[0x1E4F68A08];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v12[3] = v6;
  v11[4] = *MEMORY[0x1E4F68900];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
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
  v7[2] = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke;
  v7[3] = &unk_1E6386A68;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  id v5 = (void *)[v4 initWithResultsBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v5;
}

id __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_opt_new();
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
    id v7 = @"HUEventTypePickerLeavingLocationButtonDescription";
  }
  else {
    id v7 = @"HUEventTypePickerArrivingAtLocationButtonDescription";
  }
  v8 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v9 = (id *)MEMORY[0x1E4F68620];
  if (*(void *)(a1 + 40) != 1) {
    v9 = (id *)MEMORY[0x1E4F685F8];
  }
  id v10 = *v9;
  objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithImageIdentifier:v10];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2;
  v18[3] = &unk_1E638D280;
  v18[4] = WeakRetained;
  int v13 = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2((uint64_t)v18);
  v14 = NSNumber;
  if (v13) {
    uint64_t v5 = [WeakRetained _hasMinimumRequiredTriggerableServices:1] ^ 1;
  }
  v15 = [v14 numberWithInt:v5];
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v16;
}

uint64_t __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2(uint64_t a1)
{
  if (![MEMORY[0x1E4F69758] supportsBeingCurrentLocationDevice]) {
    return 1;
  }
  id v2 = [MEMORY[0x1E4F69250] sharedDispatcher];
  [v2 authorizationStatus];

  unsigned int v3 = HFLocationServicesAvailableForAuthorizationStatus();
  id v4 = (void *)MEMORY[0x1E4F2EA28];
  uint64_t v5 = [*(id *)(a1 + 32) home];
  LOBYTE(v4) = objc_msgSend(v4, "hf_presenceDisableReasonsForHome:", v5);

  if ((v4 & 2) != 0) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)_createCharacteristicItemForSource:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HUEventTypePickerItemManager__createCharacteristicItemForSource___block_invoke;
  v7[3] = &unk_1E6386A68;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  uint64_t v5 = (void *)[v4 initWithResultsBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v5;
}

id __67__HUEventTypePickerItemManager__createCharacteristicItemForSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
    id v7 = (id *)MEMORY[0x1E4F68680];
  }
  else {
    id v7 = (id *)MEMORY[0x1E4F68688];
  }
  uint64_t v8 = 1;
  v9 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v10 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  objc_super v11 = (objc_class *)MEMORY[0x1E4F691D0];
  id v12 = *v7;
  int v13 = (void *)[[v11 alloc] initWithImageIdentifier:v12];

  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  v14 = NSNumber;
  uint64_t v15 = *(void *)(a1 + 40);
  v16 = [WeakRetained home];
  if (+[HUCharacteristicTriggerServicePickerViewController canPickServicesFromSource:v15 home:v16])
  {
    uint64_t v8 = 1;
    if ([WeakRetained _hasMinimumRequiredTriggeringServices:1]) {
      uint64_t v8 = [WeakRetained _hasMinimumRequiredTriggerableServices:2] ^ 1;
    }
  }
  v17 = [v14 numberWithInt:v8];
  [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
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
  LOBYTE(a3) = [v5 count] >= a3;

  return a3;
}

- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3
{
  uint64_t v5 = [(HFItemManager *)self home];
  if (objc_msgSend(v5, "hf_enabledResidentsSupportsMediaActions"))
  {
    id v6 = [(HFItemManager *)self home];
    id v7 = objc_msgSend(v6, "hf_mediaAccessories");
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

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (HFStaticItem)leavingLocationEventItem
{
  return self->_leavingLocationEventItem;
}

- (void)setLeavingLocationEventItem:(id)a3
{
}

- (HFStaticItem)arrivingAtLocationEventItem
{
  return self->_arrivingAtLocationEventItem;
}

- (void)setArrivingAtLocationEventItem:(id)a3
{
}

- (HFStaticItem)timerEventItem
{
  return self->_timerEventItem;
}

- (void)setTimerEventItem:(id)a3
{
}

- (HFStaticItem)characteristicEventItem
{
  return self->_characteristicEventItem;
}

- (void)setCharacteristicEventItem:(id)a3
{
}

- (HFStaticItem)alarmEventItem
{
  return self->_alarmEventItem;
}

- (void)setAlarmEventItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmEventItem, 0);
  objc_storeStrong((id *)&self->_characteristicEventItem, 0);
  objc_storeStrong((id *)&self->_timerEventItem, 0);
  objc_storeStrong((id *)&self->_arrivingAtLocationEventItem, 0);
  objc_storeStrong((id *)&self->_leavingLocationEventItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end