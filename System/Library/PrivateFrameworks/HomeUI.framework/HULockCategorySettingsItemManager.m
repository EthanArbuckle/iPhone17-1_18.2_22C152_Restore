@interface HULockCategorySettingsItemManager
- (HFPinCodeManager)pinCodeManager;
- (HFServiceItemProvider)lockServiceItemProvider;
- (HFStaticItem)guestsItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFUserItemProvider)userItemProvider;
- (HFUserNotificationServiceTopic)topic;
- (HMHome)overrideHome;
- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 home:(id)a5;
- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 pinCodeManager:(id)a5 home:(id)a6;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4;
- (void)setGuestsItem:(id)a3;
- (void)setLockServiceItemProvider:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setTopic:(id)a3;
- (void)setUserItemProvider:(id)a3;
@end

@implementation HULockCategorySettingsItemManager

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 home:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HULockCategorySettingsItemManager;
  v11 = [(HFItemManager *)&v14 initWithDelegate:a3 sourceItem:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topic, a4);
    objc_storeStrong((id *)&v12->_overrideHome, a5);
  }

  return v12;
}

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  id v10 = (HFPinCodeManager *)a5;
  v11 = [(HULockCategorySettingsItemManager *)self initWithDelegate:a3 topic:a4 home:a6];
  pinCodeManager = v11->_pinCodeManager;
  v11->_pinCodeManager = v10;

  return v11;
}

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_topic_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULockCategorySettingsItemManager.m", 53, @"%s is unavailable; use %@ instead",
    "-[HULockCategorySettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HFItemManager *)self home];
  int v6 = [v5 hasOnboardedForAccessCode];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F69718]) initWithHome:v4];
    [(HULockCategorySettingsItemManager *)self setUserItemProvider:v7];

    v8 = [(HULockCategorySettingsItemManager *)self userItemProvider];
    [v8 setIncludeCurrentUser:1];

    id v9 = [(HFItemManager *)self home];
    uint64_t v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");
    v11 = [(HULockCategorySettingsItemManager *)self userItemProvider];
    [v11 setIncludeOtherUsers:v10];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F69558]);
  uint64_t v13 = *MEMORY[0x1E4F2DE88];
  v38[0] = *MEMORY[0x1E4F2DE80];
  v38[1] = v13;
  objc_super v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v15 = (void *)[v12 initWithHome:v4 serviceTypes:v14];
  [(HULockCategorySettingsItemManager *)self setLockServiceItemProvider:v15];

  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]";
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "(%s) Creating 'guests'", buf, 0xCu);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke;
  v32[3] = &unk_1E63861A0;
  objc_copyWeak(&v34, &location);
  id v18 = v4;
  id v33 = v18;
  v19 = (void *)[v17 initWithResultsBlock:v32];
  [(HULockCategorySettingsItemManager *)self setGuestsItem:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F695D0]);
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  v22 = [(HULockCategorySettingsItemManager *)self guestsItem];
  v23 = [v21 setWithObject:v22];
  v24 = (void *)[v20 initWithItems:v23];
  [(HULockCategorySettingsItemManager *)self setStaticItemProvider:v24];

  v25 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F68700]];
  v26 = [(HULockCategorySettingsItemManager *)self staticItemProvider];
  [v26 setClientInvalidationReasons:v25];

  v27 = [MEMORY[0x1E4F1CA48] array];
  v28 = [(HULockCategorySettingsItemManager *)self userItemProvider];
  objc_msgSend(v27, "na_safeAddObject:", v28);

  v29 = [(HULockCategorySettingsItemManager *)self staticItemProvider];
  objc_msgSend(v27, "na_safeAddObject:", v29);

  v30 = [(HULockCategorySettingsItemManager *)self lockServiceItemProvider];
  objc_msgSend(v27, "na_safeAddObject:", v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v27;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = [WeakRetained pinCodeManager];
  v5 = [v4 guestPinCodes];
  v16[0] = v5;
  int v6 = [WeakRetained pinCodeManager];
  v7 = [v6 otherEcosystemGuestPinCodes];
  v16[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v9 = [v3 combineAllFutures:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_2;
  v13[3] = &unk_1E6388C28;
  id v14 = *(id *)(a1 + 32);
  id v15 = WeakRetained;
  uint64_t v10 = [v9 flatMap:v13];
  v11 = [v10 recover:&__block_literal_global_287];

  return v11;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    __int16 v36 = 2112;
    id v37 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed getting access codes from HK and other ecosystems with results %@", buf, 0x16u);
  }

  v5 = objc_msgSend(v3, "na_arrayByFlattening");
  uint64_t v6 = [v5 count];
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    if ([v7 count])
    {
      v8 = [*(id *)(a1 + 40) home];
      if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
      {
        id v9 = [*(id *)(a1 + 40) home];
        LODWORD(v10) = [v9 hasOnboardedForAccessCode] ^ 1;
      }
      else
      {
        LODWORD(v10) = 1;
      }
    }
    else
    {
      LODWORD(v10) = 1;
    }
  }
  else
  {
    LODWORD(v10) = 1;
  }
  v11 = [*(id *)(a1 + 40) home];
  id v12 = [v11 restrictedGuests];
  uint64_t v13 = [v12 count];

  if (v13) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v10;
  }
  id v20 = HULocalizedStringWithFormat(@"HUEditLocationGuestsDescriptionFormat", @"%lu", v14, v15, v16, v17, v18, v19, v13 + v6);
  v21 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
  v22 = (void *)MEMORY[0x1E4F7A0D8];
  v32[0] = *MEMORY[0x1E4F68AB8];
  v23 = _HULocalizedStringWithDefaultValue(@"HUEditLocationGuestsTitle", @"HUEditLocationGuestsTitle", 1);
  uint64_t v24 = *MEMORY[0x1E4F68928];
  v33[0] = v23;
  v33[1] = @"Home.Locks.Category.Guests";
  uint64_t v25 = *MEMORY[0x1E4F68980];
  v32[1] = v24;
  v32[2] = v25;
  v33[2] = v20;
  v32[3] = *MEMORY[0x1E4F689F8];
  v26 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.2.circle.fill" withConfiguration:v21];
  v33[3] = v26;
  void v32[4] = *MEMORY[0x1E4F68B10];
  v27 = [NSNumber numberWithBool:v10];
  v33[4] = v27;
  v32[5] = *MEMORY[0x1E4F68900];
  v28 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v33[5] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
  v30 = [v22 futureWithResult:v29];

  return v30;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes from HK and other ecosystems. Error = %@. Hiding 'guests' item.", buf, 0x16u);
  }

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v6 = [v4 futureWithResult:v5];

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HULockCategorySettingsLockListSection"];
  v7 = [(HULockCategorySettingsItemManager *)self lockServiceItemProvider];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
  v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11];

  [v5 addObject:v6];
  __int16 v12 = [(HULockCategorySettingsItemManager *)self userItemProvider];

  if (v12)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HULockCategorySettingsPeopleSection"];
    v27 = self;
    uint64_t v14 = [(HULockCategorySettingsItemManager *)self userItemProvider];
    uint64_t v15 = [v14 items];
    uint64_t v16 = [v15 allObjects];
    [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v17 = v5;
    uint64_t v18 = v6;
    id v20 = v19 = v4;
    v21 = [v16 sortedArrayUsingComparator:v20];
    v22 = (void *)[v21 mutableCopy];

    id v4 = v19;
    uint64_t v6 = v18;
    v5 = v17;

    v23 = [(HULockCategorySettingsItemManager *)v27 guestsItem];
    objc_msgSend(v22, "na_safeAddObject:", v23);

    [v13 setItems:v22];
    uint64_t v24 = _HULocalizedStringWithDefaultValue(@"HULockCategorySettingsPeopleSectionTitle", @"HULockCategorySettingsPeopleSectionTitle", 1);
    [v13 setHeaderTitle:v24];

    [v17 addObject:v13];
  }
  uint64_t v25 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v25;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HULockCategorySettingsItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HULockCategorySettingsItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HULockCategorySettingsItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HULockCategorySettingsItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HULockCategorySettingsItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);
  }
  uint64_t v8 = [(HULockCategorySettingsItemManager *)self staticItemProvider];
  v11 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v10 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v9 senderSelector:a2];
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (HFServiceItemProvider)lockServiceItemProvider
{
  return self->_lockServiceItemProvider;
}

- (void)setLockServiceItemProvider:(id)a3
{
}

- (HFStaticItem)guestsItem
{
  return self->_guestsItem;
}

- (void)setGuestsItem:(id)a3
{
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_guestsItem, 0);
  objc_storeStrong((id *)&self->_lockServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);

  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end