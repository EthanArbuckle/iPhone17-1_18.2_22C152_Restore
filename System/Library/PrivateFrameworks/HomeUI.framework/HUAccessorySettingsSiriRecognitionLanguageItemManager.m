@interface HUAccessorySettingsSiriRecognitionLanguageItemManager
- (HFAccessorySettingSiriLanguageAdapter)adapter;
- (HFServiceLikeItem)accessoryItem;
- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager;
- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3;
- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4 accessoryItem:(id)a5;
- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 groupItem:(id)a4;
- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUSiriLanguageOptionItemProvider)optionItemProvider;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)mediaProfileContainer;
- (id)updateSelectionWithOptionItem:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setAccessoryItem:(id)a3;
- (void)setOptionItemProvider:(id)a3;
- (void)siriLanguageAdapter:(id)a3 availableLanguageOptionsDidChange:(id)a4;
- (void)siriLanguageAdapter:(id)a3 selectedLanguageOptionDidChange:(id)a4;
- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4;
- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4;
@end

@implementation HUAccessorySettingsSiriRecognitionLanguageItemManager

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsSiriRecognitionLanguageItemManager.m", 28, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsSiriRecognitionLanguageItemManager.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  v8 = [(HFItemManager *)&v14 initWithDelegate:v6 sourceItem:v7];

  if (v8)
  {
    v9 = [v7 homeKitSettingsVendor];
    v10 = objc_msgSend(v9, "hf_settingsAdapterManager");
    uint64_t v11 = [v10 adapterForIdentifier:*MEMORY[0x1E4F67FC0]];
    adapter = v8->_adapter;
    v8->_adapter = (HFAccessorySettingSiriLanguageAdapter *)v11;
  }
  return v8;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4 accessoryItem:(id)a5
{
  v8 = (HFServiceLikeItem *)a5;
  id v9 = a3;
  v10 = (void *)[a4 copy];
  accessoryItem = self->_accessoryItem;
  self->_accessoryItem = v8;
  v12 = v8;

  v15.receiver = self;
  v15.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  v13 = [(HFItemManager *)&v15 initWithDelegate:v9 sourceItem:v10];

  return v13;
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v4 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self mediaProfileContainer];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8 = [v7 homeManager];
    if ([v8 hasOptedToHH2])
    {

LABEL_8:
      uint64_t v11 = objc_msgSend(v6, "hf_siriLanguageOptionsManager");
      goto LABEL_19;
    }
    id v9 = [v6 accessory];
    int v10 = objc_msgSend(v9, "hf_isSiriEndpoint");

    if (v10) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  v12 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self mediaProfileContainer];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14
    && ([MEMORY[0x1E4F691A0] sharedDispatcher],
        objc_super v15 = objc_claimAutoreleasedReturnValue(),
        [v15 homeManager],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 hasOptedToHH2],
        v16,
        v15,
        v17))
  {
    uint64_t v11 = objc_msgSend(v14, "hf_siriLanguageOptionsManager");
  }
  else
  {
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSStringFromSelector(a2);
      v20 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self mediaProfileContainer];
      int v22 = 138412802;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri Language Options Manager not found for mediaProfileContainer %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v11 = 0;
  }

LABEL_19:

  return (HFSiriLanguageOptionsManager *)v11;
}

- (id)mediaProfileContainer
{
  objc_opt_class();
  v3 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 homeKitSettingsVendor];
  }
  else
  {
    v7 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self accessoryItem];
    v8 = [v7 accessories];
    id v9 = [v8 anyObject];
    id v6 = [v9 mediaProfile];
  }

  return v6;
}

- (id)updateSelectionWithOptionItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];

    if (v8) {
      [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];
    }
    else {
    int v10 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self adapter];
    }
    v12 = [v7 languageOption];
    uint64_t v11 = [v10 updateSelectedLanguageOption:v12];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F7A0D8];
    int v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
    uint64_t v11 = [v9 futureWithError:v10];
  }

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];

  if (v4)
  {
    id v5 = [HUSiriLanguageOptionItemProvider alloc];
    id v6 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];
    id v7 = [(HFItemManager *)self sourceItem];
    v8 = [(HUSiriLanguageOptionItemProvider *)v5 initWithSiriLanguageOptionsManager:v6 sourceItem:v7 optionStyle:0];
    [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self setOptionItemProvider:v8];
  }
  else
  {
    id v9 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self adapter];

    if (!v9) {
      goto LABEL_6;
    }
    int v10 = [HUSiriLanguageOptionItemProvider alloc];
    id v6 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self adapter];
    id v7 = [(HUSiriLanguageOptionItemProvider *)v10 initWithAdapter:v6 optionStyle:0];
    [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self setOptionItemProvider:v7];
  }

LABEL_6:
  uint64_t v11 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self optionItemProvider];
  if (v11)
  {
    v12 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self optionItemProvider];
    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"Languages"];
  id v7 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self optionItemProvider];
  v8 = [v7 items];
  id v9 = objc_msgSend(v8, "na_setByIntersectingWithSet:", v5);

  int v10 = [v9 allObjects];
  uint64_t v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
  v12 = [v10 sortedArrayUsingComparator:v11];
  [v6 setItems:v12];

  v15[0] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (void)_registerForExternalUpdates
{
  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  [(HFItemManager *)&v6 _registerForExternalUpdates];
  v3 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self adapter];
  [v3 addObserver:self];

  id v4 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];

  if (v4)
  {
    id v5 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];
    [v5 addObserver:self];
  }
}

- (void)_unregisterForExternalUpdates
{
  v3 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self adapter];
  [v3 removeObserver:self];

  id v4 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];

  if (v4)
  {
    id v5 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)self siriLanguageOptionsManager];
    [v5 removeObserver:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  [(HFItemManager *)&v6 _unregisterForExternalUpdates];
}

- (void)siriLanguageAdapter:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  id v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageAdapter:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  id v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  id v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  id v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HUSiriLanguageOptionItemProvider)optionItemProvider
{
  return self->_optionItemProvider;
}

- (void)setOptionItemProvider:(id)a3
{
}

- (HFServiceLikeItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_optionItemProvider, 0);

  objc_storeStrong((id *)&self->_adapter, 0);
}

@end