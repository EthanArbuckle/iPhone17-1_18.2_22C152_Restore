@interface HUPlaybackInfluencesItemManager
- (BOOL)playbackInfluencesFollowUser;
- (HFStaticItem)selectedItem;
- (HFStaticItem)useListeningHistoryItem;
- (HUHomeKitAccessorySettingsItemModule)accessorySettingsModule;
- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3;
- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 module:(id)a4 homeKitAccessorySettingItem:(id)a5;
- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 settingItem:(id)a4;
- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSArray)playbackInfluencesOptionItems;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)playbackInfluencesSetting;
- (id)updateUseListeningHistorySetting:(BOOL)a3;
- (void)setAccessorySettingsModule:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setUseListeningHistoryItem:(id)a3;
@end

@implementation HUPlaybackInfluencesItemManager

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPlaybackInfluencesItemManager.m", 28, @"%s is unavailable; use %@ instead",
    "-[HUPlaybackInfluencesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPlaybackInfluencesItemManager.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUPlaybackInfluencesItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 settingItem:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v10.receiver = self;
  v10.super_class = (Class)HUPlaybackInfluencesItemManager;
  v8 = [(HFItemManager *)&v10 initWithDelegate:v6 sourceItem:v7];

  return v8;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 module:(id)a4 homeKitAccessorySettingItem:(id)a5
{
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[a5 copy];
  v14.receiver = self;
  v14.super_class = (Class)HUPlaybackInfluencesItemManager;
  v12 = [(HFItemManager *)&v14 initWithDelegate:v10 sourceItem:v11];

  if (v12) {
    objc_storeStrong((id *)&v12->_accessorySettingsModule, a4);
  }

  return v12;
}

- (id)playbackInfluencesSetting
{
  v2 = [(HUPlaybackInfluencesItemManager *)self settingItem];
  v3 = [v2 homeKitSettingsVendor];
  v4 = [v3 settings];
  v5 = objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68550]);

  return v5;
}

- (BOOL)playbackInfluencesFollowUser
{
  objc_opt_class();
  v3 = [(HUPlaybackInfluencesItemManager *)self settingItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 settingValue];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    v8 = [(HUPlaybackInfluencesItemManager *)self settingItem];
    id v9 = [v8 homeKitSettingsVendor];
    id v6 = objc_msgSend(v9, "hf_settingsValueManager");

    id v10 = [(HUPlaybackInfluencesItemManager *)self playbackInfluencesSetting];
    v11 = [v6 valueForSetting:v10];
    char v7 = [v11 BOOLValue];
  }
  return v7;
}

- (id)updateUseListeningHistorySetting:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(HUPlaybackInfluencesItemManager *)self settingItem];
  id v5 = [NSNumber numberWithBool:v3];
  id v6 = [v4 updateValue:v5];

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__HUPlaybackInfluencesItemManager__buildItemProvidersForHome___block_invoke;
  v13[3] = &unk_1E6385000;
  v13[4] = self;
  id v5 = (void *)[v4 initWithResultsBlock:v13];
  [(HUPlaybackInfluencesItemManager *)self setUseListeningHistoryItem:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F695C8]);
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = [(HUPlaybackInfluencesItemManager *)self useListeningHistoryItem];
  id v9 = [v7 setWithObject:v8];
  id v10 = (void *)[v6 initWithItems:v9];

  v14[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v11;
}

id __62__HUPlaybackInfluencesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = *MEMORY[0x1E4F68AB8];
  BOOL v3 = HFLocalizedString();
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E4F68908];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [*(id *)(a1 + 32) home];
  v15[0] = v5;
  id v6 = [*(id *)(a1 + 32) home];
  char v7 = [v6 accessories];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = (void *)[v4 initWithArray:v8];
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E4F68BC0];
  id v10 = NSNumber;
  [*(id *)(a1 + 32) playbackInfluencesFollowUser];
  v11 = [v10 numberWithInteger:HFPrimaryStateFromBOOL()];
  v17[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v13 = [v2 futureWithResult:v12];

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  char v7 = [v5 array];
  v8 = [(HUPlaybackInfluencesItemManager *)self accessorySettingsModule];
  id v9 = [v8 sourceItem];
  id v10 = [v9 accessories];
  v11 = [v10 anyObject];

  v12 = [(HUPlaybackInfluencesItemManager *)self accessorySettingsModule];
  if (v12)
  {
    [v11 mediaProfile];
  }
  else
  {
    BOOL v3 = [(HUPlaybackInfluencesItemManager *)self settingItem];
    [v3 homeKitSettingsVendor];
  v13 = };
  id v14 = v13;
  if ([v14 conformsToProtocol:&unk_1F1AD86A8]) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (!v12)
  {

    v13 = v3;
  }

  if (v16)
  {
    v17 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v16];
    v18 = objc_msgSend(v16, "hf_home");
    BOOL v19 = +[HUHomeFeatureOnboardingUtilities home:v18 voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:v16 languageOption:v17];
  }
  else
  {
    BOOL v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  v21 = [(HUPlaybackInfluencesItemManager *)self useListeningHistoryItem];
  v22 = [v20 setWithObject:v21];
  int v23 = [v6 intersectsSet:v22];

  if (v23)
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"UpdateListeningHistory"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v29[3] = &__block_descriptor_33_e32___NSMutableAttributedString_8__0l;
    BOOL v30 = v19;
    v25 = __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v29);
    [v24 setAttributedFooterTitle:v25];

    v26 = [(HUPlaybackInfluencesItemManager *)self useListeningHistoryItem];
    v31[0] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v24 setItems:v27];

    [v7 addObject:v24];
  }

  return v7;
}

id __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = HFLocalizedString();
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v3 = HFLocalizedString();
    id v4 = HFLocalizedString();
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v6 = [v3 stringByAppendingString:@" "];
    char v7 = (void *)[v5 initWithString:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v21 = *MEMORY[0x1E4F42530];
    id v9 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
    v22[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v11 = (void *)[v8 initWithString:v2 attributes:v10];
    [v7 appendAttributedString:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13 = [NSString stringWithFormat:@" \n\n%@", v4];
    id v14 = (void *)[v12 initWithString:v13 attributes:0];
    [v7 appendAttributedString:v14];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v16 = HFLocalizedString();
    char v7 = (void *)[v15 initWithString:v16];

    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = *MEMORY[0x1E4F42530];
    BOOL v3 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
    v20 = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v13 = (void *)[v17 initWithString:v2 attributes:v4];
    [v7 appendAttributedString:v13];
  }

  return v7;
}

- (NSArray)playbackInfluencesOptionItems
{
  return self->_playbackInfluencesOptionItems;
}

- (HFStaticItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
}

- (HFStaticItem)useListeningHistoryItem
{
  return self->_useListeningHistoryItem;
}

- (void)setUseListeningHistoryItem:(id)a3
{
}

- (HUHomeKitAccessorySettingsItemModule)accessorySettingsModule
{
  return self->_accessorySettingsModule;
}

- (void)setAccessorySettingsModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsModule, 0);
  objc_storeStrong((id *)&self->_useListeningHistoryItem, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);

  objc_storeStrong((id *)&self->_playbackInfluencesOptionItems, 0);
}

@end