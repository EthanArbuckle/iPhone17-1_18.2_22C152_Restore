@interface HUHomeTheaterAudioItemModule
- (BOOL)disableAutomaticCommit;
- (BOOL)includeLocalDestinations;
- (HFItem)selectedUncommittedItem;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUHomeTheaterAudioItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4 includeLocalDestinations:(BOOL)a5;
- (HUHomeTheaterAudioItemModuleAlertDelegate)alertDelegate;
- (HUHomeTheaterAudioItemModuleOnboardingDelegate)onboardingDelegate;
- (NSString)tappedDestinationIdentifier;
- (id)_updateDestinationToIdentifier:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)commitConfiguration;
- (id)itemProviders;
- (void)_createItemProviders;
- (void)_selectItem:(id)a3;
- (void)selectItem:(id)a3;
- (void)setAlertDelegate:(id)a3;
- (void)setDisableAutomaticCommit:(BOOL)a3;
- (void)setOnboardingDelegate:(id)a3;
- (void)setTappedDestinationIdentifier:(id)a3;
@end

@implementation HUHomeTheaterAudioItemModule

- (HUHomeTheaterAudioItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4 includeLocalDestinations:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUHomeTheaterAudioItemModule.m", 22, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HUHomeTheaterAudioItemModule;
  v11 = [(HFItemModule *)&v15 initWithItemUpdater:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a4);
    v12->_includeLocalDestinations = a5;
    v12->_disableAutomaticCommit = 0;
    objc_storeWeak((id *)&v12->_selectedUncommittedItem, 0);
    [(HUHomeTheaterAudioItemModule *)v12 _createItemProviders];
  }

  return v12;
}

- (void)_createItemProviders
{
  if (self->_itemProviders)
  {
    NSLog(&cfstr_Createitemprov.isa, a2);
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    if ([(HUHomeTheaterAudioItemModule *)self includeLocalDestinations])
    {
      v4 = [[HUMediaDestinationItem alloc] initWithDestination:0 withModule:self];
      [v3 addObject:v4];
    }
    v5 = [(HUHomeTheaterAudioItemModule *)self mediaProfileContainer];
    v6 = objc_msgSend(v5, "hf_backingAccessory");
    v7 = [v6 audioDestinationController];
    v8 = [v7 availableDestinations];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __52__HUHomeTheaterAudioItemModule__createItemProviders__block_invoke;
    v18 = &unk_1E638C3F8;
    v19 = self;
    id v20 = v3;
    id v9 = v3;
    objc_msgSend(v8, "na_each:", &v15);
    id v10 = objc_alloc(MEMORY[0x1E4F695C8]);
    v11 = objc_msgSend(v9, "set", v15, v16, v17, v18, v19);
    v12 = (void *)[v10 initWithItems:v11];

    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v13;
  }
}

void __52__HUHomeTheaterAudioItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[HUMediaDestinationItem alloc] initWithDestination:v3 withModule:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v4];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HomeTheaterAudio"];
  if ([(HUHomeTheaterAudioItemModule *)self includeLocalDestinations])
  {
    v7 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSettings_FooterTitle", @"HUHomeTheaterSettings_FooterTitle", 1);
    [v6 setFooterTitle:v7];
  }
  v8 = [(HFItemModule *)self allItems];
  id v9 = objc_msgSend(v8, "na_setByIntersectingWithSet:", v5);

  id v10 = [v9 allObjects];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v14[3] = &unk_1E638C420;
  id v15 = &__block_literal_global_136;
  v11 = [v10 sortedArrayUsingComparator:v14];
  [v6 setItems:v11];

  v16[0] = v6;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  return v12;
}

uint64_t __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 latestResults];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B50]];
  uint64_t v8 = [v7 isEqualToString:@"kIdentifierStringForBuiltIn"];

  return v8;
}

uint64_t __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v7 = -1;
  }
  else if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v7 = ((uint64_t (**)(void, id, id))v8)[2](v8, v5, v6);
  }
  return v7;
}

- (id)commitConfiguration
{
  id v3 = [(HUHomeTheaterAudioItemModule *)self selectedUncommittedItem];
  v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B50]];

  id v6 = [(HUHomeTheaterAudioItemModule *)self _updateDestinationToIdentifier:v5];

  return v6;
}

- (void)selectItem:(id)a3
{
  id v7 = a3;
  v4 = [v7 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0) {
    [(HUHomeTheaterAudioItemModule *)self _selectItem:v7];
  }
}

