@interface HUPrimaryUserSettingsItemModule
+ (id)_userItemComparator;
- (HFItem)homePodAccountSelectionItem;
- (HFItem)primaryUserSettingsHeaderItem;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)home;
- (HUPrimaryUserItemProvider)primaryUserItemProvider;
- (HUPrimaryUserSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 mediaProfileContainer:(id)a5;
- (id)_updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setHomePodAccountSelectionItem:(id)a3;
- (void)setPrimaryUserItemProvider:(id)a3;
- (void)setPrimaryUserSettingsHeaderItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUPrimaryUserSettingsItemModule

- (HUPrimaryUserSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 mediaProfileContainer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUPrimaryUserSettingsItemModule.m", 30, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUPrimaryUserSettingsItemModule.m", 31, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUPrimaryUserSettingsItemModule;
  v13 = [(HFItemModule *)&v18 initWithItemUpdater:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_mediaProfileContainer, a5);
    [(HUPrimaryUserSettingsItemModule *)v14 _buildItemProviders];
  }

  return v14;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HUPrimaryUserSettingsItemModule *)self primaryUserItemProvider];
  v5 = [(HUPrimaryUserSettingsItemModule *)self staticItemProvider];
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HUPrimaryUserSettingsItemModule *)self mediaProfileContainer];
  v7 = objc_msgSend(v6, "hf_backingAccessory");
  int v22 = objc_msgSend(v7, "hf_isSiriEndpoint");

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUPrimaryUserSettingsHeaderSectionIdentifier"];
  if (v22) {
    id v9 = @"HUPrimaryUserSettingsHeaderSection_SiriEndpoint_Footer";
  }
  else {
    id v9 = @"HUPrimaryUserSettingsHeaderSection_Footer";
  }
  id v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  [v8 setFooterTitle:v10];

  v23 = v8;
  v24 = v5;
  [v5 addObject:v8];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUPrimaryUserSettingsUserSectionIdentifier"];
  v12 = objc_opt_new();
  v13 = [(HUPrimaryUserSettingsItemModule *)self primaryUserItemProvider];
  v14 = [v13 items];
  v15 = [v14 allObjects];
  v16 = [(id)objc_opt_class() _userItemComparator];
  v17 = [v15 sortedArrayUsingComparator:v16];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__HUPrimaryUserSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v25[3] = &unk_1E6386108;
  id v26 = v4;
  id v18 = v4;
  v19 = objc_msgSend(v17, "na_filter:", v25);
  objc_msgSend(v12, "na_safeAddObjectsFromArray:", v19);

  if ((v22 & 1) == 0)
  {
    v20 = [(HUPrimaryUserSettingsItemModule *)self homePodAccountSelectionItem];
    objc_msgSend(v12, "na_safeAddObject:", v20);
  }
  [v11 setItems:v12];
  [v24 addObject:v11];

  return v24;
}

uint64_t __67__HUPrimaryUserSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)_userItemComparator
{
  return &__block_literal_global_142;
}

uint64_t __54__HUPrimaryUserSettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68C78];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  id v9 = [v5 latestResults];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if ([v8 type] || !objc_msgSend(v10, "type"))
  {
    if ([v8 type] && !objc_msgSend(v10, "type"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
      uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v4, v5);
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)_buildItemProviders
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [HUPrimaryUserItemProvider alloc];
  id v4 = [(HUPrimaryUserSettingsItemModule *)self home];
  id v5 = [(HUPrimaryUserSettingsItemModule *)self mediaProfileContainer];
  v6 = [(HUPrimaryUserItemProvider *)v3 initWithHome:v4 mediaProfileContainer:v5];
  [(HUPrimaryUserSettingsItemModule *)self setPrimaryUserItemProvider:v6];

  uint64_t v7 = [HUPrimaryUserHomePodAccountItem alloc];
  v8 = [(HUPrimaryUserSettingsItemModule *)self home];
  id v9 = objc_msgSend(v8, "hf_characteristicValueManager");
  id v10 = [(HUPrimaryUserSettingsItemModule *)self mediaProfileContainer];
  id v11 = [(HUPrimaryUserHomePodAccountItem *)v7 initWithValueSource:v9 mediaProfileContainer:v10];
  [(HUPrimaryUserSettingsItemModule *)self setHomePodAccountSelectionItem:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v13 = [(HUPrimaryUserSettingsItemModule *)self homePodAccountSelectionItem];
  v17[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15 = (void *)[v12 initWithArray:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v15];
  [(HUPrimaryUserSettingsItemModule *)self setStaticItemProvider:v16];
}

- (id)_updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  v6 = objc_opt_new();
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  v8 = [(HUPrimaryUserSettingsItemModule *)self mediaProfileContainer];
  id v9 = [v8 accessories];
  id v10 = [v7 setWithSet:v9];

  if (!v10)
  {
    id v11 = [(HUPrimaryUserSettingsItemModule *)self mediaProfileContainer];
    id v12 = objc_msgSend(v11, "hf_backingAccessory");
    objc_msgSend(0, "na_safeAddObject:", v12);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v18 supportsPreferredMediaUser])
        {
          v19 = (void *)MEMORY[0x1E4F7A0D8];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke;
          v25[3] = &unk_1E638CD00;
          void v25[4] = self;
          v25[5] = v18;
          SEL v27 = a2;
          unint64_t v28 = a3;
          id v26 = v24;
          v20 = [v19 futureWithBlock:v25];
          [v6 addObject:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  v21 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v6];

  return v21;
}

void __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F69230];
  id v5 = [*(id *)(a1 + 32) itemProviders];
  v6 = [v4 requestToReloadItemProviders:v5 senderSelector:*(void *)(a1 + 56)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 64);
  v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke_2;
  v12[3] = &unk_1E638CCD8;
  v12[4] = v8;
  id v10 = v3;
  id v13 = v10;
  objc_copyWeak(&v15, &location);
  id v11 = v6;
  id v14 = v11;
  [v8 updatePreferredMediaUserSelectionType:v7 user:v9 completionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user for accessory %@ with error %@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated primary user setting for accessory %@", (uint8_t *)&v11, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = [WeakRetained itemUpdater];
    id v9 = (id)[v8 performItemUpdateRequest:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFItem)primaryUserSettingsHeaderItem
{
  return self->_primaryUserSettingsHeaderItem;
}

- (void)setPrimaryUserSettingsHeaderItem:(id)a3
{
}

- (HFItem)homePodAccountSelectionItem
{
  return self->_homePodAccountSelectionItem;
}

- (void)setHomePodAccountSelectionItem:(id)a3
{
}

- (HUPrimaryUserItemProvider)primaryUserItemProvider
{
  return self->_primaryUserItemProvider;
}

- (void)setPrimaryUserItemProvider:(id)a3
{
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
  objc_storeStrong((id *)&self->_primaryUserItemProvider, 0);
  objc_storeStrong((id *)&self->_homePodAccountSelectionItem, 0);
  objc_storeStrong((id *)&self->_primaryUserSettingsHeaderItem, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end