@interface HUAudioAnalysisDetectionSettingsModule
- (HFItemProvider)audioDetectionSettingsItemProvider;
- (HMAccessory)accessory;
- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3;
- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3 accessory:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
@end

@implementation HUAudioAnalysisDetectionSettingsModule

- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3 accessory:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAudioAnalysisDetectionSettingsModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_accessory, a4);
  }

  return v9;
}

- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_accessory_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAudioAnalysisDetectionSettingsModule.m", 35, @"%s is unavailable; use %@ instead",
    "-[HUAudioAnalysisDetectionSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [HUAudioAnalysisDetectionSettingsItemProvider alloc];
    v5 = [(HUAudioAnalysisDetectionSettingsModule *)self accessory];
    v6 = [(HUAudioAnalysisDetectionSettingsItemProvider *)v4 initWithAccessory:v5];
    audioDetectionSettingsItemProvider = self->_audioDetectionSettingsItemProvider;
    self->_audioDetectionSettingsItemProvider = v6;

    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_audioDetectionSettingsItemProvider, 0);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_itemProviders;
    self->_itemProviders = v8;

    itemProviders = self->_itemProviders;
  }
  v10 = itemProviders;

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [(HUAudioAnalysisDetectionSettingsModule *)self itemProviders];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v23[3] = &unk_1E638D3E8;
  id v24 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_flatMap:", v23);

  v8 = objc_opt_new();
  v9 = [(HUAudioAnalysisDetectionSettingsModule *)self audioDetectionSettingsItemProvider];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAudioAnalysisDetectionSettingsSoundDetectionSectionIdentifier"];
  objc_super v11 = _HULocalizedStringWithDefaultValue(@"HUAudioAnalysisEventSettings_Title", @"HUAudioAnalysisEventSettings_Title", 1);
  [v10 setHeaderTitle:v11];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v21 = &unk_1E6386108;
  id v22 = v9;
  id v12 = v9;
  v13 = objc_msgSend(v7, "na_filter:", &v18);
  v14 = objc_msgSend(v13, "allObjects", v18, v19, v20, v21);
  v15 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  v16 = [v14 sortedArrayUsingComparator:v15];
  [v10 setItems:v16];

  [v8 addObject:v10];

  return v8;
}

id __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 items];
  id v4 = objc_msgSend(v3, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 items];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFItemProvider)audioDetectionSettingsItemProvider
{
  return self->_audioDetectionSettingsItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDetectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end