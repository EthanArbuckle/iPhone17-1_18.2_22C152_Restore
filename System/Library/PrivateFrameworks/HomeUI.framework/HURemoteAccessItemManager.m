@interface HURemoteAccessItemManager
- (BOOL)_hasResidentDevice;
- (BOOL)_isAllowedToEditTargetUser;
- (BOOL)_isEditingAllowedForUser:(id)a3;
- (BOOL)_isRemoteAccessAllowedForUser:(id)a3;
- (BOOL)_isUserBeingEditedTheDeviceUser;
- (BOOL)_isUserOwner:(id)a3;
- (HFItem)allowRemoteAccessItem;
- (HFItem)removeItem;
- (HMHome)homeForUser;
- (HMUser)user;
- (HURemoteAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HURemoteAccessItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (void)setAllowRemoteAccessItem:(id)a3;
- (void)setHomeForUser:(id)a3;
- (void)setRemoveItem:(id)a3;
@end

@implementation HURemoteAccessItemManager

- (HURemoteAccessItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HURemoteAccessItemManager;
  v9 = [(HFItemManager *)&v12 initWithDelegate:a5 sourceItem:a4];
  v10 = v9;
  if (v9) {
    [(HURemoteAccessItemManager *)v9 setHomeForUser:v8];
  }

  return v10;
}

- (HURemoteAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HURemoteAccessItemManager.m", 38, @"%s is unavailable; use %@ instead",
    "-[HURemoteAccessItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HMUser)user
{
  v2 = [(HFItemManager *)self sourceItem];
  v3 = [v2 user];

  return (HMUser *)v3;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HURemoteAccessItemManager *)self homeForUser];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HURemoteAccessItemManager__buildItemProvidersForHome___block_invoke;
  v15[3] = &unk_1E6385000;
  v15[4] = self;
  v5 = (void *)[v4 initWithResultsBlock:v15];
  [(HURemoteAccessItemManager *)self setAllowRemoteAccessItem:v5];

  v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HURemoteAccessItemManager *)self allowRemoteAccessItem];
  v10 = [v8 setWithObject:v9];
  v11 = (void *)[v7 initWithItems:v10];
  objc_super v12 = [v6 setWithObject:v11];

  v13 = [v12 allObjects];

  return v13;
}

id __56__HURemoteAccessItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v20[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _isAllowedToEditTargetUser] ^ 1;
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  v19[0] = *MEMORY[0x1E4F68B10];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "_hasResidentDevice") ^ 1);
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E4F68AB8];
  v5 = _HULocalizedStringWithDefaultValue(@"HUUsersCellControlAccessRemotely", @"HUUsersCellControlAccessRemotely", 1);
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E4F68BC0];
  v6 = NSNumber;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 user];
  if ([v7 _isRemoteAccessAllowedForUser:v8]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = [v6 numberWithInteger:v9];
  v20[2] = v10;
  v19[3] = *MEMORY[0x1E4F68A08];
  v11 = [NSNumber numberWithBool:v2];
  v20[3] = v11;
  v19[4] = *MEMORY[0x1E4F68908];
  objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [*(id *)(a1 + 32) user];
  v14 = [v12 setWithObject:v13];
  v20[4] = v14;
  v19[5] = *MEMORY[0x1E4F68900];
  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v20[5] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v17 = [v3 futureWithResult:v16];

  return v17;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(HURemoteAccessItemManager *)self allowRemoteAccessItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = [(HURemoteAccessItemManager *)self allowRemoteAccessItem];
    int v9 = [v4 containsObject:v8];

    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUControlAccessoriesRemotelySectionIdentifier"];
      v11 = (void *)MEMORY[0x1E4F1C978];
      objc_super v12 = [(HURemoteAccessItemManager *)self allowRemoteAccessItem];
      v13 = [v11 arrayWithObject:v12];
      [v10 setItems:v13];

      v14 = _HULocalizedStringWithDefaultValue(@"HUUsersCellControlAccessRemotelyFooter", @"HUUsersCellControlAccessRemotelyFooter", 1);
      [v10 setFooterTitle:v14];

      [v5 addObject:v10];
    }
  }

  return v5;
}

- (BOOL)_isRemoteAccessAllowedForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isRemoteAccessAllowed];
  return (char)v4;
}

- (BOOL)_isEditingAllowedForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isAdministrator];
  return (char)v4;
}

- (BOOL)_isUserOwner:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isOwner];
  return (char)v4;
}

- (BOOL)_isUserBeingEditedTheDeviceUser
{
  v3 = [(HURemoteAccessItemManager *)self user];
  id v4 = [(HFItemManager *)self home];
  id v5 = [v4 currentUser];
  char v6 = [v3 isEqual:v5];

  return v6;
}

- (BOOL)_hasResidentDevice
{
  v3 = [(HFItemManager *)self home];
  if (objc_msgSend(v3, "hf_supportsRemoteAccessRestrictions"))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(HFItemManager *)self home];
    char v4 = objc_msgSend(v5, "hf_supportsPerUserRemoteAccess");
  }
  return v4;
}

- (BOOL)_isAllowedToEditTargetUser
{
  v3 = [(HFItemManager *)self home];
  char v4 = [v3 currentUser];
  if ([(HURemoteAccessItemManager *)self _isUserOwner:v4])
  {
    BOOL v5 = [(HURemoteAccessItemManager *)self _isUserBeingEditedTheDeviceUser];

    if (!v5)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {
  }
  int v7 = [(HFItemManager *)self home];
  id v8 = [v7 currentUser];
  if ([(HURemoteAccessItemManager *)self _isEditingAllowedForUser:v8])
  {
    int v9 = [(HURemoteAccessItemManager *)self user];
    BOOL v6 = ![(HURemoteAccessItemManager *)self _isEditingAllowedForUser:v9];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HFItem)allowRemoteAccessItem
{
  return self->_allowRemoteAccessItem;
}

- (void)setAllowRemoteAccessItem:(id)a3
{
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);

  objc_storeStrong((id *)&self->_allowRemoteAccessItem, 0);
}

@end