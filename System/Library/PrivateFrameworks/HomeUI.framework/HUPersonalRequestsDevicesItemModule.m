@interface HUPersonalRequestsDevicesItemModule
- (BOOL)_showPersonalRequestsItems;
- (BOOL)_voiceRecognitionLanguage:(id)a3 matchesMultiUserCapableAccessory:(id)a4;
- (BOOL)isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:(id)a3;
- (BOOL)isItemPersonalRequestsDevice:(id)a3;
- (BOOL)isItemPersonalRequestsToggle:(id)a3;
- (BOOL)onlyShowDeviceSwitches;
- (BOOL)recognitionLanguageIsSupportedVRLanguageForCurrentDevice;
- (BOOL)recognitionLanguageIsSupportedVRLanguageForItem:(id)a3;
- (HFItem)personalRequestsToggleItem;
- (HFItemProvider)personalRequestsMediaAccessoriesProvider;
- (HFItemProvider)personalRequestsOtherAccessoriesProvider;
- (HFMediaProfileContainer)sourceMediaProfileContainer;
- (HFUserItem)sourceItem;
- (HMAssistantAccessControl)accessControl;
- (HMHome)home;
- (HULocationDeviceManager)locationDeviceManager;
- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 onlyShowDeviceSwitches:(BOOL)a6;
- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 settingsController:(id)a6 onlyShowDeviceSwitches:(BOOL)a7;
- (NAFuture)activeLocationDeviceFuture;
- (NSArray)personalRequestsDevices;
- (NSArray)supportedMULanguageCodes;
- (NSMapTable)mediaProfileToLanguageOptionsManagerMap;
- (NSSet)itemProviders;
- (id)_attributedFooterTitle;
- (id)_commitUpdateToAccessControl:(id)a3;
- (id)_createPersonalRequestProviderForMediaAccessories;
- (id)_createPersonalRequestProviderForOtherAccessories;
- (id)_transformItemForSourceItem:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)recognitionLanguageForItem:(id)a3;
- (id)updateLocationDeviceToThisDevice;
- (void)_createItemProviders;
- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4;
- (void)registerForExternalUpdates;
- (void)setMediaProfileToLanguageOptionsManagerMap:(id)a3;
- (void)setOnlyShowDeviceSwitches:(BOOL)a3;
- (void)setPersonalRequestsDevices:(id)a3;
- (void)setPersonalRequestsMediaAccessoriesProvider:(id)a3;
- (void)setPersonalRequestsOtherAccessoriesProvider:(id)a3;
- (void)setSourceMediaProfileContainer:(id)a3;
- (void)setSupportedMULanguageCodes:(id)a3;
- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4;
- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4;
- (void)toggleAllPersonalRequestsDevices;
- (void)turnOnAllPersonalRequestsDevices;
- (void)turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices;
- (void)unregisterForExternalUpdates;
@end

@implementation HUPersonalRequestsDevicesItemModule

- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 onlyShowDeviceSwitches:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUPersonalRequestsDevicesItemModule.m", 46, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)HUPersonalRequestsDevicesItemModule;
  v14 = [(HFItemModule *)&v20 initWithItemUpdater:v11];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a5);
    objc_storeStrong((id *)&v15->_sourceItem, a4);
    v15->_onlyShowDeviceSwitches = a6;
    if (![(HUPersonalRequestsDevicesItemModule *)v15 onlyShowDeviceSwitches])
    {
      uint64_t v16 = +[HULocationDeviceManager sharedInstance];
      locationDeviceManager = v15->_locationDeviceManager;
      v15->_locationDeviceManager = (HULocationDeviceManager *)v16;
    }
    [(HUPersonalRequestsDevicesItemModule *)v15 _createItemProviders];
  }

  return v15;
}

- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 settingsController:(id)a6 onlyShowDeviceSwitches:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v15)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HUPersonalRequestsDevicesItemModule.m", 70, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)HUPersonalRequestsDevicesItemModule;
  v17 = [(HFItemModule *)&v31 initWithItemUpdater:v13];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a5);
    objc_storeStrong((id *)&v18->_sourceItem, a4);
    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    mediaProfileToLanguageOptionsManagerMap = v18->_mediaProfileToLanguageOptionsManagerMap;
    v18->_mediaProfileToLanguageOptionsManagerMap = (NSMapTable *)v19;

    v21 = [(HUPersonalRequestsDevicesItemModule *)v18 home];
    v22 = objc_msgSend(v21, "hf_personalRequestAccessories");

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __115__HUPersonalRequestsDevicesItemModule_initWithItemUpdater_userItem_home_settingsController_onlyShowDeviceSwitches___block_invoke;
    v28[3] = &unk_1E6387788;
    v23 = v18;
    v29 = v23;
    SEL v30 = a2;
    objc_msgSend(v22, "na_each:", v28);
    v23->_onlyShowDeviceSwitches = a7;
    if (![(HUPersonalRequestsDevicesItemModule *)v23 onlyShowDeviceSwitches])
    {
      uint64_t v24 = +[HULocationDeviceManager sharedInstance];
      locationDeviceManager = v23->_locationDeviceManager;
      v23->_locationDeviceManager = (HULocationDeviceManager *)v24;
    }
    [(HUPersonalRequestsDevicesItemModule *)v23 _createItemProviders];
  }
  return v18;
}

