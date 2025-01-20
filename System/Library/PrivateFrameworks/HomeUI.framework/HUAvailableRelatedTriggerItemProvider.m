@interface HUAvailableRelatedTriggerItemProvider
- (BOOL)relatedItemsAffectedByTrigger:(id)a3;
- (HMHome)home;
- (HRERecommendationItemProvider)recommendationItemProvider;
- (HUAvailableRelatedTriggerItemModuleContextProviding)context;
- (HUAvailableRelatedTriggerItemProvider)initWithHome:(id)a3 relatedItems:(id)a4 context:(id)a5;
- (HUTriggerItemProvider)relatedActiveTriggerItemProvider;
- (NSArray)relatedItems;
- (NSMutableSet)triggerItems;
- (NSMutableSet)updatesDisabledReasons;
- (NSSet)itemProviders;
- (id)invalidationReasons;
- (id)itemsToHideInSet:(id)a3;
- (id)recommendationsFilter;
- (id)reloadAvailableTriggerItemsWithObjects:(id)a3;
- (id)reloadItems;
- (id)triggerFilter;
- (void)_buildProviders;
- (void)disableUpdatesWithReason:(id)a3;
- (void)endDisableUpdatesWithReason:(id)a3;
- (void)setRecommendationItemProvider:(id)a3;
- (void)setRecommendationsFilter:(id)a3;
- (void)setRelatedActiveTriggerItemProvider:(id)a3;
- (void)setTriggerFilter:(id)a3;
- (void)setTriggerItems:(id)a3;
- (void)setUpdatesDisabledReasons:(id)a3;
@end

@implementation HUAvailableRelatedTriggerItemProvider

- (HUAvailableRelatedTriggerItemProvider)initWithHome:(id)a3 relatedItems:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUAvailableRelatedTriggerItemProvider;
  v12 = [(HFItemProvider *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_relatedItems, a4);
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_context, a5);
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    triggerItems = v13->_triggerItems;
    v13->_triggerItems = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    updatesDisabledReasons = v13->_updatesDisabledReasons;
    v13->_updatesDisabledReasons = (NSMutableSet *)v16;

    [(HUAvailableRelatedTriggerItemProvider *)v13 _buildProviders];
  }

  return v13;
}

- (void)_buildProviders
{
  v3 = [HUTriggerItemProvider alloc];
  v4 = [(HUAvailableRelatedTriggerItemProvider *)self home];
  v5 = [(HUTriggerItemProvider *)v3 initWithHome:v4];
  [(HUAvailableRelatedTriggerItemProvider *)self setRelatedActiveTriggerItemProvider:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F6A300]);
  v7 = [(HUAvailableRelatedTriggerItemProvider *)self home];
  v8 = [(HUAvailableRelatedTriggerItemProvider *)self relatedItems];
  id v9 = (void *)[v6 initWithHome:v7 andServiceLikeItems:v8];
  [(HUAvailableRelatedTriggerItemProvider *)self setRecommendationItemProvider:v9];

  id v12 = [(HUAvailableRelatedTriggerItemProvider *)self context];
  uint64_t v10 = [v12 engineOptions] | 0x80;
  id v11 = [(HUAvailableRelatedTriggerItemProvider *)self recommendationItemProvider];
  [v11 setEngineOptions:v10];
}

- (void)setTriggerFilter:(id)a3
{
  id v4 = a3;
  v5 = _Block_copy(v4);
  id triggerFilter = self->_triggerFilter;
  self->_id triggerFilter = v5;

  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HUAvailableRelatedTriggerItemProvider_setTriggerFilter___block_invoke;
    v9[3] = &unk_1E6390D40;
    id v10 = v4;
    v7 = [(HUAvailableRelatedTriggerItemProvider *)self relatedActiveTriggerItemProvider];
    [v7 setFilter:v9];
  }
  else
  {
    v8 = [(HUAvailableRelatedTriggerItemProvider *)self relatedActiveTriggerItemProvider];
    [v8 setFilter:0];
  }
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_setTriggerFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setRecommendationsFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self recommendationItemProvider];
  [v5 setFilter:v4];
}

- (id)recommendationsFilter
{
  v2 = [(HUAvailableRelatedTriggerItemProvider *)self recommendationItemProvider];
  id v3 = [v2 filter];

  return v3;
}

