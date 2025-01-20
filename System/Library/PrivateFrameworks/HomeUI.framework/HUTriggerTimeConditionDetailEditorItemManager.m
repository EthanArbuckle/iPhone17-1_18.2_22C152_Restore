@interface HUTriggerTimeConditionDetailEditorItemManager
- (HFItem)endConditionPickerItem;
- (HFItem)startConditionPickerItem;
- (HFTimeRangeCondition)rangeCondition;
- (HUTriggerTimeConditionDetailEditorItemManager)initWithDelegate:(id)a3 rangeCondition:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)primitiveConditionForPickerItem:(id)a3;
- (void)setEndConditionPickerItem:(id)a3;
- (void)setPrimitiveCondition:(id)a3 forPickerItem:(id)a4;
- (void)setRangeCondition:(id)a3;
- (void)setStartConditionPickerItem:(id)a3;
@end

@implementation HUTriggerTimeConditionDetailEditorItemManager

- (HUTriggerTimeConditionDetailEditorItemManager)initWithDelegate:(id)a3 rangeCondition:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerTimeConditionDetailEditorItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_rangeCondition, a4);
  }

  return v9;
}

- (id)primitiveConditionForPickerItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerTimeConditionDetailEditorItemManager *)self startConditionPickerItem];

  if (v5 == v4)
  {
    v8 = [(HUTriggerTimeConditionDetailEditorItemManager *)self rangeCondition];
    uint64_t v9 = [v8 startCondition];
  }
  else
  {
    id v6 = [(HUTriggerTimeConditionDetailEditorItemManager *)self endConditionPickerItem];

    if (v6 != v4)
    {
      NSLog(&cfstr_ItemIsNotAPick.isa, v4);
      id v7 = 0;
      goto LABEL_7;
    }
    v8 = [(HUTriggerTimeConditionDetailEditorItemManager *)self rangeCondition];
    uint64_t v9 = [v8 endCondition];
  }
  id v7 = (void *)v9;

LABEL_7:

  return v7;
}

- (void)setPrimitiveCondition:(id)a3 forPickerItem:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(HUTriggerTimeConditionDetailEditorItemManager *)self startConditionPickerItem];

  if (v7 == v6)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F69698]);
    v10 = [(HUTriggerTimeConditionDetailEditorItemManager *)self rangeCondition];
    objc_super v11 = [v10 endCondition];
    v12 = v9;
    id v13 = v17;
    id v14 = v11;
  }
  else
  {
    id v8 = [(HUTriggerTimeConditionDetailEditorItemManager *)self endConditionPickerItem];

    if (v8 != v6)
    {
      NSLog(&cfstr_UnknownItem.isa, v6);
      goto LABEL_7;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F69698]);
    v10 = [(HUTriggerTimeConditionDetailEditorItemManager *)self rangeCondition];
    objc_super v11 = [v10 startCondition];
    v12 = v15;
    id v13 = v11;
    id v14 = v17;
  }
  v16 = (void *)[v12 initWithStartCondition:v13 endCondition:v14];
  [(HUTriggerTimeConditionDetailEditorItemManager *)self setRangeCondition:v16];

LABEL_7:
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v5 = MEMORY[0x1E4F1CC08];
  id v6 = (void *)[v4 initWithResults:MEMORY[0x1E4F1CC08]];
  [(HUTriggerTimeConditionDetailEditorItemManager *)self setStartConditionPickerItem:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResults:v5];
  [(HUTriggerTimeConditionDetailEditorItemManager *)self setEndConditionPickerItem:v7];

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(HUTriggerTimeConditionDetailEditorItemManager *)self startConditionPickerItem];
  v17[0] = v9;
  v10 = [(HUTriggerTimeConditionDetailEditorItemManager *)self endConditionPickerItem];
  v17[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v12 = [v8 setWithArray:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v12];
  v16 = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"start"];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionDetailEditorStartSectionTitle", @"HUTriggerTimeConditionDetailEditorStartSectionTitle", 1);
  [v5 setHeaderTitle:v6];

  id v7 = [(HUTriggerTimeConditionDetailEditorItemManager *)self startConditionPickerItem];
  v15[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v5 setItems:v8];

  [v4 addObject:v5];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"end"];
  v10 = _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionDetailEditorEndSectionTitle", @"HUTriggerTimeConditionDetailEditorEndSectionTitle", 1);
  [v9 setHeaderTitle:v10];

  objc_super v11 = [(HUTriggerTimeConditionDetailEditorItemManager *)self endConditionPickerItem];
  id v14 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v9 setItems:v12];

  [v4 addObject:v9];

  return v4;
}

- (HFItem)startConditionPickerItem
{
  return self->_startConditionPickerItem;
}

- (void)setStartConditionPickerItem:(id)a3
{
}

- (HFItem)endConditionPickerItem
{
  return self->_endConditionPickerItem;
}

- (void)setEndConditionPickerItem:(id)a3
{
}

- (HFTimeRangeCondition)rangeCondition
{
  return self->_rangeCondition;
}

- (void)setRangeCondition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeCondition, 0);
  objc_storeStrong((id *)&self->_endConditionPickerItem, 0);

  objc_storeStrong((id *)&self->_startConditionPickerItem, 0);
}

@end