void __115__HUPersonalRequestsDevicesItemModule_initWithItemUpdater_userItem_home_settingsController_onlyShowDeviceSwitches___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_msgSend(v3, "hf_isSiriEndpoint") & 1) != 0
    || ([MEMORY[0x1E4F691A0] sharedDispatcher],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 homeManager],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasOptedToHH2],
        v5,
        v4,
        v6))
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v14 = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Creating Siri language options manager for accessory: %@", (uint8_t *)&v14, 0x20u);
    }
    v10 = [v3 mediaProfile];
    id v11 = objc_msgSend(v10, "hf_siriLanguageOptionsManager");

    id v12 = [*(id *)(a1 + 32) mediaProfileToLanguageOptionsManagerMap];
    id v13 = [v3 mediaProfile];
    [v12 setObject:v11 forKey:v13];
  }
}

- (void)registerForExternalUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
  {
    id v3 = [(HUPersonalRequestsDevicesItemModule *)self locationDeviceManager];
    [v3 addObserver:self];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(HUPersonalRequestsDevicesItemModule *)self mediaProfileToLanguageOptionsManagerMap];
  v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addObserver:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)unregisterForExternalUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
  {
    id v3 = [(HUPersonalRequestsDevicesItemModule *)self locationDeviceManager];
    [v3 removeObserver:self];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(HUPersonalRequestsDevicesItemModule *)self mediaProfileToLanguageOptionsManagerMap];
  v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeObserver:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (HMAssistantAccessControl)accessControl
{
  id v3 = [(HUPersonalRequestsDevicesItemModule *)self sourceItem];
  v4 = [v3 user];
  v5 = [(HUPersonalRequestsDevicesItemModule *)self home];
  uint64_t v6 = [v4 assistantAccessControlForHome:v5];

  return (HMAssistantAccessControl *)v6;
}

- (void)_createItemProviders
{
  if (self->_itemProviders)
  {
    NSLog(&cfstr_Createitemprov.isa, a2);
  }
  else
  {
    objc_initWeak(&location, self);
    id v3 = [(HUPersonalRequestsDevicesItemModule *)self _createPersonalRequestProviderForMediaAccessories];
    [(HUPersonalRequestsDevicesItemModule *)self setPersonalRequestsMediaAccessoriesProvider:v3];

    v4 = [(HUPersonalRequestsDevicesItemModule *)self _createPersonalRequestProviderForOtherAccessories];
    [(HUPersonalRequestsDevicesItemModule *)self setPersonalRequestsOtherAccessoriesProvider:v4];

    if ([(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
    {
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
      uint64_t v7 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
      objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
      uint64_t v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
      itemProviders = self->_itemProviders;
      self->_itemProviders = v8;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__HUPersonalRequestsDevicesItemModule__createItemProviders__block_invoke;
      v20[3] = &unk_1E6384FD0;
      objc_copyWeak(&v21, &location);
      long long v11 = (HFItem *)[v10 initWithResultsBlock:v20];
      personalRequestsToggleItem = self->_personalRequestsToggleItem;
      self->_personalRequestsToggleItem = v11;

      long long v13 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsToggleItem];
      [v6 addObject:v13];

      int v14 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v6];
      uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v16 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
      v17 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
      objc_msgSend(v15, "setWithObjects:", v16, v17, v14, 0);
      __int16 v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
      id v19 = self->_itemProviders;
      self->_itemProviders = v18;

      objc_destroyWeak(&v21);
    }

    objc_destroyWeak(&location);
  }
}

id __59__HUPersonalRequestsDevicesItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained personalRequestsDevices];
  [v2 count];

  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = *MEMORY[0x1E4F68AB8];
  v4 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequests", @"HUUsersPersonalRequests", 1);
  v14[0] = v4;
  v13[1] = *MEMORY[0x1E4F68BC0];
  v5 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  v14[1] = v5;
  v13[2] = *MEMORY[0x1E4F68908];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [WeakRetained sourceItem];
  uint64_t v8 = [v7 user];
  uint64_t v9 = objc_msgSend(v6, "na_setWithSafeObject:", v8);
  v14[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  long long v11 = [v3 futureWithResult:v10];

  return v11;
}