- (NSSet)itemProviders
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUAvailableRelatedTriggerItemProvider *)self recommendationItemProvider];
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self relatedActiveTriggerItemProvider];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return (NSSet *)v6;
}

- (id)reloadItems
{
  id v3 = [(HUAvailableRelatedTriggerItemProvider *)self updatesDisabledReasons];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F7A0D8];
    id v6 = objc_alloc(MEMORY[0x1E4F69210]);
    uint64_t v7 = [(HUAvailableRelatedTriggerItemProvider *)self triggerItems];
    v8 = (void *)[v6 initWithAddedItems:0 removedItems:0 existingItems:v7];
    id v9 = [v5 futureWithResult:v8];
  }
  else
  {
    id v10 = [(HUAvailableRelatedTriggerItemProvider *)self itemProviders];
    id v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_250);

    id v12 = (void *)MEMORY[0x1E4F7A0D8];
    v13 = [v11 allObjects];
    uint64_t v14 = [v12 combineAllFutures:v13];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_2;
    v18[3] = &unk_1E6385620;
    v18[4] = self;
    v15 = [v14 flatMap:v18];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_7;
    v17[3] = &unk_1E6385B10;
    v17[4] = self;
    id v9 = [v15 flatMap:v17];
  }

  return v9;
}

uint64_t __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadItems];
}

id __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_3;
  v15[3] = &unk_1E6390D88;
  id v16 = v5;
  id v17 = v4;
  id v18 = v6;
  id v7 = v6;
  id v8 = v4;
  id v9 = v5;
  objc_msgSend(v3, "na_each:", v15);
  id v10 = *(void **)(a1 + 32);
  id v11 = [v8 setByAddingObjectsFromSet:v9];
  id v12 = [v11 allObjects];
  v13 = [v10 reloadAvailableTriggerItemsWithObjects:v12];

  return v13;
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 existingItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E63889F8;
  id v12 = a1[4];
  objc_msgSend(v4, "na_each:", v11);

  id v5 = [v3 addedItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_5;
  v9[3] = &unk_1E63889F8;
  id v10 = a1[5];
  objc_msgSend(v5, "na_each:", v9);

  id v6 = [v3 removedItems];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_6;
  v7[3] = &unk_1E63889F8;
  id v8 = a1[6];
  objc_msgSend(v6, "na_each:", v7);
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  if ([v6 conformsToProtocol:&unk_1F1A929F0]) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  if ([v6 conformsToProtocol:&unk_1F1A929F0]) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  if ([v6 conformsToProtocol:&unk_1F1A929F0]) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);
}

id __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 defaultActiveValue];

  if (v5)
  {
    id v6 = [v3 addedItems];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_8;
    v13[3] = &unk_1E6390DB0;
    v13[4] = *(void *)(a1 + 32);
    objc_msgSend(v6, "na_each:", v13);
  }
  id v7 = [*(id *)(a1 + 32) triggerItems];
  id v8 = [v3 addedItems];
  [v7 unionSet:v8];

  id v9 = [*(id *)(a1 + 32) triggerItems];
  id v10 = [v3 removedItems];
  [v9 minusSet:v10];

  id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v11;
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 context];
  uint64_t v4 = [v5 defaultActiveValue];
  objc_msgSend(v3, "setActive:", objc_msgSend(v4, "BOOLValue"));
}

- (id)itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self triggerItems];
  id v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);

  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = objc_msgSend(v6, "na_filter:", &__block_literal_global_64_1);
  id v9 = [(HUAvailableRelatedTriggerItemProvider *)self triggerItems];
  id v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_66_5);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_3;
  v23[3] = &unk_1E6390DF8;
  v23[4] = self;
  id v11 = objc_msgSend(v8, "na_filter:", v23);
  [v7 unionSet:v11];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_4;
  v22[3] = &unk_1E6390E20;
  v22[4] = self;
  id v12 = objc_msgSend(v10, "na_dictionaryWithKeyGenerator:", v22);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_5;
  objc_super v19 = &unk_1E6390E48;
  v20 = self;
  id v21 = v12;
  id v13 = v12;
  uint64_t v14 = objc_msgSend(v8, "na_filter:", &v16);
  objc_msgSend(v7, "unionSet:", v14, v16, v17, v18, v19, v20);

  return v7;
}

