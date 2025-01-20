@interface HUServiceDetailsProgrammableSwitchItemModule
- (HUCharacteristicEventOptionProvider)programmableSwitchOptionsProvider;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setItemProviders:(id)a3;
@end

@implementation HUServiceDetailsProgrammableSwitchItemModule

- (HUCharacteristicEventOptionProvider)programmableSwitchOptionsProvider
{
  programmableSwitchOptionsProvider = self->_programmableSwitchOptionsProvider;
  if (programmableSwitchOptionsProvider)
  {
    v3 = programmableSwitchOptionsProvider;
  }
  else
  {
    v5 = [(HUServiceDetailsItemModule *)self home];
    v6 = [HUCharacteristicEventOptionProvider alloc];
    v7 = [(HUServiceDetailsItemModule *)self sourceItem];
    v8 = [(HUServiceDetailsItemModule *)self home];
    v9 = [(HUCharacteristicEventOptionProvider *)v6 initWithServiceVendingItem:v7 home:v8];
    v10 = self->_programmableSwitchOptionsProvider;
    self->_programmableSwitchOptionsProvider = v9;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__HUServiceDetailsProgrammableSwitchItemModule_programmableSwitchOptionsProvider__block_invoke;
    v14[3] = &unk_1E63909F8;
    id v15 = v5;
    v11 = self->_programmableSwitchOptionsProvider;
    id v12 = v5;
    [(HUCharacteristicEventOptionProvider *)v11 setFilter:v14];
    v3 = self->_programmableSwitchOptionsProvider;
  }

  return v3;
}

uint64_t __81__HUServiceDetailsProgrammableSwitchItemModule_programmableSwitchOptionsProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator"))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSSet)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(HUServiceDetailsProgrammableSwitchItemModule *)self programmableSwitchOptionsProvider];
    v6 = [v4 setWithObject:v5];
    v7 = self->_itemProviders;
    self->_itemProviders = v6;

    itemProviders = self->_itemProviders;
  }
  v8 = itemProviders;

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v3 = objc_msgSend(a3, "na_filter:", &__block_literal_global_245);
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v5 = (void *)MEMORY[0x1E4F1CA70];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
    v28[3] = &unk_1E6390A20;
    id v6 = v4;
    id v29 = v6;
    v7 = objc_msgSend(v3, "na_map:", v28);
    v8 = [v5 orderedSetWithSet:v7];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
    v26[3] = &unk_1E638EBB0;
    id v27 = v6;
    id v9 = v6;
    [v8 sortUsingComparator:v26];
    v10 = objc_opt_new();
    v11 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_5;
    v22[3] = &unk_1E6390A48;
    id v23 = v8;
    id v24 = v11;
    id v12 = v10;
    id v25 = v12;
    id v13 = v11;
    id v14 = v8;
    [v3 enumerateObjectsUsingBlock:v22];
    id v15 = [v12 allKeys];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_9;
    v19[3] = &unk_1E6390A90;
    id v20 = v12;
    id v21 = &__block_literal_global_18_0;
    id v16 = v12;
    v17 = objc_msgSend(v15, "na_map:", v19);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 latestResults];
  v5 = [v4 objectForKey:@"sectionElementIndex"];

  id v6 = [v3 characteristics];

  v7 = [v6 anyObject];
  v8 = [v7 service];

  [*(id *)(a1 + 32) setObject:v5 forKey:v8];

  return v8;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKey:a2];
  v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  v11 = v10;
  id v17 = v10;
  if (v9) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = v10 != 0;
  }
  id v13 = v10;
  if (v9 && v10)
  {
    uint64_t v12 = objc_msgSend(v9, "compare:", v10, v15, 3221225472, __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_4, &unk_1E6385480, v9);
    id v13 = v17;
  }

  return v12;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

void __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 characteristics];
  v5 = [v4 anyObject];
  id v10 = [v5 service];

  id v6 = objc_msgSend(@"HUServiceDetailsProgrammableSwitchSectionIdentifierPrefix-", "stringByAppendingFormat:", @"%lu", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v10));
  v7 = *(void **)(a1 + 40);
  v8 = [v10 uniqueIdentifier];
  [v7 setObject:v6 forKey:v8];

  id v9 = objc_msgSend(*(id *)(a1 + 48), "na_objectForKey:withDefaultValue:", v6, &__block_literal_global_13_3);
  [v9 addObject:v3];
}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_6()
{
  v0 = objc_opt_new();

  return v0;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = HFProgrammableSwitchInputEventOptionDisplayPriorityMap();
  v7 = [v5 latestResults];

  uint64_t v8 = *MEMORY[0x1E4F68AB8];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  id v10 = [v6 objectForKeyedSubscript:v9];

  v11 = [v4 latestResults];

  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  id v13 = [v6 objectForKeyedSubscript:v12];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  id v14 = v10;
  v22 = v14;
  id v15 = v13;
  id v16 = v15;
  id v23 = v15;
  if (v14) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = v15 != 0;
  }
  if (v14) {
    BOOL v18 = v15 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    v19 = v15;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v14, "compare:", v15, v21, 3221225472, __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_8, &unk_1E6385480, v14);
    v19 = v23;
  }

  return v17;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_9(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v4];

  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_22_2);
  uint64_t v8 = [v7 latestResults];
  id v9 = [v8 objectForKey:@"sectionIndex"];

  id v10 = [v7 latestResults];
  v11 = [v10 objectForKey:@"sectionNamespace"];

  uint64_t v12 = [v7 latestResults];
  id v13 = [v12 objectForKey:@"sectionElementIndex"];

  id v14 = [v7 latestResults];
  id v15 = [v14 objectForKey:@"sectionTitleKey"];
  [v6 setHeaderTitle:v15];

  id v16 = [NSString stringWithFormat:@"%@-%@-%@", v9, v11, v13, @"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"];
  v22[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v6 setUserInfo:v17];

  BOOL v18 = [v5 allObjects];
  v19 = [v18 sortedArrayUsingComparator:*(void *)(a1 + 40)];
  [v6 setItems:v19];

  return v6;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristics];
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_25_3);

  return v3;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2CF08]];

  return v3;
}

- (void)setItemProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProviders, 0);

  objc_storeStrong((id *)&self->_programmableSwitchOptionsProvider, 0);
}

@end