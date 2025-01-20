@interface HUNetworkProtectionModeOptionItemProvider
- (HMAccessoryNetworkProtectionGroup)group;
- (HUNetworkProtectionModeOptionItemProvider)init;
- (HUNetworkProtectionModeOptionItemProvider)initWithGroup:(id)a3;
- (NSMutableSet)networkProtectionModeOptionItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reloadItems;
- (void)setNetworkProtectionModeOptionItems:(id)a3;
@end

@implementation HUNetworkProtectionModeOptionItemProvider

- (HUNetworkProtectionModeOptionItemProvider)initWithGroup:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNetworkProtectionModeOptionItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    networkProtectionModeOptionItems = v7->_networkProtectionModeOptionItems;
    v7->_networkProtectionModeOptionItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HUNetworkProtectionModeOptionItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithGroup_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkProtectionModeOptionItemProvider.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUNetworkProtectionModeOptionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUNetworkProtectionModeOptionItemProvider *)self group];
  v6 = (void *)[v4 initWithGroup:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_1E638A660;
  objc_copyWeak(&v9, &location);
  v3 = [(HFItemProvider *)self reloadItemsWithObjects:&unk_1F19B5930 keyAdaptor:&__block_literal_global_104 itemAdaptor:&__block_literal_global_15_0 filter:0 itemMap:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_4;
  v6[3] = &unk_1E6385B38;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

id __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 targetProtectionModeOption];

  return [v2 numberWithInteger:v3];
}

HUNetworkProtectionModeOptionItem *__56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [HUNetworkProtectionModeOptionItem alloc];
  v6 = [WeakRetained group];
  uint64_t v7 = [v3 unsignedIntegerValue];

  uint64_t v8 = [(HUNetworkProtectionModeOptionItem *)v5 initWithGroup:v6 targetProtectionModeOption:v7];

  return v8;
}

id __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained networkProtectionModeOptionItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained networkProtectionModeOptionItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (NSMutableSet)networkProtectionModeOptionItems
{
  return self->_networkProtectionModeOptionItems;
}

- (void)setNetworkProtectionModeOptionItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItems, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end