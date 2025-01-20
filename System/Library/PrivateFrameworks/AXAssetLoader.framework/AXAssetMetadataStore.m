@interface AXAssetMetadataStore
+ (AXAssetMetadataStore)store;
- (NSUserDefaults)defaults;
- (id)_init;
- (id)heldAssertionsForAssetType:(id)a3;
- (id)overrideMaximumCompatibilityVersionForAssetType:(id)a3;
- (id)overrideMinimumCompatibilityVersionForAssetType:(id)a3;
- (id)valueForKey:(id)a3 forAssetType:(id)a4;
- (void)_mutateAssertionsForAssetType:(id)a3 assertions:(id)a4 mutationBlock:(id)a5;
- (void)_mutateAssetAssertions:(id)a3;
- (void)_mutateAssetEvents:(id)a3 block:(id)a4;
- (void)_mutateAssetEventsForAssetType:(id)a3 events:(id)a4 mutationBlock:(id)a5;
- (void)_mutateInstalledAssets:(id)a3;
- (void)_mutateInstalledAssetsForAssetType:(id)a3 installedAssets:(id)a4 mutationBlock:(id)a5;
- (void)_mutateOverrides:(id)a3;
- (void)_mutateOverridesForAssetType:(id)a3 overrides:(id)a4 mutationBlock:(id)a5;
- (void)_mutateUserInfo:(id)a3;
- (void)_mutateUserInfoForAssetType:(id)a3 userInfo:(id)a4 mutationBlock:(id)a5;
- (void)_performWithLock:(id)a3;
- (void)discardAllAssertionsOfType:(id)a3;
- (void)discardAllAssertionsOfType:(id)a3 heldByClient:(id)a4;
- (void)discardAssertion:(id)a3;
- (void)recordAssetRefreshEventForAssetType:(id)a3;
- (void)recordAssetsToBeDownloaded:(id)a3 forAssetType:(id)a4;
- (void)recordAssetsToBePurged:(id)a3 forAssetType:(id)a4;
- (void)recordInstalledAssets:(id)a3 forAssetType:(id)a4;
- (void)recordLastAssetAccess:(id)a3;
- (void)requestAssertion:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setOverrideMaximumCompatibilityVersion:(id)a3 forAssetType:(id)a4;
- (void)setOverrideMinimumCompatibilityVersion:(id)a3 forAssetType:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 forAssetType:(id)a5;
@end

@implementation AXAssetMetadataStore

- (void)recordInstalledAssets:(id)a3 forAssetType:(id)a4
{
  id v6 = a4;
  v7 = +[AXAsset installedAssets:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

- (void)_performWithLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateInstalledAssets:v3];
}

- (void)_mutateInstalledAssets:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(AXAssetMetadataStore *)self defaults];
  id v5 = [v4 dictionaryForKey:@"InstalledAssets"];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v8[2](v8, v6);
  v7 = [(AXAssetMetadataStore *)self defaults];
  [v7 setObject:v6 forKey:@"InstalledAssets"];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_3;
  v5[3] = &unk_1E6C42150;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateInstalledAssetsForAssetType:v4 installedAssets:a2 mutationBlock:v5];
}

- (void)_mutateInstalledAssetsForAssetType:(id)a3 installedAssets:(id)a4 mutationBlock:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
  }
  v11[2](v11, v10);
  [v7 setObject:v10 forKey:v8];
}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 removeAllObjects];
  v3 = objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_18);
  if ([v3 count]) {
    [v4 addObjectsFromArray:v3];
  }
}

+ (AXAssetMetadataStore)store
{
  if (store_onceToken != -1) {
    dispatch_once(&store_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_Store;
  return (AXAssetMetadataStore *)v2;
}

uint64_t __29__AXAssetMetadataStore_store__block_invoke()
{
  _Store = [[AXAssetMetadataStore alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAssetMetadataStore;
  v2 = [(AXAssetMetadataStore *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if ((AXProcessIsAXAssetsd() & 1) != 0
      || (AXCUProcessIsVoiceOverTouch() & 1) != 0
      || (AXCUProcessIsAXUIServer() & 1) != 0
      || (AXCUProcessIsAssistiveTouch() & 1) != 0
      || (AXCUProcessIsPreferences() & 1) != 0
      || (AXCUProcessIsVoiceOverUtilityApp() & 1) != 0
      || AXCUProcessIsMagnifierAngel())
    {
      id v4 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Accessibility.Assets"];
      [(AXAssetMetadataStore *)v3 setDefaults:v4];
    }
    else
    {
      id v4 = AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_INFO, "Process was not allowed to read/write from com.apple.Accessibility.Assets for AXAssetMetadataStore", v6, 2u);
      }
    }
  }
  return v3;
}

- (void)requestAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyListRepresentation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke;
  v8[3] = &unk_1E6C421A0;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(AXAssetMetadataStore *)self _performWithLock:v8];
}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateAssetAssertions:v3];
}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 assetType];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke_3;
  v7[3] = &unk_1E6C42150;
  id v8 = *(id *)(a1 + 48);
  [v3 _mutateAssertionsForAssetType:v6 assertions:v5 mutationBlock:v7];
}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0) {
    [v3 addObject:*(void *)(a1 + 32)];
  }
}

