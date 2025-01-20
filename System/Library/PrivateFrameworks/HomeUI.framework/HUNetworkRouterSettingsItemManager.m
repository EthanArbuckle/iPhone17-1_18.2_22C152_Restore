@interface HUNetworkRouterSettingsItemManager
+ (id)_networkRouterServiceItemComparator;
- (BOOL)isItemNetworkRouterServiceItem:(id)a3;
- (HFItem)homeProtectionItem;
- (HFServiceItemProvider)networkRouterServiceItemProvider;
- (HMHome)overrideHome;
- (HUNetworkConfigurationItemListModule)networkConfigurationItemListModule;
- (HUNetworkRouterSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUNetworkRouterSettingsItemManager)initWithHome:(id)a3 delegate:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)networkRouterServiceItemForAccessory:(id)a3;
- (void)setHomeProtectionItem:(id)a3;
- (void)setNetworkConfigurationItemListModule:(id)a3;
- (void)setNetworkRouterServiceItemProvider:(id)a3;
@end

@implementation HUNetworkRouterSettingsItemManager

- (HUNetworkRouterSettingsItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUNetworkRouterSettingsItemManager.m", 33, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUNetworkRouterSettingsItemManager;
  v10 = [(HFItemManager *)&v14 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_overrideHome, a3);
  }

  return v11;
}

- (HUNetworkRouterSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkRouterSettingsItemManager.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUNetworkRouterSettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isItemNetworkRouterServiceItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkRouterSettingsItemManager *)self networkRouterServiceItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)networkRouterServiceItemForAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkRouterSettingsItemManager *)self networkRouterServiceItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__HUNetworkRouterSettingsItemManager_networkRouterServiceItemForAccessory___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __75__HUNetworkRouterSettingsItemManager_networkRouterServiceItemForAccessory___block_invoke(uint64_t a1, void *a2)
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

  id v7 = [v6 service];
  id v8 = [v7 accessory];
  id v9 = [v8 uniqueIdentifier];
  v10 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v11 = [v9 isEqual:v10];

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F69558];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = *MEMORY[0x1E4F2DF20];
  v21[0] = *MEMORY[0x1E4F2DF18];
  v21[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v9 = (void *)[v6 initWithHome:v5 serviceTypes:v8];
  [(HUNetworkRouterSettingsItemManager *)self setNetworkRouterServiceItemProvider:v9];

  v10 = [[HUNetworkRouterHomeProtectionItem alloc] initWithHome:v5];
  [(HUNetworkRouterSettingsItemManager *)self setHomeProtectionItem:v10];

  uint64_t v11 = [(HUNetworkRouterSettingsItemManager *)self homeProtectionItem];
  v20 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

  id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
  objc_super v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  v15 = (void *)[v13 initWithItems:v14];

  v16 = [(HUNetworkRouterSettingsItemManager *)self networkRouterServiceItemProvider];
  v19[0] = v16;
  v19[1] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v17;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[HUNetworkConfigurationItemListModule alloc] initWithItemUpdater:self home:v4];

  [(HUNetworkRouterSettingsItemManager *)self setNetworkConfigurationItemListModule:v5];
  id v6 = [(HUNetworkRouterSettingsItemManager *)self networkConfigurationItemListModule];
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUNetworkRouterSettingsRouterListSectionIdentifier"];
  uint64_t v7 = [(HUNetworkRouterSettingsItemManager *)self networkRouterServiceItemProvider];
  id v8 = [v7 items];
  id v9 = [v8 allObjects];
  v10 = [(id)objc_opt_class() _networkRouterServiceItemComparator];
  uint64_t v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11 filteringToDisplayedItems:v4];

  v12 = _HULocalizedStringWithDefaultValue(@"HUNetworkRouterSettingsRouterListSectionTitle", @"HUNetworkRouterSettingsRouterListSectionTitle", 1);
  [v6 setHeaderTitle:v12];

  [v5 addObject:v6];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUNetworkRouterSettingsHomeProtectionSectionIdentifier"];
  objc_super v14 = [(HUNetworkRouterSettingsItemManager *)self homeProtectionItem];
  v23[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v13 setItems:v15];

  v16 = [(HUNetworkRouterSettingsItemManager *)self homeProtectionItem];
  v17 = [v16 latestResults];
  v18 = [v17 objectForKeyedSubscript:@"HFResultNetworkRouterHomeProtectionDescriptionKey"];
  [v13 setFooterTitle:v18];

  [v5 addObject:v13];
  v19 = [(HUNetworkRouterSettingsItemManager *)self networkConfigurationItemListModule];
  v20 = [v19 buildSectionsWithDisplayedItems:v4];

  [v5 addObjectsFromArray:v20];
  v21 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v21;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUNetworkRouterSettingsItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

+ (id)_networkRouterServiceItemComparator
{
  return &__block_literal_global_237;
}

uint64_t __73__HUNetworkRouterSettingsItemManager__networkRouterServiceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v7;
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_7:
    id v9 = 0;
  }

  uint64_t v12 = objc_opt_class();
  id v13 = v5;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v14 = v13;
    }
    else {
      objc_super v14 = 0;
    }
    v15 = v13;
    if (v14) {
      goto LABEL_15;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
  }
  v15 = 0;
LABEL_15:

  v18 = [v9 service];
  int v19 = objc_msgSend(v18, "hf_isNetworkRouterSatellite");

  v20 = [v15 service];
  int v21 = objc_msgSend(v20, "hf_isNetworkRouterSatellite");

  if ((v19 & 1) != 0 || !v21)
  {
    if ((v19 ^ 1 | v21) == 1)
    {
      v23 = [MEMORY[0x1E4F69220] defaultItemComparator];
      uint64_t v22 = ((uint64_t (**)(void, id, id))v23)[2](v23, v7, v13);
    }
    else
    {
      uint64_t v22 = 1;
    }
  }
  else
  {
    uint64_t v22 = -1;
  }

  return v22;
}

- (HFItem)homeProtectionItem
{
  return self->_homeProtectionItem;
}

- (void)setHomeProtectionItem:(id)a3
{
}

- (HUNetworkConfigurationItemListModule)networkConfigurationItemListModule
{
  return self->_networkConfigurationItemListModule;
}

- (void)setNetworkConfigurationItemListModule:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFServiceItemProvider)networkRouterServiceItemProvider
{
  return self->_networkRouterServiceItemProvider;
}

- (void)setNetworkRouterServiceItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkRouterServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_networkConfigurationItemListModule, 0);

  objc_storeStrong((id *)&self->_homeProtectionItem, 0);
}

@end