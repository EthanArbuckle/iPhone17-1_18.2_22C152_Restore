@interface HUUsersAndGuestsPinCodeItemManager
- (HFPinCodeManager)pinCodeManager;
- (HFStaticItem)restoreHomeKeyAccessItem;
- (HFTransformItemProvider)transformedGuestUserItemProvider;
- (HFUserItemProvider)userItemProvider;
- (HMAccessory)accessory;
- (HMHome)overrideHome;
- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3;
- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUUsersAndGuestsPinCodeItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6;
- (NAFuture)restoreFuture;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setAccessory:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setRestoreFuture:(id)a3;
- (void)setRestoreHomeKeyAccessItem:(id)a3;
- (void)setTransformedGuestUserItemProvider:(id)a3;
- (void)setUserItemProvider:(id)a3;
@end

@implementation HUUsersAndGuestsPinCodeItemManager

- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithPinCodeManager_delegate_home_forAccessory_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUsersAndGuestsPinCodeItemManager.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUUsersAndGuestsPinCodeItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithPinCodeManager_delegate_home_forAccessory_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUsersAndGuestsPinCodeItemManager.m", 41, @"%s is unavailable; use %@ instead",
    "-[HUUsersAndGuestsPinCodeItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUUsersAndGuestsPinCodeItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  v15 = [(HFItemManager *)&v27 initWithDelegate:a4 sourceItem:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pinCodeManager, a3);
    objc_storeStrong((id *)&v16->_overrideHome, a5);
    objc_storeStrong((id *)&v16->_accessory, a6);
    v17 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    restoreFuture = v16->_restoreFuture;
    v16->_restoreFuture = v17;
  }
  if (v14)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__HUUsersAndGuestsPinCodeItemManager_initWithPinCodeManager_delegate_home_forAccessory___block_invoke;
    v22[3] = &unk_1E6391A18;
    id v23 = v14;
    id v24 = v13;
    v25 = v16;
    SEL v26 = a2;
    [v24 fetchMissingWalletKeysForAccessory:v23 completion:v22];

    v19 = v23;
  }
  else
  {
    v19 = [(HUUsersAndGuestsPinCodeItemManager *)v16 restoreFuture];
    v20 = [MEMORY[0x1E4F1CAD0] set];
    [v19 finishWithResult:v20];
  }
  return v16;
}

