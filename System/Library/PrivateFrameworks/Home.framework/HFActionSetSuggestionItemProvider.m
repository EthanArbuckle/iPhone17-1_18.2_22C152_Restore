@interface HFActionSetSuggestionItemProvider
- (BOOL)hasProvidedStaticSuggestionItems;
- (BOOL)includeCustomActionSets;
- (BOOL)includeExistingActionSets;
- (BOOL)persistAddedSuggestions;
- (HFActionSetSuggestionItemProvider)initWithHome:(id)a3;
- (HFServiceLikeItem)serviceLikeItem;
- (HMHome)home;
- (NSSet)customSuggestionItems;
- (NSSet)staticSuggestionItems;
- (id)_builtInActionSetOfType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)items;
- (id)reloadItems;
- (void)setCustomSuggestionItems:(id)a3;
- (void)setHasProvidedStaticSuggestionItems:(BOOL)a3;
- (void)setIncludeCustomActionSets:(BOOL)a3;
- (void)setIncludeExistingActionSets:(BOOL)a3;
- (void)setPersistAddedSuggestions:(BOOL)a3;
- (void)setServiceLikeItem:(id)a3;
- (void)setStaticSuggestionItems:(id)a3;
@end

@implementation HFActionSetSuggestionItemProvider

- (HFActionSetSuggestionItemProvider)initWithHome:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFActionSetSuggestionItemProvider;
  v6 = [(HFItemProvider *)&v26 init];
  v7 = v6;
  if (v6)
  {
    id v21 = v5;
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = [MEMORY[0x263EFF9C0] set];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = +[HFActionSetSuggestionVendor supportedBuiltInActionSetTypes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v15 = [(HFActionSetSuggestionItemProvider *)v7 _builtInActionSetOfType:v14];
          if (v15)
          {
            v16 = [HFActionSetSuggestionItem alloc];
            v17 = [(HFActionSetSuggestionItemProvider *)v7 home];
            v18 = [(HFActionSetSuggestionItem *)v16 initWithHome:v17 actionSet:v15];

            [v18 setIncludeExistingActionSets:[(HFActionSetSuggestionItemProvider *)v7 includeExistingActionSets]];
            [v18 setPersistAddedSuggestions:[(HFActionSetSuggestionItemProvider *)v7 persistAddedSuggestions]];
            [v8 addObject:v18];
          }
          else
          {
            v18 = HFLogForCategory(0x2AuLL);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = [(HFActionSetSuggestionItemProvider *)v7 home];
              *(_DWORD *)buf = 138412546;
              uint64_t v28 = v14;
              __int16 v29 = 2112;
              v30 = v19;
              _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "No action set found for builtin type %@ in home %@", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v11);
    }

    [(HFActionSetSuggestionItemProvider *)v7 setStaticSuggestionItems:v8];
    id v5 = v21;
  }

  return v7;
}

- (void)setIncludeExistingActionSets:(BOOL)a3
{
  self->_includeExistingActionSets = a3;
  v4 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__HFActionSetSuggestionItemProvider_setIncludeExistingActionSets___block_invoke;
  v5[3] = &__block_descriptor_33_e35_v16__0__HFActionSetSuggestionItem_8l;
  BOOL v6 = a3;
  objc_msgSend(v4, "na_each:", v5);
}

uint64_t __66__HFActionSetSuggestionItemProvider_setIncludeExistingActionSets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIncludeExistingActionSets:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  self->_persistAddedSuggestions = a3;
  v4 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__HFActionSetSuggestionItemProvider_setPersistAddedSuggestions___block_invoke;
  v5[3] = &__block_descriptor_33_e35_v16__0__HFActionSetSuggestionItem_8l;
  BOOL v6 = a3;
  objc_msgSend(v4, "na_each:", v5);
}

uint64_t __64__HFActionSetSuggestionItemProvider_setPersistAddedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersistAddedSuggestions:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setServiceLikeItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceLikeItem, a3);
  BOOL v6 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HFActionSetSuggestionItemProvider_setServiceLikeItem___block_invoke;
  v8[3] = &unk_264091D98;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "na_each:", v8);
}

