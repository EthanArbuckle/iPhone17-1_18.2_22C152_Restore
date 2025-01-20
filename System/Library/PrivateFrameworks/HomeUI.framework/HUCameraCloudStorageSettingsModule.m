@interface HUCameraCloudStorageSettingsModule
- (BOOL)isItemHeader:(id)a3;
- (HFItemProvider)cloudStorageSectionSettingsItemProvider;
- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4;
- (NSSet)cameraProfiles;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)itemProviders;
- (id)removeAllCameraRecordings;
@end

@implementation HUCameraCloudStorageSettingsModule

- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v8 count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUCameraCloudStorageSettingsModule.m", 23, @"Invalid parameter not satisfying: %@", @"cameraProfiles.count > 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUCameraCloudStorageSettingsModule;
  v9 = [(HFItemModule *)&v14 initWithItemUpdater:v7];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    cameraProfiles = v9->_cameraProfiles;
    v9->_cameraProfiles = (NSSet *)v10;
  }
  return v9;
}

- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraCloudStorageSettingsModule.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUCameraCloudStorageSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)removeAllCameraRecordings
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(HUCameraCloudStorageSettingsModule *)self cameraProfiles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke;
        v16[3] = &unk_1E6385108;
        v16[4] = v9;
        uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v16];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v11 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_16;
  v15[3] = &unk_1E6389E78;
  v15[4] = self;
  v15[5] = a2;
  v12 = [v11 addCompletionBlock:v15];

  return v12;
}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) recordingEventManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_2;
  v7[3] = &unk_1E6385A20;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 deleteAllEventsWithCompletionHandler:v7];
}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error removing all camera clips: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) uniqueIdentifier];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Deleted all clips for profile:%@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_16(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemUpdater];
  v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = [*(id *)(a1 + 32) itemProviders];
  v4 = [v2 requestToReloadItemProviders:v3 senderSelector:*(void *)(a1 + 40)];
  id v5 = (id)[v6 performItemUpdateRequest:v4];
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (id)didSelectItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithNoResult", a3);
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [HUCameraCloudStorageItemProvider alloc];
    id v5 = [(HUCameraCloudStorageSettingsModule *)self cameraProfiles];
    id v6 = [v5 anyObject];
    int v7 = [(HUCameraCloudStorageItemProvider *)v4 initWithCameraProfile:v6];
    cloudStorageSectionSettingsItemProvider = self->_cloudStorageSectionSettingsItemProvider;
    self->_cloudStorageSectionSettingsItemProvider = v7;

    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_cloudStorageSectionSettingsItemProvider, 0);
    uint64_t v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_itemProviders;
    self->_itemProviders = v9;

    itemProviders = self->_itemProviders;
  }
  v11 = itemProviders;

  return v11;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCameraCloudStorageSettingsModule *)self itemProviders];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v23[3] = &unk_1E638D3E8;
  id v24 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "na_flatMap:", v23);

  id v8 = [(HUCameraCloudStorageSettingsModule *)self cloudStorageSectionSettingsItemProvider];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"iCloudStorageSection"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v21 = &unk_1E6386108;
  id v22 = v8;
  id v11 = v8;
  v12 = objc_msgSend(v7, "na_filter:", &v18);
  v13 = objc_msgSend(v12, "allObjects", v18, v19, v20, v21);
  objc_super v14 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  v15 = [v13 sortedArrayUsingComparator:v14];
  [v10 setItems:v15];

  v16 = _HULocalizedStringWithDefaultValue(@"HUCameraEraseFooterString", @"HUCameraEraseFooterString", 1);
  [v10 setFooterTitle:v16];

  [v9 addObject:v10];

  return v9;
}

id __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  id v4 = objc_msgSend(v3, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 items];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFItemProvider)cloudStorageSectionSettingsItemProvider
{
  return self->_cloudStorageSectionSettingsItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStorageSectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end