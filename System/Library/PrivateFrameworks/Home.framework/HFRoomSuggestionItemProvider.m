@interface HFRoomSuggestionItemProvider
- (HFRoomSuggestionItemProvider)init;
- (HFRoomSuggestionItemProvider)initWithHome:(id)a3;
- (HFRoomSuggestionItemProvider)initWithHome:(id)a3 suggestionVendor:(id)a4;
- (HFRoomSuggestionVendor)suggestionVendor;
- (HMHome)home;
- (NSSet)suggestionItems;
- (NSSet)supplementaryRoomBuilders;
- (id)_filteredSuggestions;
- (id)_filteredSupplementaryRoomBuilders;
- (id)_keyForRoomName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)suggestedRoomLimit;
- (void)setSuggestedRoomLimit:(unint64_t)a3;
- (void)setSuggestionItems:(id)a3;
- (void)setSuggestionVendor:(id)a3;
- (void)setSupplementaryRoomBuilders:(id)a3;
@end

@implementation HFRoomSuggestionItemProvider

- (HFRoomSuggestionItemProvider)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = +[HFDefaultRoomSuggestionVendor homeAppSuggestionVendor];
  v6 = [(HFRoomSuggestionItemProvider *)self initWithHome:v4 suggestionVendor:v5];

  return v6;
}

- (HFRoomSuggestionItemProvider)initWithHome:(id)a3 suggestionVendor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFRoomSuggestionItemProvider;
  v9 = [(HFItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    v10->_suggestedRoomLimit = 3;
    objc_storeStrong((id *)&v10->_suggestionVendor, a4);
  }

  return v10;
}

- (HFRoomSuggestionItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFRoomSuggestionItemProvider.m", 42, @"%s is unavailable; use %@ instead",
    "-[HFRoomSuggestionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFRoomSuggestionItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFRoomSuggestionItemProvider *)self suggestionItems];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_215);

  v30 = [(HFRoomSuggestionItemProvider *)self _filteredSuggestions];
  v5 = [v30 allObjects];
  v6 = +[HFRoomSuggestion priorityComparator];
  id v7 = [v5 sortedArrayUsingComparator:v6];
  id v8 = (void *)[v7 mutableCopy];

  while (1)
  {
    unint64_t v9 = [v8 count];
    if (v9 <= [(HFRoomSuggestionItemProvider *)self suggestedRoomLimit]) {
      break;
    }
    [v8 removeLastObject];
  }
  v10 = (void *)MEMORY[0x263EFF9C0];
  v11 = objc_msgSend(v8, "na_map:", &__block_literal_global_12_11);
  objc_super v12 = [v10 setWithArray:v11];

  v13 = [(HFRoomSuggestionItemProvider *)self _filteredSupplementaryRoomBuilders];
  v14 = objc_msgSend(v13, "na_dictionaryWithKeyGenerator:", &__block_literal_global_15_11);

  v15 = [v14 allKeys];
  [v12 addObjectsFromArray:v15];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_4;
  aBlock[3] = &unk_26409B270;
  aBlock[4] = self;
  v16 = _Block_copy(aBlock);
  v17 = +[HFSetDiff diffFromSet:v4 toSet:v12];
  v18 = [v17 additions];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_6;
  v31[3] = &unk_26409B298;
  id v32 = v14;
  v33 = self;
  id v19 = v14;
  v20 = objc_msgSend(v18, "na_map:", v31);

  [v17 deletions];
  v21 = v29 = (void *)v4;
  v22 = objc_msgSend(v21, "na_map:", v16);

  v23 = [v17 updates];
  v24 = objc_msgSend(v23, "na_map:", v16);

  v25 = [v24 setByAddingObjectsFromSet:v20];
  [(HFRoomSuggestionItemProvider *)self setSuggestionItems:v25];

  v26 = [[HFItemProviderReloadResults alloc] initWithAddedItems:v20 removedItems:v22 existingItems:v24];
  v27 = [MEMORY[0x263F58190] futureWithResult:v26];

  return v27;
}

