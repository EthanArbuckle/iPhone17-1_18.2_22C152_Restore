@interface HFAccessoryProfileItemProvider
- (HFAccessoryProfileFilterOptions)filterOptions;
- (HFAccessoryProfileItemProvider)init;
- (HFAccessoryProfileItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)profileItems;
- (id)_profileItemForProfile:(id)a3;
- (id)_supportedProfileClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilterOptions:(id)a3;
- (void)setProfileItems:(id)a3;
@end

@implementation HFAccessoryProfileItemProvider

- (HFAccessoryProfileItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFAccessoryProfileItemProvider;
  v6 = [(HFItemProvider *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    profileItems = v7->_profileItems;
    v7->_profileItems = (NSMutableSet *)v8;

    v10 = objc_alloc_init(HFAccessoryProfileFilterOptions);
    filterOptions = v7->_filterOptions;
    v7->_filterOptions = v10;

    v12 = [(HFAccessoryProfileItemProvider *)v7 _supportedProfileClasses];
    [(HFAccessoryProfileFilterOptions *)v7->_filterOptions setByClasses:v12];
  }
  return v7;
}

- (HFAccessoryProfileItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryProfileItemProvider.m", 39, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryProfileItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFAccessoryProfileItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFAccessoryProfileItemProvider *)self home];
  id v4 = objc_msgSend(v3, "hf_allAccessoryProfiles");
  id v5 = [(HFAccessoryProfileItemProvider *)self filterOptions];
  v6 = +[HFAccessoryProfileFilter filterProfiles:v4 options:v5];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v14, &location);
  v7 = _Block_copy(aBlock);
  uint64_t v8 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v6 filter:0 itemMap:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, &location);
  v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

id __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _supportedProfileClasses];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_2;
  v16[3] = &unk_264093938;
  id v6 = v3;
  id v17 = v6;
  char v7 = objc_msgSend(v5, "na_any:", v16);

  if ((v7 & 1) == 0) {
    NSLog(&cfstr_Accessoryprofi_1.isa, v6);
  }

  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_10;
    }
    id v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_10:

  id v14 = [WeakRetained _profileItemForProfile:v11];

  return v14;
}

uint64_t __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

id __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained profileItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  char v7 = [WeakRetained profileItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryProfileItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)_supportedProfileClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_profileItemForProfile:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryProfileItem alloc];
  objc_super v6 = [(HFAccessoryProfileItemProvider *)self home];
  char v7 = objc_msgSend(v6, "hf_characteristicValueManager");
  uint64_t v8 = [(HFAccessoryProfileItem *)v5 initWithProfile:v4 valueSource:v7];

  return v8;
}

- (HFAccessoryProfileFilterOptions)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)profileItems
{
  return self->_profileItems;
}

- (void)setProfileItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_filterOptions, 0);
}

@end