- (void)_selectItem:(id)a3
{
  id v5 = a3;
  if ([(HUHomeTheaterAudioItemModule *)self disableAutomaticCommit])
  {
    objc_storeWeak((id *)&self->_selectedUncommittedItem, v5);
  }
  else
  {
    char v6 = [v5 latestResults];

    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B50]];
    [(HUHomeTheaterAudioItemModule *)self setTappedDestinationIdentifier:v7];

    id v5 = [(HUHomeTheaterAudioItemModule *)self tappedDestinationIdentifier];
    uint64_t v8 = [(HUHomeTheaterAudioItemModule *)self _updateDestinationToIdentifier:v5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__HUHomeTheaterAudioItemModule__selectItem___block_invoke;
    v17[3] = &unk_1E63877D0;
    v17[4] = self;
    v17[5] = a2;
    id v9 = (id)[v8 addCompletionBlock:v17];
  }
  id v10 = [(HUHomeTheaterAudioItemModule *)self onboardingDelegate];

  if (v10)
  {
    v11 = [(HUHomeTheaterAudioItemModule *)self onboardingDelegate];
    [v11 homeTheaterItemModuleDidChangeSelectedDestination:self];
  }
  v12 = (void *)MEMORY[0x1E4F69230];
  v13 = [(HUHomeTheaterAudioItemModule *)self itemProviders];
  v14 = [v12 requestToReloadItemProviders:v13 senderSelector:a2];

  id v15 = [(HFItemModule *)self itemUpdater];
  id v16 = (id)[v15 performItemUpdateRequest:v14];
}

void __44__HUHomeTheaterAudioItemModule__selectItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setTappedDestinationIdentifier:0];
  if (a3)
  {
    id v5 = (void *)MEMORY[0x1E4F69230];
    char v6 = [*(id *)(a1 + 32) itemProviders];
    id v9 = [v5 requestToReloadItemProviders:v6 senderSelector:*(void *)(a1 + 40)];

    id v7 = [*(id *)(a1 + 32) itemUpdater];
    id v8 = (id)[v7 performItemUpdateRequest:v9];
  }
}

- (id)_updateDestinationToIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(HUHomeTheaterAudioItemModule *)self mediaProfileContainer];
  id v7 = objc_msgSend(v6, "hf_backingAccessory");
  id v8 = [v7 audioDestinationController];
  id v9 = [v8 availableDestinations];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke;
  v22[3] = &unk_1E638C448;
  id v23 = v5;
  id v10 = v5;
  v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v22);
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v13;
    __int16 v28 = 2112;
    v29 = v11;
    __int16 v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ setting destination to %@ from possible destinations %@", buf, 0x2Au);
  }
  v14 = (void *)MEMORY[0x1E4F7A0D8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_31;
  v20[3] = &unk_1E63877F8;
  v20[4] = self;
  id v21 = v11;
  id v15 = v11;
  id v16 = [v14 futureWithErrorOnlyHandlerAdapterBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_2;
  v19[3] = &unk_1E63877D0;
  v19[4] = self;
  v19[5] = a2;
  v17 = [v16 addCompletionBlock:v19];

  return v17;
}

uint64_t __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 audioDestinationIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 mediaProfileContainer];
  id v5 = objc_msgSend(v7, "hf_backingAccessory");
  char v6 = [v5 audioDestinationController];
  [v6 updateDestination:*(void *)(a1 + 40) completionHandler:v4];
}

void __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUHomeTheaterAudioItemModuleOnboardingDelegate)onboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);

  return (HUHomeTheaterAudioItemModuleOnboardingDelegate *)WeakRetained;
}

- (void)setOnboardingDelegate:(id)a3
{
}

- (HUHomeTheaterAudioItemModuleAlertDelegate)alertDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertDelegate);

  return (HUHomeTheaterAudioItemModuleAlertDelegate *)WeakRetained;
}

- (void)setAlertDelegate:(id)a3
{
}

- (NSString)tappedDestinationIdentifier
{
  return self->_tappedDestinationIdentifier;
}

- (void)setTappedDestinationIdentifier:(id)a3
{
}

- (HFItem)selectedUncommittedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedUncommittedItem);

  return (HFItem *)WeakRetained;
}

- (BOOL)includeLocalDestinations
{
  return self->_includeLocalDestinations;
}

- (BOOL)disableAutomaticCommit
{
  return self->_disableAutomaticCommit;
}

- (void)setDisableAutomaticCommit:(BOOL)a3
{
  self->_disableAutomaticCommit = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedUncommittedItem);
  objc_storeStrong((id *)&self->_tappedDestinationIdentifier, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end