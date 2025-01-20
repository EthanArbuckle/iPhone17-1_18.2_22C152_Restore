@interface HUMultiCameraRecordingOptionsItemManager
- (NSMutableArray)cameraRecordingItemModules;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)cameraRecordingSettingsModule:(id)a3 didUpdateItem:(id)a4;
- (void)setCameraRecordingItemModules:(id)a3;
@end

@implementation HUMultiCameraRecordingOptionsItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUMultiCameraRecordingOptionsItemManager *)self cameraRecordingItemModules];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(HUMultiCameraRecordingOptionsItemManager *)self setCameraRecordingItemModules:v6];

    v7 = objc_msgSend(v4, "hf_allCameraProfilesSupportingRecording");
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__HUMultiCameraRecordingOptionsItemManager__buildItemProvidersForHome___block_invoke;
    v25[3] = &unk_1E6391C50;
    v25[4] = self;
    objc_msgSend(v7, "na_each:", v25);
  }
  objc_opt_class();
  v8 = [(HUMultiCameraRecordingOptionsItemManager *)self cameraRecordingItemModules];
  v9 = [v8 lastObject];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  [v11 setShouldShowFooterTitle:1];
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = [(HUMultiCameraRecordingOptionsItemManager *)self cameraRecordingItemModules];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v21 + 1) + 8 * i) itemProviders];
        v19 = [v18 allObjects];
        [v12 addObjectsFromArray:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v15);
  }

  return v12;
}

void __71__HUMultiCameraRecordingOptionsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HUMultiCameraRecordingSettingsModule alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];

  v8 = [(HUMultiCameraRecordingSettingsModule *)v4 initWithItemUpdater:v5 cameraProfiles:v6 displayStyle:2];
  [(HUCameraRecordingSettingsModule *)v8 setDelegate:*(void *)(a1 + 32)];
  v7 = [*(id *)(a1 + 32) cameraRecordingItemModules];
  [v7 addObject:v8];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUMultiCameraRecordingOptionsItemManager *)self cameraRecordingItemModules];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = [(HUMultiCameraRecordingOptionsItemManager *)self cameraRecordingItemModules];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__HUMultiCameraRecordingOptionsItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v13[3] = &unk_1E6391C78;
    id v14 = v4;
    id v9 = v7;
    id v15 = v9;
    objc_msgSend(v8, "na_each:", v13);

    v10 = v15;
    id v11 = v9;
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

void __77__HUMultiCameraRecordingOptionsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 buildSectionsWithDisplayedItems:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObjectsFromArray:v3];
}

- (void)cameraRecordingSettingsModule:(id)a3 didUpdateItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [(HFItemManager *)self sourceItem];
  id v11 = [v9 setWithObject:v10];
  v12 = [(HFItemManager *)self updateResultsForItems:v11 senderSelector:a2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__HUMultiCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke;
  v16[3] = &unk_1E638BFB0;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = (id)[v12 addCompletionBlock:v16];
}

void __88__HUMultiCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke(uint64_t a1)
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

- (NSMutableArray)cameraRecordingItemModules
{
  return self->_cameraRecordingItemModules;
}

- (void)setCameraRecordingItemModules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end