- (void)discardAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyListRepresentation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke;
  v8[3] = &unk_1E6C421A0;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(AXAssetMetadataStore *)self _performWithLock:v8];
}

void __41__AXAssetMetadataStore_discardAssertion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateAssetAssertions:v3];
}

void __41__AXAssetMetadataStore_discardAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 assetType];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke_3;
  v7[3] = &unk_1E6C42150;
  id v8 = *(id *)(a1 + 48);
  [v3 _mutateAssertionsForAssetType:v6 assertions:v5 mutationBlock:v7];
}

uint64_t __41__AXAssetMetadataStore_discardAssertion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)discardAllAssertionsOfType:(id)a3 heldByClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateAssetAssertions:v3];
}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_3;
  v5[3] = &unk_1E6C42150;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateAssertionsForAssetType:v4 assertions:a2 mutationBlock:v5];
}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_4;
  v3[3] = &unk_1E6C421C8;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ax_removeObjectsFromArrayUsingBlock:", v3);
}

uint64_t __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"clientIdentifier"];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)discardAllAssertionsOfType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke;
  v6[3] = &unk_1E6C420B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXAssetMetadataStore *)self _performWithLock:v6];
}

void __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_2;
  v2[3] = &unk_1E6C42210;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _mutateAssetAssertions:v2];
}

uint64_t __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mutateAssertionsForAssetType:*(void *)(a1 + 40) assertions:a2 mutationBlock:&__block_literal_global_10];
}

uint64_t __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (id)heldAssertionsForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__AXAssetMetadataStore_heldAssertionsForAssetType___block_invoke;
  v11[3] = &unk_1E6C421A0;
  v11[4] = self;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(AXAssetMetadataStore *)self _performWithLock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __51__AXAssetMetadataStore_heldAssertionsForAssetType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaults];
  id v4 = [v2 dictionaryForKey:@"AssetAssertions"];

  id v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([v3 count]) {
    [*(id *)(a1 + 48) addObjectsFromArray:v3];
  }
}

uint64_t __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 assetInfoDictionary];
}

- (void)recordAssetRefreshEventForAssetType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke;
  v6[3] = &unk_1E6C420B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXAssetMetadataStore *)self _performWithLock:v6];
}

void __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_2;
  v2[3] = &unk_1E6C42210;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _mutateAssetEvents:@"RefreshEvents" block:v2];
}

uint64_t __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mutateAssetEventsForAssetType:*(void *)(a1 + 40) events:a2 mutationBlock:&__block_literal_global_23];
}

void __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v3 addObject:v2];

  if ((unint64_t)[v3 count] >= 5) {
    [v3 removeObjectAtIndex:0];
  }
}

- (void)recordAssetsToBePurged:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateAssetEvents:@"PurgeEvents" block:v3];
}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_3;
  v5[3] = &unk_1E6C42150;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateAssetEventsForAssetType:v4 events:a2 mutationBlock:v5];
}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_29);
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setObject:v5 forKeyedSubscript:@"Date"];

    [v4 setObject:v3 forKeyedSubscript:@"Assets"];
    [v6 addObject:v4];
    if ((unint64_t)[v6 count] >= 5) {
      [v6 removeObjectAtIndex:0];
    }
  }
}

uint64_t __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 assetInfoDictionary];
}

- (void)recordAssetsToBeDownloaded:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateAssetEvents:@"DownloadEvents" block:v3];
}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_3;
  v5[3] = &unk_1E6C42150;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateAssetEventsForAssetType:v4 events:a2 mutationBlock:v5];
}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_41);
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setObject:v5 forKeyedSubscript:@"Date"];

    [v4 setObject:v3 forKeyedSubscript:@"Assets"];
    [v6 addObject:v4];
    if ((unint64_t)[v6 count] >= 5) {
      [v6 removeObjectAtIndex:0];
    }
  }
}

uint64_t __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 assetInfoDictionary];
}

- (void)recordLastAssetAccess:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke;
    v6[3] = &unk_1E6C420B8;
    v6[4] = self;
    id v7 = v4;
    [(AXAssetMetadataStore *)self _performWithLock:v6];
  }
}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_2;
  v2[3] = &unk_1E6C42210;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _mutateAssetEvents:@"AssetAccess" block:v2];
}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 assetType];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_3;
  v7[3] = &unk_1E6C42150;
  id v8 = *(id *)(a1 + 40);
  [v3 _mutateAssetEventsForAssetType:v6 events:v5 mutationBlock:v7];
}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setObject:v4 forKeyedSubscript:@"Date"];

  id v5 = [*(id *)(a1 + 32) assetId];
  [v3 setObject:v5 forKeyedSubscript:@"AssetID"];

  [v6 addObject:v3];
  if ((unint64_t)[v6 count] >= 4) {
    [v6 removeObjectAtIndex:0];
  }
}

