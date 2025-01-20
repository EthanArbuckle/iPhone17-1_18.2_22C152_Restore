@interface HUCharacteristicEventItemManager
+ (id)_optionItemComparator;
+ (id)_titleForItemSection:(id)a3;
+ (id)serviceVendorItemForEventBuilderItem:(id)a3 inHome:(id)a4;
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFItem)activeOptionItem;
- (HFItem)serviceNameItem;
- (HFServiceVendor)serviceVendingItem;
- (HFStaticItemProvider)staticItemProvider;
- (HUCharacteristicEventItemManager)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 delegate:(id)a5;
- (HUCharacteristicEventOptionProvider)optionProvider;
- (HUInstructionsItem)instructionsItem;
- (HUTriggerConditionEditorItemModule)conditionModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)optionItems;
- (void)setActiveOptionItem:(id)a3;
- (void)setInstructionsItem:(id)a3;
- (void)setOptionProvider:(id)a3;
- (void)setServiceNameItem:(id)a3;
- (void)setServiceVendingItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUCharacteristicEventItemManager

+ (id)serviceVendorItemForEventBuilderItem:(id)a3 inHome:(id)a4
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
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HUCharacteristicEventItemManager.m", 55, @"Invalid parameter not satisfying: %@", @"eventBuilderItem" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"HUCharacteristicEventItemManager.m", 56, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

LABEL_3:
  id v10 = objc_alloc_init(MEMORY[0x1E4F69360]);
  v11 = [v7 characteristics];
  v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_147);

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2;
  v30[3] = &unk_1E6388C70;
  id v13 = v9;
  id v31 = v13;
  v14 = objc_msgSend(v12, "na_flatMap:", v30);
  v15 = [v7 characteristics];
  v16 = objc_msgSend(v15, "na_map:", &__block_literal_global_74_0);

  if ([v14 count])
  {
    if ((unint64_t)[v14 count] >= 2)
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Found multiple matching service groups that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }
    }
    id v18 = objc_alloc(MEMORY[0x1E4F69538]);
    v19 = [v14 anyObject];
    uint64_t v20 = [v18 initWithValueSource:v10 serviceGroup:v19];
LABEL_21:
    v25 = (HUCharacteristicEventUnknownItem *)v20;

    goto LABEL_22;
  }
  if ([v12 count])
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "Found multiple matching services that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }
    }
    v22 = (void *)MEMORY[0x1E4F69550];
    v19 = [v12 anyObject];
    uint64_t v20 = [v22 serviceItemForService:v19 valueSource:v10];
    goto LABEL_21;
  }
  if ([v16 count])
  {
    if ((unint64_t)[v16 count] >= 2)
    {
      v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Found multiple matching accessories that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }
    }
    id v24 = objc_alloc(MEMORY[0x1E4F68E18]);
    v19 = [v16 anyObject];
    uint64_t v20 = [v24 initWithAccessory:v19 valueSource:v10];
    goto LABEL_21;
  }
  v25 = objc_alloc_init(HUCharacteristicEventUnknownItem);
LABEL_22:

  return v25;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 service];
  if (objc_msgSend(v3, "hf_isVisible"))
  {
    v4 = [v2 service];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = objc_msgSend(*(id *)(a1 + 32), "hf_serviceGroupsForService:", a2);
  v4 = [v2 setWithArray:v3];

  return v4;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 service];
  v3 = [v2 accessory];

  return v3;
}