- (BOOL)_showPersonalRequestsItems
{
  id v3 = [(HUPersonalRequestsDevicesItemModule *)self home];
  v4 = [v3 currentUser];
  v5 = [(HUPersonalRequestsDevicesItemModule *)self sourceItem];
  uint64_t v6 = [v5 user];
  if ([v4 isEqual:v6])
  {
    uint64_t v7 = [(HUPersonalRequestsDevicesItemModule *)self accessControl];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count]
    && [(HUPersonalRequestsDevicesItemModule *)self _showPersonalRequestsItems])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v7 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
    BOOL v8 = [v7 items];
    uint64_t v9 = [v8 allObjects];
    id v10 = [v6 arrayWithArray:v9];

    long long v11 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
    long long v12 = [v11 items];
    long long v13 = [v12 allObjects];
    [v10 addObjectsFromArray:v13];

    int v14 = [v10 sortedArrayUsingComparator:&__block_literal_global_44];
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    __int16 v16 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v15);

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMEPOD_PERSONAL_REQUESTS_DEVICES"];
    __int16 v18 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsHomePodsSectionTitle", @"HUUsersPersonalRequestsHomePodsSectionTitle", 1);
    [v17 setHeaderTitle:v18];

    id v19 = [v16 allObjects];
    uint64_t v20 = [MEMORY[0x1E4F69758] comparatorWithSortedObjects:v14];
    id v21 = [v19 sortedArrayUsingComparator:v20];
    [v17 setItems:v21];

    if (![(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
    {
      v22 = [(HUPersonalRequestsDevicesItemModule *)self _attributedFooterTitle];
      [v17 setAttributedFooterTitle:v22];
    }
    [v5 addObject:v17];
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

uint64_t __71__HUPersonalRequestsDevicesItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F68AB8]];
  BOOL v8 = [v4 latestResults];

  uint64_t v9 = [v8 objectForKey:v6];
  uint64_t v10 = [v7 localizedStandardCompare:v9];

  return v10;
}

- (BOOL)isItemPersonalRequestsToggle:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsToggleItem];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)isItemPersonalRequestsDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
  char v6 = [v5 items];
  if ([v6 containsObject:v4])
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
    uint64_t v9 = [v8 items];
    char v7 = [v9 containsObject:v4];
  }
  return v7;
}

- (NSArray)personalRequestsDevices
{
  v2 = [(HUPersonalRequestsDevicesItemModule *)self accessControl];
  id v3 = [v2 accessories];

  return (NSArray *)v3;
}

- (void)toggleAllPersonalRequestsDevices
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsDevices];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    char v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = NSStringFromSelector(a2);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Setting Personal Request devices to empty array.", (uint8_t *)&v8, 0xCu);
    }
    [(HUPersonalRequestsDevicesItemModule *)self setPersonalRequestsDevices:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    [(HUPersonalRequestsDevicesItemModule *)self turnOnAllPersonalRequestsDevices];
  }
}

- (void)turnOnAllPersonalRequestsDevices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    char v6 = [(HUPersonalRequestsDevicesItemModule *)self home];
    char v7 = objc_msgSend(v6, "hf_personalRequestAccessories");
    int v10 = 138412546;
    long long v11 = v5;
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ Setting Personal Request devices to %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [(HUPersonalRequestsDevicesItemModule *)self home];
  uint64_t v9 = objc_msgSend(v8, "hf_personalRequestAccessories");
  [(HUPersonalRequestsDevicesItemModule *)self setPersonalRequestsDevices:v9];
}

