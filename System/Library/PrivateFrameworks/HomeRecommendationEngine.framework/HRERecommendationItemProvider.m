@interface HRERecommendationItemProvider
+ (id)_highestRankRecommendations:(id)a3 forKeyGenerator:(id)a4;
+ (id)filterRecommendations:(id)a3;
- (BOOL)firstUpdateComplete;
- (BOOL)updatesDisabled;
- (HFAccessoryTypeGroup)accessoryTypeGroup;
- (HMHome)home;
- (HRERecommendationEngine)recommendationEngine;
- (HRERecommendationItemProvider)init;
- (HRERecommendationItemProvider)initWithHome:(id)a3 andAccessoryTypeGroup:(id)a4;
- (HRERecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4;
- (NSArray)serviceLikeItems;
- (NSMutableSet)recommendationItems;
- (id)configureBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (id)reloadItemsWithRecommendations:(id)a3 filter:(id)a4 itemMap:(id)a5;
- (unint64_t)engineOptions;
- (void)setConfigureBlock:(id)a3;
- (void)setEngineOptions:(unint64_t)a3;
- (void)setFilter:(id)a3;
- (void)setFirstUpdateComplete:(BOOL)a3;
- (void)setRecommendationEngine:(id)a3;
- (void)setRecommendationItems:(id)a3;
- (void)setUpdatesDisabled:(BOOL)a3;
@end

@implementation HRERecommendationItemProvider

- (HRERecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HRERecommendationItemProvider;
  v9 = [(HFItemProvider *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeItems, a4);
    accessoryTypeGroup = v10->_accessoryTypeGroup;
    v10->_accessoryTypeGroup = 0;

    uint64_t v12 = objc_opt_new();
    recommendationItems = v10->_recommendationItems;
    v10->_recommendationItems = (NSMutableSet *)v12;

    v14 = objc_alloc_init(HRERecommendationEngine);
    recommendationEngine = v10->_recommendationEngine;
    v10->_recommendationEngine = v14;

    v10->_updatesDisabled = 0;
    v10->_engineOptions = 83;
    v10->_firstUpdateComplete = 0;
  }

  return v10;
}

- (HRERecommendationItemProvider)initWithHome:(id)a3 andAccessoryTypeGroup:(id)a4
{
  id v7 = a4;
  id v8 = [(HRERecommendationItemProvider *)self initWithHome:a3 andServiceLikeItems:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_accessoryTypeGroup, a4);
  }

  return v9;
}

- (HRERecommendationItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HRERecommendationItemProvider.m", 52, @"%s is unavailable; use %@ instead",
    "-[HRERecommendationItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HRERecommendationItemProvider *)self home];
  v6 = [(HRERecommendationItemProvider *)self serviceLikeItems];
  id v7 = (void *)[v4 initWithHome:v5 andServiceLikeItems:v6];

  objc_msgSend(v7, "setEngineOptions:", -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
  id v8 = [(HRERecommendationItemProvider *)self filter];
  [v7 setFilter:v8];

  return v7;
}

- (id)reloadItems
{
  if ([(HRERecommendationItemProvider *)self updatesDisabled])
  {
    v3 = (void *)MEMORY[0x263F58190];
    id v4 = objc_alloc(MEMORY[0x263F47B80]);
    v5 = [(HRERecommendationItemProvider *)self items];
    v6 = (void *)[v4 initWithAddedItems:0 removedItems:0 existingItems:v5];
    id v7 = [v3 futureWithResult:v6];
  }
  else
  {
    id v8 = [(HRERecommendationItemProvider *)self accessoryTypeGroup];
    v9 = [(HRERecommendationItemProvider *)self recommendationEngine];
    if (v8)
    {
      v10 = [(HRERecommendationItemProvider *)self accessoryTypeGroup];
      v11 = [(HRERecommendationItemProvider *)self home];
      objc_msgSend(v9, "recommendationsForAccessoryTypeGroup:inHome:options:", v10, v11, -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
    }
    else
    {
      v10 = [(HRERecommendationItemProvider *)self serviceLikeItems];
      v11 = [(HRERecommendationItemProvider *)self home];
      objc_msgSend(v9, "generateRecommendationsForServiceLikeItems:inHome:options:", v10, v11, -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
    uint64_t v12 = };

    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke;
    v17[3] = &unk_264CF4740;
    objc_copyWeak(&v18, &location);
    v13 = [v12 flatMap:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_7;
    v15[3] = &unk_264CF4768;
    objc_copyWeak(&v16, &location);
    id v7 = [v13 flatMap:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __44__HRERecommendationItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_2;
  v17[3] = &unk_264CF3F88;
  void v17[4] = WeakRetained;
  v5 = objc_msgSend(v3, "na_filter:", v17);
  v6 = [(id)objc_opt_class() filterRecommendations:v5];

  id v7 = objc_msgSend(v3, "na_dictionaryWithKeyGenerator:", &__block_literal_global_13);

  id v8 = [WeakRetained recommendationItems];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __44__HRERecommendationItemProvider_reloadItems__block_invoke_4;
  v15 = &unk_264CF46F8;
  id v16 = v7;
  id v9 = v7;
  objc_msgSend(v8, "na_each:", &v12);

  v10 = objc_msgSend(WeakRetained, "reloadItemsWithRecommendations:filter:itemMap:", v6, &__block_literal_global_14_1, &__block_literal_global_17_0, v12, v13, v14, v15);

  return v10;
}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) filter];
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) filter];
    uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v3);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __44__HRERecommendationItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  v5 = [v3 recommendation];
  uint64_t v6 = [v5 uniqueIdentifier];
  id v7 = [v4 objectForKeyedSubscript:v6];

  if (v7) {
    [v8 setRecommendation:v7];
  }
}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_5()
{
  return 1;
}