void __88__HUUsersAndGuestsPinCodeItemManager_initWithPinCodeManager_delegate_home_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "hf_minimumDescription");
    int v14 = 136315906;
    v15 = "-[HUUsersAndGuestsPinCodeItemManager initWithPinCodeManager:delegate:home:forAccessory:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed fetching the missing wallet keys %@ for %@ in %@", (uint8_t *)&v14, 0x2Au);
  }
  v7 = [*(id *)(a1 + 48) restoreFuture];
  [v7 finishWithResult:v3];

  v8 = [*(id *)(a1 + 48) restoreHomeKeyAccessItem];

  if (v8)
  {
    v9 = *(void **)(a1 + 48);
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = [v9 restoreHomeKeyAccessItem];
    id v12 = [v10 setWithObject:v11];
    id v13 = (id)[v9 updateResultsForItems:v12 senderSelector:*(void *)(a1 + 56)];
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F69718]) initWithHome:v4];
  [(HUUsersAndGuestsPinCodeItemManager *)self setUserItemProvider:v5];

  v6 = [(HUUsersAndGuestsPinCodeItemManager *)self userItemProvider];
  [v6 setIncludeCurrentUser:1];

  v7 = [(HUUsersAndGuestsPinCodeItemManager *)self userItemProvider];
  [v7 setIncludeOtherUsers:1];

  objc_initWeak(&location, self);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F69718]) initWithHome:v4];
  [v8 setIncludeCurrentUser:0];
  [v8 setIncludeOtherUsers:1];
  [v8 setIncludeGuestUsers:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke;
  v27[3] = &unk_1E63862F8;
  objc_copyWeak(&v28, &location);
  [v8 setFilter:v27];
  id v9 = objc_alloc(MEMORY[0x1E4F696B0]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_2;
  v25[3] = &unk_1E638A408;
  objc_copyWeak(&v26, &location);
  v10 = (void *)[v9 initWithSourceProvider:v8 transformationBlock:v25];
  [(HUUsersAndGuestsPinCodeItemManager *)self setTransformedGuestUserItemProvider:v10];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  id v11 = objc_alloc(MEMORY[0x1E4F695C0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_4;
  v23[3] = &unk_1E6384FD0;
  objc_copyWeak(&v24, &location);
  id v12 = (void *)[v11 initWithResultsBlock:v23];
  [(HUUsersAndGuestsPinCodeItemManager *)self setRestoreHomeKeyAccessItem:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
  int v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [(HUUsersAndGuestsPinCodeItemManager *)self restoreHomeKeyAccessItem];
  v31[0] = v15;
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v17 = [v14 setWithArray:v16];
  __int16 v18 = (void *)[v13 initWithItems:v17];

  v30[0] = v18;
  uint64_t v19 = [(HUUsersAndGuestsPinCodeItemManager *)self userItemProvider];
  v30[1] = v19;
  __int16 v20 = [(HUUsersAndGuestsPinCodeItemManager *)self transformedGuestUserItemProvider];
  v30[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v21;
}

uint64_t __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [WeakRetained home];
  uint64_t v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_alloc(MEMORY[0x1E4F696A8]);
  id v7 = (void *)[v3 copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_3;
  v11[3] = &unk_1E6387EF8;
  objc_copyWeak(&v13, v4);
  id v8 = v3;
  id v12 = v8;
  uint64_t v9 = (void *)[v6 initWithSourceItem:v7 transformationBlock:v11];

  objc_destroyWeak(&v13);

  return v9;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];

  objc_opt_class();
  id v7 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [WeakRetained home];
  id v11 = [v9 user];
  id v12 = [v10 homeAccessControlForUser:v11];

  id v13 = [v12 restrictedGuestAccessSettings];
  int v14 = [v13 accessAllowedToAccessories];
  v15 = [WeakRetained accessory];
  objc_msgSend(v14, "na_safeContainsObject:", v15);

  __int16 v16 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  id v17 = NSString;
  __int16 v18 = [WeakRetained accessory];
  uint64_t v19 = [v18 name];
  __int16 v20 = [v17 stringWithFormat:@"Home.Locks.UsersAndGuests.UserHandle.AllowedAccess.%@", v19];
  v21 = [v20 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  [v6 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  return v6;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained restoreFuture];
  int v3 = [v2 isFinished];

  if (v3)
  {
    id v4 = [WeakRetained restoreFuture];
    uint64_t v5 = [v4 flatMap:&__block_literal_global_277];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRestoreHomeKeyAccessButton", @"HUPinCodeRestoreHomeKeyAccessButton", 1);
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.Locks.UsersAndGuests.Pincode.RestoreHomeKeyAccess" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[HUUsersAndGuestsPinCodeItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) restoreHomeKeyAccessItem is hidden because restoreFuture is NOT finished", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];
  }
  id v8 = (void *)v5;

  return v8;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRestoreHomeKeyAccessButton", @"HUPinCodeRestoreHomeKeyAccessButton", 1);
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"Home.Locks.UsersAndGuests.Pincode.RestoreHomeKeyAccess" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  uint64_t v5 = objc_msgSend(v2, "hmf_isEmpty");
  id v6 = [NSNumber numberWithBool:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[HUUsersAndGuestsPinCodeItemManager _buildItemProvidersForHome:]_block_invoke_5";
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For restoreHomeKeyAccessItem, hidden = %{BOOL}d | missingWalletKeys = %@ | getMissingWalletKeyFuture.isFinished = YES", (uint8_t *)&v10, 0x1Cu);
  }

  id v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(HFItemManager *)self itemModules];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v42[3] = &unk_1E6391A40;
  id v7 = v4;
  id v43 = v7;
  id v8 = objc_msgSend(v6, "na_flatMap:", v42);
  [v5 addObjectsFromArray:v8];

  id v9 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_44_1);
  v40 = v7;
  if (v9)
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Found pin code list section", buf, 2u);
    }

    id v11 = (void *)[v9 mutableCopy];
    __int16 v12 = (void *)MEMORY[0x1E4F1CA48];
    int v13 = [v9 items];
    __int16 v14 = [v12 arrayWithArray:v13];

    [(HUUsersAndGuestsPinCodeItemManager *)self transformedGuestUserItemProvider];
    uint64_t v16 = v15 = self;
    id v17 = [v16 items];
    __int16 v18 = [v17 allObjects];
    uint64_t v19 = [MEMORY[0x1E4F69220] defaultItemComparator];
    __int16 v20 = [v18 sortedArrayUsingComparator:v19];

    v21 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v22 = [(HUUsersAndGuestsPinCodeItemManager *)v15 transformedGuestUserItemProvider];
    id v23 = [v22 items];
    id v24 = [v23 allObjects];
    v25 = objc_msgSend(v21, "indexSetWithIndexesInRange:", 0, objc_msgSend(v24, "count"));
    [v14 insertObjects:v20 atIndexes:v25];

    self = v15;
    [v11 setItems:v14];
    [v5 removeObject:v9];
    [v5 addObject:v11];
  }
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodes-users"];
  objc_super v27 = [(HUUsersAndGuestsPinCodeItemManager *)self userItemProvider];
  id v28 = [v27 items];
  v29 = [v28 allObjects];
  [MEMORY[0x1E4F69220] defaultItemComparator];
  v30 = v5;
  v32 = v31 = self;
  v33 = [v29 sortedArrayUsingComparator:v32];
  v34 = (void *)[v33 mutableCopy];

  v35 = [(HUUsersAndGuestsPinCodeItemManager *)v31 restoreHomeKeyAccessItem];
  [v34 addObject:v35];

  [v26 setItems:v34];
  v36 = HFLocalizedString();
  [v26 setHeaderTitle:v36];

  v37 = HFLocalizedString();
  [v26 setFooterTitle:v37];

  [v30 insertObject:v26 atIndex:0];
  v38 = [MEMORY[0x1E4F69220] filterSections:v30 toDisplayedItems:v40];

  return v38;
}

