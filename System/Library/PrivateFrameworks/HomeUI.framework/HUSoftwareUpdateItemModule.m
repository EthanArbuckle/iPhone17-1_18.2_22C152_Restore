@interface HUSoftwareUpdateItemModule
- (BOOL)hideAppleUpdates;
- (BOOL)hideThirdPartyUpdates;
- (HFSoftwareUpdatableItemProtocol)sourceItem;
- (HMHome)home;
- (HUSoftwareUpdateInfoItemProvider)softwareUpdateInfoItemProvider;
- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3;
- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5;
- (NSSet)accessories;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)_reloadItemProviders;
- (void)setHideAppleUpdates:(BOOL)a3;
- (void)setHideThirdPartyUpdates:(BOOL)a3;
- (void)setSoftwareUpdateInfoItemProvider:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation HUSoftwareUpdateItemModule

- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_sourceItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateItemModule.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HUSoftwareUpdateItemModule;
  v11 = [(HFItemModule *)&v18 initWithItemUpdater:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    objc_storeStrong((id *)&v12->_sourceItem, a5);
    if ([v10 conformsToProtocol:&unk_1F1A3D3B8])
    {
      v13 = [v10 accessories];
      uint64_t v14 = objc_msgSend(v13, "na_filter:", &__block_literal_global_74);
      accessories = v12->_accessories;
      v12->_accessories = (NSSet *)v14;
    }
    else
    {
      uint64_t v16 = [v9 accessoriesSupportingSoftwareUpdate];
      v13 = v12->_accessories;
      v12->_accessories = (NSSet *)v16;
    }
  }
  return v12;
}

BOOL __66__HUSoftwareUpdateItemModule_initWithItemUpdater_home_sourceItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 softwareUpdateController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_reloadItemProviders
{
  v4 = [(HFItemModule *)self itemProviders];

  if (v4)
  {
    id v9 = [(HFItemModule *)self itemUpdater];
    v5 = (void *)MEMORY[0x1E4F69230];
    v6 = [(HFItemModule *)self itemProviders];
    v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
    id v8 = (id)[v9 performItemUpdateRequest:v7];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"hideSectionHeaders"] & 1) != 0
    || ([v7 isEqualToString:@"hideAppleUpdates"] & 1) != 0
    || [v7 isEqualToString:@"hideThirdPartyUpdates"])
  {
    int v8 = [v6 BOOLValue];
    id v9 = [(HUSoftwareUpdateItemModule *)self valueForKey:v7];
    int v10 = [v9 BOOLValue];

    if (v8 != v10)
    {
      v11.receiver = self;
      v11.super_class = (Class)HUSoftwareUpdateItemModule;
      [(HUSoftwareUpdateItemModule *)&v11 setValue:v6 forKey:v7];
      [(HUSoftwareUpdateItemModule *)self _reloadItemProviders];
    }
  }
}

- (id)buildItemProviders
{
  BOOL v3 = [HUSoftwareUpdateInfoItemProvider alloc];
  v4 = [(HUSoftwareUpdateItemModule *)self home];
  v5 = [(HUSoftwareUpdateInfoItemProvider *)v3 initWithHome:v4];
  [(HUSoftwareUpdateItemModule *)self setSoftwareUpdateInfoItemProvider:v5];

  id v6 = [(HUSoftwareUpdateItemModule *)self accessories];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__HUSoftwareUpdateItemModule_buildItemProviders__block_invoke;
  v13[3] = &unk_1E6385F78;
  id v14 = v6;
  id v7 = v6;
  int v8 = [(HUSoftwareUpdateItemModule *)self softwareUpdateInfoItemProvider];
  [v8 setFilter:v13];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  int v10 = [(HUSoftwareUpdateItemModule *)self softwareUpdateInfoItemProvider];
  objc_super v11 = objc_msgSend(v9, "na_setWithSafeObject:", v10);

  return v11;
}

uint64_t __48__HUSoftwareUpdateItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
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

  uint64_t v7 = [*(id *)(a1 + 32) containsObject:v6];
  return v7;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_84];
  v28[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_86_0];
  v28[1] = v7;
  int v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_88_1];
  v28[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];

  int v10 = [(HUSoftwareUpdateItemModule *)self softwareUpdateInfoItemProvider];
  objc_super v11 = [v10 items];
  v12 = [v11 allObjects];
  v13 = [v12 sortedArrayUsingDescriptors:v9];

  id v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_4;
  v25 = &unk_1E63893A8;
  id v16 = v14;
  id v26 = v16;
  id v17 = v15;
  id v27 = v17;
  objc_msgSend(v13, "na_each:", &v22);
  if (![(HUSoftwareUpdateItemModule *)self hideAppleUpdates]
    && [v16 count])
  {
    objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSoftwareUpdateAppleUpdatesSectionIdentifier"];
    [v18 setItems:v16];
    [v5 addObject:v18];
  }
  if (!-[HUSoftwareUpdateItemModule hideThirdPartyUpdates](self, "hideThirdPartyUpdates") && [v17 count])
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSoftwareUpdateThirdPartyUpdatesSectionIdentifier"];
    [v19 setItems:v17];
    [v5 addObject:v19];
  }
  v20 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v20;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 accessories];
  id v6 = [v5 anyObject];
  uint64_t v7 = [v6 manufacturer];
  int v8 = [v4 accessories];

  id v9 = [v8 anyObject];
  int v10 = [v9 manufacturer];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 accessories];
  id v6 = [v5 anyObject];
  uint64_t v7 = objc_msgSend(v6, "hf_userFriendlyLocalizedCapitalizedDescription");
  int v8 = [v4 accessories];

  id v9 = [v8 anyObject];
  int v10 = objc_msgSend(v9, "hf_userFriendlyLocalizedCapitalizedDescription");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 accessories];
  id v6 = [v5 anyObject];
  uint64_t v7 = objc_msgSend(v6, "hf_softwareUpdateVersion");
  int v8 = [v7 versionString];
  id v9 = [v4 accessories];

  int v10 = [v9 anyObject];
  uint64_t v11 = objc_msgSend(v10, "hf_softwareUpdateVersion");
  v12 = [v11 versionString];
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

void __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 accessories];
  id v4 = [v3 anyObject];
  int v5 = objc_msgSend(v4, "hf_isHomePod");

  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

- (HMHome)home
{
  return self->_home;
}

- (HFSoftwareUpdatableItemProtocol)sourceItem
{
  return self->_sourceItem;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (BOOL)hideAppleUpdates
{
  return self->_hideAppleUpdates;
}

- (void)setHideAppleUpdates:(BOOL)a3
{
  self->_hideAppleUpdates = a3;
}

- (BOOL)hideThirdPartyUpdates
{
  return self->_hideThirdPartyUpdates;
}

- (void)setHideThirdPartyUpdates:(BOOL)a3
{
  self->_hideThirdPartyUpdates = a3;
}

- (HUSoftwareUpdateInfoItemProvider)softwareUpdateInfoItemProvider
{
  return self->_softwareUpdateInfoItemProvider;
}

- (void)setSoftwareUpdateInfoItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateInfoItemProvider, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end