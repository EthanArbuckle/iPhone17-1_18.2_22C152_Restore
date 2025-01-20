@interface HUPersonalRequestsEditorItemManager
- (BOOL)_arePersonalRequestsEnabled;
- (BOOL)activityNotificationsEnabled;
- (BOOL)onlyShowDeviceSwitches;
- (BOOL)personalRequestsAuthenticationRequired;
- (HFItem)activityNotificationsItem;
- (HFStaticItemProvider)staticItemProvider;
- (HMAssistantAccessControl)accessControl;
- (HMHome)homeForUser;
- (HMUser)user;
- (HULocationDeviceManager)locationDeviceManager;
- (HUPersonalRequestsDevicesItemModule)prDevicesModule;
- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 accessorySettingItem:(id)a5 module:(id)a6 onlyShowDeviceSwitches:(BOOL)a7;
- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 onlyShowDeviceSwitches:(BOOL)a5;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_commitUpdateToAccessControl:(id)a3;
- (void)_updateRequiredAuthSectionFooterForSection:(id)a3;
- (void)setActivityNotificationsEnabled:(BOOL)a3;
- (void)setLocationDeviceManager:(id)a3;
- (void)setOnlyShowDeviceSwitches:(BOOL)a3;
- (void)setPersonalRequestsAuthenticationRequired:(BOOL)a3;
- (void)setPrDevicesModule:(id)a3;
@end

@implementation HUPersonalRequestsEditorItemManager

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalRequestsEditorItemManager.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUPersonalRequestsEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 onlyShowDeviceSwitches:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUPersonalRequestsEditorItemManager;
  v9 = [(HFItemManager *)&v20 initWithDelegate:a3 sourceItem:v8];
  if (v9)
  {
    uint64_t v10 = [v8 home];
    homeForUser = v9->_homeForUser;
    v9->_homeForUser = (HMHome *)v10;

    v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v13 = [v12 homeManager];
    v14 = objc_msgSend(v13, "hf_accessorySettingsController");

    v15 = [[HUPersonalRequestsDevicesItemModule alloc] initWithItemUpdater:v9 userItem:v8 home:v9->_homeForUser settingsController:v14 onlyShowDeviceSwitches:v5];
    prDevicesModule = v9->_prDevicesModule;
    v9->_prDevicesModule = v15;

    uint64_t v17 = +[HULocationDeviceManager sharedInstance];
    locationDeviceManager = v9->_locationDeviceManager;
    v9->_locationDeviceManager = (HULocationDeviceManager *)v17;

    v9->_onlyShowDeviceSwitches = v5;
  }

  return v9;
}

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 accessorySettingItem:(id)a5 module:(id)a6 onlyShowDeviceSwitches:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HUPersonalRequestsEditorItemManager;
  v13 = [(HFItemManager *)&v22 initWithDelegate:a3 sourceItem:v11];
  if (v13)
  {
    uint64_t v14 = [v11 home];
    homeForUser = v13->_homeForUser;
    v13->_homeForUser = (HMHome *)v14;

    v16 = [HUPersonalRequestsDevicesItemModule alloc];
    uint64_t v17 = v13->_homeForUser;
    v18 = [v12 settingsController];
    uint64_t v19 = [(HUPersonalRequestsDevicesItemModule *)v16 initWithItemUpdater:v13 userItem:v11 home:v17 settingsController:v18 onlyShowDeviceSwitches:v7];
    prDevicesModule = v13->_prDevicesModule;
    v13->_prDevicesModule = (HUPersonalRequestsDevicesItemModule *)v19;

    v13->_onlyShowDeviceSwitches = v7;
  }

  return v13;
}

- (HMUser)user
{
  v2 = [(HFItemManager *)self sourceItem];
  v3 = [v2 user];

  return (HMUser *)v3;
}

- (HMAssistantAccessControl)accessControl
{
  v3 = [(HFItemManager *)self sourceItem];
  v4 = [v3 user];
  BOOL v5 = [(HUPersonalRequestsEditorItemManager *)self homeForUser];
  v6 = [v4 assistantAccessControlForHome:v5];

  return (HMAssistantAccessControl *)v6;
}

- (BOOL)_arePersonalRequestsEnabled
{
  v3 = [(HUPersonalRequestsEditorItemManager *)self homeForUser];
  uint64_t v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

  BOOL v5 = [(HUPersonalRequestsEditorItemManager *)self accessControl];
  v6 = [(HUPersonalRequestsEditorItemManager *)self prDevicesModule];
  BOOL v7 = [v6 supportedMULanguageCodes];
  LOBYTE(v4) = objc_msgSend(v5, "hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:currentUserIsOwner:", v7, v4);

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  if ([(HUPersonalRequestsEditorItemManager *)self onlyShowDeviceSwitches])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = [(HUPersonalRequestsEditorItemManager *)self staticItemProvider];

    if (!v6)
    {
      BOOL v7 = objc_opt_new();
      id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __66__HUPersonalRequestsEditorItemManager__buildItemProvidersForHome___block_invoke;
      objc_super v20 = &unk_1E6384FD0;
      objc_copyWeak(&v21, &location);
      v9 = (HFItem *)[v8 initWithResultsBlock:&v17];
      activityNotificationsItem = self->_activityNotificationsItem;
      self->_activityNotificationsItem = v9;

      id v11 = [(HUPersonalRequestsEditorItemManager *)self activityNotificationsItem];
      [v7 addObject:v11];

      id v12 = (HFStaticItemProvider *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v7];
      staticItemProvider = self->_staticItemProvider;
      self->_staticItemProvider = v12;

      objc_destroyWeak(&v21);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
    v15 = [(HUPersonalRequestsEditorItemManager *)self staticItemProvider];
    BOOL v5 = [v14 arrayWithObject:v15];

    objc_destroyWeak(&location);
  }

  return v5;
}