uint64_t __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 buildSectionsWithDisplayedItems:*(void *)(a1 + 32)];
}

uint64_t __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"PinCodes-guests"];

  return v3;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc(MEMORY[0x1E4F693B8]);
  id v7 = [(HUUsersAndGuestsPinCodeItemManager *)self pinCodeManager];
  id v8 = [(HUUsersAndGuestsPinCodeItemManager *)self accessory];
  id v9 = (void *)[v6 initWithItemUpdater:self pinCodeManager:v7 listType:3 home:v4 forAccessory:v8];

  [v5 addObject:v9];
  if ([v4 hasOnboardedForAccessCode])
  {
    int v10 = objc_msgSend(v4, "hf_accessoriesSupportingAccessCodes");
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F693B8]);
      int v13 = [(HUUsersAndGuestsPinCodeItemManager *)self pinCodeManager];
      __int16 v14 = [(HUUsersAndGuestsPinCodeItemManager *)self accessory];
      id v15 = (void *)[v12 initWithItemUpdater:self pinCodeManager:v13 listType:2 home:v4 forAccessory:v14];

      [v5 addObject:v15];
    }
  }

  return v5;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  uint64_t v3 = [(HUUsersAndGuestsPinCodeItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  uint64_t v3 = [(HUUsersAndGuestsPinCodeItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v3 = [(HUUsersAndGuestsPinCodeItemManager *)self overrideHome];
  objc_super v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(HUUsersAndGuestsPinCodeItemManager *)self overrideHome];
  id v9 = [v7 user];

  int v10 = [v8 homeAccessControlForUser:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v12 = [v10 restrictedGuestAccessSettings];
  int v13 = [v12 accessAllowedToAccessories];
  __int16 v14 = (void *)[v11 initWithSet:v13];

  id v15 = [(HUUsersAndGuestsPinCodeItemManager *)self accessory];
  int v16 = objc_msgSend(v14, "na_safeContainsObject:", v15);

  if (v4)
  {
    if (v16) {
      goto LABEL_7;
    }
    id v17 = [(HUUsersAndGuestsPinCodeItemManager *)self accessory];
    objc_msgSend(v14, "na_safeAddObject:", v17);
  }
  else
  {
    if (!v16) {
      goto LABEL_7;
    }
    id v17 = [(HUUsersAndGuestsPinCodeItemManager *)self accessory];
    [v14 removeObject:v17];
  }

LABEL_7:
  __int16 v18 = [v10 restrictedGuestAccessSettings];
  uint64_t v19 = (void *)[v18 mutableCopy];

  [v19 setAccessAllowedToAccessories:v14];
  __int16 v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v41 = self;
    __int16 v42 = 2112;
    id v43 = v21;
    __int16 v44 = 2112;
    v45 = v14;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating allowed accessories to: %@", buf, 0x20u);
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F7A0D8];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke;
  v37[3] = &unk_1E6385D90;
  id v38 = v10;
  id v39 = v19;
  id v23 = v19;
  id v24 = v10;
  v25 = [v22 futureWithBlock:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_68;
  v34[3] = &unk_1E63859F8;
  id v26 = v9;
  id v35 = v26;
  id v36 = v8;
  id v27 = v8;
  id v28 = (id)[v25 addSuccessBlock:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_75;
  v32[3] = &unk_1E6386708;
  id v33 = v26;
  id v29 = v26;
  id v30 = (id)[v25 addFailureBlock:v32];

  return v25;
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6386708;
  id v8 = v3;
  id v6 = v3;
  [v5 updateRestrictedGuestSettings:v4 completionHandler:v7];
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v3) {
    [v5 finishWithError:v3];
  }
  else {
    [v5 finishWithNoResult];
  }
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_68(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v9 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories for %@", buf, 0x16u);
  }

  uint64_t v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_70;
  v5[3] = &unk_1E6387408;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v5 sender:0];
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_75(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories for %@ with error: %@.", (uint8_t *)&v6, 0x20u);
  }
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (HFTransformItemProvider)transformedGuestUserItemProvider
{
  return self->_transformedGuestUserItemProvider;
}

- (void)setTransformedGuestUserItemProvider:(id)a3
{
}

- (HFStaticItem)restoreHomeKeyAccessItem
{
  return self->_restoreHomeKeyAccessItem;
}

- (void)setRestoreHomeKeyAccessItem:(id)a3
{
}

- (NAFuture)restoreFuture
{
  return self->_restoreFuture;
}

- (void)setRestoreFuture:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_restoreFuture, 0);
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, 0);
  objc_storeStrong((id *)&self->_transformedGuestUserItemProvider, 0);

  objc_storeStrong((id *)&self->_userItemProvider, 0);
}

@end