- (BOOL)_voiceRecognitionLanguage:(id)a3 matchesMultiUserCapableAccessory:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [a4 mediaProfile];
  uint64_t v9 = [v8 accessory];
  char v10 = [v9 supportsMultiUser];

  if (v10)
  {
    long long v11 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v8];
    __int16 v12 = v11;
    if (v11)
    {
      long long v13 = [v11 recognitionLanguage];
      int v14 = [v13 isEqualToString:v7];
      uint64_t v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = NSStringFromSelector(a2);
        int v20 = 138413314;
        id v21 = self;
        __int16 v22 = 2112;
        v23 = v16;
        __int16 v24 = 1024;
        *(_DWORD *)v25 = v14;
        *(_WORD *)&v25[4] = 2112;
        *(void *)&v25[6] = v13;
        __int16 v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Supported voice recognition language matches Siri language?: %{BOOL}d: %@, on %@", (uint8_t *)&v20, 0x30u);
      }
    }
    else
    {
      long long v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = NSStringFromSelector(a2);
        int v20 = 138412802;
        id v21 = self;
        __int16 v22 = 2112;
        v23 = v18;
        __int16 v24 = 2112;
        *(void *)v25 = v8;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ HomePod does not have Siri Language: %@", (uint8_t *)&v20, 0x20u);
      }
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    __int16 v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = NSStringFromSelector(a2);
      int v20 = 138412802;
      id v21 = self;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      *(void *)v25 = v8;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory does not support multi user features (voice recognition): %@", (uint8_t *)&v20, 0x20u);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
  uint64_t v5 = [v4 languageCode];

  char v6 = [(HUPersonalRequestsDevicesItemModule *)self home];
  id v7 = objc_msgSend(v6, "hf_personalRequestAccessories");

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke;
  uint64_t v15 = &unk_1E6387070;
  __int16 v16 = self;
  id v8 = v5;
  id v17 = v8;
  uint64_t v9 = objc_msgSend(v7, "na_filter:", &v12);
  char v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ turning on Personal Requests for all HomePods on %@ & that support voice recognition: %@", buf, 0x2Au);
  }
  -[HUPersonalRequestsDevicesItemModule setPersonalRequestsDevices:](self, "setPersonalRequestsDevices:", v9, v12, v13, v14, v15, v16);
}

uint64_t __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mediaProfile];
  if ([v4 isContainedWithinItemGroup])
  {
    uint64_t v5 = [*(id *)(a1 + 32) home];
    uint64_t v6 = objc_msgSend(v5, "hf_mediaSystemForAccessory:", v3);

    id v4 = (void *)v6;
  }
  id v7 = [v4 accessories];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke_2;
  v11[3] = &unk_1E6387070;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v9 = objc_msgSend(v7, "na_all:", v11);

  return v9;
}

uint64_t __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _voiceRecognitionLanguage:*(void *)(a1 + 40) matchesMultiUserCapableAccessory:a2];
}

- (void)setPersonalRequestsDevices:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUPersonalRequestsDevicesItemModule *)self accessControl];
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v7 setAccessories:v5];
    [v7 setAllowUnauthenticatedRequests:1];
    id v8 = [(HUPersonalRequestsDevicesItemModule *)self _commitUpdateToAccessControl:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__HUPersonalRequestsDevicesItemModule_setPersonalRequestsDevices___block_invoke;
    v10[3] = &unk_1E63877D0;
    v10[4] = self;
    v10[5] = a2;
    id v9 = (id)[v8 addCompletionBlock:v10];
  }
}

void __66__HUPersonalRequestsDevicesItemModule_setPersonalRequestsDevices___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) itemUpdater];
  v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [*(id *)(a1 + 32) personalRequestsMediaAccessoriesProvider];
  id v5 = [*(id *)(a1 + 32) personalRequestsOtherAccessoriesProvider];
  uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  id v7 = [v2 requestToReloadItemProviders:v6 senderSelector:*(void *)(a1 + 40)];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (NAFuture)activeLocationDeviceFuture
{
  if ([(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v4 = [(HUPersonalRequestsDevicesItemModule *)self locationDeviceManager];
    id v3 = [v4 activeLocationDeviceFuture];
  }

  return (NAFuture *)v3;
}

- (id)updateLocationDeviceToThisDevice
{
  if ([(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches]) {
    NSLog(&cfstr_WeShouldNeverC.isa);
  }
  if ([(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
  {
    id v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Updating location device to this device...", buf, 2u);
    }

    uint64_t v6 = [(HUPersonalRequestsDevicesItemModule *)self locationDeviceManager];
    id v7 = [v6 updateActiveLocationDeviceToThisDevice];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke;
    v12[3] = &unk_1E6384D58;
    v12[4] = self;
    v12[5] = a2;
    id v8 = [v7 addSuccessBlock:v12];
    id v9 = [v8 addFailureBlock:&__block_literal_global_47];
    char v10 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v4 = [v9 reschedule:v10];
  }

  return v4;
}

void __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke(uint64_t a1)
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated location device to this device", v8, 2u);
  }

  id v3 = [*(id *)(a1 + 32) itemUpdater];
  id v4 = (void *)MEMORY[0x1E4F69230];
  id v5 = [*(id *)(a1 + 32) allItems];
  uint64_t v6 = [v4 requestToUpdateItems:v5 senderSelector:*(void *)(a1 + 40)];
  id v7 = (id)[v3 performItemUpdateRequest:v6];
}

void __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Failed to update active location device: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(HUPersonalRequestsDevicesItemModule *)self recognitionLanguageForItem:a3];
  uint64_t v6 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v7 = [v6 languageCode];

  int v8 = [v5 isEqualToString:v7];
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = NSStringFromSelector(a2);
    int v12 = 138413314;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri language on this device (%@) matches Siri Language on Accessory (%@)?: %{BOOL}d", (uint8_t *)&v12, 0x30u);
  }
  return v8;
}

