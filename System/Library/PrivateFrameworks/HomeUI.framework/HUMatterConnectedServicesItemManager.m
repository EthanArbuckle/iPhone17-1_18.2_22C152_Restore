@interface HUMatterConnectedServicesItemManager
+ (id)connectedServicesItemComparator;
- (HFItem)instructionsItem;
- (HMAccessory)accessory;
- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider;
- (HUMatterConnectedServicesItemManager)initWithConnectedServicesItemProvider:(id)a3 delegate:(id)a4;
- (HUMatterHomeConnectedEcosystemItemProvider)connectedHomeEcosystemItemProvider;
- (NSString)accessorySystemCommisionerUUID;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)connectedAccessoryEcosystemItemProvider;
- (id)fetchSystemCommissionerPairingUUID;
- (void)connectedServicesSectionFooterLink:(id)a3 isForAccessory:(BOOL)a4;
- (void)setAccessorySystemCommisionerUUID:(id)a3;
- (void)setConnectedServicesItemProvider:(id)a3;
- (void)setInstructionsItem:(id)a3;
@end

@implementation HUMatterConnectedServicesItemManager

- (HUMatterConnectedServicesItemManager)initWithConnectedServicesItemProvider:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUMatterConnectedServicesItemManager;
  v8 = [(HFItemManager *)&v13 initWithDelegate:a4 sourceItem:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connectedServicesItemProvider, a3);
    v10 = [(HUMatterConnectedServicesItemManager *)v9 connectedHomeEcosystemItemProvider];
    v11 = [v10 home];
    [(HFItemManager *)v9 setHome:v11];
  }
  return v9;
}

- (id)fetchSystemCommissionerPairingUUID
{
  v3 = [(HUMatterConnectedServicesItemManager *)self connectedAccessoryEcosystemItemProvider];

  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0 || !v3)
  {
    id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    objc_initWeak(&location, self);
    v5 = [(HUMatterConnectedServicesItemManager *)self accessory];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__HUMatterConnectedServicesItemManager_fetchSystemCommissionerPairingUUID__block_invoke;
    v8[3] = &unk_1E638D950;
    objc_copyWeak(&v10, &location);
    id v6 = v4;
    id v9 = v6;
    [v5 fetchCHIPPairingsWithCompletion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __74__HUMatterConnectedServicesItemManager_fetchSystemCommissionerPairingUUID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch CHIP pairings: %@", (uint8_t *)&v14, 0xCu);
    }

    [WeakRetained setAccessorySystemCommisionerUUID:0];
  }
  else
  {
    id v9 = [v5 anyObject];
    id v10 = [v9 systemCommissionerPairingUUID];
    v11 = [v10 UUIDString];
    [WeakRetained setAccessorySystemCommisionerUUID:v11];

    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [WeakRetained accessorySystemCommisionerUUID];
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Establishing accessorySystemCommisionerUUID : %@", (uint8_t *)&v14, 0xCu);
    }
    [WeakRetained recalculateVisibilityAndSortAllItems];
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUMatterConnectedServicesItemManager *)self connectedHomeEcosystemItemProvider];

  if (v4)
  {
    id v5 = [HUInstructionsItem alloc];
    id v6 = _HULocalizedStringWithDefaultValue(@"HUMatterHomeConnectedEcosystemsInfoTitle", @"HUMatterHomeConnectedEcosystemsInfoTitle", 1);
    id v7 = [(HUInstructionsItem *)v5 initWithStyle:4 title:v6 description:0];
    [(HUMatterConnectedServicesItemManager *)self setInstructionsItem:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F695C8]);
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    id v10 = [(HUMatterConnectedServicesItemManager *)self instructionsItem];
    v19[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v12 = [v9 setWithArray:v11];
    objc_super v13 = (void *)[v8 initWithItems:v12];

    v18[0] = v13;
    int v14 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
    v18[1] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }
  else
  {
    objc_super v13 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
    v17 = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }

  return v15;
}

- (void)connectedServicesSectionFooterLink:(id)a3 isForAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
  {
    id v7 = _HULocalizedStringWithDefaultValue(@"HUMatterConnectedEcosystemsFooterLink", @"HUMatterConnectedEcosystemsFooterLink", 1);
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v6 appendAttributedString:v8];

    if (v4)
    {
      id v9 = [(HUMatterConnectedServicesItemManager *)self accessorySystemCommisionerUUID];

      if (!v9)
      {
        objc_super v13 = HFLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch CHIP pairings", buf, 2u);
        }
        v12 = @"prefs:root=General&path=MATTER_ACCESSORIES";
        goto LABEL_7;
      }
      id v10 = NSString;
      v11 = [(HUMatterConnectedServicesItemManager *)self accessorySystemCommisionerUUID];
      [v10 stringWithFormat:@"%@/%@", @"prefs:root=General&path=MATTER_ACCESSORIES", v11];
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_super v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v23 = *MEMORY[0x1E4F42530];
      v24[0] = v13;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = (NSObject **)v24;
      v17 = &v23;
    }
    else
    {
      v12 = @"prefs:root=General&path=MATTER_ACCESSORIES";
      objc_super v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=MATTER_ACCESSORIES"];
      id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v21 = *MEMORY[0x1E4F42530];
      v22 = v13;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = &v22;
      v17 = &v21;
    }
    v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    v19 = (void *)[v14 initWithString:v7 attributes:v18];
    [v6 appendAttributedString:v19];

