@interface HUTriggerActionEditorItemManager
- (HUButtonItem)addShortcutItem;
- (HUTriggerActionEditorItemManager)initWithDelegate:(id)a3 showShortcutItem:(BOOL)a4;
- (HUTriggerHeaderItem)addShortcutHeader;
- (HUViewControllerTableViewItem)gridItem;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setAddShortcutHeader:(id)a3;
- (void)setAddShortcutItem:(id)a3;
- (void)setGridItem:(id)a3;
@end

@implementation HUTriggerActionEditorItemManager

- (HUTriggerActionEditorItemManager)initWithDelegate:(id)a3 showShortcutItem:(BOOL)a4
{
  BOOL v4 = a4;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [HUViewControllerTableViewItem alloc];
  v9 = [(HFStaticItem *)v8 initWithResults:MEMORY[0x1E4F1CC08]];
  [v7 addObject:v9];
  if (v4)
  {
    v10 = [HUTriggerHeaderItem alloc];
    uint64_t v29 = *MEMORY[0x1E4F68AB8];
    uint64_t v11 = v29;
    v12 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorShortcutSectionTitle", @"HUTriggerActionEditorShortcutSectionTitle", 1);
    v30[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v14 = [(HFStaticItem *)v10 initWithResults:v13];

    [v7 addObject:v14];
    v15 = [HUButtonItem alloc];
    v27[0] = v11;
    v16 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorConvertToShortcutTitle", @"HUTriggerActionEditorConvertToShortcutTitle", 1);
    v27[1] = *MEMORY[0x1E4F68B10];
    v28[0] = v16;
    v28[1] = MEMORY[0x1E4F1CC28];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v18 = [(HFStaticItem *)v15 initWithResults:v17];

    [v7 addObject:v18];
  }
  else
  {
    v18 = 0;
    v14 = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__HUTriggerActionEditorItemManager_initWithDelegate_showShortcutItem___block_invoke;
  v25[3] = &unk_1E6387E60;
  id v19 = v7;
  id v26 = v19;
  v24.receiver = self;
  v24.super_class = (Class)HUTriggerActionEditorItemManager;
  v20 = [(HFSimpleItemManager *)&v24 initWithDelegate:v6 itemProvidersCreator:v25];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_gridItem, v9);
    objc_storeStrong((id *)&v21->_addShortcutHeader, v14);
    objc_storeStrong((id *)&v21->_addShortcutItem, v18);
    v22 = [MEMORY[0x1E4F69758] comparatorWithSortedObjects:v19];
    [(HFSimpleItemManager *)v21 setItemComparator:v22];
  }
  return v21;
}

id __70__HUTriggerActionEditorItemManager_initWithDelegate_showShortcutItem___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F695C8]);
  v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  BOOL v4 = (void *)[v2 initWithItems:v3];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionEditorItemManagerGridSectionIdentifier"];
  id v6 = [(HUTriggerActionEditorItemManager *)self gridItem];
  v19[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v5 setItems:v7];

  [v4 addObject:v5];
  v8 = [(HUTriggerActionEditorItemManager *)self addShortcutHeader];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionEditorItemManagerShortcutsHeaderSectionIdentifier"];
    v10 = [(HUTriggerActionEditorItemManager *)self addShortcutHeader];
    v18 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v9 setItems:v11];

    [v4 addObject:v9];
  }
  v12 = [(HUTriggerActionEditorItemManager *)self addShortcutItem];

  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionEditorItemManagerShortcutsItemSectionIdentifier"];
    v14 = [(HUTriggerActionEditorItemManager *)self addShortcutItem];
    v17 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v13 setItems:v15];

    [v4 addObject:v13];
  }

  return v4;
}

- (HUButtonItem)addShortcutItem
{
  return self->_addShortcutItem;
}

- (void)setAddShortcutItem:(id)a3
{
}

- (HUViewControllerTableViewItem)gridItem
{
  return self->_gridItem;
}

- (void)setGridItem:(id)a3
{
}

- (HUTriggerHeaderItem)addShortcutHeader
{
  return self->_addShortcutHeader;
}

- (void)setAddShortcutHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addShortcutHeader, 0);
  objc_storeStrong((id *)&self->_gridItem, 0);

  objc_storeStrong((id *)&self->_addShortcutItem, 0);
}

@end