- (id)recognitionLanguageForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  if (v6)
  {
    objc_opt_class();
    id v7 = v4;
    if (objc_opt_isKindOfClass()) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    id v9 = v8;

    char v10 = [v9 sourceItem];
    if (objc_opt_isKindOfClass()) {
      long long v11 = v10;
    }
    else {
      long long v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = objc_opt_class();
    objc_opt_class();
    id v14 = v7;
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    id v17 = [v16 sourceItem];
    if (objc_opt_isKindOfClass()) {
      __int16 v18 = v17;
    }
    else {
      __int16 v18 = 0;
    }
    id v19 = v18;
  }
  else
  {
    id v20 = v4;
    if (objc_opt_isKindOfClass()) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    id v12 = v21;

    uint64_t v13 = objc_opt_class();
    id v16 = v20;
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v16;
    }
    else {
      uint64_t v22 = 0;
    }
    id v19 = v22;
  }

  if (v12)
  {
    [v12 mediaProfileContainer];
  }
  else
  {
    id v16 = [v19 accessories];
    uint64_t v13 = [v16 anyObject];
    [v13 mediaProfile];
  id v23 = };
  id v24 = v23;
  if ([v24 conformsToProtocol:&unk_1F1AD86A8]) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  id v26 = v25;

  if (!v12)
  {

    id v23 = v16;
  }

  v27 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v26];

  uint64_t v28 = [v27 recognitionLanguage];

  return v28;
}

- (BOOL)recognitionLanguageIsSupportedVRLanguageForItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUPersonalRequestsDevicesItemModule *)self supportedMULanguageCodes];
  id v7 = [(HUPersonalRequestsDevicesItemModule *)self recognitionLanguageForItem:v5];

  int v8 = [v6 containsObject:v7];
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = NSStringFromSelector(a2);
    int v12 = 138412802;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory language is a supported voice recognition language?: %{BOOL}d", (uint8_t *)&v12, 0x1Cu);
  }
  return v8;
}

- (BOOL)recognitionLanguageIsSupportedVRLanguageForCurrentDevice
{
  id v2 = [(HUPersonalRequestsDevicesItemModule *)self supportedMULanguageCodes];
  id v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v4 = [v3 languageCode];
  char v5 = [v2 containsObject:v4];

  return v5;
}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke;
  v18[3] = &unk_1E63877F8;
  id v6 = v4;
  id v19 = v6;
  id v20 = self;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_300;
  uint64_t v15 = &unk_1E63859F8;
  __int16 v16 = self;
  id v17 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:&v12];
  id v10 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_305, v12, v13, v14, v15, v16);

  return v7;
}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to assistant access control: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [*(id *)(a1 + 40) sourceItem];
  id v7 = [v6 user];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) home];
  [v7 updateAssistantAccessControl:v8 forHome:v9 completionHandler:v3];
}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_300(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6387820;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchUserObserverMessage:v4 sender:0];
}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
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

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (id)_createPersonalRequestProviderForMediaAccessories
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F69288]);
  id v4 = [(HUPersonalRequestsDevicesItemModule *)self home];
  uint64_t v5 = (void *)[v3 initWithHome:v4];

  [v5 setFilter:&__block_literal_global_310];
  id v6 = objc_alloc(MEMORY[0x1E4F696B0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_3;
  v9[3] = &unk_1E6387868;
  objc_copyWeak(&v10, &location);
  id v7 = (void *)[v6 initWithSourceProvider:v5 transformationBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1AD86A8]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 accessories];
    uint64_t v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_312);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [MEMORY[0x1E4F2E670] isAccessorySupported:v2];
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2E670] isAccessorySupported:a2];
}

id __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _transformItemForSourceItem:v3];

  return v5;
}

