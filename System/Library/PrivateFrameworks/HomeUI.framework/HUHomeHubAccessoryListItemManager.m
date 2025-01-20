@interface HUHomeHubAccessoryListItemManager
- (HUHomeHubAccessoryListItemManager)initWithAccessories:(id)a3 delegate:(id)a4;
- (HUHomeHubAccessoryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSSet)accessories;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemForAccessory:(id)a3;
- (void)setAccessories:(id)a3;
@end

@implementation HUHomeHubAccessoryListItemManager

- (HUHomeHubAccessoryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithAccessories_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeHubAccessoryListItemManager.m", 25, @"%s is unavailable; use %@ instead",
    "-[HUHomeHubAccessoryListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubAccessoryListItemManager)initWithAccessories:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubAccessoryListItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a4 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_accessories, a3);
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(HUHomeHubAccessoryListItemManager *)self accessories];
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubAccessoryListItemManager _buildItemProvidersForHome:]";
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s accessories: %@.", buf, 0x16u);
  }
  v6 = [(HUHomeHubAccessoryListItemManager *)self accessories];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HUHomeHubAccessoryListItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E638DAB0;
  v11[4] = self;
  id v7 = objc_msgSend(v6, "na_map:", v11);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v7];
  v12 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  return v9;
}

uint64_t __64__HUHomeHubAccessoryListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _itemForAccessory:a2];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(HUHomeHubAccessoryListItemManager *)self accessories];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_166);

  v8 = [v7 allObjects];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_15_2];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v16[3] = &unk_1E638D8C8;
  id v17 = v7;
  id v18 = v4;
  id v10 = v5;
  id v19 = v10;
  id v11 = v4;
  id v12 = v7;
  objc_msgSend(v9, "na_each:", v16);
  v13 = v19;
  id v14 = v10;

  return v14;
}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 home];
}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v5 name];
  id v7 = [v4 name];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [v5 uniqueIdentifier];

    [v4 uniqueIdentifier];
  }
  else
  {
    v9 = [v5 name];

    [v4 name];
  id v10 = };
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

void __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  v6 = [v3 uniqueIdentifier];
  id v7 = [v6 UUIDString];
  int v8 = (void *)[v5 initWithIdentifier:v7];

  if ((unint64_t)[*(id *)(a1 + 32) count] <= 1)
  {
    [v8 setHeaderTitle:0];
  }
  else
  {
    v9 = objc_msgSend(v3, "hf_displayName");
    [v8 setHeaderTitle:v9];
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
  id v17 = &unk_1E6389D10;
  id v18 = v3;
  id v19 = v4;
  id v11 = v4;
  id v12 = v3;
  objc_msgSend(v10, "na_each:", &v14);
  v13 = objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_20_2, v14, v15, v16, v17);
  [v8 setItems:v13];
  [*(id *)(a1 + 48) addObject:v8];
}

void __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B18]];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v4 == v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  int v8 = [v4 latestResults];

  v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

- (id)_itemForAccessory:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_msgSend(v3, "hf_displayName");
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F68AB8]);

  uint64_t v6 = [v3 home];
  id v7 = [v6 uniqueIdentifier];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68B18]);

  int v8 = (void *)MEMORY[0x1E4F692A8];
  v9 = [v3 mediaProfile];
  LODWORD(v8) = [v8 isHomePodMini:v9];

  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v11 = *MEMORY[0x1E4F68D20];
LABEL_5:
    uint64_t v15 = [v10 systemImageNamed:v11];
    v16 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
    id v17 = [v15 imageWithTintColor:v16];
    objc_msgSend(v4, "na_safeSetObject:forKey:", v17, *MEMORY[0x1E4F689F8]);

    goto LABEL_7;
  }
  id v12 = (void *)MEMORY[0x1E4F692A8];
  v13 = [v3 mediaProfile];
  LODWORD(v12) = [v12 isHomePodOriginal:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F42A80];
  if (v12)
  {
    uint64_t v11 = *MEMORY[0x1E4F68D28];
    uint64_t v10 = (void *)MEMORY[0x1E4F42A80];
    goto LABEL_5;
  }
  uint64_t v15 = [v3 device];
  v16 = objc_msgSend(v14, "hu_symbolFromProductPlatform:", v15);
  objc_msgSend(v4, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E4F689F8]);
LABEL_7:

  id v18 = objc_alloc(MEMORY[0x1E4F695C0]);
  id v19 = (void *)[v4 copy];
  v20 = (void *)[v18 initWithResults:v19];

  return v20;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end