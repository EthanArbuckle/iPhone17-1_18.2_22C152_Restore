@interface HUFirmwareUpdateItemProvider
+ (BOOL)prefersNonBlockingReloads;
+ (id)itemComparator;
- (BOOL)hasProvidedInstructionsItem;
- (HFItemProvider)linkedApplicationItemProvider;
- (HMHome)home;
- (HUFirmwareUpdateItemProvider)init;
- (HUFirmwareUpdateItemProvider)initWithHome:(id)a3 style:(unint64_t)a4;
- (HUInstructionsItem)instructionsItem;
- (NSSet)linkedApplicationItems;
- (id)_effectiveFilter;
- (id)_instructionsItemResultsWithSampleLinkedApplicationItem:(id)a3 numberOfLinkedApplicationItems:(int64_t)a4;
- (id)_localizedDescriptionForAppName:(id)a3 accessoriesWithFirmwareUpdates:(id)a4 visibleAccessoryTileDisplayNames:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (unint64_t)style;
- (void)setFilter:(id)a3;
- (void)setHasProvidedInstructionsItem:(BOOL)a3;
- (void)setInstructionsItem:(id)a3;
- (void)setLinkedApplicationItemProvider:(id)a3;
- (void)setLinkedApplicationItems:(id)a3;
@end

@implementation HUFirmwareUpdateItemProvider

+ (id)itemComparator
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F69758];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 comparatorWithSortedClasses:v3 secondaryComparator:&__block_literal_global_269];

  return v4;
}

uint64_t __46__HUFirmwareUpdateItemProvider_itemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v8 = [v4 latestResults];

  v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v7 localizedStandardCompare:v9];

  return v10;
}

- (HUFirmwareUpdateItemProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_style_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFirmwareUpdateItemProvider.m", 41, @"%s is unavailable; use %@ instead",
    "-[HUFirmwareUpdateItemProvider init]",
    v5);

  return 0;
}

- (HUFirmwareUpdateItemProvider)initWithHome:(id)a3 style:(unint64_t)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HUFirmwareUpdateItemProvider;
  v8 = [(HFItemProvider *)&v26 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_style = a4;
    uint64_t v10 = [[HULinkedApplicationItemProvider alloc] initWithHome:v7];
    v11 = [(HUFirmwareUpdateItemProvider *)v9 _effectiveFilter];
    [(HULinkedApplicationItemProvider *)v10 setFilter:v11];

    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    linkedApplicationItems = v9->_linkedApplicationItems;
    v9->_linkedApplicationItems = (NSSet *)v12;

    if ([(HUFirmwareUpdateItemProvider *)v9 style] == 2)
    {
      objc_initWeak(&location, v9);
      id v14 = objc_alloc(MEMORY[0x1E4F696B0]);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke;
      v23[3] = &unk_1E6391820;
      v15 = &v24;
      objc_copyWeak(&v24, &location);
      uint64_t v16 = [v14 initWithSourceProvider:v10 transformationBlock:v23];
      uint64_t v17 = 64;
    }
    else
    {
      objc_storeStrong((id *)&v9->_linkedApplicationItemProvider, v10);
      objc_initWeak(&location, v9);
      v18 = [HUInstructionsItem alloc];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_4;
      v21[3] = &unk_1E6384FD0;
      v15 = &v22;
      objc_copyWeak(&v22, &location);
      uint64_t v16 = [(HFStaticItem *)v18 initWithResultsBlock:v21];
      uint64_t v17 = 48;
    }
    v19 = *(Class *)((char *)&v9->super.super.isa + v17);
    *(Class *)((char *)&v9->super.super.isa + v17) = (Class)v16;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  return v9;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_2;
  v7[3] = &unk_1E6391128;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = (void *)[v4 initWithSourceItem:v3 transformationBlock:v7];
  objc_destroyWeak(&v8);

  return v5;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"HFResultApplicationAssociatedAccessories"];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_17_0);
  id v8 = objc_msgSend(v7, "na_setByFlattening");

  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v10 = &stru_1F18F92B8;
  if (v9) {
    uint64_t v10 = v9;
  }
  v11 = v10;

  uint64_t v12 = [WeakRetained _localizedDescriptionForAppName:v11 accessoriesWithFirmwareUpdates:v6 visibleAccessoryTileDisplayNames:v8];

  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  v13 = [WeakRetained home];
  LODWORD(v11) = objc_msgSend(v13, "hf_currentUserIsRestrictedGuest");

  if (v11) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }

  return v5;
}

uint64_t __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayNamesForVisibleTiles");
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_4(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained linkedApplicationItems];
    v5 = [v4 anyObject];
    uint64_t v6 = (void *)[v5 copy];

    id v7 = [v3 linkedApplicationItems];
    id v8 = objc_msgSend(v3, "_instructionsItemResultsWithSampleLinkedApplicationItem:numberOfLinkedApplicationItems:", v6, objc_msgSend(v7, "count"));
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = *MEMORY[0x1E4F68B10];
    v16[0] = MEMORY[0x1E4F1CC38];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v8 = [v9 futureWithResult:v10];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_5;
  v13[3] = &unk_1E6389138;
  objc_copyWeak(&v14, v1);
  v11 = [v8 flatMap:v13];
  objc_destroyWeak(&v14);

  return v11;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_5(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v11[0] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  id v7 = [WeakRetained home];
  int v8 = objc_msgSend(v7, "hf_currentUserIsRestrictedGuest");

  if (v8) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUFirmwareUpdateItemProvider *)self home];
  uint64_t v6 = objc_msgSend(v4, "initWithHome:style:", v5, -[HUFirmwareUpdateItemProvider style](self, "style"));

  return v6;
}