- (id)_createPersonalRequestProviderForOtherAccessories
{
  id v3 = objc_alloc(MEMORY[0x1E4F68E20]);
  id v4 = [(HUPersonalRequestsDevicesItemModule *)self home];
  uint64_t v5 = (void *)[v3 initWithHome:v4];

  [v5 setFilter:&__block_literal_global_319];
  id v6 = objc_alloc(MEMORY[0x1E4F696B0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke_2;
  v9[3] = &unk_1E6387890;
  void v9[4] = self;
  uint64_t v7 = (void *)[v6 initWithSourceProvider:v5 transformationBlock:v9];

  return v7;
}

void *__88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke(uint64_t a1, void *a2)
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

  if (!v5) {
    goto LABEL_8;
  }
  id v6 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v5, "hf_primaryService");

    if (v7)
    {
      id v6 = (void *)[MEMORY[0x1E4F2E670] isAccessorySupported:v5];
      goto LABEL_9;
    }
LABEL_8:
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _transformItemForSourceItem:a2];
}

- (id)_transformItemForSourceItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke;
  v9[3] = &unk_1E63878B8;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = (void *)[v5 initWithSourceItem:v6 transformationBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [*(id *)(v2 + 32) accessories];
  v79 = [v6 anyObject];

  uint64_t v7 = (void *)[v4 mutableCopy];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v8;

  id v10 = [WeakRetained accessControl];
  id v11 = [v10 accessories];

  objc_opt_class();
  id v12 = *(id *)(v2 + 32);
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = *(id *)(v2 + 32);
  if (objc_opt_isKindOfClass()) {
    __int16 v16 = v15;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;

  v78 = v17;
  if (v14)
  {
    uint64_t v18 = [v14 accessories];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_2;
    v82[3] = &unk_1E63869C8;
    id v83 = v11;
    char v19 = objc_msgSend(v18, "na_any:", v82);

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    if (!v17) {
      goto LABEL_19;
    }
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_4;
    v80[3] = &unk_1E63869C8;
    id v81 = v17;
    int v20 = objc_msgSend(v11, "na_any:", v80);

    if (!v20) {
      goto LABEL_19;
    }
  }
  int v21 = [WeakRetained accessControl];
  char v22 = [v21 allowUnauthenticatedRequests];

  if ((v22 & 1) == 0)
  {
    id v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v79;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Forcing PR OFF for %@ because the user previously had allowUnauthenticatedRequests set to NO", buf, 0xCu);
    }
  }
LABEL_19:
  id v24 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  uint64_t v75 = *MEMORY[0x1E4F68BC0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v24);

  [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  uint64_t v25 = [WeakRetained sourceMediaProfileContainer];
  if (!v25) {
    goto LABEL_23;
  }
  id v26 = (void *)v25;
  v27 = [WeakRetained sourceMediaProfileContainer];
  uint64_t v28 = objc_msgSend(v27, "hf_backingAccessory");
  [v28 uniqueIdentifier];
  v29 = WeakRetained;
  uint64_t v30 = v2;
  objc_super v31 = v9;
  id v32 = v14;
  v34 = v33 = v11;
  v35 = [v79 uniqueIdentifier];
  int v76 = [v34 isEqual:v35];

  id v11 = v33;
  id v14 = v32;
  id v9 = v31;
  uint64_t v2 = v30;
  id WeakRetained = v29;

  if (v76)
  {
    v36 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsSelectedHomePodDescriptionText", @"HUUsersPersonalRequestsSelectedHomePodDescriptionText", 1);
    uint64_t v37 = *MEMORY[0x1E4F68980];
    [v9 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v38 = [v29 sourceMediaProfileContainer];
    v39 = objc_msgSend(v38, "hf_backingAccessory");
    v40 = objc_msgSend(v39, "hf_siriEndpointProfile");

    if (v40)
    {
      v41 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsSelectedSiriEndpointDescriptionText", @"HUUsersPersonalRequestsSelectedSiriEndpointDescriptionText", 1);
      [v9 setObject:v41 forKeyedSubscript:v37];
    }
  }
  else
  {
LABEL_23:
    uint64_t v37 = *MEMORY[0x1E4F68980];
    [v9 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  uint64_t v42 = [WeakRetained supportedMULanguageCodes];
  if (v42
    && (v43 = (void *)v42,
        [WeakRetained home],
        v44 = objc_claimAutoreleasedReturnValue(),
        int v45 = [v44 isMultiUserEnabled],
        v44,
        v43,
        v45))
  {
    v77 = v11;
    int v46 = [WeakRetained recognitionLanguageIsSupportedVRLanguageForItem:*(void *)(v2 + 32)];
    int v47 = [WeakRetained isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:*(void *)(v2 + 32)];
    v48 = HFLogForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v73 = *(void **)(v2 + 32);
      v49 = [WeakRetained home];
      int v50 = [v49 isMultiUserEnabled];
      int v51 = [v79 supportsMultiUser];
      [WeakRetained home];
      v52 = id v74 = v14;
      int v53 = objc_msgSend(v52, "hf_currentUserIsOwner");
      *(_DWORD *)buf = 138413570;
      v85 = v73;
      __int16 v86 = 1024;
      int v87 = v47;
      __int16 v88 = 1024;
      int v89 = v46;
      __int16 v90 = 1024;
      int v91 = v50;
      __int16 v92 = 1024;
      int v93 = v51;
      __int16 v94 = 1024;
      int v95 = v53;
      _os_log_impl(&dword_1BE345000, v48, OS_LOG_TYPE_DEFAULT, "Calculating switch attributes for item %@: \n\t\t.... item is on phone's language?: %{BOOL}d (& is VR language)?: %{BOOL}d, home has enabled multi-user?: %{BOOL}d, item supports multi-user?: %{BOOL}d, current user is the owner?: %{BOOL}d", buf, 0x2Au);

      id v14 = v74;
    }

    if ([v79 supportsMultiUser]) {
      char v54 = v46 & v47;
    }
    else {
      char v54 = [v14 supportsMultiUser] & v46 & v47;
    }
    id v11 = v77;
    if ((v54 & 1) == 0)
    {
      v61 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription", @"HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription", 1);
      [v9 setObject:v61 forKeyedSubscript:v37];

      v62 = [WeakRetained home];
      char v63 = objc_msgSend(v62, "hf_currentUserIsOwner");

      if ((v63 & 1) == 0)
      {
        [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A08]];
        v64 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
        [v9 setObject:v64 forKeyedSubscript:v75];
      }
    }
  }
  else
  {
    v55 = [WeakRetained home];
    char v56 = [v55 isMultiUserEnabled];

    if (v56)
    {
      v57 = HFLogForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v57, OS_LOG_TYPE_DEFAULT, "Supported voice recognition languages have not populated yet. Disabling personal requests switches for non-owners. This should get fixed during an upcoming reload...", buf, 2u);
      }

      v58 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription", @"HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription", 1);
      [v9 setObject:v58 forKeyedSubscript:v37];
    }
    v59 = [WeakRetained home];
    char v60 = objc_msgSend(v59, "hf_currentUserIsOwner");

    if ((v60 & 1) == 0) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
  }
  uint64_t v65 = *MEMORY[0x1E4F68908];
  v66 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  v67 = v66;
  if (v66)
  {
    v68 = (void *)[v66 mutableCopy];
  }
  else
  {
    v69 = [MEMORY[0x1E4F1CAD0] set];
    v68 = (void *)[v69 mutableCopy];
  }
  v70 = [WeakRetained sourceItem];
  v71 = [v70 user];
  [v68 addObject:v71];

  [v9 setObject:v68 forKeyedSubscript:v65];

  return v9;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_3;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) accessory];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