id __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 roomBuilder];
  v3 = [v2 name];

  return v3;
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) suggestionItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_26409B248;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 roomBuilder];
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

HFRoomBuilderItem *__43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = [HFRoomBuilder alloc];
    v6 = [*(id *)(a1 + 40) home];
    uint64_t v4 = [(HFItemBuilder *)v5 initWithHome:v6];

    [(HFRoomBuilder *)v4 setName:v3];
  }
  id v7 = [[HFRoomBuilderItem alloc] initWithRoomBuilder:v4];

  return v7;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFRoomSuggestionItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"room"];

  return v3;
}

- (id)_filteredSupplementaryRoomBuilders
{
  v2 = [(HFRoomSuggestionItemProvider *)self supplementaryRoomBuilders];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_27_14);

  return v3;
}

BOOL __66__HFRoomSuggestionItemProvider__filteredSupplementaryRoomBuilders__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 room];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_filteredSuggestions
{
  BOOL v3 = [(HFRoomSuggestionItemProvider *)self suggestionVendor];
  uint64_t v4 = [v3 roomSuggestions];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke;
  v7[3] = &unk_26409B328;
  v7[4] = self;
  objc_super v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v4 name];
  v6 = [v3 _keyForRoomName:v5];

  id v7 = [v4 aliases];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_2;
  v21[3] = &unk_26408DC00;
  v21[4] = *(void *)(a1 + 32);
  id v8 = objc_msgSend(v7, "na_map:", v21);

  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [*(id *)(a1 + 32) home];
  v11 = [v10 rooms];
  objc_super v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_31_5);
  v13 = [v9 setWithArray:v12];

  v14 = [*(id *)(a1 + 32) _filteredSupplementaryRoomBuilders];
  v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_33_6);
  [v13 unionSet:v15];

  if ([v13 count])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_5;
    v18[3] = &unk_26409B300;
    v18[4] = *(void *)(a1 + 32);
    id v19 = v8;
    id v20 = v6;
    uint64_t v16 = objc_msgSend(v13, "na_all:", v18);
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _keyForRoomName:a2];
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_5(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) _keyForRoomName:a2];
  id v4 = [*(id *)(a1 + 40) setByAddingObject:*(void *)(a1 + 48)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_6;
  v8[3] = &unk_26408D210;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_all:", v8);

  return v6;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsString:a2] ^ 1;
}

- (id)_keyForRoomName:(id)a3
{
  BOOL v3 = [a3 stringByApplyingTransform:@"Any-Latin; Latin-ASCII; Any-Lower" reverse:0];
  id v4 = _HFLocalizedStringWithDefaultValue(@"HFRoomSuggestionRoomKey", @"HFRoomSuggestionRoomKey", 1);
  id v5 = [v4 lowercaseString];
  uint64_t v6 = [v3 stringByReplacingOccurrencesOfString:v5 withString:&stru_26C081158];
  id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  id v9 = [v8 componentsJoinedByString:&stru_26C081158];

  return v9;
}

- (unint64_t)suggestedRoomLimit
{
  return self->_suggestedRoomLimit;
}

- (void)setSuggestedRoomLimit:(unint64_t)a3
{
  self->_suggestedRoomLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFRoomSuggestionVendor)suggestionVendor
{
  return self->_suggestionVendor;
}

- (void)setSuggestionVendor:(id)a3
{
}

- (NSSet)supplementaryRoomBuilders
{
  return self->_supplementaryRoomBuilders;
}

- (void)setSupplementaryRoomBuilders:(id)a3
{
}

- (NSSet)suggestionItems
{
  return self->_suggestionItems;
}

- (void)setSuggestionItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_supplementaryRoomBuilders, 0);
  objc_storeStrong((id *)&self->_suggestionVendor, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end