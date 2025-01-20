@interface HUSiriHistoryItemManager
- (HFStaticItem)deleteSiriHistoryItem;
- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4;
- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 groupItem:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItemAtIndexPath:(id)a3;
- (id)didUpdateItemAtIndexPath:(id)a3;
- (void)setDeleteSiriHistoryItem:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HUSiriHistoryItemManager

- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v13.receiver = self;
  v13.super_class = (Class)HUSiriHistoryItemManager;
  v8 = [(HFItemManager *)&v13 initWithDelegate:v6 sourceItem:v7];

  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Home.DeleteSiriHistory", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;
  }
  return v8;
}

- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HUSiriHistoryItemManager;
  v4 = [(HFItemManager *)&v9 initWithDelegate:a3 sourceItem:a4];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Home.DeleteSiriHistory", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;
  }
  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HUSiriHistoryItemManager__buildItemProvidersForHome___block_invoke;
  v13[3] = &unk_1E6385000;
  v13[4] = self;
  v5 = (void *)[v4 initWithResultsBlock:v13];
  [(HUSiriHistoryItemManager *)self setDeleteSiriHistoryItem:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F695C8]);
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = [(HUSiriHistoryItemManager *)self deleteSiriHistoryItem];
  objc_super v9 = [v7 setWithObject:v8];
  dispatch_queue_t v10 = (void *)[v6 initWithItems:v9];

  v14[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v11;
}

id __55__HUSiriHistoryItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = *MEMORY[0x1E4F68AB8];
  v3 = HFLocalizedString();
  v15[0] = v3;
  v14[1] = *MEMORY[0x1E4F68908];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v5 = [*(id *)(a1 + 32) home];
  v13[0] = v5;
  id v6 = [*(id *)(a1 + 32) home];
  v7 = objc_msgSend(v6, "hf_mediaAccessories");
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  objc_super v9 = (void *)[v4 initWithArray:v8];
  v15[1] = v9;
  dispatch_queue_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = [v2 futureWithResult:v10];

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = [(HUSiriHistoryItemManager *)self deleteSiriHistoryItem];
  objc_super v9 = [v7 setWithObject:v8];
  int v10 = [v5 intersectsSet:v9];

  if (v10)
  {
    v46 = v6;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"deleteSiriHistory"];
    objc_opt_class();
    v12 = [(HFItemManager *)self sourceItem];
    if (objc_opt_isKindOfClass()) {
      objc_super v13 = v12;
    }
    else {
      objc_super v13 = 0;
    }
    id v14 = v13;

    v15 = [v14 homeKitSettingsVendor];
    if ([v15 conformsToProtocol:&unk_1F1AD86A8]) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    v45 = v14;
    v18 = [v14 homeKitSettingsVendor];
    v19 = [v18 settings];
    v20 = objc_msgSend(v19, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68530]);

    objc_opt_class();
    v44 = v20;
    v21 = [v20 value];
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    objc_opt_class();
    v24 = [(HFItemManager *)self sourceItem];
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    v27 = [v26 settingValue];

    [v27 BOOLValue];
    v28 = [v17 accessories];

    v29 = [v28 anyObject];
    v30 = objc_msgSend(v29, "hf_userFriendlyLocalizedLowercaseDescription");
    v31 = HFLocalizedStringWithFormat();

    v32 = objc_msgSend(v26, "sourceItem", v30);
    if ([v32 conformsToProtocol:&unk_1F1A3D558]) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    v35 = [v34 accessories];

    v36 = [v35 anyObject];

    if (objc_msgSend(v36, "hf_isSiriEndpoint"))
    {
      [v27 BOOLValue];
      v37 = objc_msgSend(v36, "hf_categoryOrPrimaryServiceType");
      uint64_t v38 = HFLocalizedCategoryOrPrimaryServiceTypeString();

      v31 = (void *)v38;
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v47[3] = &unk_1E6385028;
    id v48 = v31;
    id v39 = v31;
    v40 = __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v47);
    [v11 setAttributedFooterTitle:v40];

    v41 = [(HUSiriHistoryItemManager *)self deleteSiriHistoryItem];
    v49[0] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    [v11 setItems:v42];

    id v6 = v46;
    [v46 addObject:v11];
  }

  return v6;
}

