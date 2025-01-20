@interface HUAddRestrictedGuestItemManager
- (HFAccessoryItemProvider)secureAccessoryItemProvider;
- (HFSchedule)defaultAccessSchedule;
- (HFTransformItemProvider)transformedSecureAccessoryItemProvider;
- (HMHome)overrideHome;
- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3;
- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5 inviteeAddresses:(id)a6;
- (HUAddRestrictedGuestItemManagerDelegate)restrictedGuestDelegate;
- (HURestrictedGuestScheduleItem)homeScheduleItem;
- (NSArray)inviteeAddresses;
- (id)_accessoryToSymbolIconIdentifier:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:(id)a3;
- (void)sendInvitesWithAllowedAccessories:(id)a3;
- (void)setHomeScheduleItem:(id)a3;
- (void)setRestrictedGuestDelegate:(id)a3;
- (void)setSecureAccessoryItemProvider:(id)a3;
- (void)setTransformedSecureAccessoryItemProvider:(id)a3;
- (void)updateAccessSchedule:(id)a3;
@end

@implementation HUAddRestrictedGuestItemManager

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5 inviteeAddresses:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HUAddRestrictedGuestItemManager;
  v13 = [(HFItemManager *)&v19 initWithDelegate:a3 sourceItem:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a5);
    objc_storeStrong((id *)&v14->_inviteeAddresses, a6);
    v15 = [MEMORY[0x1E4F694A8] scheduleBuilderFromType:0 withDefaultRules:0];
    uint64_t v16 = [v15 build];
    defaultAccessSchedule = v14->_defaultAccessSchedule;
    v14->_defaultAccessSchedule = (HFSchedule *)v16;
  }
  return v14;
}

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_sourceItem_home_inviteeAddresses_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddRestrictedGuestItemManager.m", 54, @"%s is unavailable; use %@ instead",
    "-[HUAddRestrictedGuestItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_sourceItem_home_inviteeAddresses_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddRestrictedGuestItemManager.m", 59, @"%s is unavailable; use %@ instead",
    "-[HUAddRestrictedGuestItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [HURestrictedGuestScheduleItem alloc];
  v7 = [(HUAddRestrictedGuestItemManager *)self defaultAccessSchedule];
  v8 = [(HURestrictedGuestScheduleItem *)v6 initWithSchedule:v7];
  [(HUAddRestrictedGuestItemManager *)self setHomeScheduleItem:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F68E20]) initWithHome:v4];
  [(HUAddRestrictedGuestItemManager *)self setSecureAccessoryItemProvider:v9];

  v10 = [(HUAddRestrictedGuestItemManager *)self secureAccessoryItemProvider];
  [v10 setFilter:&__block_literal_global_95];

  id v11 = objc_alloc(MEMORY[0x1E4F696B0]);
  id v12 = [(HUAddRestrictedGuestItemManager *)self secureAccessoryItemProvider];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_2;
  v21[3] = &unk_1E6389F08;
  v21[4] = self;
  v13 = (void *)[v11 initWithSourceProvider:v12 transformationBlock:v21];
  [(HUAddRestrictedGuestItemManager *)self setTransformedSecureAccessoryItemProvider:v13];

  v14 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
  objc_msgSend(v5, "na_safeAddObject:", v14);

  id v15 = objc_alloc(MEMORY[0x1E4F695C8]);
  uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v17 = (void *)[v15 initWithItems:v16];

  v22[0] = v17;
  v18 = [(HUAddRestrictedGuestItemManager *)self transformedSecureAccessoryItemProvider];
  v22[1] = v18;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  return v19;
}

uint64_t __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = objc_msgSend(v5, "hf_isRestrictedGuestAllowedAccessory");
  return v6;
}

id __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
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

  v7 = [v6 accessory];
  id v8 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9 = (void *)[v4 copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_3;
  v14[3] = &unk_1E6386A18;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = (void *)[v8 initWithSourceItem:v9 transformationBlock:v14];

  return v12;
}