uint64_t __56__HFActionSetSuggestionItemProvider_setServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setServiceLikeItem:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFActionSetSuggestionItemProvider *)self home];
  BOOL v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)_builtInActionSetOfType:(id)a3
{
  id v4 = a3;
  id v5 = [(HFActionSetSuggestionItemProvider *)self home];
  BOOL v6 = [v5 actionSets];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HFActionSetSuggestionItemProvider__builtInActionSetOfType___block_invoke;
  v10[3] = &unk_26408E348;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __61__HFActionSetSuggestionItemProvider__builtInActionSetOfType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 actionSetType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)reloadItems
{
  if ([(HFActionSetSuggestionItemProvider *)self hasProvidedStaticSuggestionItems])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  }
  if ([(HFActionSetSuggestionItemProvider *)self hasProvidedStaticSuggestionItems])
  {
    uint64_t v4 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(HFActionSetSuggestionItemProvider *)self setHasProvidedStaticSuggestionItems:1];
  id v5 = [(HFActionSetSuggestionItemProvider *)self home];
  BOOL v6 = [v5 actionSets];
  v15[4] = self;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke;
  v16[3] = &unk_264091DC0;
  v16[4] = self;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_2;
  v15[3] = &unk_26408F990;
  id v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v6 filter:v16 itemMap:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_264091DE8;
  v12[4] = self;
  id v13 = v3;
  id v14 = v4;
  id v8 = v4;
  id v9 = v3;
  uint64_t v10 = [v7 flatMap:v12];

  return v10;
}

uint64_t __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if ([*(id *)(a1 + 32) includeCustomActionSets])
  {
    id v7 = [v6 actionSetType];
    uint64_t v8 = [v7 isEqualToString:*MEMORY[0x263F0B958]];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

HFActionSetSuggestionItem *__48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [HFActionSetSuggestionItem alloc];
  uint64_t v8 = [*(id *)(a1 + 32) home];
  id v9 = [(HFActionSetSuggestionItem *)v7 initWithHome:v8 actionSet:v6];

  uint64_t v10 = [*(id *)(a1 + 32) serviceLikeItem];
  [(HFActionSetSuggestionItem *)v9 setServiceLikeItem:v10];

  -[HFActionSetSuggestionItem setIncludeExistingActionSets:](v9, "setIncludeExistingActionSets:", [*(id *)(a1 + 32) includeExistingActionSets]);
  -[HFActionSetSuggestionItem setPersistAddedSuggestions:](v9, "setPersistAddedSuggestions:", [*(id *)(a1 + 32) persistAddedSuggestions]);

  return v9;
}

id __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 allItems];
  [*(id *)(a1 + 32) setCustomSuggestionItems:v4];

  id v5 = [[HFItemProviderReloadResults alloc] initWithAddedItems:*(void *)(a1 + 40) removedItems:0 existingItems:*(void *)(a1 + 48)];
  id v6 = (void *)MEMORY[0x263F58190];
  id v7 = [(HFItemProviderReloadResults *)v5 resultsByMergingWithResults:v3];

  uint64_t v8 = [v6 futureWithResult:v7];

  return v8;
}

- (id)items
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(HFActionSetSuggestionItemProvider *)self staticSuggestionItems];
  if (v4)
  {
    [v3 unionSet:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
    [v3 unionSet:v5];
  }
  id v6 = [(HFActionSetSuggestionItemProvider *)self customSuggestionItems];
  if (v6)
  {
    [v3 unionSet:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA08] set];
    [v3 unionSet:v7];
  }
  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (BOOL)includeExistingActionSets
{
  return self->_includeExistingActionSets;
}

- (BOOL)includeCustomActionSets
{
  return self->_includeCustomActionSets;
}

- (void)setIncludeCustomActionSets:(BOOL)a3
{
  self->_includeCustomActionSets = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (NSSet)staticSuggestionItems
{
  return self->_staticSuggestionItems;
}

- (void)setStaticSuggestionItems:(id)a3
{
}

- (NSSet)customSuggestionItems
{
  return self->_customSuggestionItems;
}

- (void)setCustomSuggestionItems:(id)a3
{
}

- (BOOL)hasProvidedStaticSuggestionItems
{
  return self->_hasProvidedStaticSuggestionItems;
}

- (void)setHasProvidedStaticSuggestionItems:(BOOL)a3
{
  self->_hasProvidedStaticSuggestionItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSuggestionItems, 0);
  objc_storeStrong((id *)&self->_staticSuggestionItems, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end