id __66__HUPersonalRequestsEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsActivityNotificationsTitle", @"HUUsersPersonalRequestsActivityNotificationsTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v5 = [WeakRetained user];
  v6 = objc_msgSend(v4, "setWithObjects:", v5, 0);
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "_arePersonalRequestsEnabled") ^ 1);
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v8 = [WeakRetained accessControl];
  if ([v8 areActivityNotificationsEnabledForPersonalRequests]) {
    v9 = &unk_1F19B48B0;
  }
  else {
    v9 = &unk_1F19B48C8;
  }
  [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v10;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [(HUPersonalRequestsEditorItemManager *)self prDevicesModule];
  BOOL v5 = [v3 arrayWithObject:v4];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [(HUPersonalRequestsEditorItemManager *)self prDevicesModule];
    BOOL v7 = [v6 buildSectionsWithDisplayedItems:v4];
    [v5 addObjectsFromArray:v7];

    if (![(HUPersonalRequestsEditorItemManager *)self onlyShowDeviceSwitches])
    {
      id v8 = (void *)MEMORY[0x1E4F1CAD0];
      v9 = [(HUPersonalRequestsEditorItemManager *)self activityNotificationsItem];
      v16[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      id v11 = [v8 setWithArray:v10];
      id v12 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v11);

      if ([v12 count])
      {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"kHUEditUserPersonalRequestsRequireAuthSection"];
        uint64_t v14 = [v12 allObjects];
        [v13 setItems:v14];

        [(HUPersonalRequestsEditorItemManager *)self _updateRequiredAuthSectionFooterForSection:v13];
        [v5 addObject:v13];
      }
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BOOL)personalRequestsAuthenticationRequired
{
  id v2 = [(HUPersonalRequestsEditorItemManager *)self accessControl];
  char v3 = [v2 allowUnauthenticatedRequests] ^ 1;

  return v3;
}

- (void)setActivityNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"NO";
    if (v3) {
      BOOL v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Setting activityNotificationsEnabled to: %@", buf, 0xCu);
  }

  id v8 = [(HUPersonalRequestsEditorItemManager *)self accessControl];
  v9 = (void *)[v8 mutableCopy];

  [v9 setActivityNotificationsEnabledForPersonalRequests:v3];
  uint64_t v10 = [(HUPersonalRequestsEditorItemManager *)self _commitUpdateToAccessControl:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HUPersonalRequestsEditorItemManager_setActivityNotificationsEnabled___block_invoke;
  v12[3] = &unk_1E63877D0;
  v12[4] = self;
  v12[5] = a2;
  id v11 = (id)[v10 addCompletionBlock:v12];
}

void __71__HUPersonalRequestsEditorItemManager_setActivityNotificationsEnabled___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)MEMORY[0x1E4F69230];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v2 activityNotificationsItem];
  id v5 = objc_msgSend(v4, "setWithObjects:", v8, 0);
  v6 = [v3 requestToUpdateItems:v5 senderSelector:*(void *)(a1 + 40)];
  id v7 = (id)[v2 performItemUpdateRequest:v6];
}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke;
  v18[3] = &unk_1E63877F8;
  id v6 = v4;
  id v19 = v6;
  objc_super v20 = self;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_38;
  uint64_t v15 = &unk_1E63859F8;
  v16 = self;
  id v17 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:&v12];
  id v10 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_167, v12, v13, v14, v15, v16);

  return v7;
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to assistant access control: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [*(id *)(a1 + 40) user];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) home];
  [v6 updateAssistantAccessControl:v7 forHome:v8 completionHandler:v3];
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_38(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6387820;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchUserObserverMessage:v4 sender:0];
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [v3 currentUser];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) home];
    [v7 user:v4 didUpdateAssistantAccessControl:v5 forHome:v6];
  }
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (void)_updateRequiredAuthSectionFooterForSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUPersonalRequestsEditorItemManager *)self locationDeviceManager];
  id v6 = [v5 activeLocationDeviceFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__HUPersonalRequestsEditorItemManager__updateRequiredAuthSectionFooterForSection___block_invoke;
  v9[3] = &unk_1E638BCE8;
  id v10 = v4;
  id v7 = v4;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

void __82__HUPersonalRequestsEditorItemManager__updateRequiredAuthSectionFooterForSection___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v10 = [a2 name];
    int v9 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsActivityNotificationsFooterItem", @"%@", v3, v4, v5, v6, v7, v8, (uint64_t)v10);
    [*(id *)(a1 + 32) setFooterTitle:v9];
  }
}

- (HUPersonalRequestsDevicesItemModule)prDevicesModule
{
  return self->_prDevicesModule;
}

- (void)setPrDevicesModule:(id)a3
{
}

- (void)setPersonalRequestsAuthenticationRequired:(BOOL)a3
{
  self->_personalRequestsAuthenticationRequired = a3;
}

- (HFItem)activityNotificationsItem
{
  return self->_activityNotificationsItem;
}

- (BOOL)activityNotificationsEnabled
{
  return self->_activityNotificationsEnabled;
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
}

- (BOOL)onlyShowDeviceSwitches
{
  return self->_onlyShowDeviceSwitches;
}

- (void)setOnlyShowDeviceSwitches:(BOOL)a3
{
  self->_onlyShowDeviceSwitches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_activityNotificationsItem, 0);

  objc_storeStrong((id *)&self->_prDevicesModule, 0);
}

@end