id __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:*(void *)(a1 + 32)];
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  v3 = HFLocalizedString();
  uint64_t v8 = *MEMORY[0x1E4F42530];
  id v4 = [MEMORY[0x1E4F696F8] aboutImproveSiriAndDictationURL];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)[v2 initWithString:v3 attributes:v5];
  [v1 appendAttributedString:v6];

  return v1;
}

- (id)didSelectItemAtIndexPath:(id)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(HFItemManager *)self displayedItemAtIndexPath:a3];
  id v5 = [(HUSiriHistoryItemManager *)self deleteSiriHistoryItem];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = HFLocalizedString();
    objc_opt_class();
    uint64_t v8 = [(HFItemManager *)self sourceItem];
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
    id v10 = v9;

    v11 = [v10 sourceItem];

    if ([v11 conformsToProtocol:&unk_1F1A3D558]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    id v14 = [v13 accessories];

    v15 = [v14 anyObject];

    if (objc_msgSend(v15, "hf_isSiriEndpoint"))
    {
      v16 = objc_msgSend(v15, "hf_categoryOrPrimaryServiceType");
      uint64_t v17 = HFLocalizedCategoryOrPrimaryServiceTypeString();

      v7 = (void *)v17;
    }
    v24[0] = *MEMORY[0x1E4F68AB8];
    v18 = HFLocalizedString();
    uint64_t v19 = *MEMORY[0x1E4F68980];
    v25[0] = v18;
    v25[1] = v7;
    uint64_t v20 = *MEMORY[0x1E4F68948];
    v24[1] = v19;
    v24[2] = v20;
    v21 = HFLocalizedString();
    v25[2] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)didUpdateItemAtIndexPath:(id)a3
{
  id v4 = [(HFItemManager *)self displayedItemAtIndexPath:a3];
  id v5 = [(HUSiriHistoryItemManager *)self deleteSiriHistoryItem];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke;
    v9[3] = &unk_1E6385108;
    v9[4] = self;
    v7 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v9];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = [*(id *)(a1 + 32) sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v6 homeKitSettingsVendor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    id v10 = [v6 homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    id v13 = [v12 accessory];

    v35[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
LABEL_14:
    uint64_t v20 = (void *)v14;

    id v7 = v20;
    goto LABEL_15;
  }
  v15 = [v6 homeKitSettingsVendor];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    objc_opt_class();
    uint64_t v17 = [v6 homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    id v13 = [v19 components];

    uint64_t v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_3);
    goto LABEL_14;
  }
  v24 = [*(id *)(a1 + 32) sourceItem];
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v25)
  {
    objc_opt_class();
    id v26 = [*(id *)(a1 + 32) sourceItem];
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    v29 = [v28 sourceItem];

    v30 = [v29 accessories];
    uint64_t v31 = [v30 allObjects];

    id v7 = (id)v31;
  }
LABEL_15:
  v21 = [*(id *)(a1 + 32) queue];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_3;
  v32[3] = &unk_1E63850E0;
  id v33 = v7;
  id v34 = v3;
  id v22 = v7;
  id v23 = v3;
  dispatch_async(v21, v32);
}

id __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 mediaProfile];
  id v3 = [v2 accessory];

  return v3;
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_313);
  id v3 = [MEMORY[0x1E4F7A0D8] chainFutures:v2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_6;
  v5[3] = &unk_1E63850B8;
  id v6 = *(id *)(a1 + 40);
  id v4 = (id)[v3 addCompletionBlock:v5];
}

id __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_5;
  v7[3] = &unk_1E6385090;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 futureWithErrorOnlyHandlerAdapterBlock:v7];

  return v5;
}

uint64_t __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteSiriHistoryWithCompletion:a2];
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLocalizedString();
  id v6 = HFLocalizedString();
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *MEMORY[0x1E4F68980];
  v10[0] = *MEMORY[0x1E4F68AB8];
  v10[1] = v8;
  v11[0] = v5;
  v11[1] = v6;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v7 finishWithResult:v9 error:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (HFStaticItem)deleteSiriHistoryItem
{
  return self->_deleteSiriHistoryItem;
}

- (void)setDeleteSiriHistoryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteSiriHistoryItem, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end