- (id)_attributedFooterTitle
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__5;
  id v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  id v3 = [(HUPersonalRequestsDevicesItemModule *)self home];
  id v4 = objc_msgSend(v3, "hf_siriEndPointAccessories");
  BOOL v5 = [v4 count] != 0;

  uint64_t v6 = [(HUPersonalRequestsDevicesItemModule *)self locationDeviceManager];
  uint64_t v7 = [v6 activeLocationDeviceFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HUPersonalRequestsDevicesItemModule__attributedFooterTitle__block_invoke;
  v11[3] = &unk_1E63878E0;
  BOOL v12 = v5;
  v11[4] = &v13;
  id v8 = (id)[v7 addCompletionBlock:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __61__HUPersonalRequestsDevicesItemModule__attributedFooterTitle__block_invoke(uint64_t a1, void *a2)
{
  id v38 = a2;
  id v4 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsEnabledSettingsLinkTitle", @"HUUsersPersonalRequestsEnabledSettingsLinkTitle", 1);
  if ([v38 isCurrentDevice])
  {
    id v11 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsEnabledThisDeviceFooterItem", @"HUUsersPersonalRequestsEnabledThisDeviceFooterItem", 1);
    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_9;
    }
    BOOL v12 = @"HUUsersPersonalRequestsEnabledThisDeviceFooterItem_Accessories";
    goto LABEL_4;
  }
  if (v38)
  {
    id v14 = [v38 name];
    id v11 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsEnabledOtherDeviceFooterItem", @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_9;
    }
    uint64_t v2 = [v38 name];
    uint64_t v13 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsEnabledOtherDeviceFooterItem_Accessories", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v2);

    id v11 = v2;
    goto LABEL_8;
  }
  if (![MEMORY[0x1E4F69758] isAMac]) {
    goto LABEL_14;
  }
  id v11 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem", @"HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem", 1);
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v12 = @"HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem_Accessories";
LABEL_4:
    uint64_t v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
LABEL_8:

    id v11 = (void *)v13;
  }
