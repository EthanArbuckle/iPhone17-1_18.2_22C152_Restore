@interface HUChildServiceEditorItemModule
+ (id)childItemComparator;
+ (id)supportedServiceTypes;
- (BOOL)canToggleConfigurationStateForItem:(id)a3;
- (HFServiceItemProvider)childServiceItemProvider;
- (HFServiceLikeItem)sourceItem;
- (HMAccessory)accessory;
- (HMHome)home;
- (HUChildServiceEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 mode:(unint64_t)a6;
- (id)_createItemProviders;
- (id)_isConfiguredControlItemForItem:(id)a3;
- (id)itemProviders;
- (id)toggleConfigurationStateForItem:(id)a3;
- (int64_t)configurationStateForItem:(id)a3;
- (unint64_t)editingMode;
- (void)setChildServiceItemProvider:(id)a3;
@end

@implementation HUChildServiceEditorItemModule

+ (id)supportedServiceTypes
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HUChildServiceEditorItemModule.m", 22, @"%s is an abstract method that must be overriden by subclass %@", "+[HUChildServiceEditorItemModule supportedServiceTypes]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)childItemComparator
{
  return &__block_literal_global_275;
}

uint64_t __53__HUChildServiceEditorItemModule_childItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v5 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68AB8];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v9 = [v4 latestResults];
  v10 = [v9 objectForKeyedSubscript:v7];

  v11 = [v5 latestResults];

  uint64_t v12 = *MEMORY[0x1E4F68A08];
  v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  int v14 = [v13 BOOLValue];

  v15 = [v4 latestResults];

  v16 = [v15 objectForKeyedSubscript:v12];
  int v17 = [v16 BOOLValue];

  if (!v14 || v17)
  {
    if ((v14 | v17 ^ 1) == 1)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      id v19 = v8;
      v24 = v19;
      id v20 = v10;
      v21 = v20;
      id v25 = v20;
      if (v19) {
        uint64_t v18 = -1;
      }
      else {
        uint64_t v18 = v20 != 0;
      }
      if (v19 && v20)
      {
        uint64_t v18 = objc_msgSend(v19, "localizedStandardCompare:", v20, v23, 3221225472, __53__HUChildServiceEditorItemModule_childItemComparator__block_invoke_2, &unk_1E6385480, v19);
        v21 = v25;
      }
    }
    else
    {
      uint64_t v18 = -1;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

uint64_t __53__HUChildServiceEditorItemModule_childItemComparator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedStandardCompare:*(void *)(a1 + 40)];
}

- (HUChildServiceEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 mode:(unint64_t)a6
{
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUChildServiceEditorItemModule;
  int v14 = [(HFItemModule *)&v19 initWithItemUpdater:a3];
  if (v14)
  {
    if (!v13)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v14, @"HUChildServiceEditorItemModule.m", 53, @"Invalid parameter not satisfying: %@", @"sourceItem" object file lineNumber description];
    }
    objc_storeStrong((id *)&v14->_home, a4);
    objc_storeStrong((id *)&v14->_sourceItem, a5);
    v14->_editingMode = a6;
    uint64_t v15 = [(HUChildServiceEditorItemModule *)v14 _createItemProviders];
    itemProviders = v14->_itemProviders;
    v14->_itemProviders = (NSSet *)v15;
  }
  return v14;
}

- (HMAccessory)accessory
{
  v2 = [(HUChildServiceEditorItemModule *)self sourceItem];
  v3 = [v2 accessories];
  id v4 = [v3 anyObject];

  return (HMAccessory *)v4;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    id v4 = [(HUChildServiceEditorItemModule *)self _createItemProviders];
    id v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)_createItemProviders
{
  v3 = [(HUChildServiceEditorItemModule *)self childServiceItemProvider];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F69558]);
    id v5 = [(HUChildServiceEditorItemModule *)self home];
    v6 = [(id)objc_opt_class() supportedServiceTypes];
    uint64_t v7 = (void *)[v4 initWithHome:v5 serviceTypes:v6];
    [(HUChildServiceEditorItemModule *)self setChildServiceItemProvider:v7];

    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [(id)objc_opt_class() supportedServiceTypes];
    v10 = [v8 setWithArray:v9];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke;
    v17[3] = &unk_1E63919A0;
    objc_copyWeak(&v19, &location);
    id v11 = v10;
    id v18 = v11;
    id v12 = [(HUChildServiceEditorItemModule *)self childServiceItemProvider];
    [v12 setSourceServiceGenerator:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  int v14 = [(HUChildServiceEditorItemModule *)self childServiceItemProvider];
  uint64_t v15 = [v13 setWithObject:v14];

  return v15;
}