id __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [*(id *)(a1 + 32) name];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = NSString;
  id v5 = [*(id *)(a1 + 32) name];
  id v6 = [v4 stringWithFormat:@"Home.Users.Guest.AllowedAccessories.%@", v5];
  v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  id v8 = [*(id *)(a1 + 40) _accessoryToSymbolIconIdentifier:*(void *)(a1 + 32)];
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68A00]];

  v9 = [MEMORY[0x1E4F68EA0] securityAccessoryTypeGroup];
  uint64_t v10 = objc_msgSend(v9, "hu_tintColor");
  [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB0]];

  id v11 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v20 = a3;
  id v5 = [v4 array];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HomeAccessScheduleSection"];
  v7 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
  v21[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v6 setItems:v8];

  v9 = HFLocalizedString();
  [v6 setHeaderTitle:v9];

  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuestScheduleItem_NewInviteUser_Footer", @"HURestrictedGuestScheduleItem_NewInviteUser_Footer", 1);
  [v6 setFooterTitle:v10];

  [v5 addObject:v6];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"AccessoriesSection"];
  id v12 = [(HUAddRestrictedGuestItemManager *)self transformedSecureAccessoryItemProvider];
  v13 = [v12 items];
  v14 = [v13 allObjects];
  id v15 = [MEMORY[0x1E4F69220] defaultItemComparator];
  uint64_t v16 = [v14 sortedArrayUsingComparator:v15];
  v17 = (void *)[v16 mutableCopy];

  [v11 setItems:v17];
  [v5 addObject:v11];
  v18 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v20];

  return v18;
}

