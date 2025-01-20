@interface HUAudioAnalysisSettingsItemModule
+ (id)_audioAnalysisDeviceItemComparator;
- (HFAccessoryItemProvider)accessoryItemProvider;
- (HFItemProvider)audioAnalysisDeviceItemProvider;
- (HFItemProvider)soundsItemProvider;
- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider;
- (HMHome)home;
- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3;
- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)enableAudioAnalysisSetting:(BOOL)a3 forItem:(id)a4;
- (id)itemProviders;
- (id)updateAudioAnalysisDetectionSettings:(BOOL)a3 forItem:(id)a4;
- (void)_buildItemProviders;
- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5;
- (void)setAccessoryItemProvider:(id)a3;
- (void)setAudioAnalysisDeviceItemProvider:(id)a3;
- (void)setHome:(id)a3;
- (void)setMediaAccessoryItemProvider:(id)a3;
- (void)setSoundsItemProvider:(id)a3;
@end

@implementation HUAudioAnalysisSettingsItemModule

- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUAudioAnalysisSettingsItemModule.m", 34, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUAudioAnalysisSettingsItemModule;
  v9 = [(HFItemModule *)&v13 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    [(HUAudioAnalysisSettingsItemModule *)v10 _buildItemProviders];
  }

  return v10;
}

- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAudioAnalysisSettingsItemModule.m", 46, @"%s is unavailable; use %@ instead",
    "-[HUAudioAnalysisSettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (void)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F69288]);
  v4 = [(HUAudioAnalysisSettingsItemModule *)self home];
  v5 = (void *)[v3 initWithHome:v4];
  [(HUAudioAnalysisSettingsItemModule *)self setMediaAccessoryItemProvider:v5];

  v6 = [(HUAudioAnalysisSettingsItemModule *)self mediaAccessoryItemProvider];
  [v6 setFilter:&__block_literal_global_172];

  id v7 = [HUHomeAudioAnalysisDetectionSettingsItemProvider alloc];
  id v8 = [(HUAudioAnalysisSettingsItemModule *)self home];
  v9 = [(HUHomeAudioAnalysisDetectionSettingsItemProvider *)v7 initWithHome:v8];
  [(HUAudioAnalysisSettingsItemModule *)self setSoundsItemProvider:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F696B0]);
  v11 = [(HUAudioAnalysisSettingsItemModule *)self mediaAccessoryItemProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_3;
  v16[3] = &unk_1E638DB80;
  v16[4] = self;
  v12 = (void *)[v10 initWithSourceProvider:v11 transformationBlock:v16];
  [(HUAudioAnalysisSettingsItemModule *)self setAudioAnalysisDeviceItemProvider:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F68E20]);
  v14 = [(HUAudioAnalysisSettingsItemModule *)self home];
  v15 = (void *)[v13 initWithHome:v14];

  [v15 setFilter:&__block_literal_global_288];
}

uint64_t __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1AD86A8]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 accessories];
    uint64_t v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_263);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v2 supportsAudioAnalysis];
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsAudioAnalysis];
}

id __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_4;
  v9[3] = &unk_1E638B630;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  uint64_t v7 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v9];

  return v7;
}

id __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;

  id v7 = *(id *)(a1 + 32);
  id v8 = &unk_1F1A3D2C0;
  if ([v7 conformsToProtocol:v8]) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if ([v10 isSiriEndpointAccessory])
  {
    uint64_t v11 = [v10 commonSettingsManager];

    if (v11)
    {
      v12 = [v10 commonSettingsManager];
      [v12 addObserver:*(void *)(a1 + 40)];
    }
  }
  id v13 = NSNumber;
  [v10 isAudioAnalysisEnabled];
  v14 = [v13 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

void *__56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
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
    id v7 = objc_msgSend(v5, "hf_primaryService");

    if (v7)
    {
      id v6 = (void *)[v5 supportsAudioAnalysis];
      goto LABEL_9;
    }
LABEL_8:
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)itemProviders
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUAudioAnalysisSettingsItemModule *)self soundsItemProvider];
  id v5 = [(HUAudioAnalysisSettingsItemModule *)self audioAnalysisDeviceItemProvider];
  id v6 = [(HUAudioAnalysisSettingsItemModule *)self accessoryItemProvider];
  id v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);

  return v7;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAudioAnalysisSettingsAudioAnalysisSoundsItemSectionIdentifier"];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUListenSettingsSoundsSection_Header", @"HUListenSettingsSoundsSection_Header", 1);
  [v6 setHeaderTitle:v7];

  id v8 = objc_opt_new();
  v9 = [(HUAudioAnalysisSettingsItemModule *)self soundsItemProvider];
  id v10 = [v9 items];
  uint64_t v11 = [v10 allObjects];
  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v11);

  [v6 setItems:v8];
  [v5 addObject:v6];
  v12 = [(HUAudioAnalysisSettingsItemModule *)self home];
  uint64_t v13 = [v12 audioAnalysisClassifierOptions];

  if (v13)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAudioAnalysisSettingsAudioAnalysisDeviceItemSectionIdentifier"];
    v15 = _HULocalizedStringWithDefaultValue(@"HUListenSettingsHomePodSection_Header", @"HUListenSettingsHomePodSection_Header", 1);
    [v14 setHeaderTitle:v15];

    v16 = _HULocalizedStringWithDefaultValue(@"HUListenSettingsHomePodSection_Footer", @"HUListenSettingsHomePodSection_Footer", 1);
    [v14 setFooterTitle:v16];

    v17 = objc_opt_new();
    v18 = [(HUAudioAnalysisSettingsItemModule *)self audioAnalysisDeviceItemProvider];
    v19 = [v18 items];
    v20 = [v19 allObjects];
    objc_msgSend(v17, "na_safeAddObjectsFromArray:", v20);

    v21 = (void *)[v17 copy];
    v22 = [(id)objc_opt_class() _audioAnalysisDeviceItemComparator];
    v23 = [v21 sortedArrayUsingComparator:v22];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69__HUAudioAnalysisSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v26[3] = &unk_1E6386108;
    id v27 = v4;
    v24 = objc_msgSend(v23, "na_filter:", v26);
    [v14 setItems:v24];

    [v5 addObject:v14];
  }

  return v5;
}