id __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained sourceItem];
  id v4 = [v3 homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    v6 = [WeakRetained sourceItem];
    uint64_t v7 = [v6 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    v10 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = objc_msgSend(v9, "hf_childServices");

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_2;
    v37[3] = &unk_1E6387048;
    id v38 = *(id *)(a1 + 32);
    id v12 = objc_msgSend(v11, "na_filter:", v37);
    id v13 = [v10 futureWithResult:v12];

    int v14 = v38;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v15 = [WeakRetained sourceItem];
  v16 = [v15 homeKitObject];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (v17)
  {
    objc_opt_class();
    id v18 = [WeakRetained sourceItem];
    id v19 = [v18 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    v22 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = objc_msgSend(v21, "hf_visibleServices");

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_3;
    v35[3] = &unk_1E6387048;
    id v36 = *(id *)(a1 + 32);
    uint64_t v23 = objc_msgSend(v11, "na_filter:", v35);
    id v13 = [v22 futureWithResult:v23];

    int v14 = v36;
    goto LABEL_16;
  }
  v24 = [WeakRetained sourceItem];
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v25)
  {
    objc_opt_class();
    v26 = [WeakRetained sourceItem];
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    v29 = [v28 accessoryBuilder];

    id v11 = [v29 accessory];

    v30 = (void *)MEMORY[0x1E4F7A0D8];
    int v14 = objc_msgSend(v11, "hf_visibleServices");
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_4;
    v33[3] = &unk_1E6387048;
    id v34 = *(id *)(a1 + 32);
    v31 = objc_msgSend(v14, "na_filter:", v33);
    id v13 = [v30 futureWithResult:v31];

    goto LABEL_16;
  }
  id v13 = 0;
LABEL_17:

  return v13;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_isConfiguredControlItemForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemModule *)self itemUpdater];
  v6 = [v5 childItemsForItem:v4];

  uint64_t v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_22_3);

  return v7;
}

uint64_t __66__HUChildServiceEditorItemModule__isConfiguredControlItemForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (_MergedGlobals_2_3 != -1) {
    dispatch_once(&_MergedGlobals_2_3, &__block_literal_global_28_2);
  }
  id v3 = (id)qword_1EA12E1C8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v2 characteristicOptions];
    id v5 = [v4 allCharacteristicTypes];
    uint64_t v6 = [v5 intersectsSet:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __66__HUChildServiceEditorItemModule__isConfiguredControlItemForItem___block_invoke_3()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F2D040];
  v5[0] = *MEMORY[0x1E4F2CF10];
  v5[1] = v1;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_1EA12E1C8;
  qword_1EA12E1C8 = v3;
}

- (int64_t)configurationStateForItem:(id)a3
{
  uint64_t v3 = [(HUChildServiceEditorItemModule *)self _isConfiguredControlItemForItem:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 latestResults];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

    if (v6)
    {
      if ([v6 unsignedIntegerValue] == 2) {
        int64_t v7 = 3;
      }
      else {
        int64_t v7 = 2;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)canToggleConfigurationStateForItem:(id)a3
{
  int64_t v4 = [(HUChildServiceEditorItemModule *)self configurationStateForItem:a3];
  id v5 = [(HUChildServiceEditorItemModule *)self home];
  char v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");
  if (v4) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v4 != 1 && v7;

  return v8;
}

- (id)toggleConfigurationStateForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUChildServiceEditorItemModule *)self _isConfiguredControlItemForItem:v4];
  if (!v5) {
    NSLog(&cfstr_NoControlItemF.isa, v4);
  }
  char v6 = [v5 toggleValue];

  return v6;
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (HFServiceItemProvider)childServiceItemProvider
{
  return self->_childServiceItemProvider;
}

- (void)setChildServiceItemProvider:(id)a3
{
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_childServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end