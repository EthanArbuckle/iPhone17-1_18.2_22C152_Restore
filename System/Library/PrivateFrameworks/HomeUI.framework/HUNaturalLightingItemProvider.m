@interface HUNaturalLightingItemProvider
- (HMHome)home;
- (HUNaturalLightingItemProvider)initWithHome:(id)a3;
- (NSMutableSet)naturalLightingItems;
- (NSNumber)defaultSelectedValue;
- (id)homeKitObjectFilter;
- (id)invalidationReasons;
- (id)lightProfileFilter;
- (id)reloadItems;
- (id)sourceItemForHomeKitObject:(id)a3;
- (void)setDefaultSelectedValue:(id)a3;
- (void)setHomeKitObjectFilter:(id)a3;
- (void)setLightProfileFilter:(id)a3;
- (void)setNaturalLightingItems:(id)a3;
@end

@implementation HUNaturalLightingItemProvider

- (HUNaturalLightingItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    naturalLightingItems = v7->_naturalLightingItems;
    v7->_naturalLightingItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  v3 = [(HUNaturalLightingItemProvider *)self home];
  v4 = objc_msgSend(v3, "hf_homeKitObjectsSupportingNaturalLighting");

  id v5 = [v4 allObjects];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke;
  v11[3] = &unk_1E6385F78;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E638A780;
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:v11 itemMap:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1E6385B10;
  v9[4] = self;
  v7 = [v6 flatMap:v9];

  return v7;
}

uint64_t __44__HUNaturalLightingItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) homeKitObjectFilter];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) homeKitObjectFilter];
    uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v3);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

HUNaturalLightingItem *__44__HUNaturalLightingItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) sourceItemForHomeKitObject:a2];
  if (v3)
  {
    v4 = [HUNaturalLightingItem alloc];
    id v5 = [*(id *)(a1 + 32) defaultSelectedValue];
    uint64_t v6 = -[HUNaturalLightingItem initWithSourceItem:defaultSelected:](v4, "initWithSourceItem:defaultSelected:", v3, [v5 BOOLValue]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 naturalLightingItems];
  uint64_t v6 = [v4 addedItems];
  [v5 unionSet:v6];

  v7 = [*(id *)(a1 + 32) naturalLightingItems];
  uint64_t v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (id)sourceItemForHomeKitObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F69360]);
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F69550] serviceItemForService:v7 valueSource:v4];
LABEL_11:
    v12 = (void *)v11;
    goto LABEL_12;
  }
  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F68E18]) initWithAccessory:v10 valueSource:v4];
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)invalidationReasons
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUNaturalLightingItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  id v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = *MEMORY[0x1E4F686E0];
  v8[0] = *MEMORY[0x1E4F686E8];
  v8[1] = v4;
  v8[2] = *MEMORY[0x1E4F686B0];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (id)lightProfileFilter
{
  return self->_lightProfileFilter;
}

- (void)setLightProfileFilter:(id)a3
{
}

- (id)homeKitObjectFilter
{
  return self->_homeKitObjectFilter;
}

- (void)setHomeKitObjectFilter:(id)a3
{
}

- (NSNumber)defaultSelectedValue
{
  return self->_defaultSelectedValue;
}

- (void)setDefaultSelectedValue:(id)a3
{
}

- (NSMutableSet)naturalLightingItems
{
  return self->_naturalLightingItems;
}

- (void)setNaturalLightingItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_naturalLightingItems, 0);
  objc_storeStrong((id *)&self->_defaultSelectedValue, 0);
  objc_storeStrong(&self->_homeKitObjectFilter, 0);
  objc_storeStrong(&self->_lightProfileFilter, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end