uint64_t __69__HUAudioAnalysisSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)enableAudioAnalysisSetting:(BOOL)a3 forItem:(id)a4
{
  id v5 = [a4 sourceItem];
  id v6 = &unk_1F1A3D2C0;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke;
    v12[3] = &unk_1E6388DB0;
    id v13 = v8;
    BOOL v14 = a3;
    id v10 = [v9 futureWithBlock:v12];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

void __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) setEnableAudioAnalysis:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E63850B8;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v7];
}

void __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Failed to update enable audio analysis setting : %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  [*(id *)(a1 + 32) finishWithResult:v5 error:v6];
}

+ (id)_audioAnalysisDeviceItemComparator
{
  return &__block_literal_global_313_0;
}

uint64_t __71__HUAudioAnalysisSettingsItemModule__audioAnalysisDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F69220];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 defaultItemComparator];
  uint64_t v8 = ((uint64_t (**)(void, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v11 = [(HFItemModule *)self itemUpdater];
  v12 = (void *)MEMORY[0x1E4F69230];
  id v13 = [(HUAudioAnalysisSettingsItemModule *)self itemProviders];
  BOOL v14 = [v12 requestToReloadItemProviders:v13 senderSelector:a2];
  id v15 = (id)[v11 performItemUpdateRequest:v14];
}

- (id)updateAudioAnalysisDetectionSettings:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v8 = [(HUAudioAnalysisSettingsItemModule *)self home];
  uint64_t v9 = [v8 audioAnalysisClassifierOptions];

  uint64_t v10 = [v7 audioDetectionType];
  uint64_t v11 = v10 | v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke;
  v16[3] = &unk_1E638A2F8;
  if (!v4) {
    uint64_t v11 = v9 & ~v10;
  }
  v16[4] = self;
  void v16[5] = v11;
  v12 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_317;
  v15[3] = &unk_1E63877D0;
  v15[4] = self;
  v15[5] = a2;
  id v13 = [v12 addCompletionBlock:v15];

  return v13;
}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) home];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_2;
  v8[3] = &unk_1E6385A20;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v7 = v3;
  [v4 updateAudioAnalysisClassifierOptions:v6 completion:v8];
}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error setting audio analysis classifier setting: %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated audio analysis classifier settings", (uint8_t *)&v10, 2u);
    }

    uint64_t v6 = NSNumber;
    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) home];
    id v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "audioAnalysisClassifierOptions"));
    [v7 finishWithResult:v9 error:0];
  }
}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_317(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemUpdater];
  id v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = [*(id *)(a1 + 32) itemProviders];
  BOOL v4 = [v2 requestToReloadItemProviders:v3 senderSelector:*(void *)(a1 + 40)];
  id v5 = (id)[v6 performItemUpdateRequest:v4];
}

- (HFItemProvider)audioAnalysisDeviceItemProvider
{
  return self->_audioAnalysisDeviceItemProvider;
}

- (void)setAudioAnalysisDeviceItemProvider:(id)a3
{
}

- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider
{
  return self->_mediaAccessoryItemProvider;
}

- (void)setMediaAccessoryItemProvider:(id)a3
{
}

- (HFItemProvider)soundsItemProvider
{
  return self->_soundsItemProvider;
}

- (void)setSoundsItemProvider:(id)a3
{
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_soundsItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, 0);

  objc_storeStrong((id *)&self->_audioAnalysisDeviceItemProvider, 0);
}

@end