LABEL_9:
  if (v11)
  {
    uint64_t v2 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsEnabledSettingsDescription", @"%@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    v33 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsEnabledFormat", @"%@%@", v27, v28, v29, v30, v31, v32, (uint64_t)v11);

    goto LABEL_15;
  }
LABEL_14:
  v33 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsEnabledNoFMFDeviceSettingsDescription", @"%@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
LABEL_15:
  int v34 = [MEMORY[0x1E4F69758] isAMac];
  char v35 = v34;
  v36 = (void *)MEMORY[0x1E4F28B18];
  if (v34)
  {
    uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v33 attributes:0];
  }
  else
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
    uint64_t v37 = objc_msgSend(v36, "hf_attributedLinkStringForString:linkString:linkURL:", v33, v4, v2);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v37);
  if ((v35 & 1) == 0)
  {

    uint64_t v37 = v2;
  }
}

- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4
{
  if ([(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches]) {
    NSLog(&cfstr_WeShouldNeverC_0.isa);
  }
  if (![(HUPersonalRequestsDevicesItemModule *)self onlyShowDeviceSwitches])
  {
    id v10 = [(HFItemModule *)self itemUpdater];
    uint64_t v6 = (void *)MEMORY[0x1E4F69230];
    uint64_t v7 = [(HFItemModule *)self allItems];
    uint64_t v8 = [v6 requestToUpdateItems:v7 senderSelector:a2];
    id v9 = (id)[v10 performItemUpdateRequest:v8];
  }
}

- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Update items with available language options: %@", (uint8_t *)&v15, 0x20u);
  }
  id v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
  objc_msgSend(v9, "na_safeAddObject:", v10);

  id v11 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
  objc_msgSend(v9, "na_safeAddObject:", v11);

  BOOL v12 = [(HFItemModule *)self itemUpdater];
  uint64_t v13 = [MEMORY[0x1E4F69230] requestToReloadItemProviders:v9 senderSelector:a2];
  id v14 = (id)[v12 performItemUpdateRequest:v13];
}

- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Update items with selected language option: %@", (uint8_t *)&v15, 0x20u);
  }
  id v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsMediaAccessoriesProvider];
  objc_msgSend(v9, "na_safeAddObject:", v10);

  id v11 = [(HUPersonalRequestsDevicesItemModule *)self personalRequestsOtherAccessoriesProvider];
  objc_msgSend(v9, "na_safeAddObject:", v11);

  BOOL v12 = [(HFItemModule *)self itemUpdater];
  uint64_t v13 = [MEMORY[0x1E4F69230] requestToReloadItemProviders:v9 senderSelector:a2];
  id v14 = (id)[v12 performItemUpdateRequest:v13];
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HFMediaProfileContainer)sourceMediaProfileContainer
{
  return self->_sourceMediaProfileContainer;
}

- (void)setSourceMediaProfileContainer:(id)a3
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

- (NSArray)supportedMULanguageCodes
{
  return self->_supportedMULanguageCodes;
}

- (void)setSupportedMULanguageCodes:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserItem)sourceItem
{
  return self->_sourceItem;
}

- (HFItemProvider)personalRequestsMediaAccessoriesProvider
{
  return self->_personalRequestsMediaAccessoriesProvider;
}

- (void)setPersonalRequestsMediaAccessoriesProvider:(id)a3
{
}

- (HFItemProvider)personalRequestsOtherAccessoriesProvider
{
  return self->_personalRequestsOtherAccessoriesProvider;
}

- (void)setPersonalRequestsOtherAccessoriesProvider:(id)a3
{
}

- (HFItem)personalRequestsToggleItem
{
  return self->_personalRequestsToggleItem;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (NSMapTable)mediaProfileToLanguageOptionsManagerMap
{
  return self->_mediaProfileToLanguageOptionsManagerMap;
}

- (void)setMediaProfileToLanguageOptionsManagerMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileToLanguageOptionsManagerMap, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_personalRequestsToggleItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsOtherAccessoriesProvider, 0);
  objc_storeStrong((id *)&self->_personalRequestsMediaAccessoriesProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, 0);
  objc_storeStrong((id *)&self->_sourceMediaProfileContainer, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end