+ (BOOL)prefersNonBlockingReloads
{
  return +[HULinkedApplicationItemProvider prefersNonBlockingReloads];
}

- (id)reloadItems
{
  id v3 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItemProvider];
  id v4 = [v3 reloadItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HUFirmwareUpdateItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6385B10;
  void v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __43__HUFirmwareUpdateItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 copy];
  v5 = [v3 allItems];

  [*(id *)(a1 + 32) setLinkedApplicationItems:v5];
  if ([*(id *)(a1 + 32) style] != 2)
  {
    if ([*(id *)(a1 + 32) hasProvidedInstructionsItem])
    {
      uint64_t v6 = [v4 existingItems];
      id v7 = [*(id *)(a1 + 32) instructionsItem];
      int v8 = [v6 setByAddingObject:v7];
      [v4 setExistingItems:v8];
    }
    else
    {
      uint64_t v6 = [v4 addedItems];
      id v7 = [*(id *)(a1 + 32) instructionsItem];
      int v8 = [v6 setByAddingObject:v7];
      [v4 setAddedItems:v8];
    }

    [*(id *)(a1 + 32) setHasProvidedInstructionsItem:1];
  }
  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (id)items
{
  if ([(HUFirmwareUpdateItemProvider *)self style] == 2
    || ![(HUFirmwareUpdateItemProvider *)self hasProvidedInstructionsItem])
  {
    v5 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItems];
  }
  else
  {
    id v3 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItems];
    id v4 = [(HUFirmwareUpdateItemProvider *)self instructionsItem];
    v5 = [v3 setByAddingObject:v4];
  }

  return v5;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUFirmwareUpdateItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (void)setFilter:(id)a3
{
  id v4 = (void *)[a3 copy];
  id filter = self->_filter;
  self->_id filter = v4;

  objc_opt_class();
  id v14 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItemProvider];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v14;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    int v8 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItemProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [(HUFirmwareUpdateItemProvider *)self linkedApplicationItemProvider];
      objc_opt_class();
      v11 = [v10 sourceProvider];
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
    }
  }
  v13 = [(HUFirmwareUpdateItemProvider *)self _effectiveFilter];
  [v14 setFilter:v13];
}

- (id)_effectiveFilter
{
  v2 = [(HUFirmwareUpdateItemProvider *)self filter];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HUFirmwareUpdateItemProvider__effectiveFilter__block_invoke;
  aBlock[3] = &unk_1E6391848;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(aBlock);

  return v4;
}

uint64_t __48__HUFirmwareUpdateItemProvider__effectiveFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && !(*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v3 isFirmwareUpdateAvailable];
  }

  return v5;
}

- (id)_localizedDescriptionForAppName:(id)a3 accessoriesWithFirmwareUpdates:(id)a4 visibleAccessoryTileDisplayNames:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(HUFirmwareUpdateItemProvider *)self style];
  if (v11 == 2) {
    goto LABEL_4;
  }
  if (v11 != 1)
  {
    if (v11)
    {
      v13 = 0;
      goto LABEL_35;
    }
LABEL_4:
    if ([v8 length] && objc_msgSend(v10, "count") == 1)
    {
      [MEMORY[0x1E4F69758] isAMac];
      uint64_t v12 = [v10 anyObject];
      uint64_t v23 = (uint64_t)v12;
      id v24 = v8;
LABEL_33:
      v13 = HFLocalizedStringWithFormat();

      goto LABEL_35;
    }
    if (![v8 length] || (unint64_t)objc_msgSend(v10, "count") < 2)
    {
      if (![v8 length]
        && [v10 count] == 1
        && [MEMORY[0x1E4F69758] isAMac])
      {
        uint64_t v12 = [v10 anyObject];
        uint64_t v23 = (uint64_t)v12;
        goto LABEL_33;
      }
      if (![v8 length]
        && (unint64_t)[v10 count] >= 2
        && [MEMORY[0x1E4F69758] isAMac])
      {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  if (![v8 length] || objc_msgSend(v9, "count") != 1)
  {
    if (![v8 length] || (unint64_t)objc_msgSend(v9, "count") < 2)
    {
      if (![v8 length]
        && [v9 count] == 1
        && [MEMORY[0x1E4F69758] isAMac])
      {
        uint64_t v23 = (uint64_t)v8;
        goto LABEL_34;
      }
      if (![v8 length]
        && (unint64_t)[v9 count] >= 2
        && [MEMORY[0x1E4F69758] isAMac])
      {
        uint64_t v23 = (uint64_t)v8;
        goto LABEL_34;
      }
LABEL_32:
      [MEMORY[0x1E4F69758] isAMac];
LABEL_20:
      uint64_t v23 = [v10 count];
      goto LABEL_34;
    }
LABEL_23:
    [MEMORY[0x1E4F69758] isAMac];
    uint64_t v23 = [v10 count];
    id v24 = v8;
    goto LABEL_34;
  }
  uint64_t v23 = (uint64_t)v8;
  [MEMORY[0x1E4F69758] isAMac];
LABEL_34:
  v13 = HFLocalizedStringWithFormat();
LABEL_35:
  if (objc_msgSend(v9, "na_any:", &__block_literal_global_78_0, v23, v24))
  {
    [v9 count];
    id v14 = HFLocalizedWiFiString();
    uint64_t v15 = (void *)MEMORY[0x1E4F28B18];
    uint64_t v16 = HFLocalizedStringWithFormat();
    uint64_t v17 = HFLocalizedWiFiString();
    v18 = (void *)MEMORY[0x1E4F696F8];
    v19 = [(HUFirmwareUpdateItemProvider *)self home];
    v20 = [v18 networkRouterSettingsURLForHome:v19];
    uint64_t v21 = objc_msgSend(v15, "hf_attributedLinkStringForString:linkString:linkURL:", v16, v17, v20);

    v13 = (void *)v21;
  }

  return v13;
}

uint64_t __128__HUFirmwareUpdateItemProvider__localizedDescriptionForAppName_accessoriesWithFirmwareUpdates_visibleAccessoryTileDisplayNames___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_networkConfigurationProfiles");
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_81_1);

  return v3;
}

