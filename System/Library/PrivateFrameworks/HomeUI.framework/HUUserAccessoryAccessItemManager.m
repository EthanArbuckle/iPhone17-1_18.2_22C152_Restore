@interface HUUserAccessoryAccessItemManager
- (HFTransformItemProvider)transformedAllowedAccessoryItemProvider;
- (HMHome)overrideHome;
- (HMUser)user;
- (HUUserAccessoryAccessItemManager)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5;
- (NSString)accessoryCategoryType;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (void)setTransformedAllowedAccessoryItemProvider:(id)a3;
@end

@implementation HUUserAccessoryAccessItemManager

- (HUUserAccessoryAccessItemManager)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessItemManager.m", 29, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessItemManager.m", 28, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessItemManager.m", 30, @"Invalid parameter not satisfying: %@", @"accessoryCategoryType" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)HUUserAccessoryAccessItemManager;
  v13 = [(HFItemManager *)&v19 initWithDelegate:0 sourceItem:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a3);
    objc_storeStrong((id *)&v14->_user, a4);
    objc_storeStrong((id *)&v14->_accessoryCategoryType, a5);
  }

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"AccessoriesSection"];
  v8 = [(HUUserAccessoryAccessItemManager *)self transformedAllowedAccessoryItemProvider];
  v9 = [v8 items];
  id v10 = [v9 allObjects];
  id v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
  id v12 = [v10 sortedArrayUsingComparator:v11];
  v13 = (void *)[v12 mutableCopy];

  [v7 setItems:v13];
  v14 = _HULocalizedStringWithDefaultValue(@"HUUserAccessoryAccess_AllowedAccessoriesSection_Header", @"HUUserAccessoryAccess_AllowedAccessoriesSection_Header", 1);
  [v7 setHeaderTitle:v14];

  [v6 addObject:v7];
  v15 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v5];

  return v15;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");
  v6 = [(HUUserAccessoryAccessItemManager *)self user];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    v8 = [(HFItemManager *)self home];
    v9 = [(HUUserAccessoryAccessItemManager *)self user];
    id v10 = [v8 homeAccessControlForUser:v9];

    id v11 = [v10 restrictedGuestAccessSettings];
    id v12 = [v11 accessAllowedToAccessories];
    id v13 = objc_alloc(MEMORY[0x1E4F68E20]);
    v14 = [(HFItemManager *)self home];
    v15 = (void *)[v13 initWithHome:v14];

    if ([MEMORY[0x1E4F69758] isInternalTest])
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F69360]);
      [v15 setValueSource:v16];
    }
    objc_initWeak((id *)location, self);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke;
    v35[3] = &unk_1E638B680;
    objc_copyWeak(&v37, (id *)location);
    id v17 = v12;
    id v36 = v17;
    [v15 setFilter:v35];
    id v18 = objc_alloc(MEMORY[0x1E4F696B0]);
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_3;
    v31 = &unk_1E6391FB0;
    objc_copyWeak(&v34, (id *)location);
    id v19 = v17;
    id v32 = v19;
    id v33 = v4;
    v20 = (void *)[v18 initWithSourceProvider:v15 transformationBlock:&v28];
    -[HUUserAccessoryAccessItemManager setTransformedAllowedAccessoryItemProvider:](self, "setTransformedAllowedAccessoryItemProvider:", v20, v28, v29, v30, v31);

    v21 = [(HUUserAccessoryAccessItemManager *)self transformedAllowedAccessoryItemProvider];
    v38 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v4 name];
      v24 = [v4 uniqueIdentifier];
      v25 = [(HUUserAccessoryAccessItemManager *)self user];
      v26 = objc_msgSend(v25, "hf_prettyDescription");
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[HUUserAccessoryAccessItemManager _buildItemProvidersForHome:]";
      __int16 v40 = 2112;
      v41 = v23;
      __int16 v42 = 2112;
      v43 = v24;
      __int16 v44 = 2112;
      v45 = v26;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Not creating itemProviders for Home <Name:%@, uniqueIdentifier:%@> becuase it does NOT contain user %@", location, 0x2Au);
    }
    v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

uint64_t __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = (void *)MEMORY[0x1E4F2E520];
  v9 = [WeakRetained accessoryCategoryType];
  id v10 = objc_msgSend(v8, "hf_compatibleServiceTypesForCategoryType:", v9);
  id v11 = objc_msgSend(v7, "hf_primaryService");
  id v12 = [v11 serviceType];
  int v13 = objc_msgSend(v10, "na_safeContainsObject:", v12);

  v14 = [WeakRetained home];
  v15 = [WeakRetained home];
  id v16 = [v15 currentUser];
  LODWORD(v12) = objc_msgSend(v14, "hf_userIsRestrictedGuest:", v16);

  if (v12)
  {
    id v17 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_2;
    v20[3] = &unk_1E63869C8;
    id v21 = v7;
    uint64_t v18 = v13 & objc_msgSend(v17, "na_any:", v20);
  }
  else if (v13)
  {
    uint64_t v18 = objc_msgSend(v7, "hf_isRestrictedGuestAllowedAccessory");
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

id __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 accessory];
  id v9 = objc_alloc(MEMORY[0x1E4F696A8]);
  id v10 = (void *)[v5 copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_4;
  v14[3] = &unk_1E6391F88;
  id v15 = v8;
  id v16 = a1[4];
  id v17 = WeakRetained;
  id v18 = a1[5];
  id v11 = v8;
  id v12 = (void *)[v9 initWithSourceItem:v10 transformationBlock:v14];

  return v12;
}

id __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_4(id *a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1[4] name];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = NSString;
  id v5 = [a1[4] name];
  v6 = [v4 stringWithFormat:@"Home.Users.Accesory.Access.%@", v5];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  id v7 = (void *)MEMORY[0x1E4F69548];
  v8 = objc_msgSend(a1[4], "hf_primaryService");
  id v9 = [v8 serviceType];
  id v10 = [v7 iconDescriptorForAccessoryCategoryOrServiceType:v9];
  [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  [a1[5] containsObject:a1[4]];
  id v11 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  id v12 = [a1[6] home];
  int v13 = [a1[6] home];
  v14 = [v13 currentUser];
  int v15 = objc_msgSend(v12, "hf_userIsRestrictedGuest:", v14);

  id v16 = [a1[6] home];
  if (objc_msgSend(v16, "hf_currentUserIsAdministrator"))
  {
    id v17 = [a1[6] home];
    id v18 = [a1[6] user];
    int v19 = objc_msgSend(v17, "hf_userIsRestrictedGuest:", v18) ^ 1;
  }
  else
  {
    int v19 = 1;
  }

  v20 = [NSNumber numberWithBool:v19 & ~v15];
  [v2 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  if (([a1[4] isReachable] & 1) == 0
    && (objc_msgSend(a1[7], "hf_shouldBlockCurrentRestrictedGuestFromHome") & 1) == 0)
  {
    id v21 = _HULocalizedStringWithDefaultValue(@"HUUserAccessoryAccess_isUnReachable", @"HUUserAccessoryAccess_isUnReachable", 1);
    objc_msgSend(v2, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E4F68980]);
  }
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];

  return v2;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUUserAccessoryAccessItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (HFTransformItemProvider)transformedAllowedAccessoryItemProvider
{
  return self->_transformedAllowedAccessoryItemProvider;
}

- (void)setTransformedAllowedAccessoryItemProvider:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMUser)user
{
  return self->_user;
}

- (NSString)accessoryCategoryType
{
  return self->_accessoryCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);

  objc_storeStrong((id *)&self->_transformedAllowedAccessoryItemProvider, 0);
}

@end