- (void)updateAccessSchedule:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
    id v8 = [v7 schedule];
    int v17 = 136315650;
    v18 = (HUAddRestrictedGuestItemManager *)"-[HUAddRestrictedGuestItemManager updateAccessSchedule:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Requesting to update access schedule from %@ to %@", (uint8_t *)&v17, 0x20u);
  }
  if (v5)
  {
    v9 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
    [v9 setSchedule:v5];

    uint64_t v10 = (void *)MEMORY[0x1E4F69230];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
    v13 = [v11 setWithObject:v12];
    v14 = [v10 requestToUpdateItems:v13 senderSelector:a2];
    id v15 = [(HFItemManager *)self performItemUpdateRequest:v14];
  }
  else
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = NSStringFromSelector(a2);
      int v17 = 138412546;
      v18 = self;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@:%@ No access schedule defined. Cannot update access schedule.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)sendInvitesWithAllowedAccessories:(id)a3
{
  id v5 = a3;
  id v6 = [(HUAddRestrictedGuestItemManager *)self inviteeAddresses];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Invalid configuration. Unable to send invitations without invitee addresses", (uint8_t *)&location, 2u);
    }
  }
  v9 = [(HUAddRestrictedGuestItemManager *)self inviteeAddresses];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke;
  v24[3] = &unk_1E6389F30;
  v24[4] = self;
  uint64_t v10 = objc_msgSend(v9, "na_map:", v24);

  objc_initWeak(&location, self);
  id v11 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v10];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_130;
  v20[3] = &unk_1E6389FA8;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a2;
  id v12 = v5;
  id v21 = v12;
  v13 = [v11 flatMap:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_137;
  v18[3] = &unk_1E6389FD0;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  id v14 = (id)[v13 addFailureBlock:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_142;
  v16[3] = &unk_1E6389FF8;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a2;
  id v15 = (id)[v13 addSuccessBlock:v16];
  objc_destroyWeak(v17);
  objc_destroyWeak(v19);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 outgoingInvitations];

  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v3;
    __int16 v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_INFO, "Attempting to remove existing invitations that match address %@. Invitations: %@", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = [v12 invitee];
        id v14 = [v13 userID];
        char v15 = [v3 isEqualToString:v14];

        if (v15)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_124;
          v23[3] = &unk_1E6385090;
          v23[4] = v12;
          int v17 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v23];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          id v22[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2;
          void v22[3] = &unk_1E6386708;
          v22[4] = v12;
          v18 = [v17 addFailureBlock:v22];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_127;
          v20[3] = &unk_1E6387DC8;
          id v21 = v3;
          uint64_t v16 = [v18 addSuccessBlock:v20];

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_124(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelInviteWithCompletionHandler:a2];
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Removing existing invitation failed: %@ invitation: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_127(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_INFO, "Successfully removed existing invitation for %@", (uint8_t *)&v4, 0xCu);
  }
}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_130(id *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_131;
  v7[3] = &unk_1E6389F80;
  objc_copyWeak(v9, a1 + 5);
  v9[1] = a1[6];
  id v8 = a1[4];
  uint64_t v5 = [v4 futureWithCompletionHandlerAdapterBlock:v7];

  objc_destroyWeak(v9);

  return v5;
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_131(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v7 = [WeakRetained inviteeAddresses];
    *(_DWORD *)buf = 138412802;
    id v18 = WeakRetained;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Sending invitation(s) to address(es): %@", buf, 0x20u);
  }
  id v8 = [WeakRetained inviteeAddresses];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_132;
  id v14 = &unk_1E6389F58;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v15 = *(id *)(a1 + 32);
  uint64_t v9 = objc_msgSend(v8, "na_map:", &v11);

  uint64_t v10 = objc_msgSend(WeakRetained, "home", v11, v12, v13, v14);
  [v10 inviteUsersWithInviteInformation:v9 completionHandler:v3];

  objc_destroyWeak(&v16);
}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:*(void *)(a1 + 32)];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F2EBB8]) initWithUser:v4 administrator:0 remoteAccess:0 announceAccess:0 camerasAccessLevel:0 restrictedGuest:1 restrictedGuestHomeAccessSettings:v6];

  return v7;
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_137(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v7 = [WeakRetained inviteeAddresses];
    *(_DWORD *)buf = 138412802;
    id v22 = WeakRetained;
    __int16 v23 = 2112;
    long long v24 = v6;
    __int16 v25 = 2112;
    long long v26 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to send out invitation(s) to address(es): %@", buf, 0x20u);
  }
  id v8 = [WeakRetained inviteeAddresses];
  uint64_t v9 = [v8 count];
  uint64_t v10 = (id *)MEMORY[0x1E4F68760];
  if (v9 != 1) {
    uint64_t v10 = (id *)MEMORY[0x1E4F68768];
  }
  id v11 = *v10;

  uint64_t v12 = [WeakRetained restrictedGuestDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [WeakRetained restrictedGuestDelegate];
    [v14 restrictedGuestItemManager:WeakRetained didFailToSendInvitations:v3];
  }
  id v15 = [MEMORY[0x1E4F69110] sharedHandler];
  id v16 = objc_msgSend(WeakRetained, "inviteeAddresses", *MEMORY[0x1E4F68420]);
  int v17 = [v16 firstObject];
  id v20 = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v15 handleError:v3 operationType:v11 options:v18 retryBlock:0 cancelBlock:0];
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v7 = [WeakRetained inviteeAddresses];
    *(_DWORD *)buf = 138412802;
    id v20 = WeakRetained;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    long long v24 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully sent invitation(s) to address(es): %@", buf, 0x20u);
  }
  if ([v3 count])
  {
    id v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_144;
    id v16 = &unk_1E6387408;
    id v17 = WeakRetained;
    id v9 = v3;
    id v18 = v9;
    [v8 dispatchHomeObserverMessage:&v13 sender:0];

    uint64_t v10 = objc_msgSend(WeakRetained, "restrictedGuestDelegate", v13, v14, v15, v16, v17);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [WeakRetained restrictedGuestDelegate];
      [v12 restrictedGuestItemManager:WeakRetained didSendInvitations:v9];
    }
  }
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_144(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateStateForOutgoingInvitations:*(void *)(a1 + 40)];
  }
}

