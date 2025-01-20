@interface HUAccessorySettingsSiriOutputVoiceItemManager
- (HFAccessorySettingSiriLanguageAdapter)adapter;
- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager;
- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3;
- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 groupItem:(id)a4;
- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 siriLanguageOptionsManager:(id)a4 sourceItem:(id)a5;
- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUSiriLanguageOptionItemProvider)accentOptionItemProvider;
- (HUSiriLanguageOptionItemProvider)genderOptionItemProvider;
- (SiriTTSPreviewRequest)previewRequest;
- (SiriTTSServiceSession)session;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)updateSelectionWithOptionItem:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)dealloc;
- (void)setAccentOptionItemProvider:(id)a3;
- (void)setGenderOptionItemProvider:(id)a3;
- (void)setPreviewRequest:(id)a3;
- (void)setSession:(id)a3;
- (void)setSiriLanguageOptionsManager:(id)a3;
- (void)siriLanguageAdapter:(id)a3 availableLanguageOptionsDidChange:(id)a4;
- (void)siriLanguageAdapter:(id)a3 selectedLanguageOptionDidChange:(id)a4;
- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4;
- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4;
@end

@implementation HUAccessorySettingsSiriOutputVoiceItemManager

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsSiriOutputVoiceItemManager.m", 43, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_groupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsSiriOutputVoiceItemManager.m", 45, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v27.receiver = self;
  v27.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  v8 = [(HFItemManager *)&v27 initWithDelegate:v6 sourceItem:v7];

  if (v8)
  {
    v9 = [v7 homeKitSettingsVendor];
    v10 = objc_msgSend(v9, "hf_settingsAdapterManager");
    uint64_t v11 = [v10 adapterForIdentifier:*MEMORY[0x1E4F67FC0]];
    adapter = v8->_adapter;
    v8->_adapter = (HFAccessorySettingSiriLanguageAdapter *)v11;

    v13 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v14 = [v13 homeManager];
    int v15 = [v14 hasOptedToHH2];

    if (v15)
    {
      objc_opt_class();
      v16 = [v7 homeKitSettingsVendor];
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        uint64_t v19 = objc_msgSend(v18, "hf_siriLanguageOptionsManager");
        siriLanguageOptionsManager = v8->_siriLanguageOptionsManager;
        v8->_siriLanguageOptionsManager = (HFSiriLanguageOptionsManager *)v19;
      }
      else
      {
        objc_opt_class();
        siriLanguageOptionsManager = [v7 homeKitSettingsVendor];
        if (objc_opt_isKindOfClass()) {
          v21 = siriLanguageOptionsManager;
        }
        else {
          v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          v23 = objc_msgSend(v22, "hf_siriLanguageOptionsManager");
        }
        else
        {
          v23 = 0;
        }
        objc_storeStrong((id *)&v8->_siriLanguageOptionsManager, v23);
        if (v22) {

        }
        else {
          siriLanguageOptionsManager = 0;
        }
      }
    }
    v24 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E4FA4F50]);
    session = v8->_session;
    v8->_session = v24;
  }
  return v8;
}

- (void)dealloc
{
  if (self->_previewRequest) {
    -[SiriTTSServiceSession cancelWithRequest:](self->_session, "cancelWithRequest:");
  }
  v3.receiver = self;
  v3.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  [(HFItemManager *)&v3 dealloc];
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 siriLanguageOptionsManager:(id)a4 sourceItem:(id)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[a5 copy];
  v16.receiver = self;
  v16.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  v12 = [(HFItemManager *)&v16 initWithDelegate:v10 sourceItem:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_siriLanguageOptionsManager, a4);
    v13 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E4FA4F50]);
    session = v12->_session;
    v12->_session = v13;
  }
  return v12;
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
    v8 = [v7 languageOption];
    id v9 = [v8 outputLanguage];

    id v10 = [v7 languageOption];
    uint64_t v11 = [v10 voiceName];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FA4F70]) initWithLanguage:v9 name:v11];
    v13 = (SiriTTSPreviewRequest *)[objc_alloc(MEMORY[0x1E4FA4F40]) initWithVoice:v12 previewType:0];
    previewRequest = self->_previewRequest;
    self->_previewRequest = v13;

    session = self->_session;
    objc_super v16 = self->_previewRequest;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    objc_super v27 = __79__HUAccessorySettingsSiriOutputVoiceItemManager_updateSelectionWithOptionItem___block_invoke;
    v28 = &unk_1E6385A20;
    id v29 = v9;
    id v30 = v11;
    id v17 = v11;
    id v18 = v9;
    [(SiriTTSServiceSession *)session speakWithPreviewRequest:v16 didFinish:&v25];
    uint64_t v19 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];

    if (v19) {
      [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];
    }
    else {
    id v22 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self adapter];
    }
    v23 = [v7 languageOption];
    v21 = [v22 updateSelectedLanguageOption:v23];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F7A0D8];
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
    v21 = [v20 futureWithError:v12];
  }

  return v21;
}