LABEL_7:
  }
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40 = _HULocalizedStringWithDefaultValue(@"HUMatterAccessoryConnectedEcosystemsFooter", @"HUMatterAccessoryConnectedEcosystemsFooter", 1);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v40];
  id v6 = [(HUMatterConnectedServicesItemManager *)self connectedHomeEcosystemItemProvider];

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"ConnectedEcosystemsInstructions"];
    id v8 = [(HUMatterConnectedServicesItemManager *)self instructionsItem];
    v51[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    [v7 setItems:v9];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"ConnectedEcosystems"];
    v11 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
    v12 = [v11 items];
    objc_super v13 = [v12 allObjects];
    id v14 = [(id)objc_opt_class() connectedServicesItemComparator];
    id v15 = [v13 sortedArrayUsingComparator:v14];
    [v10 setItems:v15 filteringToDisplayedItems:v4];

    uint64_t v16 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
    LODWORD(v11) = [v16 hasSystemCommissionerEcosystem];

    if (v11)
    {
      [(HUMatterConnectedServicesItemManager *)self connectedServicesSectionFooterLink:v5 isForAccessory:0];
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Matter Connected Services completed footer: %@", (uint8_t *)&buf, 0xCu);
      }

      [v10 setAttributedFooterTitle:v5];
    }
    v18 = (void *)MEMORY[0x1E4F69220];
    v50[0] = v7;
    v50[1] = v10;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v20 = [v18 filterSections:v19 toDisplayedItems:v4];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"OwnedConnectedEcosystems"];
    v22 = _HULocalizedStringWithDefaultValue(@"HUMatterHomeConnectedEcosystemsOwnedPairingsTitle", @"HUMatterHomeConnectedEcosystemsOwnedPairingsTitle", 1);
    [v21 setHeaderTitle:v22];

    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"OtherConnectedEcosystems"];
    v24 = _HULocalizedStringWithDefaultValue(@"HUMatterHomeConnectedEcosystemsOtherPairingsTitle", @"HUMatterHomeConnectedEcosystemsOtherPairingsTitle", 1);
    [v23 setHeaderTitle:v24];

    v25 = [MEMORY[0x1E4F1CA80] set];
    v26 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
    v27 = [v26 items];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __73__HUMatterConnectedServicesItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v41[3] = &unk_1E638D978;
    p_long long buf = &buf;
    id v28 = v25;
    id v42 = v28;
    v29 = objc_msgSend(v27, "na_filter:", v41);

    v30 = [v29 allObjects];
    v31 = [(id)objc_opt_class() connectedServicesItemComparator];
    v32 = [v30 sortedArrayUsingComparator:v31];
    [v21 setItems:v32 filteringToDisplayedItems:v4];

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      [(HUMatterConnectedServicesItemManager *)self connectedServicesSectionFooterLink:v5 isForAccessory:1];
      v33 = HFLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 138412290;
        v46 = v5;
        _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "Matter Connected Services completed footer: %@", v45, 0xCu);
      }

      [v21 setAttributedFooterTitle:v5];
    }
    v34 = [v28 allObjects];
    v35 = [(id)objc_opt_class() connectedServicesItemComparator];
    v36 = [v34 sortedArrayUsingComparator:v35];
    [v23 setItems:v36 filteringToDisplayedItems:v4];

    v37 = (void *)MEMORY[0x1E4F69220];
    v44[0] = v21;
    v44[1] = v23;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v20 = [v37 filterSections:v38 toDisplayedItems:v4];

    _Block_object_dispose(&buf, 8);
  }

  return v20;
}

uint64_t __73__HUMatterConnectedServicesItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 connectedEcosystem];
  int v8 = [v7 owned];

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", v6);
    goto LABEL_8;
  }
  id v9 = [v6 connectedEcosystem];
  id v10 = [v9 vendor];
  int v11 = [v10 isSystemCommissionerVendor];

  uint64_t v12 = 1;
  if (v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)connectedServicesItemComparator
{
  return &__block_literal_global_164;
}

uint64_t __71__HUMatterConnectedServicesItemManager_connectedServicesItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v8 connectedEcosystem];
  objc_super v13 = [v11 connectedEcosystem];

  if (!v12)
  {
    objc_opt_class();
    id v14 = v6;
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    objc_opt_class();
    id v17 = v9;
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    uint64_t v12 = [v16 connectedEcosystem];
    uint64_t v20 = [v19 connectedEcosystem];

    objc_super v13 = (void *)v20;
  }
  objc_msgSend(MEMORY[0x1E4F2E6A8], "hf_ecosystemComparator");
  uint64_t v21 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v22 = ((uint64_t (**)(void, void *, void *))v21)[2](v21, v12, v13);

  return v22;
}

- (HMAccessory)accessory
{
  v2 = [(HUMatterConnectedServicesItemManager *)self connectedAccessoryEcosystemItemProvider];
  id v3 = [v2 accessory];

  return (HMAccessory *)v3;
}

- (id)connectedAccessoryEcosystemItemProvider
{
  objc_opt_class();
  id v3 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedHomeEcosystemItemProvider
{
  objc_opt_class();
  id v3 = [(HUMatterConnectedServicesItemManager *)self connectedServicesItemProvider];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (HUMatterHomeConnectedEcosystemItemProvider *)v5;
}

- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider
{
  return self->_connectedServicesItemProvider;
}

- (void)setConnectedServicesItemProvider:(id)a3
{
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (NSString)accessorySystemCommisionerUUID
{
  return self->_accessorySystemCommisionerUUID;
}

- (void)setAccessorySystemCommisionerUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySystemCommisionerUUID, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);

  objc_storeStrong((id *)&self->_connectedServicesItemProvider, 0);
}

@end