@interface HUAccessorySettingsProfileItemProvider
- (HFAccessorySettingManagedConfigurationAdapter)adapter;
- (HMSettingGroup)settingGroup;
- (HUAccessorySettingsProfileItemProvider)initWithAdapter:(id)a3 settingGroup:(id)a4;
- (NSMutableSet)accessorySettingsProfileItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setAccessorySettingsProfileItems:(id)a3;
- (void)setAdapter:(id)a3;
- (void)setFilter:(id)a3;
- (void)setSettingGroup:(id)a3;
@end

@implementation HUAccessorySettingsProfileItemProvider

- (HUAccessorySettingsProfileItemProvider)initWithAdapter:(id)a3 settingGroup:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileItemProvider.m", 27, @"Invalid parameter not satisfying: %@", @"settingGroup" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileItemProvider.m", 28, @"Invalid parameter not satisfying: %@", @"adapter" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsProfileItemProvider;
  v10 = [(HFItemProvider *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_settingGroup, a4);
    uint64_t v12 = objc_opt_new();
    accessorySettingsProfileItems = v11->_accessorySettingsProfileItems;
    v11->_accessorySettingsProfileItems = (NSMutableSet *)v12;

    objc_storeStrong((id *)&v11->_adapter, a3);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUAccessorySettingsProfileItemProvider *)self adapter];
  v6 = [(HUAccessorySettingsProfileItemProvider *)self settingGroup];
  v7 = (void *)[v4 initWithAdapter:v5 settingGroup:v6];

  return v7;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HUAccessorySettingsProfileItemProvider *)self adapter];
  v4 = [v3 profilesSettingFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke;
  v8[3] = &unk_1E638AE08;
  id v5 = v3;
  id v9 = v5;
  objc_copyWeak(&v11, &location);
  v10 = self;
  v6 = [v4 flatMap:v8];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);

  return v6;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) profiles];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1E638ADE0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  v7 = [v4 flatMap:v9];

  objc_destroyWeak(&v12);

  return v7;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "HUAccessorySettingsProfileItemProvider: Unfiltered profiles: %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_11;
  aBlock[3] = &unk_1E638AD50;
  objc_copyWeak(&v19, a1 + 6);
  id v18 = a1[4];
  uint64_t v6 = _Block_copy(aBlock);
  v7 = [a1[5] filter];
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_5;
    v15[3] = &unk_1E638ADB8;
    v2 = &v16;
    objc_copyWeak(&v16, a1 + 6);
    id v8 = v15;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = _Block_copy(v8);

  id v10 = [a1[5] reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_115 itemAdaptor:&__block_literal_global_19_0 filter:v9 itemMap:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_6;
  v13[3] = &unk_1E6385B38;
  objc_copyWeak(&v14, a1 + 6);
  uint64_t v11 = [v10 flatMap:v13];
  objc_destroyWeak(&v14);

  if (v7) {
    objc_destroyWeak(v2);
  }

  objc_destroyWeak(&v19);

  return v11;
}

HUAccessorySettingsProfileItem *__53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained accessorySettingsProfileItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2_12;
  v9[3] = &unk_1E638AD28;
  id v6 = v3;
  id v10 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (HUAccessorySettingsProfileItem *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    v7 = [[HUAccessorySettingsProfileItem alloc] initWithProfile:v6 setting:*(void *)(a1 + 32)];
  }

  return v7;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3 = [a2 profile];
  id v4 = [v3 UUID];
  id v5 = [*(id *)(a1 + 32) UUID];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 profile];
  id v3 = [v2 UUID];

  return v3;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained filter];
  uint64_t v6 = [v3 profile];

  uint64_t v7 = ((uint64_t (**)(void, void *))v5)[2](v5, v6);
  return v7;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v3 allItems];
    int v13 = 138412290;
    id v14 = v12;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "HUAccessorySettingsProfileItemProvider: Filtered profile items: %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v6 = [WeakRetained accessorySettingsProfileItems];
  uint64_t v7 = [v3 addedItems];
  [v6 unionSet:v7];

  id v8 = [WeakRetained accessorySettingsProfileItems];
  id v9 = [v3 removedItems];
  [v8 minusSet:v9];

  id v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v10;
}

- (id)items
{
  v2 = [(HUAccessorySettingsProfileItemProvider *)self accessorySettingsProfileItems];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUAccessorySettingsProfileItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (void)setSettingGroup:(id)a3
{
}

- (NSMutableSet)accessorySettingsProfileItems
{
  return self->_accessorySettingsProfileItems;
}

- (void)setAccessorySettingsProfileItems:(id)a3
{
}

- (HFAccessorySettingManagedConfigurationAdapter)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_accessorySettingsProfileItems, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);

  objc_storeStrong(&self->_filter, 0);
}

@end