HRERecommendationItem *__44__HRERecommendationItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HRERecommendationItem alloc] initWithRecommendation:v2];

  return v3;
}

id __44__HRERecommendationItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained recommendationItems];
  uint64_t v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained recommendationItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  [WeakRetained setFirstUpdateComplete:1];
  id v9 = [WeakRetained configureBlock];

  if (v9)
  {
    v10 = [v3 addedItems];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_8;
    v13[3] = &unk_264CF46F8;
    v13[4] = WeakRetained;
    objc_msgSend(v10, "na_each:", v13);
  }
  v11 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v11;
}

void __44__HRERecommendationItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 configureBlock];
  v4[2](v4, v3);
}

- (id)reloadItemsWithRecommendations:(id)a3 filter:(id)a4 itemMap:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke_2;
  v7[3] = &unk_264CF4790;
  v7[4] = self;
  v7[5] = a2;
  v5 = [(HFItemProvider *)self reloadItemsWithObjects:a3 keyAdaptor:&__block_literal_global_22_1 itemAdaptor:v7 filter:a4 itemMap:a5];

  return v5;
}

uint64_t __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

id __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HRERecommendationItemProvider.m" lineNumber:118 description:@"HRERecommendationItemProvider expects all existing items to be recommendation items"];
  }
  id v4 = [v3 recommendation];
  v5 = [v4 uniqueIdentifier];

  return v5;
}

- (id)items
{
  id v2 = [(HRERecommendationItemProvider *)self recommendationItems];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)invalidationReasons
{
  v11[8] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HRERecommendationItemProvider;
  id v2 = [(HFItemProvider *)&v10 invalidationReasons];
  uint64_t v3 = *MEMORY[0x263F479B8];
  v11[0] = *MEMORY[0x263F479D8];
  v11[1] = v3;
  uint64_t v4 = *MEMORY[0x263F479D0];
  v11[2] = *MEMORY[0x263F479C8];
  v11[3] = v4;
  uint64_t v5 = *MEMORY[0x263F479B0];
  v11[4] = *MEMORY[0x263F479E8];
  v11[5] = v5;
  uint64_t v6 = *MEMORY[0x263F479E0];
  v11[6] = *MEMORY[0x263F479C0];
  v11[7] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:8];
  id v8 = [v2 setByAddingObjectsFromArray:v7];

  return v8;
}

+ (id)filterRecommendations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_31_0);

    uint64_t v6 = [a1 _highestRankRecommendations:v5 forKeyGenerator:&__block_literal_global_35];

    id v7 = [a1 _highestRankRecommendations:v6 forKeyGenerator:&__block_literal_global_37_0];

    id v8 = [a1 _highestRankRecommendations:v7 forKeyGenerator:&__block_literal_global_40_0];

    id v9 = v8;
    id v4 = v9;
  }
  else
  {
    id v9 = (id)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __55__HRERecommendationItemProvider_filterRecommendations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 home];
    uint64_t v4 = objc_msgSend(v3, "hf_hasEnabledResident");
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 selectedTriggerBuilder];
  id v7 = [v6 trigger];
  id v8 = [v7 uniqueIdentifier];
  id v9 = [v8 UUIDString];

  return v9;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 selectedActionSetBuilder];
  id v7 = [v6 actionSet];
  id v8 = [v7 uniqueIdentifier];
  id v9 = [v8 UUIDString];

  return v9;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 selectedActionSetBuilder];
  id v7 = [v6 actionSet];

  if (v7)
  {
    id v8 = [v7 name];
  }
  else
  {
    id v9 = [v5 selectedActionSetBuilder];
    id v8 = [v9 name];
  }

  return v8;
}

+ (id)_highestRankRecommendations:(id)a3 forKeyGenerator:(id)a4
{
  id v5 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke;
  v14[3] = &unk_264CF47D8;
  id v15 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v14);
  id v8 = [v7 allKeys];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke_2;
  v12[3] = &unk_264CF4800;
  id v13 = v7;
  id v9 = v7;
  objc_super v10 = objc_msgSend(v8, "na_flatMap:", v12);

  return v10;
}

__CFString *__77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = @"(null)";
  }

  return v3;
}

id __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqual:@"(null)"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

    id v7 = [v5 setWithArray:v6];
    id v8 = +[HRERecommendation highestRankInRecommendations:v7];
    uint64_t v4 = [v8 allObjects];

    id v3 = (id)v6;
  }

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  return self->_accessoryTypeGroup;
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (void)setEngineOptions:(unint64_t)a3
{
  self->_engineOptions = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (void)setConfigureBlock:(id)a3
{
}

- (BOOL)firstUpdateComplete
{
  return self->_firstUpdateComplete;
}

- (void)setFirstUpdateComplete:(BOOL)a3
{
  self->_firstUpdateComplete = a3;
}

- (BOOL)updatesDisabled
{
  return self->_updatesDisabled;
}

- (void)setUpdatesDisabled:(BOOL)a3
{
  self->_updatesDisabled = a3;
}

- (HRERecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
}

- (NSMutableSet)recommendationItems
{
  return self->_recommendationItems;
}

- (void)setRecommendationItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationItems, 0);
  objc_storeStrong((id *)&self->_recommendationEngine, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_accessoryTypeGroup, 0);
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end