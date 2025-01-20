@interface HUCameraRecordingOptionsModule
- (BOOL)isItemHeader:(id)a3;
- (HFStaticItemProvider)recordAudioItemProvider;
- (HUCameraCloudStorageSettingsModule)cloudStorageModule;
- (HUCameraRecordAudioSettingsItem)recordAudioItem;
- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3;
- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4;
- (HUCameraSmartDetectionSettingsModule)smartDetectionModule;
- (NSSet)cameraProfiles;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (void)_buildItemProviders;
- (void)setItemProviders:(id)a3;
- (void)setRecordAudioItem:(id)a3;
- (void)setRecordAudioItemProvider:(id)a3;
- (void)updateRecordAudioValue:(BOOL)a3;
@end

@implementation HUCameraRecordingOptionsModule

- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v8 count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUCameraRecordingOptionsModule.m", 30, @"Invalid parameter not satisfying: %@", @"cameraProfiles.count > 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUCameraRecordingOptionsModule;
  v9 = [(HFItemModule *)&v14 initWithItemUpdater:v7];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    cameraProfiles = v9->_cameraProfiles;
    v9->_cameraProfiles = (NSSet *)v10;

    [(HUCameraRecordingOptionsModule *)v9 _buildItemProviders];
  }

  return v9;
}

- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraRecordingOptionsModule.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUCameraRecordingOptionsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (void)_buildItemProviders
{
  v3 = [HUCameraSmartDetectionSettingsModule alloc];
  v4 = [(HFItemModule *)self itemUpdater];
  v5 = [(HUCameraRecordingOptionsModule *)self cameraProfiles];
  v6 = [(HUCameraSmartDetectionSettingsModule *)v3 initWithItemUpdater:v4 cameraProfiles:v5 conditionCollection:0 settingsContext:0];
  smartDetectionModule = self->_smartDetectionModule;
  self->_smartDetectionModule = v6;

  id v8 = [HUCameraCloudStorageSettingsModule alloc];
  v9 = [(HFItemModule *)self itemUpdater];
  uint64_t v10 = [(HUCameraRecordingOptionsModule *)self cameraProfiles];
  v11 = [(HUCameraCloudStorageSettingsModule *)v8 initWithItemUpdater:v9 cameraProfiles:v10];
  cloudStorageModule = self->_cloudStorageModule;
  self->_cloudStorageModule = v11;

  v13 = [HUCameraRecordAudioSettingsItem alloc];
  objc_super v14 = [(HUCameraRecordingOptionsModule *)self cameraProfiles];
  v15 = [v14 anyObject];
  v16 = [(HUCameraRecordAudioSettingsItem *)v13 initWithCameraProfile:v15];
  [(HUCameraRecordingOptionsModule *)self setRecordAudioItem:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F695C8]);
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [(HUCameraRecordingOptionsModule *)self recordAudioItem];
  v20 = [v18 setWithObject:v19];
  v21 = (void *)[v17 initWithItems:v20];
  [(HUCameraRecordingOptionsModule *)self setRecordAudioItemProvider:v21];

  id v28 = [(HUCameraRecordingOptionsModule *)self smartDetectionModule];
  v22 = [v28 itemProviders];
  v23 = [(HUCameraRecordingOptionsModule *)self recordAudioItemProvider];
  v24 = [v22 setByAddingObject:v23];
  v25 = [(HUCameraRecordingOptionsModule *)self cloudStorageModule];
  v26 = [v25 itemProviders];
  v27 = [v24 setByAddingObjectsFromSet:v26];
  [(HUCameraRecordingOptionsModule *)self setItemProviders:v27];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUCameraRecordingOptionsModule *)self smartDetectionModule];
  v6 = [v5 buildSectionsWithDisplayedItems:v4];

  id v7 = [(HUCameraRecordingOptionsModule *)self cloudStorageModule];
  id v8 = [v7 buildSectionsWithDisplayedItems:v4];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"recordAudioSection"];
  uint64_t v10 = [(HUCameraRecordingOptionsModule *)self recordAudioItem];
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v9 setItems:v11];

  v12 = [v6 arrayByAddingObject:v9];
  v13 = [v12 arrayByAddingObjectsFromArray:v8];

  objc_super v14 = [MEMORY[0x1E4F69220] filterSections:v13 toDisplayedItems:v4];

  return v14;
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraRecordingOptionsModule *)self smartDetectionModule];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(HUCameraRecordingOptionsModule *)self smartDetectionModule];
    id v7 = [v6 allItems];
    int v8 = [v7 containsObject:v4];

    if (!v8) {
      goto LABEL_5;
    }
    v5 = [(HUCameraRecordingOptionsModule *)self smartDetectionModule];
    id v9 = (id)[v5 didSelectItem:v4];
  }

LABEL_5:
  uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v10;
}

- (void)updateRecordAudioValue:(BOOL)a3
{
  BOOL v3 = a3;
  v6 = [(HUCameraRecordingOptionsModule *)self recordAudioItem];
  id v7 = [v6 updateRecordAudioSettingWithValue:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HUCameraRecordingOptionsModule_updateRecordAudioValue___block_invoke;
  v9[3] = &unk_1E63871D8;
  v9[4] = self;
  v9[5] = a2;
  id v8 = (id)[v7 addCompletionBlock:v9];
}

void __57__HUCameraRecordingOptionsModule_updateRecordAudioValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [*(id *)(a1 + 32) recordAudioItem];
      v6 = [v5 cameraProfile];
      id v7 = [v6 userSettings];
      int v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Failed to change audio recording setting for camera settings: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v8 = [*(id *)(a1 + 32) itemUpdater];
  id v9 = (void *)MEMORY[0x1E4F69230];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = [*(id *)(a1 + 32) recordAudioItemProvider];
  v12 = [v10 setWithObject:v11];
  v13 = [v9 requestToReloadItemProviders:v12 senderSelector:*(void *)(a1 + 40)];
  id v14 = (id)[v8 performItemUpdateRequest:v13];
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (HUCameraSmartDetectionSettingsModule)smartDetectionModule
{
  return self->_smartDetectionModule;
}

- (HUCameraCloudStorageSettingsModule)cloudStorageModule
{
  return self->_cloudStorageModule;
}

- (HUCameraRecordAudioSettingsItem)recordAudioItem
{
  return self->_recordAudioItem;
}

- (void)setRecordAudioItem:(id)a3
{
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFStaticItemProvider)recordAudioItemProvider
{
  return self->_recordAudioItemProvider;
}

- (void)setRecordAudioItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordAudioItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_recordAudioItem, 0);
  objc_storeStrong((id *)&self->_cloudStorageModule, 0);
  objc_storeStrong((id *)&self->_smartDetectionModule, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end