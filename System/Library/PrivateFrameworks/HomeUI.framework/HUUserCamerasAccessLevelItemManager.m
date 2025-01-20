@interface HUUserCamerasAccessLevelItemManager
- (BOOL)_isAllowedToEditTargetUser;
- (BOOL)_isEditingAllowedForUser:(id)a3;
- (BOOL)_isUserBeingEditedTheDeviceUser;
- (BOOL)_isUserOwner:(id)a3;
- (HFItem)removeItem;
- (HMHome)homeForUser;
- (HMUser)user;
- (HUUserCamerasAccessLevelItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUUserCamerasAccessLevelItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5;
- (NSArray)accessLevelItems;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_cameraAccessLevels;
- (id)_homeFuture;
- (unint64_t)_accessLevelForUser:(id)a3;
- (void)setAccessLevelItems:(id)a3;
- (void)setHomeForUser:(id)a3;
- (void)setRemoveItem:(id)a3;
@end

@implementation HUUserCamerasAccessLevelItemManager

- (HUUserCamerasAccessLevelItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUUserCamerasAccessLevelItemManager;
  v9 = [(HFItemManager *)&v12 initWithDelegate:a5 sourceItem:a4];
  v10 = v9;
  if (v9) {
    [(HUUserCamerasAccessLevelItemManager *)v9 setHomeForUser:v8];
  }

  return v10;
}

- (HUUserCamerasAccessLevelItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUserCamerasAccessLevelItemManager.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUUserCamerasAccessLevelItemManager initWithDelegate:sourceItem:]",
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
  v3 = [(HUUserCamerasAccessLevelItemManager *)self homeForUser];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  char v4 = ![(HUUserCamerasAccessLevelItemManager *)self _isAllowedToEditTargetUser];
  v5 = [(HUUserCamerasAccessLevelItemManager *)self _cameraAccessLevels];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke;
  v15[3] = &unk_1E638A280;
  v15[4] = self;
  char v16 = v4;
  v6 = objc_msgSend(v5, "na_map:", v15);
  [(HUUserCamerasAccessLevelItemManager *)self setAccessLevelItems:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v8 = [(HUUserCamerasAccessLevelItemManager *)self accessLevelItems];
  v9 = (void *)[v7 initWithArray:v8];

  v10 = (void *)MEMORY[0x1E4F1CA80];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v9];
  objc_super v12 = [v10 setWithObject:v11];

  v13 = [v12 allObjects];

  return v13;
}

id __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke_2;
  v7[3] = &unk_1E638A258;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = v3;
  char v8 = *(unsigned char *)(a1 + 40);
  v5 = (void *)[v4 initWithResultsBlock:v7];

  return v5;
}

id __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v3 = HFLocalizedStringFromHMUserCameraAccessLevel();
  v18[0] = v3;
  v17[1] = @"HFAccessLevelValueResultKey";
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v18[1] = v4;
  v17[2] = *MEMORY[0x1E4F68B40];
  v5 = NSNumber;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  char v8 = [v6 user];
  v9 = objc_msgSend(v5, "numberWithInt:", v7 == objc_msgSend(v6, "_accessLevelForUser:", v8));
  v18[2] = v9;
  v17[3] = *MEMORY[0x1E4F68A08];
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v18[3] = v10;
  v17[4] = *MEMORY[0x1E4F68908];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v12 = [*(id *)(a1 + 32) user];
  v13 = objc_msgSend(v11, "setWithObjects:", v12, 0, v17[0]);
  v18[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v15 = [v2 futureWithResult:v14];

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = [(HUUserCamerasAccessLevelItemManager *)self accessLevelItems];
  char v8 = (void *)[v6 initWithArray:v7];
  int v9 = [v4 intersectsSet:v8];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v11 = [(HUUserCamerasAccessLevelItemManager *)self accessLevelItems];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ([v4 containsObject:v16]) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v13);
    }

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCamerasAccessLevelSectionIdentifier"];
    [v17 setItems:v10];
    if ([(HUUserCamerasAccessLevelItemManager *)self _isAllowedToEditTargetUser])
    {
      id v18 = objc_alloc(MEMORY[0x1E4F69720]);
      v19 = [(HFItemManager *)self home];
      v20 = (void *)[v18 initWithHome:v19];

      [v20 setStyle:1];
      v21 = [(HFItemManager *)self home];
      v22 = [(HUUserCamerasAccessLevelItemManager *)self user];
      v23 = objc_msgSend(v21, "hf_handleForUser:", v22);
      v24 = [v20 stringForObjectValue:v23];

      v31 = HULocalizedStringWithFormat(@"HUUsersCamerasAccessLevelFooter", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
      [v17 setFooterTitle:v31];
    }
    [v5 addObject:v17];
  }

  return v5;
}

- (id)_cameraAccessLevels
{
  return &unk_1F19B5900;
}

- (unint64_t)_accessLevelForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  id v6 = [v5 homeAccessControlForUser:v4];

  unint64_t v7 = [v6 camerasAccessLevel];
  return v7;
}

- (BOOL)_isEditingAllowedForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  id v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isAdministrator];
  return (char)v4;
}

- (BOOL)_isUserOwner:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self home];
  id v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isOwner];
  return (char)v4;
}

- (BOOL)_isUserBeingEditedTheDeviceUser
{
  uint64_t v3 = [(HUUserCamerasAccessLevelItemManager *)self user];
  id v4 = [(HFItemManager *)self home];
  id v5 = [v4 currentUser];
  char v6 = [v3 isEqual:v5];

  return v6;
}

- (BOOL)_isAllowedToEditTargetUser
{
  uint64_t v3 = [(HFItemManager *)self home];
  id v4 = [v3 currentUser];
  if ([(HUUserCamerasAccessLevelItemManager *)self _isUserOwner:v4])
  {
    BOOL v5 = [(HUUserCamerasAccessLevelItemManager *)self _isUserBeingEditedTheDeviceUser];

    if (!v5)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {
  }
  unint64_t v7 = [(HFItemManager *)self home];
  char v8 = [v7 currentUser];
  if ([(HUUserCamerasAccessLevelItemManager *)self _isEditingAllowedForUser:v8])
  {
    int v9 = [(HUUserCamerasAccessLevelItemManager *)self user];
    BOOL v6 = ![(HUUserCamerasAccessLevelItemManager *)self _isEditingAllowedForUser:v9];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSArray)accessLevelItems
{
  return self->_accessLevelItems;
}

- (void)setAccessLevelItems:(id)a3
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

  objc_storeStrong((id *)&self->_accessLevelItems, 0);
}

@end