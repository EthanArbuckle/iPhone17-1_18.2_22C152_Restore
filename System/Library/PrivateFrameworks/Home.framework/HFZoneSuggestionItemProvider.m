@interface HFZoneSuggestionItemProvider
- (HFZoneSuggestionItemProvider)init;
- (HFZoneSuggestionItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)zoneBuilderItems;
- (id)_zoneSuggestions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setZoneBuilderItems:(id)a3;
@end

@implementation HFZoneSuggestionItemProvider

- (HFZoneSuggestionItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFZoneSuggestionItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    zoneBuilderItems = v7->_zoneBuilderItems;
    v7->_zoneBuilderItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFZoneSuggestionItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFZoneSuggestionItemProvider.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFZoneSuggestionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFZoneSuggestionItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_264098DE8;
  objc_copyWeak(&v21, &location);
  v3 = _Block_copy(aBlock);
  id v4 = [(HFZoneSuggestionItemProvider *)self _zoneSuggestions];
  id v5 = [v4 allObjects];

  v6 = [(HFZoneSuggestionItemProvider *)self home];
  v7 = [v6 zones];
  uint64_t v8 = [v7 count];

  unint64_t v9 = [v5 count];
  if (v9 >= 2) {
    unint64_t v10 = 2;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v8)
  {
    if (v8 == 1) {
      --v10;
    }
    else {
      unint64_t v10 = 0;
    }
  }
  objc_super v11 = [v5 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  v12 = v11;
  if (v10)
  {
    if ([v11 count] <= v10) {
      goto LABEL_13;
    }
    uint64_t v13 = objc_msgSend(v12, "subarrayWithRange:", 0, v10);
  }
  else
  {
    uint64_t v13 = MEMORY[0x263EFFA68];
  }

  v12 = (void *)v13;
LABEL_13:
  v14 = [(HFZoneSuggestionItemProvider *)self filter];
  v15 = [(HFItemProvider *)self reloadItemsWithObjects:v12 keyAdaptor:&__block_literal_global_175 itemAdaptor:&__block_literal_global_15_7 filter:v14 itemMap:v3];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_4;
  v18[3] = &unk_26408D198;
  objc_copyWeak(&v19, &location);
  v16 = [v15 flatMap:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v16;
}

HFZoneBuilderItem *__43__HFZoneSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [HFZoneBuilder alloc];
  v6 = [WeakRetained home];
  v7 = [(HFItemBuilder *)v5 initWithHome:v6];

  [(HFZoneBuilder *)v7 setName:v3];
  uint64_t v8 = [[HFZoneBuilderItem alloc] initWithZoneBuilder:v7];

  return v8;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 zoneBuilder];
  id v3 = [v2 name];

  return v3;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained zoneBuilderItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained zoneBuilderItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  unint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFZoneSuggestionItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"room"];

  return v3;
}

- (id)_zoneSuggestions
{
  id v2 = [(HFZoneSuggestionItemProvider *)self home];
  id v3 = [v2 zones];
  id v4 = (void *)[v3 copy];

  objc_super v5 = (void *)MEMORY[0x263EFFA08];
  v6 = _HFLocalizedStringWithDefaultValue(@"HFZoneSuggestionMainLevel", @"HFZoneSuggestionMainLevel", 1);
  v7 = _HFLocalizedStringWithDefaultValue(@"HFZoneSuggestionBasement", @"HFZoneSuggestionBasement", 1);
  uint64_t v8 = _HFLocalizedStringWithDefaultValue(@"HFZoneSuggestionOutside", @"HFZoneSuggestionOutside", 1);
  unint64_t v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke;
  v13[3] = &unk_26408D210;
  id v14 = v4;
  id v10 = v4;
  objc_super v11 = objc_msgSend(v9, "na_filter:", v13);

  return v11;
}

uint64_t __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke_2;
  v8[3] = &unk_264091F98;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

uint64_t __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [v3 uppercaseString];
  id v5 = [*(id *)(a1 + 32) uppercaseString];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)zoneBuilderItems
{
  return self->_zoneBuilderItems;
}

- (void)setZoneBuilderItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneBuilderItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end