BOOL __128__HUFirmwareUpdateItemProvider__localizedDescriptionForAppName_accessoriesWithFirmwareUpdates_visibleAccessoryTileDisplayNames___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 currentProtectionMode] == 1;
}

- (id)_instructionsItemResultsWithSampleLinkedApplicationItem:(id)a3 numberOfLinkedApplicationItems:(int64_t)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(HUFirmwareUpdateItemProvider *)self home];
  id v10 = [v9 accessories];
  unint64_t v11 = [v8 setWithArray:v10];
  uint64_t v12 = [(HUFirmwareUpdateItemProvider *)self _effectiveFilter];
  v13 = objc_msgSend(v11, "na_filter:", v12);

  id v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_97_0);
  uint64_t v15 = objc_msgSend(v14, "na_setByFlattening");

  uint64_t v16 = objc_msgSend(v13, "na_map:", &__block_literal_global_99_2);
  uint64_t v17 = objc_msgSend(v16, "na_setByFlattening");
  v18 = (void *)[v17 count];

  if ((a4 || [MEMORY[0x1E4F69758] isAMac]) && objc_msgSend(v15, "count"))
  {
    v19 = [MEMORY[0x1E4F7A0D8] futureWithResult:&stru_1F18F92B8];
    if (a4 == 1)
    {
      v20 = [v7 updateWithOptions:MEMORY[0x1E4F1CC08]];
      uint64_t v21 = [v20 flatMap:&__block_literal_global_102_0];

      v19 = (void *)v21;
    }
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_4;
    v25[3] = &unk_1E6391870;
    objc_copyWeak(v28, &location);
    v28[1] = v18;
    id v26 = v13;
    id v27 = v15;
    v28[2] = (id)a2;
    id v22 = [v19 flatMap:v25];

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v30 = *MEMORY[0x1E4F68B10];
    v31[0] = MEMORY[0x1E4F1CC38];
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v22 = [v23 futureWithResult:v19];
  }

  return v22;
}

uint64_t __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

uint64_t __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 storeID];
}

id __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = &stru_1F18F92B8;
  }
  uint64_t v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v4;
}

id __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 6);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = HFLocalizedString();
  id v7 = [WeakRetained _localizedDescriptionForAppName:v4 accessoriesWithFirmwareUpdates:a1[4] visibleAccessoryTileDisplayNames:a1[5]];

  if (!v7)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[8], WeakRetained, @"HUFirmwareUpdateItemProvider.m", 349, @"Invalid parameter not satisfying: %@", @"description != nil" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v8, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E4F68AB8]);
  objc_msgSend(v8, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68980]);
  [v8 setObject:&unk_1F19B5288 forKeyedSubscript:@"instructionsStyle"];
  [v8 setObject:&unk_1F19B52A0 forKeyedSubscript:*MEMORY[0x1E4F68A28]];
  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (unint64_t)style
{
  return self->_style;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (NSSet)linkedApplicationItems
{
  return self->_linkedApplicationItems;
}

- (void)setLinkedApplicationItems:(id)a3
{
}

- (HFItemProvider)linkedApplicationItemProvider
{
  return self->_linkedApplicationItemProvider;
}

- (void)setLinkedApplicationItemProvider:(id)a3
{
}

- (BOOL)hasProvidedInstructionsItem
{
  return self->_hasProvidedInstructionsItem;
}

- (void)setHasProvidedInstructionsItem:(BOOL)a3
{
  self->_hasProvidedInstructionsItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItems, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong(&self->_filter, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end