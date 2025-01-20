@interface MDIndexExtensionManager
@end

@implementation MDIndexExtensionManager

uint64_t __41___MDIndexExtensionManager_sharedManager__block_invoke()
{
  sharedManager__sharedManager = objc_alloc_init(_MDIndexExtensionManager);

  return MEMORY[0x1F41817F8]();
}

void __42___MDIndexExtensionManager_loadExtensions__block_invoke(uint64_t a1)
{
  v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D0E3000, v2, OS_LOG_TYPE_INFO, "One time load of extensions 1!", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) extensionLoader];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42___MDIndexExtensionManager_loadExtensions__block_invoke_7;
  v4[3] = &unk_1E554CBB0;
  v4[4] = *(void *)(a1 + 32);
  [v3 startLookingForExtensionsWithMatchUpdateHandler:v4];
}

void __42___MDIndexExtensionManager_loadExtensions__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_INFO, "Extensions callback 1 %@ %@", (uint8_t *)&v14, 0x16u);
  }

  v11 = [*(id *)(a1 + 32) extensionsCondition];
  [v11 lock];

  objc_msgSend(*(id *)(a1 + 32), "setLoaderCallbackCount:", objc_msgSend(*(id *)(a1 + 32), "loaderCallbackCount") + 1);
  [*(id *)(a1 + 32) setIndexExtensionsByBundleID:v7];
  [*(id *)(a1 + 32) setFileProviderBundleMap:v8];
  [*(id *)(a1 + 32) setFileProviderBundleIDs:v9];

  v12 = [*(id *)(a1 + 32) extensionsCondition];
  [v12 broadcast];

  v13 = [*(id *)(a1 + 32) extensionsCondition];
  [v13 unlock];

  [*(id *)(a1 + 32) _notifyForLoadedExtensions];
}

@end