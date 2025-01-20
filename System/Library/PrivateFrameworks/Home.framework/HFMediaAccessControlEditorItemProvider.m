@interface HFMediaAccessControlEditorItemProvider
- (HFMediaAccessControlEditorItemProvider)initWithHome:(id)a3;
- (HFMediaAccessControlEditorItemProvider)initWithItems:(id)a3;
- (HFStaticItem)passwordEnableItem;
- (HFStaticItem)passwordItem;
- (HMHome)home;
- (NSArray)accessControlItems;
- (NSMutableDictionary)itemForIdentifier;
- (id)_buildItems;
- (id)items;
- (void)setAccessControlItems:(id)a3;
- (void)setPasswordEnableItem:(id)a3;
- (void)setPasswordItem:(id)a3;
@end

@implementation HFMediaAccessControlEditorItemProvider

- (HFMediaAccessControlEditorItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = [(HFMediaAccessControlEditorItemProvider *)self _buildItems];
  v11.receiver = self;
  v11.super_class = (Class)HFMediaAccessControlEditorItemProvider;
  v7 = [(HFStaticItemProvider *)&v11 initWithItems:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_home, a3);
    uint64_t v8 = objc_opt_new();
    itemForIdentifier = v7->_itemForIdentifier;
    v7->_itemForIdentifier = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (HFMediaAccessControlEditorItemProvider)initWithItems:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessControlEditorItemProvider.m", 38, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessControlEditorItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)_buildItems
{
  v41[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = [(HFMediaAccessControlEditorItemProvider *)self accessControlItems];
  BOOL v4 = v3 == 0;

  if (v4)
  {
    id v5 = objc_opt_new();
    v6 = 0;
    do
    {
      v7 = NSLocalizedStringFromHFMediaAccessControlClassification((uint64_t)v6, 0);
      uint64_t v8 = [@"AccessControlItem" stringByAppendingFormat:@"_%@", v7];

      v9 = [HFStaticItem alloc];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke;
      v37[3] = &unk_26409A338;
      objc_copyWeak(v39, &location);
      v39[1] = v6;
      id v10 = v8;
      id v38 = v10;
      objc_super v11 = [(HFStaticItem *)v9 initWithResultsBlock:v37];
      [v5 addObject:v11];
      v12 = [(HFMediaAccessControlEditorItemProvider *)self itemForIdentifier];
      [v12 setObject:v11 forKeyedSubscript:v10];

      objc_destroyWeak(v39);
      ++v6;
    }
    while (v6 != (char *)3);
    [(HFMediaAccessControlEditorItemProvider *)self setAccessControlItems:v5];
  }
  v13 = [(HFMediaAccessControlEditorItemProvider *)self passwordEnableItem];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    v15 = [HFStaticItem alloc];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_2;
    v35[3] = &unk_264093CD0;
    objc_copyWeak(&v36, &location);
    v16 = [(HFStaticItem *)v15 initWithResultsBlock:v35];
    [(HFMediaAccessControlEditorItemProvider *)self setPasswordEnableItem:v16];

    v17 = [(HFMediaAccessControlEditorItemProvider *)self passwordEnableItem];
    v18 = [(HFMediaAccessControlEditorItemProvider *)self itemForIdentifier];
    [v18 setObject:v17 forKeyedSubscript:@"PasswordItem"];

    objc_destroyWeak(&v36);
  }
  v19 = [(HFMediaAccessControlEditorItemProvider *)self passwordItem];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    v21 = [HFStaticItem alloc];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_3;
    v33[3] = &unk_264093CD0;
    objc_copyWeak(&v34, &location);
    v22 = [(HFStaticItem *)v21 initWithResultsBlock:v33];
    [(HFMediaAccessControlEditorItemProvider *)self setPasswordItem:v22];

    v23 = [(HFMediaAccessControlEditorItemProvider *)self passwordItem];
    v24 = [(HFMediaAccessControlEditorItemProvider *)self itemForIdentifier];
    [v24 setObject:v23 forKeyedSubscript:@"PasswordEnableItem"];

    objc_destroyWeak(&v34);
  }
  v25 = (void *)MEMORY[0x263EFFA08];
  v26 = [(HFMediaAccessControlEditorItemProvider *)self accessControlItems];
  v27 = [(HFMediaAccessControlEditorItemProvider *)self passwordItem];
  v41[0] = v27;
  v28 = [(HFMediaAccessControlEditorItemProvider *)self passwordEnableItem];
  v41[1] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v30 = [v26 arrayByAddingObjectsFromArray:v29];
  v31 = [v25 setWithArray:v30];

  objc_destroyWeak(&location);
  return v31;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke(uint64_t a1)
{
  v19[5] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = [WeakRetained home];
  id v5 = objc_msgSend(v4, "hf_accessControlDescriptor");
  BOOL v6 = v3 == [v5 access];

  v7 = (void *)MEMORY[0x263F58190];
  v18[0] = @"title";
  uint64_t v8 = NSLocalizedStringFromHFMediaAccessControlClassification(*(void *)(a1 + 48), 0);
  uint64_t v9 = *(void *)(a1 + 32);
  v19[0] = v8;
  v19[1] = v9;
  v18[1] = @"HFAccessControlItemIdentifier";
  v18[2] = @"selected";
  id v10 = [NSNumber numberWithBool:v6];
  v19[2] = v10;
  v18[3] = @"HFAccessControlValueResultKey";
  objc_super v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v19[3] = v11;
  v18[4] = @"dependentHomeKitObjects";
  v12 = (void *)MEMORY[0x263EFFA08];
  v13 = [WeakRetained home];
  BOOL v14 = [v12 setWithObject:v13];
  v19[4] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  v16 = [v7 futureWithResult:v15];

  return v16;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_2(uint64_t a1)
{
  v23[7] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained home];
  uint64_t v3 = objc_msgSend(v2, "hf_accessControlDescriptor");
  uint64_t v4 = [v3 accessSupportsPassword] ^ 1;

  v19 = (void *)MEMORY[0x263F58190];
  v22[0] = @"title";
  v21 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessControlRequirePasswordTitle", @"HFMediaAccessControlRequirePasswordTitle", 1);
  v23[0] = v21;
  v23[1] = @"HFMediaAccessControlRequirePasswordTitle";
  v22[1] = @"titleLocalizationKey";
  v22[2] = @"hidden";
  BOOL v20 = [NSNumber numberWithBool:v4];
  v23[2] = v20;
  v22[3] = @"selected";
  id v5 = NSNumber;
  v18 = [WeakRetained home];
  BOOL v6 = objc_msgSend(v18, "hf_accessControlDescriptor");
  v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "accessRequiresPassword"));
  v23[3] = v7;
  v23[4] = @"PasswordItem";
  v22[4] = @"HFAccessControlItemIdentifier";
  v22[5] = @"HFAccessControlValueResultKey";
  uint64_t v8 = NSNumber;
  uint64_t v9 = [WeakRetained home];
  id v10 = objc_msgSend(v9, "hf_accessControlDescriptor");
  objc_super v11 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "accessRequiresPassword"));
  v23[5] = v11;
  v22[6] = @"dependentHomeKitObjects";
  v12 = (void *)MEMORY[0x263EFFA08];
  v13 = [WeakRetained home];
  BOOL v14 = [v12 setWithObject:v13];
  v23[6] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
  v16 = [v19 futureWithResult:v15];

  return v16;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_3(uint64_t a1)
{
  v24[5] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained home];
  uint64_t v3 = objc_msgSend(v2, "hf_accessControlDescriptor");
  int v4 = [v3 accessSupportsPassword];

  id v5 = [WeakRetained home];
  BOOL v6 = objc_msgSend(v5, "hf_accessControlDescriptor");
  int v7 = [v6 accessRequiresPassword];

  uint64_t v8 = v4 & v7 ^ 1u;
  uint64_t v9 = (void *)MEMORY[0x263F58190];
  v23[0] = @"title";
  id v10 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessControlPasswordTitle", @"HFMediaAccessControlPasswordTitle", 1);
  v24[0] = v10;
  v23[1] = @"hidden";
  objc_super v11 = [NSNumber numberWithBool:v8];
  v24[1] = v11;
  v24[2] = @"PasswordEnableItem";
  v23[2] = @"HFAccessControlItemIdentifier";
  v23[3] = @"HFAccessControlValueResultKey";
  v12 = [WeakRetained home];
  v13 = objc_msgSend(v12, "hf_accessControlDescriptor");
  uint64_t v14 = [v13 accessPassword];
  v15 = (void *)v14;
  v16 = &stru_26C081158;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v24[3] = v16;
  v23[4] = @"dependentHomeKitObjects";
  v17 = (void *)MEMORY[0x263EFFA08];
  v18 = [WeakRetained home];
  v19 = [v17 setWithObject:v18];
  v24[4] = v19;
  BOOL v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  v21 = [v9 futureWithResult:v20];

  return v21;
}

- (id)items
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9C0];
  int v4 = [(HFMediaAccessControlEditorItemProvider *)self accessControlItems];
  id v5 = [v3 setWithArray:v4];

  BOOL v6 = [(HFMediaAccessControlEditorItemProvider *)self passwordItem];
  objc_msgSend(v5, "na_safeAddObject:", v6);

  int v7 = [(HFMediaAccessControlEditorItemProvider *)self passwordEnableItem];
  objc_msgSend(v5, "na_safeAddObject:", v7);

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)accessControlItems
{
  return self->_accessControlItems;
}

- (void)setAccessControlItems:(id)a3
{
}

- (HFStaticItem)passwordEnableItem
{
  return self->_passwordEnableItem;
}

- (void)setPasswordEnableItem:(id)a3
{
}

- (HFStaticItem)passwordItem
{
  return self->_passwordItem;
}

- (void)setPasswordItem:(id)a3
{
}

- (NSMutableDictionary)itemForIdentifier
{
  return self->_itemForIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemForIdentifier, 0);
  objc_storeStrong((id *)&self->_passwordItem, 0);
  objc_storeStrong((id *)&self->_passwordEnableItem, 0);
  objc_storeStrong((id *)&self->_accessControlItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end