void __79__HUAccessorySettingsSiriOutputVoiceItemManager_updateSelectionWithOptionItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3 == 0;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Voice Preview completed successfully:%d for language:%@ voiceName:%@", (uint8_t *)v7, 0x1Cu);
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setAccentOptionItemProvider:0];
  [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setGenderOptionItemProvider:0];
  id v4 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];

  uint64_t v5 = [HUSiriLanguageOptionItemProvider alloc];
  if (v4)
  {
    uint64_t v6 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];
    id v7 = [(HFItemManager *)self sourceItem];
    __int16 v8 = [(HUSiriLanguageOptionItemProvider *)v5 initWithSiriLanguageOptionsManager:v6 sourceItem:v7 optionStyle:1];
    [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setAccentOptionItemProvider:v8];

    uint64_t v9 = [HUSiriLanguageOptionItemProvider alloc];
    __int16 v10 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];
    uint64_t v11 = [(HFItemManager *)self sourceItem];
    uint64_t v12 = [(HUSiriLanguageOptionItemProvider *)v9 initWithSiriLanguageOptionsManager:v10 sourceItem:v11 optionStyle:2];
    [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setGenderOptionItemProvider:v12];
  }
  else
  {
    v13 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self adapter];
    v14 = [(HUSiriLanguageOptionItemProvider *)v5 initWithAdapter:v13 optionStyle:1];
    [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setAccentOptionItemProvider:v14];

    int v15 = [HUSiriLanguageOptionItemProvider alloc];
    __int16 v10 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self adapter];
    uint64_t v11 = [(HUSiriLanguageOptionItemProvider *)v15 initWithAdapter:v10 optionStyle:2];
    [(HUAccessorySettingsSiriOutputVoiceItemManager *)self setGenderOptionItemProvider:v11];
  }

  objc_super v16 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self accentOptionItemProvider];
  if (v16)
  {
    id v17 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self genderOptionItemProvider];
    if (v17)
    {
      id v18 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self accentOptionItemProvider];
      v22[0] = v18;
      uint64_t v19 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self genderOptionItemProvider];
      v22[1] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Accents"];
  id v7 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self accentOptionItemProvider];
  __int16 v8 = [v7 items];
  uint64_t v9 = objc_msgSend(v8, "na_setByIntersectingWithSet:", v4);

  __int16 v10 = [v9 allObjects];
  uint64_t v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
  uint64_t v12 = [v10 sortedArrayUsingComparator:v11];
  [v6 setItems:v12];

  v13 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsSiriOutputVoiceVarietySectionTitle", @"HUAccessorySettingsSiriOutputVoiceVarietySectionTitle", 1);
  [v6 setHeaderTitle:v13];

  v14 = [v6 items];
  unint64_t v15 = [v14 count];

  if (v15 >= 2) {
    [v5 addObject:v6];
  }
  objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Genders"];
  id v17 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self genderOptionItemProvider];
  id v18 = [v17 items];
  uint64_t v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_157];
  [v16 setItems:v19];

  v20 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsSiriOutputVoiceSectionTitle", @"HUAccessorySettingsSiriOutputVoiceSectionTitle", 1);
  [v16 setHeaderTitle:v20];

  v21 = [v16 items];
  unint64_t v22 = [v21 count];

  if (v22 >= 2) {
    [v5 addObject:v16];
  }

  return v5;
}

uint64_t __82__HUAccessorySettingsSiriOutputVoiceItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F4E4C8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 sharedInstance];
  __int16 v8 = [v7 outputVoiceComparator];
  uint64_t v9 = [v6 languageOption];

  __int16 v10 = [v9 outputVoice];
  uint64_t v11 = [v5 languageOption];

  uint64_t v12 = [v11 outputVoice];
  uint64_t v13 = ((uint64_t (**)(void, void *, void *))v8)[2](v8, v10, v12);

  return v13;
}

- (void)_registerForExternalUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  [(HFItemManager *)&v5 _registerForExternalUpdates];
  id v3 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];
  [v3 addObserver:self];

  id v4 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self adapter];
  [v4 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  id v3 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self adapter];
  [v3 removeObserver:self];

  id v4 = [(HUAccessorySettingsSiriOutputVoiceItemManager *)self siriLanguageOptionsManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  [(HFItemManager *)&v5 _unregisterForExternalUpdates];
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

- (HUSiriLanguageOptionItemProvider)accentOptionItemProvider
{
  return self->_accentOptionItemProvider;
}

- (void)setAccentOptionItemProvider:(id)a3
{
}

- (HUSiriLanguageOptionItemProvider)genderOptionItemProvider
{
  return self->_genderOptionItemProvider;
}

- (void)setGenderOptionItemProvider:(id)a3
{
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
{
}

- (SiriTTSServiceSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (SiriTTSPreviewRequest)previewRequest
{
  return self->_previewRequest;
}

- (void)setPreviewRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_genderOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_accentOptionItemProvider, 0);

  objc_storeStrong((id *)&self->_adapter, 0);
}

@end