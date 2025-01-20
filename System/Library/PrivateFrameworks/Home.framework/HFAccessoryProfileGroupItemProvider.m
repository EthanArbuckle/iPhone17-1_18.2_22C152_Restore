@interface HFAccessoryProfileGroupItemProvider
- (HFAccessoryProfileFilterOptions)filterOptions;
- (HFAccessoryProfileGroupItemProvider)init;
- (HFAccessoryProfileGroupItemProvider)initWithHome:(id)a3;
- (HFAccessoryProfileGroupOptions)groupOptions;
- (HMHome)home;
- (NSMutableSet)profileGroupItems;
- (id)_profileGroupItemForProfiles:(id)a3 groupIdentifier:(id)a4;
- (id)_supportedProfileClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilterOptions:(id)a3;
- (void)setGroupOptions:(id)a3;
- (void)setProfileGroupItems:(id)a3;
@end

@implementation HFAccessoryProfileGroupItemProvider

- (HFAccessoryProfileGroupItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryProfileGroupItemProvider;
  v6 = [(HFItemProvider *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    profileGroupItems = v7->_profileGroupItems;
    v7->_profileGroupItems = (NSMutableSet *)v8;

    v10 = objc_alloc_init(HFAccessoryProfileFilterOptions);
    filterOptions = v7->_filterOptions;
    v7->_filterOptions = v10;

    v12 = [(HFAccessoryProfileGroupItemProvider *)v7 _supportedProfileClasses];
    [(HFAccessoryProfileFilterOptions *)v7->_filterOptions setByClasses:v12];

    v13 = objc_alloc_init(HFAccessoryProfileGroupOptions);
    groupOptions = v7->_groupOptions;
    v7->_groupOptions = v13;
  }
  return v7;
}

- (HFAccessoryProfileGroupItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryProfileGroupItemProvider.m", 42, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryProfileGroupItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFAccessoryProfileGroupItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFAccessoryProfileGroupItemProvider *)self home];
  id v4 = objc_msgSend(v3, "hf_allAccessoryProfiles");
  id v5 = [(HFAccessoryProfileGroupItemProvider *)self filterOptions];
  v6 = +[HFAccessoryProfileFilter filterProfiles:v4 options:v5];

  v7 = [(HFAccessoryProfileGroupItemProvider *)self groupOptions];
  uint64_t v8 = +[HFAccessoryProfileGroup groupProfiles:v6 options:v7];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_3;
  v14[3] = &unk_2640950A8;
  v14[4] = self;
  v9 = [(HFItemProvider *)self reloadItemsWithObjects:v8 keyAdaptor:&__block_literal_global_104 itemAdaptor:&__block_literal_global_14_6 filter:0 itemMap:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_26408D198;
  objc_copyWeak(&v13, &location);
  v10 = [v9 flatMap:v12];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

uint64_t __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupIdentifier];
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  v6 = 0;
LABEL_8:

  v9 = [v6 groupIdentifier];

  return v9;
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 profiles];
  id v5 = [v3 groupIdentifier];

  v6 = [v2 _profileGroupItemForProfiles:v4 groupIdentifier:v5];

  return v6;
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained profileGroupItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained profileGroupItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryProfileGroupItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)_supportedProfileClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_profileGroupItemForProfiles:(id)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HFAccessoryProfileGroupItem alloc];
  v9 = [MEMORY[0x263EFFA08] setWithArray:v7];

  v10 = [(HFAccessoryProfileGroupItemProvider *)self home];
  v11 = objc_msgSend(v10, "hf_characteristicValueManager");
  v12 = [(HFAccessoryProfileGroupItem *)v8 initWithProfiles:v9 groupIdentifier:v6 valueSource:v11];

  return v12;
}

- (HFAccessoryProfileFilterOptions)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(id)a3
{
}

- (HFAccessoryProfileGroupOptions)groupOptions
{
  return self->_groupOptions;
}

- (void)setGroupOptions:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)profileGroupItems
{
  return self->_profileGroupItems;
}

- (void)setProfileGroupItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileGroupItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_groupOptions, 0);
  objc_storeStrong((id *)&self->_filterOptions, 0);
}

@end