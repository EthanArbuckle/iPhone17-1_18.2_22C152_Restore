@interface HUTVViewingProfilesDevicesItemModule
- (BOOL)isTVViewingProfileDevice:(id)a3;
- (HFItemProvider)viewingProfileItemProvider;
- (HFUserItem)sourceItem;
- (HMHome)home;
- (HMMediaContentProfileAccessControl)accessControl;
- (HUTVViewingProfilesDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4;
- (NSArray)viewingProfilesDevices;
- (NSSet)itemProviders;
- (id)_commitUpdateToAccessControl:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)_createItemProviders;
- (void)setViewingProfileItemProvider:(id)a3;
- (void)setViewingProfilesDevices:(id)a3;
- (void)turnOnTVViewingProfilesForAllDevices;
@end

@implementation HUTVViewingProfilesDevicesItemModule

- (HUTVViewingProfilesDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTVViewingProfilesDevicesItemModule;
  v8 = [(HFItemModule *)&v14 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceItem, a4);
    v10 = [(HUTVViewingProfilesDevicesItemModule *)v9 sourceItem];
    uint64_t v11 = [v10 home];
    home = v9->_home;
    v9->_home = (HMHome *)v11;

    [(HUTVViewingProfilesDevicesItemModule *)v9 _createItemProviders];
  }

  return v9;
}

- (BOOL)isTVViewingProfileDevice:(id)a3
{
  id v4 = a3;
  v5 = [(HUTVViewingProfilesDevicesItemModule *)self viewingProfileItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (HMMediaContentProfileAccessControl)accessControl
{
  v3 = [(HUTVViewingProfilesDevicesItemModule *)self sourceItem];
  id v4 = [v3 user];
  v5 = [(HUTVViewingProfilesDevicesItemModule *)self home];
  v6 = [v4 mediaContentProfileAccessControlForHome:v5];

  return (HMMediaContentProfileAccessControl *)v6;
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
    id v3 = objc_alloc(MEMORY[0x1E4F69288]);
    id v4 = [(HUTVViewingProfilesDevicesItemModule *)self home];
    v5 = (void *)[v3 initWithHome:v4];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke;
    v14[3] = &unk_1E6385F78;
    v14[4] = self;
    [v5 setFilter:v14];
    id v6 = objc_alloc(MEMORY[0x1E4F696B0]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_5;
    v12[3] = &unk_1E6387868;
    objc_copyWeak(&v13, &location);
    char v7 = (void *)[v6 initWithSourceProvider:v5 transformationBlock:v12];
    [(HUTVViewingProfilesDevicesItemModule *)self setViewingProfileItemProvider:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [(HUTVViewingProfilesDevicesItemModule *)self viewingProfileItemProvider];
    v10 = [v8 setWithObject:v9];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v12 = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ homeKitObject: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 accessory];

  if (objc_msgSend(v9, "hf_isAppleTV")) {
    uint64_t v10 = [MEMORY[0x1E4F2E8C0] isAccessorySupported:v9];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

id __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_2;
  v8[3] = &unk_1E63878B8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = (void *)[v4 initWithSourceItem:v5 transformationBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

id __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v8 = v7;

  id v9 = [WeakRetained accessControl];
  id v10 = [v9 accessories];

  uint64_t v11 = [*(id *)(a1 + 32) accessories];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_3;
  v22[3] = &unk_1E63869C8;
  id v12 = v10;
  id v23 = v12;
  objc_msgSend(v11, "na_any:", v22);

  uint64_t v13 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  uint64_t v14 = *MEMORY[0x1E4F68908];
  id v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  uint64_t v16 = v15;
  if (v15)
  {
    v17 = (void *)[v15 mutableCopy];
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CAD0] set];
    v17 = (void *)[v18 mutableCopy];
  }
  v19 = [WeakRetained sourceItem];
  v20 = [v19 user];
  [v17 addObject:v20];

  [v8 setObject:v17 forKeyedSubscript:v14];

  return v8;
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_4;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(HUTVViewingProfilesDevicesItemModule *)self viewingProfileItemProvider];
    id v7 = [v6 items];
    uint64_t v8 = [v7 count];

    if (!v8) {
      NSLog(&cfstr_Buildsectionsw.isa);
    }
    id v9 = [(HUTVViewingProfilesDevicesItemModule *)self viewingProfileItemProvider];
    id v10 = [v9 items];
    uint64_t v11 = [v10 allObjects];
    id v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_66];

    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    uint64_t v14 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v13);

    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"TV_VIEWING_PROFILES_DEVICES"];
    uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUUsersTVViewingProfilesDevicesSectionTitle", @"HUUsersTVViewingProfilesDevicesSectionTitle", 1);
    [v15 setHeaderTitle:v16];

    v17 = HULocalizedModelString(@"HUUsersTVViewingProfilesDevicesFooterTitle");
    [v15 setFooterTitle:v17];

    v18 = [v14 allObjects];
    v19 = [MEMORY[0x1E4F69758] comparatorWithSortedObjects:v12];
    v20 = [v18 sortedArrayUsingComparator:v19];
    [v15 setItems:v20];

    [v5 addObject:v15];
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