- (id)overrideMinimumCompatibilityVersionForAssetType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AXAssetMetadataStore_overrideMinimumCompatibilityVersionForAssetType___block_invoke;
  v8[3] = &unk_1E6C42090;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(AXAssetMetadataStore *)self _performWithLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__AXAssetMetadataStore_overrideMinimumCompatibilityVersionForAssetType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaults];
  id v7 = [v2 dictionaryForKey:@"Overrides"];

  id v3 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"MinimumCompatibilityVersion"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setOverrideMinimumCompatibilityVersion:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

void __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateOverrides:v3];
}

void __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_3;
  v5[3] = &unk_1E6C42258;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateOverridesForAssetType:v4 overrides:a2 mutationBlock:v5];
}

uint64_t __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"MinimumCompatibilityVersion"];
}

- (id)overrideMaximumCompatibilityVersionForAssetType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AXAssetMetadataStore_overrideMaximumCompatibilityVersionForAssetType___block_invoke;
  v8[3] = &unk_1E6C42090;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(AXAssetMetadataStore *)self _performWithLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__AXAssetMetadataStore_overrideMaximumCompatibilityVersionForAssetType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaults];
  id v7 = [v2 dictionaryForKey:@"Overrides"];

  id v3 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"MaximumCompatibilityVersion"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setOverrideMaximumCompatibilityVersion:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke;
  v10[3] = &unk_1E6C421A0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AXAssetMetadataStore *)self _performWithLock:v10];
}

void __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C42178;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mutateOverrides:v3];
}

void __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_3;
  v5[3] = &unk_1E6C42258;
  id v6 = *(id *)(a1 + 48);
  [v3 _mutateOverridesForAssetType:v4 overrides:a2 mutationBlock:v5];
}

uint64_t __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"MaximumCompatibilityVersion"];
}

- (id)valueForKey:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__AXAssetMetadataStore_valueForKey_forAssetType___block_invoke;
  v12[3] = &unk_1E6C42280;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  [(AXAssetMetadataStore *)self _performWithLock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __49__AXAssetMetadataStore_valueForKey_forAssetType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaults];
  id v7 = [v2 dictionaryForKey:@"UserInfo"];

  id v3 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setValue:(id)a3 forKey:(id)a4 forAssetType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke;
  v14[3] = &unk_1E6C422D0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [(AXAssetMetadataStore *)self _performWithLock:v14];
}

void __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_2;
  v3[3] = &unk_1E6C422A8;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _mutateUserInfo:v3];
}

void __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_3;
  v6[3] = &unk_1E6C42210;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v4 _mutateUserInfoForAssetType:v5 userInfo:a2 mutationBlock:v6];
}

uint64_t __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_mutateAssetAssertions:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(AXAssetMetadataStore *)self defaults];
  uint64_t v5 = [v4 dictionaryForKey:@"AssetAssertions"];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v8[2](v8, v6);
  id v7 = [(AXAssetMetadataStore *)self defaults];
  [v7 setObject:v6 forKey:@"AssetAssertions"];
}

- (void)_mutateAssertionsForAssetType:(id)a3 assertions:(id)a4 mutationBlock:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  id v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
  }
  v11[2](v11, v10);
  [v7 setObject:v10 forKey:v8];
}

- (void)_mutateAssetEvents:(id)a3 block:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(AXAssetMetadataStore *)self defaults];
  id v8 = [v7 dictionaryForKey:v11];
  id v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v6[2](v6, v9);
  id v10 = [(AXAssetMetadataStore *)self defaults];
  [v10 setObject:v9 forKey:v11];
}

- (void)_mutateAssetEventsForAssetType:(id)a3 events:(id)a4 mutationBlock:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  id v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
  }
  v11[2](v11, v10);
  [v7 setObject:v10 forKey:v8];
}

- (void)_mutateOverrides:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(AXAssetMetadataStore *)self defaults];
  uint64_t v5 = [v4 dictionaryForKey:@"Overrides"];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v8[2](v8, v6);
  id v7 = [(AXAssetMetadataStore *)self defaults];
  [v7 setObject:v6 forKey:@"Overrides"];
}

- (void)_mutateOverridesForAssetType:(id)a3 overrides:(id)a4 mutationBlock:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  id v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v11[2](v11, v10);
  [v7 setObject:v10 forKey:v8];
}

- (void)_mutateUserInfo:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(AXAssetMetadataStore *)self defaults];
  uint64_t v5 = [v4 dictionaryForKey:@"UserInfo"];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v8[2](v8, v6);
  id v7 = [(AXAssetMetadataStore *)self defaults];
  [v7 setObject:v6 forKey:@"UserInfo"];
}

- (void)_mutateUserInfoForAssetType:(id)a3 userInfo:(id)a4 mutationBlock:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  id v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v11[2](v11, v10);
  [v7 setObject:v10 forKey:v8];
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end