BOOL __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 triggerItem];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 recommendationItem];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 trigger];
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 32) relatedItemsAffectedByTrigger:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_4(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 trigger];
  uint64_t v4 = [*(id *)(a1 + 32) home];
  id v5 = objc_msgSend(v3, "hre_triggerComparisonIdentifierInHome:", v4);

  return v5;
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 triggerItem];

  if (v4
    && ([v3 trigger],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEnabled],
        v5,
        v6))
  {
    id v7 = [v3 trigger];
    id v8 = [*(id *)(a1 + 32) home];
    id v9 = objc_msgSend(v7, "hre_triggerComparisonIdentifierInHome:", v8);

    id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    id v11 = [v10 recommendationItem];
    id v12 = [v11 recommendation];

    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F696C0];
    uint64_t v17 = [v3 trigger];
    id v18 = [*(id *)(a1 + 32) home];
    objc_super v19 = objc_alloc_init(HUTriggerBuilderContext);
    v20 = [v16 triggerBuilderForTrigger:v17 inHome:v18 context:v19];

    id v21 = [v15 compareForMatchingToTrigger:v20];
    v22 = v21;
    if (v21) {
      uint64_t v23 = [v21 hasNoDifferencesHigherThanPriority:0];
    }
    else {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (BOOL)relatedItemsAffectedByTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self relatedItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HUAvailableRelatedTriggerItemProvider_relatedItemsAffectedByTrigger___block_invoke;
  v9[3] = &unk_1E6390E70;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __71__HUAvailableRelatedTriggerItemProvider_relatedItemsAffectedByTrigger___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 homeKitObject];
  uint64_t v4 = objc_msgSend(v2, "hf_affectsHomeKitObject:", v3);

  return v4;
}

- (id)reloadAvailableTriggerItemsWithObjects:(id)a3
{
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_3;
  v6[3] = &unk_1E6390ED8;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_4;
  v5[3] = &unk_1E6390F00;
  id v3 = [(HFItemProvider *)self reloadItemsWithObjects:a3 keyAdaptor:&__block_literal_global_74_1 itemAdaptor:&__block_literal_global_76_3 filter:v6 itemMap:v5];

  return v3;
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v3 trigger];
    uint64_t v6 = [v4 relatedItemsAffectedByTrigger:v5];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

HUAvailableTriggerItem *__80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HUAvailableTriggerItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  uint64_t v6 = [*(id *)(a1 + 32) relatedItems];
  char v7 = [(HUAvailableTriggerItem *)v4 initWithHome:v5 containingItem:v3 relatedToServiceLikeItems:v6];

  return v7;
}

- (id)invalidationReasons
{
  v8.receiver = self;
  v8.super_class = (Class)HUAvailableRelatedTriggerItemProvider;
  id v3 = [(HFItemProvider *)&v8 invalidationReasons];
  uint64_t v4 = [(HUAvailableRelatedTriggerItemProvider *)self itemProviders];
  id v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_85_2);
  uint64_t v6 = [v3 setByAddingObjectsFromSet:v5];

  return v6;
}

uint64_t __60__HUAvailableRelatedTriggerItemProvider_invalidationReasons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidationReasons];
}

- (void)disableUpdatesWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self updatesDisabledReasons];
  [v5 addObject:v4];
}

- (void)endDisableUpdatesWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemProvider *)self updatesDisabledReasons];
  [v5 removeObject:v4];
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)relatedItems
{
  return self->_relatedItems;
}

- (id)triggerFilter
{
  return self->_triggerFilter;
}

- (HUAvailableRelatedTriggerItemModuleContextProviding)context
{
  return self->_context;
}

- (HRERecommendationItemProvider)recommendationItemProvider
{
  return self->_recommendationItemProvider;
}

- (void)setRecommendationItemProvider:(id)a3
{
}

- (HUTriggerItemProvider)relatedActiveTriggerItemProvider
{
  return self->_relatedActiveTriggerItemProvider;
}

- (void)setRelatedActiveTriggerItemProvider:(id)a3
{
}

- (NSMutableSet)triggerItems
{
  return self->_triggerItems;
}

- (void)setTriggerItems:(id)a3
{
}

- (NSMutableSet)updatesDisabledReasons
{
  return self->_updatesDisabledReasons;
}

- (void)setUpdatesDisabledReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatesDisabledReasons, 0);
  objc_storeStrong((id *)&self->_triggerItems, 0);
  objc_storeStrong((id *)&self->_relatedActiveTriggerItemProvider, 0);
  objc_storeStrong((id *)&self->_recommendationItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_triggerFilter, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end