uint64_t __72__HUTVViewingProfilesDevicesItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68AB8]];
  uint64_t v8 = [v4 latestResults];

  id v9 = [v8 objectForKey:v6];
  uint64_t v10 = [v7 localizedStandardCompare:v9];

  return v10;
}

- (NSArray)viewingProfilesDevices
{
  v2 = [(HUTVViewingProfilesDevicesItemModule *)self accessControl];
  id v3 = [v2 accessories];

  return (NSArray *)v3;
}

- (void)setViewingProfilesDevices:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUTVViewingProfilesDevicesItemModule *)self accessControl];
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v7 setAccessories:v5];
    uint64_t v8 = [(HUTVViewingProfilesDevicesItemModule *)self _commitUpdateToAccessControl:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__HUTVViewingProfilesDevicesItemModule_setViewingProfilesDevices___block_invoke;
    v12[3] = &unk_1E63877D0;
    void v12[4] = self;
    v12[5] = a2;
    id v9 = (id)[v8 addCompletionBlock:v12];
  }
  else
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Can't update to viewing profile access control because it is nil - presumably becuase we are waiting for it to sync.", v11, 2u);
    }
  }
}

void __66__HUTVViewingProfilesDevicesItemModule_setViewingProfilesDevices___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) itemUpdater];
  v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [*(id *)(a1 + 32) viewingProfileItemProvider];
  id v5 = [v3 setWithObject:v4];
  uint64_t v6 = [v2 requestToReloadItemProviders:v5 senderSelector:*(void *)(a1 + 40)];
  id v7 = (id)[v8 performItemUpdateRequest:v6];
}

- (void)turnOnTVViewingProfilesForAllDevices
{
  id v4 = [(HUTVViewingProfilesDevicesItemModule *)self home];
  id v3 = objc_msgSend(v4, "hf_tvViewingProfilesAccessories");
  [(HUTVViewingProfilesDevicesItemModule *)self setViewingProfilesDevices:v3];
}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke;
  v18[3] = &unk_1E63877F8;
  id v6 = v4;
  id v19 = v6;
  v20 = self;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_33;
  id v15 = &unk_1E63859F8;
  uint64_t v16 = self;
  id v17 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:&v12];
  id v10 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_41_1, v12, v13, v14, v15, v16);

  return v7;
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to viewing profile access control: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [*(id *)(a1 + 40) sourceItem];
  id v7 = [v6 user];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) home];
  [v7 updateMediaContentProfileAccessControl:v8 forHome:v9 completionHandler:v3];
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_33(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6387820;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchUserObserverMessage:v4 sender:0];
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [v3 currentUser];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) home];
    [v7 user:v4 didUpdateMediaContentProfileAccessControl:v5 forHome:v6];
  }
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserItem)sourceItem
{
  return self->_sourceItem;
}

- (HFItemProvider)viewingProfileItemProvider
{
  return self->_viewingProfileItemProvider;
}

- (void)setViewingProfileItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewingProfileItemProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end