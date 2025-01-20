@interface HFNetworkConfigurationGroupItemProvider
- (HFNetworkConfigurationGroupItemProvider)init;
- (HFNetworkConfigurationGroupItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)groupItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setGroupItems:(id)a3;
@end

@implementation HFNetworkConfigurationGroupItemProvider

- (HFNetworkConfigurationGroupItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFNetworkConfigurationGroupItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    groupItems = v7->_groupItems;
    v7->_groupItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFNetworkConfigurationGroupItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFNetworkConfigurationGroupItemProvider.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFNetworkConfigurationGroupItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFNetworkConfigurationGroupItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFNetworkConfigurationGroupItemProvider *)self home];
  id v4 = [v3 accessoryProtectionGroups];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_26408F3B0;
  objc_copyWeak(&v11, &location);
  id v5 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:&__block_literal_global_139 itemMap:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_26408D198;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

BOOL __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  v6 = v4;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    v6 = 0;
  }

  id v9 = [v6 accessories];
  BOOL v10 = [v9 count] != 0;

  return v10;
}

HFNetworkConfigurationGroupItem *__54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_opt_class();
  id v6 = v3;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    uint64_t v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = [MEMORY[0x263F08690] currentHandler];
    BOOL v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  uint64_t v8 = 0;
LABEL_8:

  id v11 = [HFNetworkConfigurationGroupItem alloc];
  v12 = [WeakRetained home];
  v13 = objc_msgSend(v12, "hf_characteristicValueManager");
  v14 = [(HFNetworkConfigurationGroupItem *)v11 initWithGroup:v8 valueSource:v13];

  return v14;
}

id __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained groupItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained groupItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFNetworkConfigurationGroupItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)groupItems
{
  return self->_groupItems;
}

- (void)setGroupItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end