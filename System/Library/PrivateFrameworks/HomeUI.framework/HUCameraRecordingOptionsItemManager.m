@interface HUCameraRecordingOptionsItemManager
- (HUCameraRecordingSettingsModule)cameraRecordingItemModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (unint64_t)displayStyle;
- (void)cameraRecordingSettingsModule:(id)a3 didUpdateItem:(id)a4;
- (void)setCameraRecordingItemModule:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
@end

@implementation HUCameraRecordingOptionsItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  objc_opt_class();
  v4 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 profile];
    if (objc_msgSend(v7, "hf_supportsRecordingEvents"))
    {
      v8 = [(HUCameraRecordingOptionsItemManager *)self cameraRecordingItemModule];

      if (v8) {
        goto LABEL_9;
      }
      v9 = [HUCameraRecordingSettingsModule alloc];
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      v11 = [v6 profile];
      v12 = [v10 setWithObject:v11];
      v13 = [(HUCameraRecordingSettingsModule *)v9 initWithItemUpdater:self cameraProfiles:v12 displayStyle:[(HUCameraRecordingOptionsItemManager *)self displayStyle]];
      [(HUCameraRecordingOptionsItemManager *)self setCameraRecordingItemModule:v13];

      v7 = [(HUCameraRecordingOptionsItemManager *)self cameraRecordingItemModule];
      [v7 setDelegate:self];
    }
  }
LABEL_9:
  v14 = [(HUCameraRecordingOptionsItemManager *)self cameraRecordingItemModule];
  v15 = [v14 itemProviders];
  v16 = [v15 allObjects];

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraRecordingOptionsItemManager *)self cameraRecordingItemModule];
  id v6 = [v5 buildSectionsWithDisplayedItems:v4];

  return v6;
}

- (void)cameraRecordingSettingsModule:(id)a3 didUpdateItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [(HFItemManager *)self sourceItem];
  v11 = [v9 setWithObject:v10];
  v12 = [(HFItemManager *)self updateResultsForItems:v11 senderSelector:a2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__HUCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke;
  v16[3] = &unk_1E638BFB0;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = (id)[v12 addCompletionBlock:v16];
}

void __83__HUCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Did update recording settings module:%@ with item:%@", (uint8_t *)&v5, 0x16u);
  }
}

- (HUCameraRecordingSettingsModule)cameraRecordingItemModule
{
  return self->_cameraRecordingItemModule;
}

- (void)setCameraRecordingItemModule:(id)a3
{
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void).cxx_destruct
{
}

@end