- (id)mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F2E9A8]);
  id v7 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
  id v8 = [v7 schedule];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F2EA70];
    uint64_t v10 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
    char v11 = [v10 schedule];
    uint64_t v12 = objc_msgSend(v9, "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v11);
    [v6 setGuestAccessSchedule:v12];

    uint64_t v13 = HFLogForCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    uint64_t v14 = NSStringFromSelector(a2);
    id v15 = [v6 guestAccessSchedule];
    id v16 = [(HUAddRestrictedGuestItemManager *)self homeScheduleItem];
    id v17 = [v16 schedule];
    int v25 = 138413058;
    long long v26 = self;
    __int16 v27 = 2112;
    v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Sending user invitation(s) with guest access schedule [%@] from schedule [%@].", (uint8_t *)&v25, 0x2Au);

    goto LABEL_4;
  }
  uint64_t v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    int v25 = 138412546;
    long long v26 = self;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@:%@ No access schedule defined for user invitation(s). Unexpected.", (uint8_t *)&v25, 0x16u);
LABEL_4:
  }
LABEL_6:

  if (v5)
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
    [v6 setAccessAllowedToAccessories:v18];

    uint64_t v19 = HFLogForCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v20 = NSStringFromSelector(a2);
    int v25 = 138412802;
    long long v26 = self;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    id v30 = v5;
    __int16 v21 = "%@:%@ Sending user invitation(s) with allowed accessories [%@].";
    id v22 = v19;
    uint32_t v23 = 32;
  }
  else
  {
    uint64_t v19 = HFLogForCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v20 = NSStringFromSelector(a2);
    int v25 = 138412546;
    long long v26 = self;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v21 = "%@:%@ No allowed accessories defined for user invitation(s).";
    id v22 = v19;
    uint32_t v23 = 22;
  }
  _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, v23);

LABEL_12:

  return v6;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUAddRestrictedGuestItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_accessoryToSymbolIconIdentifier:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_primaryService");
  id v4 = [v3 serviceType];

  if ([v4 isEqualToString:*MEMORY[0x1E4F2DE18]])
  {
    id v5 = (id *)MEMORY[0x1E4F68CF8];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F2DE88]])
  {
    id v5 = (id *)MEMORY[0x1E4F68D08];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F2DE38]])
  {
    id v5 = (id *)MEMORY[0x1E4F68D00];
  }
  else
  {
    int v6 = [v4 isEqualToString:*MEMORY[0x1E4F2DEB0]];
    id v5 = (id *)MEMORY[0x1E4F68D18];
    if (v6) {
      id v5 = (id *)MEMORY[0x1E4F68D10];
    }
  }
  id v7 = *v5;

  return v7;
}

- (HUAddRestrictedGuestItemManagerDelegate)restrictedGuestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restrictedGuestDelegate);

  return (HUAddRestrictedGuestItemManagerDelegate *)WeakRetained;
}

- (void)setRestrictedGuestDelegate:(id)a3
{
}

- (NSArray)inviteeAddresses
{
  return self->_inviteeAddresses;
}

- (HFSchedule)defaultAccessSchedule
{
  return self->_defaultAccessSchedule;
}

- (HURestrictedGuestScheduleItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
}

- (HFTransformItemProvider)transformedSecureAccessoryItemProvider
{
  return self->_transformedSecureAccessoryItemProvider;
}

- (void)setTransformedSecureAccessoryItemProvider:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFAccessoryItemProvider)secureAccessoryItemProvider
{
  return self->_secureAccessoryItemProvider;
}

- (void)setSecureAccessoryItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_transformedSecureAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
  objc_storeStrong((id *)&self->_defaultAccessSchedule, 0);
  objc_storeStrong((id *)&self->_inviteeAddresses, 0);

  objc_destroyWeak((id *)&self->_restrictedGuestDelegate);
}

@end