- (HUCharacteristicEventItemManager)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUCharacteristicEventItemManager;
  v11 = [(HFItemManager *)&v23 initWithDelegate:a5];
  if (v11)
  {
    v12 = objc_opt_class();
    id v13 = [v9 home];
    uint64_t v14 = [v12 serviceVendorItemForEventBuilderItem:v10 inHome:v13];
    serviceVendingItem = v11->_serviceVendingItem;
    v11->_serviceVendingItem = (HFServiceVendor *)v14;

    objc_storeStrong((id *)&v11->_eventBuilderItem, a4);
    objc_storeStrong((id *)&v11->_triggerBuilder, a3);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v16 = [HUTriggerConditionEditorItemModule alloc];
      v17 = [v9 home];
      id v18 = [v9 conditionCollection];
      v19 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v20 = [(HUTriggerConditionEditorItemModule *)v16 initWithItemUpdater:v11 home:v17 conditionCollection:v18 disallowedConditionTypes:v19];
      conditionModule = v11->_conditionModule;
      v11->_conditionModule = (HUTriggerConditionEditorItemModule *)v20;
    }
  }

  return v11;
}

- (void)setActiveOptionItem:(id)a3
{
  id v6 = a3;
  activeOptionItem = self->_activeOptionItem;
  v12 = (HFItem *)v6;
  id v8 = activeOptionItem;
  if (v8 == v12)
  {

    id v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  if (!v12)
  {

    goto LABEL_7;
  }
  char v9 = [(HFItem *)v12 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_activeOptionItem, a3);
    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v12);
    id v11 = [(HFItemManager *)self updateResultsForItems:v10 senderSelector:a2];
    goto LABEL_8;
  }
LABEL_9:
}

- (id)optionItems
{
  v3 = [(HUCharacteristicEventItemManager *)self optionProvider];
  v4 = [v3 items];
  v5 = [(HFItemManager *)self allDisplayedItems];
  id v6 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v5);

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUInstructionsItem alloc];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicEventOptionInstructionsHeader", @"HUCharacteristicEventOptionInstructionsHeader", 1);
  id v7 = [(HUInstructionsItem *)v5 initWithStyle:0 title:v6 description:0];
  [(HUCharacteristicEventItemManager *)self setInstructionsItem:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F696A8]);
  char v9 = [(HUCharacteristicEventItemManager *)self serviceVendingItem];
  id v10 = (void *)[v9 copy];
  uint64_t v11 = *MEMORY[0x1E4F68908];
  v34[0] = *MEMORY[0x1E4F68AB8];
  v34[1] = v11;
  v34[2] = *MEMORY[0x1E4F689E8];
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  id v13 = (void *)[v8 initWithSourceItem:v10 resultKeyFilter:v12];
  [(HUCharacteristicEventItemManager *)self setServiceNameItem:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F695C8]);
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [(HUCharacteristicEventItemManager *)self instructionsItem];
  v17 = [(HUCharacteristicEventItemManager *)self serviceNameItem];
  id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, 0);
  v19 = (void *)[v14 initWithItems:v18];
  [(HUCharacteristicEventItemManager *)self setStaticItemProvider:v19];

  uint64_t v20 = [HUCharacteristicEventOptionProvider alloc];
  v21 = [(HUCharacteristicEventItemManager *)self serviceVendingItem];
  v22 = [(HUCharacteristicEventOptionProvider *)v20 initWithServiceVendingItem:v21 home:v4];

  [(HUCharacteristicEventItemManager *)self setOptionProvider:v22];
  objc_super v23 = [(HUCharacteristicEventItemManager *)self staticItemProvider];
  v33[0] = v23;
  id v24 = [(HUCharacteristicEventItemManager *)self optionProvider];
  v33[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v26 = [(HUCharacteristicEventItemManager *)self conditionModule];
  v27 = [v26 itemProviders];
  uint64_t v28 = [v27 allObjects];
  v29 = (void *)v28;
  if (v28) {
    uint64_t v30 = v28;
  }
  else {
    uint64_t v30 = MEMORY[0x1E4F1CBF0];
  }
  id v31 = [v25 arrayByAddingObjectsFromArray:v30];

  return v31;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(HUCharacteristicEventItemManager *)self instructionsItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCharacteristicEventSectionIdentifierInstructions"];
    char v9 = [(HUCharacteristicEventItemManager *)self instructionsItem];
    v37[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    [v8 setItems:v10];

    [v5 addObject:v8];
  }
  uint64_t v11 = [(HUCharacteristicEventItemManager *)self serviceNameItem];
  int v12 = [v4 containsObject:v11];

  if (v12)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCharacteristicEventSectionIdentifierService"];
    id v14 = [(HUCharacteristicEventItemManager *)self serviceNameItem];
    v36 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    [v13 setItems:v15];

    [v5 addObject:v13];
  }
  v16 = [(HUCharacteristicEventItemManager *)self optionProvider];
  v17 = [v16 items];
  id v18 = objc_msgSend(v17, "na_setByIntersectingWithSet:", v4);

  if ([v18 count])
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCharacteristicEventSectionIdentifierOptions"];
    uint64_t v20 = [v18 allObjects];
    v21 = [(id)objc_opt_class() _optionItemComparator];
    v22 = [v20 sortedArrayUsingComparator:v21];
    objc_super v23 = (void *)[v22 mutableCopy];

    objc_opt_class();
    id v24 = [(HUCharacteristicEventItemManager *)self activeOptionItem];
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    if (v26)
    {
      uint64_t v27 = [v23 indexOfObject:v26];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = v27;
        v29 = [v26 childItem];

        if (v29)
        {
          uint64_t v30 = [v26 childItem];
          [v23 insertObject:v30 atIndex:v28 + 1];
        }
      }
    }
    [v19 setItems:v23];
    id v31 = [(id)objc_opt_class() _titleForItemSection:v19];
    [v19 setHeaderTitle:v31];

    [v5 addObject:v19];
  }
  v32 = [(HUCharacteristicEventItemManager *)self conditionModule];

  if (v32)
  {
    v33 = [(HUCharacteristicEventItemManager *)self conditionModule];
    v34 = [v33 buildSectionsWithDisplayedItems:v4];
    [v5 addObjectsFromArray:v34];
  }

  return v5;
}

+ (id)_optionItemComparator
{
  return &__block_literal_global_96_0;
}

uint64_t __57__HUCharacteristicEventItemManager__optionItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 characteristics];
  int v7 = [v6 anyObject];
  id v8 = [v7 characteristicType];

  char v9 = [v5 characteristics];
  id v10 = [v9 anyObject];
  uint64_t v11 = [v10 characteristicType];

  if (![v8 isEqualToString:v11])
  {
    uint64_t v17 = [v8 compare:v11];
    goto LABEL_8;
  }
  int v12 = [v4 representativeTriggerValue];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v13 = [v5 representativeTriggerValue];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
LABEL_7:
    uint64_t v17 = 0;
    goto LABEL_8;
  }
  v15 = [v5 representativeTriggerValue];
  v16 = [v4 representativeTriggerValue];
  uint64_t v17 = [v15 compare:v16];

LABEL_8:
  return v17;
}

+ (id)_titleForItemSection:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [a3 items];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_101);
  id v6 = [v3 setWithArray:v5];

  if ([v6 count] == 1)
  {
    int v7 = [v6 anyObject];
    id v8 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_valueRangeCharacteristicTypes");
    char v9 = [v7 characteristicType];
    int v10 = [v8 containsObject:v9];

    if (v10)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F2E7A8], "hf_naturalLanguageDescriptionForCharacteristic:", v7);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id __57__HUCharacteristicEventItemManager__titleForItemSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 mainCharacteristic];

  return v6;
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFServiceVendor)serviceVendingItem
{
  return self->_serviceVendingItem;
}

- (void)setServiceVendingItem:(id)a3
{
}

- (HFItem)activeOptionItem
{
  return self->_activeOptionItem;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (HFItem)serviceNameItem
{
  return self->_serviceNameItem;
}

- (void)setServiceNameItem:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HUCharacteristicEventOptionProvider)optionProvider
{
  return self->_optionProvider;
}

- (void)setOptionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceNameItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_activeOptionItem, 0);
  objc_storeStrong((id *)&self->_serviceVendingItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end