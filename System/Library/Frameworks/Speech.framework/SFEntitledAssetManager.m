@interface SFEntitledAssetManager
+ (BOOL)isOverrideSupportedForAssetType:(unint64_t)a3;
+ (BOOL)isSubscribedToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5;
+ (id)_assetPathWithStatus:(id)a3;
+ (id)_assetSetSubscriptionWithConfig:(id)a3 regionId:(id)a4 expiration:(id)a5;
+ (id)_assetSetSubscriptionsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5;
+ (id)_overrideModelQualityForConfig:(id)a3;
+ (id)_overridePathForConfig:(id)a3;
+ (id)_overrideStatusForConfig:(id)a3;
+ (id)assetNameForAssetType:(unint64_t)a3;
+ (id)assetSetNameForAssetType:(unint64_t)a3;
+ (id)assetSetUsageForConfig:(id)a3 regionId:(id)a4;
+ (id)assetSetUsagesForAssetType:(unint64_t)a3;
+ (id)assetUsageTypeForAssetType:(unint64_t)a3;
+ (id)installationStateForDownloadStatus:(unint64_t)a3;
+ (id)jsonFilenameForAssetType:(unint64_t)a3;
+ (id)modelAttributesForAsset:(id)a3;
+ (id)modelTasksForLocaleWithInstallationStatus:(id)a3;
+ (id)offlineDictationLocales;
+ (id)onDeviceDictationLocales;
+ (id)sharedInstance;
+ (id)statusForAsset:(id)a3;
+ (id)subscriptionNameForConfig:(id)a3 regionId:(id)a4;
+ (id)subscriptionNamePrefixForAssetType:(unint64_t)a3;
+ (id)subscriptionsForSubscriberId:(id)a3;
+ (id)supportedLanguagesForAssetType:(unint64_t)a3;
+ (id)systemSubscriberId;
+ (id)unsubscribeFromAssetsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5;
+ (unint64_t)_assetTypeForSubscriptionName:(id)a3;
+ (void)initialize;
+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completionHandler:(id)a5;
+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6;
+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6 completionHandler:(id)a7;
+ (void)unsubscribeFromAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5;
- (SFEntitledAssetManager)init;
- (SFEntitledAssetManager)initWithAssetSetDict:(id)a3 cleanupDuration:(unint64_t)a4;
- (id)_assetSetWithName:(id)a3 usage:(id)a4;
- (id)_assetSetsWithAssetType:(unint64_t)a3;
- (id)_assetWithAssetConfig:(id)a3 regionId:(id)a4;
- (id)_assetsWithAssetType:(unint64_t)a3;
- (id)_installationStatusForLanguagesWithAssetType:(unint64_t)a3 includeDetailedStatus:(BOOL)a4 subscriberId:(id)a5;
- (id)_installedAssetWithConfig:(id)a3 regionId:(id)a4 shouldSubscribe:(BOOL)a5 subscriberId:(id)a6 expiration:(id)a7;
- (id)assetSetDict;
- (id)assetStatusForConfig:(id)a3;
- (id)detailedInstallationStatusForLanguagesWithAssetType:(unint64_t)a3 subscriberId:(id)a4;
- (id)installationStatusForLanguagesWithAssetType:(unint64_t)a3;
- (id)installedAssetWithConfig:(id)a3;
- (id)installedAssetWithConfig:(id)a3 regionId:(id)a4;
- (id)installedAudioSamplingConfigWithAssetName:(id)a3;
- (id)installedLanguagesForAssetType:(unint64_t)a3;
- (id)modelQualityTypeStatusStringWithConfig:(id)a3;
- (void)_cancelCleanupTimer;
- (void)_cleanupTimerFired;
- (void)_refreshAssetSetsWithName:(id)a3;
- (void)_scheduleCleanupTimer;
- (void)dealloc;
- (void)downloadStatusWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (void)refreshAssetSetWithConfig:(id)a3 regionId:(id)a4;
- (void)registerAssetDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)releaseAssetSets;
- (void)releaseAssetSetsWithAssetType:(unint64_t)a3;
- (void)switchToNewAssetsForAssetType:(unint64_t)a3;
- (void)wait;
@end

@implementation SFEntitledAssetManager

uint64_t __40__SFEntitledAssetManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedManager_1669 = objc_alloc_init(SFEntitledAssetManager);

  return MEMORY[0x1F41817F8]();
}

- (SFEntitledAssetManager)init
{
  return [(SFEntitledAssetManager *)self initWithAssetSetDict:0 cleanupDuration:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sCleanupQueue = dispatch_get_global_queue(9, 0);
    MEMORY[0x1F41817F8]();
  }
}

void __49__SFEntitledAssetManager_offlineDictationLocales__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB35C0] sharedManager];
  uint64_t v0 = [v3 queryAllSupportedKeys:@"com.apple.dictation.offline"];
  v1 = (void *)v0;
  if (v0) {
    v2 = (void *)v0;
  }
  else {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&offlineDictationLocales_offlineDictationLocales, v2);
}

void __50__SFEntitledAssetManager_onDeviceDictationLocales__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB35C0] sharedManager];
  uint64_t v0 = [v3 queryAllSupportedKeys:@"com.apple.dictation.ondevice"];
  v1 = (void *)v0;
  if (v0) {
    v2 = (void *)v0;
  }
  else {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&onDeviceDictationLocales_onDeviceDictationLocales, v2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1667 != -1) {
    dispatch_once(&sharedInstance_onceToken_1667, &__block_literal_global_1668);
  }
  v2 = (void *)sharedInstance_sharedManager_1669;

  return v2;
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_478(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2_479;
  v12 = &unk_1E6155198;
  id v13 = *(id *)(a1 + 48);
  id v4 = v3;
  id v14 = v4;
  [v2 enumerateObjectsUsingBlock:&v9];
  objc_msgSend(v2, "removeObjectsInArray:", v4, v9, v10, v11, v12);
  if (![v2 count])
  {
    v5 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v16 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1B709D000, v5, OS_LOG_TYPE_DEFAULT, "%s Removed update handler for %@ assets.", buf, 0x16u);
    }
    v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
    v8 = [MEMORY[0x1E4FB35A0] sharedManager];
    [v8 removeObserver:v7];

    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

uint64_t __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1B709D000, v2, OS_LOG_TYPE_DEFAULT, "%s New UAF update for %@ assets.", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 40) _refreshAssetSetsWithName:*(void *)(a1 + 32)];
}

- (void)_refreshAssetSetsWithName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v14 = self;
  uint64_t v6 = [(NSMutableDictionary *)self->_assetSetDict objectForKey:v4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [MEMORY[0x1E4FB35A0] sharedManager];
        id v13 = [v12 retrieveAssetSet:v4 usages:v11];

        [v5 setObject:v13 forKey:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)v14->_assetSetDict setObject:v5 forKey:v4];
}

- (void)registerAssetDelegate:(id)a3 assetType:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]";
    _os_log_impl(&dword_1B709D000, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v8 = +[SFEntitledAssetManager assetSetNameForAssetType:a4];
  if ([v8 length])
  {
    objc_initWeak((id *)buf, v6);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke;
    aBlock[3] = &unk_1E6155170;
    objc_copyWeak(&v26, (id *)buf);
    uint64_t v9 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2;
    v21[3] = &unk_1E61551E8;
    objc_copyWeak(v23, &location);
    id v10 = v8;
    id v22 = v10;
    v23[1] = (id)a4;
    uint64_t v11 = _Block_copy(v21);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_481;
    block[3] = &unk_1E6155210;
    block[4] = self;
    id v18 = v10;
    id v13 = v9;
    id v19 = v13;
    id v14 = v11;
    id v20 = v14;
    dispatch_sync(queue, block);
    v14[2](v14);
    long long v15 = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_482;
    v16[3] = &unk_1E61557A0;
    v16[4] = self;
    dispatch_sync(v15, v16);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *((void *)WeakRetained + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_3;
    block[3] = &unk_1E61557F0;
    id v14 = *(id *)(a1 + 32);
    int v5 = v3;
    id v15 = v5;
    dispatch_sync(v4, block);
    id v6 = [v5 installationStatusForLanguagesWithAssetType:*(void *)(a1 + 48)];
    uint64_t v7 = v3[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_478;
    v9[3] = &unk_1E61551C0;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v8 = v6;
    dispatch_sync(v7, v9);
  }
}

- (id)installationStatusForLanguagesWithAssetType:(unint64_t)a3
{
  return [(SFEntitledAssetManager *)self _installationStatusForLanguagesWithAssetType:a3 includeDetailedStatus:0 subscriberId:0];
}

void __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke_2(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _assetWithAssetConfig:*(void *)(a1 + 40) regionId:*(void *)(a1 + 48)];
  v2 = [v9 location];
  uint64_t v3 = [v2 path];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v9 _assetId];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_assetWithAssetConfig:(id)a3 regionId:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = +[SFEntitledAssetManager assetSetUsageForConfig:v6 regionId:v7];
  if (v8)
  {
    id v9 = +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", [v6 assetType]);
    +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", [v6 assetType]);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v11 = [(SFEntitledAssetManager *)self _assetSetWithName:v9 usage:v8];
    id v12 = [v11 assetNamed:v10];
    if (!v12)
    {
      id v13 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315906;
        id v22 = "-[SFEntitledAssetManager _assetWithAssetConfig:regionId:]";
        __int16 v23 = 2112;
        v24 = v10;
        __int16 v25 = 2112;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_error_impl(&dword_1B709D000, v13, OS_LOG_TYPE_ERROR, "%s No asset found with name: %@, asset set: %@, usage: %@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
  else
  {
    id v14 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      long long v16 = v14;
      uint64_t v17 = [v6 assetType];
      if ((unint64_t)(v17 - 1) > 6) {
        id v18 = @"Unknown";
      }
      else {
        id v18 = off_1E6154988[v17 - 1];
      }
      id v19 = v18;
      id v20 = [v6 language];
      int v21 = 136315907;
      id v22 = "-[SFEntitledAssetManager _assetWithAssetConfig:regionId:]";
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2112;
      id v26 = v20;
      __int16 v27 = 2113;
      id v28 = v7;
      _os_log_error_impl(&dword_1B709D000, v16, OS_LOG_TYPE_ERROR, "%s No valid usage resolved from asset type: %@, language: %@, regionId: %{private}@", (uint8_t *)&v21, 0x2Au);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_assetSetWithName:(id)a3 usage:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 length])
  {
    id v8 = [(NSMutableDictionary *)self->_assetSetDict objectForKey:v6];
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_assetSetDict setObject:v8 forKey:v6];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = objc_msgSend(v8, "allKeys", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        if ([v14 isEqualToDictionary:v7]) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v15 = [v8 objectForKey:v14];

      if (v15) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_12:
    }
    long long v16 = [MEMORY[0x1E4FB35A0] sharedManager];
    id v15 = [v16 retrieveAssetSet:v6 usages:v7];

    if (v15)
    {
      [v8 setObject:v15 forKey:v7];
      [(SFEntitledAssetManager *)self _scheduleCleanupTimer];
    }
    else
    {
      id v18 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v25 = "-[SFEntitledAssetManager _assetSetWithName:usage:]";
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_error_impl(&dword_1B709D000, v18, OS_LOG_TYPE_ERROR, "%s No valid asset set resolved from name %@, usage %@, returning nil.", buf, 0x20u);
      }
      id v15 = 0;
    }
LABEL_22:
  }
  else
  {
    uint64_t v17 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v25 = "-[SFEntitledAssetManager _assetSetWithName:usage:]";
      _os_log_error_impl(&dword_1B709D000, v17, OS_LOG_TYPE_ERROR, "%s Empty asset name.", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

- (void)_scheduleCleanupTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(SFEntitledAssetManager *)self _cancelCleanupTimer];
  if (!self->_cleanupTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)sCleanupQueue);
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = v3;

    objc_initWeak(&location, self);
    int v5 = self->_cleanupTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SFEntitledAssetManager__scheduleCleanupTimer__block_invoke;
    v8[3] = &unk_1E6155300;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v5, v8);
    id v6 = self->_cleanupTimer;
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * self->_cleanupDuration);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_cleanupTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_482(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
    _os_log_impl(&dword_1B709D000, v2, OS_LOG_TYPE_DEFAULT, "%s Cancelling the cleanup timer after registering an asset delegate.", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _cancelCleanupTimer];
}

- (void)_cancelCleanupTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cleanupTimer = self->_cleanupTimer;
  if (cleanupTimer)
  {
    dispatch_source_cancel(cleanupTimer);
    int v4 = self->_cleanupTimer;
    self->_cleanupTimer = 0;
  }
}

+ (BOOL)isSubscribedToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[SFEntitledAssetManager subscriptionNameForConfig:v7 regionId:v8];
  if ([v10 length])
  {
    uint64_t v11 = +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", [v7 assetType]);
    uint64_t v12 = +[SFEntitledAssetManager assetSetUsageForConfig:v7 regionId:v8];
    uint64_t v13 = [MEMORY[0x1E4FB35A0] sharedManager];
    id v14 = [v13 subscriptionsForSubscriber:v9];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      id v31 = v9;
      id v32 = v8;
      id v33 = v7;
      uint64_t v17 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v20 = [v19 name];
          int v21 = [v20 isEqualToString:v10];

          if (v21)
          {
            uint64_t v22 = [v19 assetSets];
            long long v23 = [(id)v22 objectForKey:v11];

            LOBYTE(v22) = [v23 isEqualToDictionary:v12];
            if (v22)
            {
              LOBYTE(v16) = 1;
              goto LABEL_16;
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_16:
      id v8 = v32;
      id v7 = v33;
      id v9 = v31;
    }
  }
  else
  {
    v24 = (void *)SFLogFramework;
    LOBYTE(v16) = 0;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = v24;
      uint64_t v26 = [v7 assetType];
      if ((unint64_t)(v26 - 1) > 6) {
        id v27 = @"Unknown";
      }
      else {
        id v27 = off_1E6154988[v26 - 1];
      }
      __int16 v28 = v27;
      id v29 = [v7 language];
      *(_DWORD *)buf = 136315907;
      v40 = "+[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:]";
      __int16 v41 = 2112;
      v42 = v28;
      __int16 v43 = 2112;
      v44 = v29;
      __int16 v45 = 2113;
      id v46 = v8;
      _os_log_impl(&dword_1B709D000, v25, OS_LOG_TYPE_DEFAULT, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);

      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

+ (id)subscriptionNameForConfig:(id)a3 regionId:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SFEntitledAssetManager subscriptionNamePrefixForAssetType:](SFEntitledAssetManager, "subscriptionNamePrefixForAssetType:", [v5 assetType]);
  if ([v7 length])
  {
    uint64_t v8 = [v5 assetType];
    if (v8 != 5)
    {
      if (v8 == 7)
      {
        id v14 = [v5 language];
        uint64_t v15 = +[SFUtilities languageCodeForLocaleIdentifier:v14];
      }
      else
      {
        if (v8 == 6)
        {
          id v9 = v7;
          goto LABEL_19;
        }
        id v14 = [v5 language];
        uint64_t v15 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v14];
      }
      uint64_t v11 = (void *)v15;

      id v9 = [v7 stringByAppendingString:v11];
      goto LABEL_11;
    }
    if (v6)
    {
      uint64_t v10 = [v5 language];
      uint64_t v11 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v10];

      uint64_t v12 = [v7 stringByAppendingString:v11];
      uint64_t v13 = [v12 stringByAppendingString:@"."];
      id v9 = [v13 stringByAppendingString:v6];

LABEL_11:
      goto LABEL_19;
    }
    uint64_t v16 = [v5 assetType];
    if ((unint64_t)(v16 - 1) > 6) {
      uint64_t v17 = @"Unknown";
    }
    else {
      uint64_t v17 = off_1E6154988[v16 - 1];
    }
    id v18 = v17;
    id v19 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      uint64_t v22 = "+[SFEntitledAssetManager subscriptionNameForConfig:regionId:]";
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_1B709D000, v19, OS_LOG_TYPE_ERROR, "%s regionId cannot be nil for asset type: %@", (uint8_t *)&v21, 0x16u);
    }
  }
  id v9 = &stru_1F10479F8;
LABEL_19:

  return v9;
}

+ (id)subscriptionNamePrefixForAssetType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0) {
    return off_1E6155348[v3];
  }
  int v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    id v6 = v4;
    if (v3 > 6) {
      id v7 = @"Unknown";
    }
    else {
      id v7 = off_1E6154988[v3];
    }
    uint64_t v8 = v7;
    int v9 = 136315394;
    uint64_t v10 = "+[SFEntitledAssetManager subscriptionNamePrefixForAssetType:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_error_impl(&dword_1B709D000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);
  }
  return &stru_1F10479F8;
}

+ (id)assetSetUsageForConfig:(id)a3 regionId:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 language];

  if (v7)
  {
    uint64_t v8 = +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", [v5 assetType]);
    if ([v8 length])
    {
      int v9 = [v5 language];
      uint64_t v10 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v9];

      switch([v5 assetType])
      {
        case 1:
        case 3:
        case 4:
          v38 = v8;
          v39[0] = v10;
          __int16 v11 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v12 = (__CFString **)v39;
          uint64_t v13 = &v38;
          goto LABEL_15;
        case 5:
          if (v6)
          {
            long long v20 = objc_msgSend(v10, "stringByAppendingString:", @".", v8);
            int v21 = [v20 stringByAppendingString:v6];
            id v29 = v21;
            uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

LABEL_17:
          }
          else
          {
            uint64_t v22 = (void *)SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
            {
              uint64_t v17 = v22;
              uint64_t v26 = [v5 assetType];
              if ((unint64_t)(v26 - 1) > 6) {
                id v27 = @"Unknown";
              }
              else {
                id v27 = off_1E6154988[v26 - 1];
              }
              v24 = v27;
              *(_DWORD *)buf = 136315394;
              id v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
              __int16 v32 = 2112;
              id v33 = v24;
              uint64_t v25 = "%s regionId cannot be nil for asset type: %@";
LABEL_31:
              _os_log_error_impl(&dword_1B709D000, v17, OS_LOG_TYPE_ERROR, v25, buf, 0x16u);
            }
LABEL_19:
            uint64_t v15 = 0;
          }
LABEL_20:

          break;
        case 6:
          long long v36 = v8;
          long long v37 = @"1";
          __int16 v11 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v12 = &v37;
          uint64_t v13 = &v36;
LABEL_15:
          uint64_t v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
          goto LABEL_20;
        case 7:
          long long v34 = v8;
          long long v20 = +[SFUtilities languageCodeForLocaleIdentifier:v10];
          long long v35 = v20;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          goto LABEL_17;
        default:
          uint64_t v16 = (void *)SFLogFramework;
          if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          uint64_t v17 = v16;
          uint64_t v18 = [v5 assetType];
          if ((unint64_t)(v18 - 1) > 6) {
            id v19 = @"Unknown";
          }
          else {
            id v19 = off_1E6154988[v18 - 1];
          }
          v24 = v19;
          *(_DWORD *)buf = 136315394;
          id v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
          __int16 v32 = 2112;
          id v33 = v24;
          uint64_t v25 = "%s Unsupported asset type: %@";
          goto LABEL_31;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v14 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
      _os_log_error_impl(&dword_1B709D000, v14, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)assetUsageTypeForAssetType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0) {
    return off_1E61553B8[v3];
  }
  int v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    id v6 = v4;
    if (v3 > 6) {
      id v7 = @"Unknown";
    }
    else {
      id v7 = off_1E6154988[v3];
    }
    uint64_t v8 = v7;
    int v9 = 136315394;
    uint64_t v10 = "+[SFEntitledAssetManager assetUsageTypeForAssetType:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_error_impl(&dword_1B709D000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);
  }
  return &stru_1F10479F8;
}

- (id)_installationStatusForLanguagesWithAssetType:(unint64_t)a3 includeDetailedStatus:(BOOL)a4 subscriberId:(id)a5
{
  BOOL v5 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v37 = a5;
  id v44 = [MEMORY[0x1E4F1CA60] dictionary];
  v42 = +[SFEntitledAssetManager assetNameForAssetType:a3];
  id v7 = +[SFEntitledAssetManager assetSetNameForAssetType:a3];
  v40 = +[SFEntitledAssetManager assetUsageTypeForAssetType:a3];
  uint64_t v8 = +[SFEntitledAssetManager assetSetUsagesForAssetType:a3];
  int v9 = [MEMORY[0x1E4FB35A0] sharedManager];
  v39 = [v9 retrieveAssetSet:v7 usages:MEMORY[0x1E4F1CC08]];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v46)
  {
    if (v37) {
      BOOL v10 = v5;
    }
    else {
      BOOL v10 = 0;
    }
    BOOL v38 = v10;
    uint64_t v45 = *(void *)v48;
    unint64_t v11 = 0x1E4F29000uLL;
    unint64_t v41 = a3;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * v12);
        id v14 = (void *)MEMORY[0x1BA9BAAE0]();
        uint64_t v15 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v13];
        uint64_t v16 = [[SFEntitledAssetConfig alloc] initWithLanguage:v15 assetType:a3];
        uint64_t v17 = +[SFEntitledAssetManager _overridePathForConfig:v16];
        if (v17)
        {
          uint64_t v18 = +[SFEntitledAssetManager _overrideStatusForConfig:v16];
          id v19 = v18;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            id v20 = [*(id *)(v11 + 24) stringWithFormat:@"%@:", @"Version"];
          }
          uint64_t v22 = v20;

          id v29 = [*(id *)(v11 + 24) stringWithFormat:@"%@ ModelInfo=%@: AssetId=OVERRIDE:", v22, v17];
LABEL_22:
          [v44 setObject:v29 forKey:v15];

          goto LABEL_23;
        }
        v53 = v40;
        uint64_t v54 = v13;
        int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v22 = [v39 assetNamed:v42 withUsage:v21];

        if (!v22)
        {
          __int16 v23 = +[SFEntitledAssetManager onDeviceDictationLocales];
          int v24 = [v23 containsObject:v13];
          uint64_t v25 = @"0";
          if (v24) {
            uint64_t v25 = @"1";
          }
          uint64_t v26 = v25;

          id v27 = objc_alloc(MEMORY[0x1E4FB3590]);
          v51 = @"PreferOverServer";
          v52 = v26;
          uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];

          uint64_t v22 = (void *)[v27 initWithName:v42 location:0 metadata:v28];
        }
        if ([v22 _assetMetadataAvailable])
        {
          id v29 = +[SFEntitledAssetManager statusForAsset:v22];
          a3 = v41;
          if ((v38 & (SFEntitledAssetStatusIsInstalled(v29) ^ 1)) == 1
            && +[SFEntitledAssetManager isSubscribedToAssetWithConfig:v16 regionId:0 subscriberId:v37])
          {
            long long v36 = +[SFEntitledAssetManager subscriptionNameForConfig:v16 regionId:0];
            v30 = [MEMORY[0x1E4FB35A0] sharedManager];
            uint64_t v31 = [v30 downloadStatusForSubscriber:v37 subscriptionName:v36];

            __int16 v32 = +[SFEntitledAssetManager installationStateForDownloadStatus:v31];
            uint64_t v35 = [v29 stringByReplacingOccurrencesOfString:@"Not Installing" withString:v32];

            a3 = v41;
            id v29 = (void *)v35;
          }
          goto LABEL_22;
        }
        a3 = v41;
LABEL_23:

        ++v12;
        unint64_t v11 = 0x1E4F29000;
      }
      while (v46 != v12);
      uint64_t v33 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      uint64_t v46 = v33;
    }
    while (v33);
  }

  return v44;
}

+ (id)_overridePathForConfig:(id)a3
{
  id v3 = a3;
  if (!+[SFEntitledAssetManager isOverrideSupportedForAssetType:](SFEntitledAssetManager, "isOverrideSupportedForAssetType:", [v3 assetType]))
  {
    id v7 = 0;
    goto LABEL_15;
  }
  int v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v3 assetType];
  if ((unint64_t)(v5 - 1) > 6) {
    id v6 = @"Unknown";
  }
  else {
    id v6 = off_1E6154988[v5 - 1];
  }
  uint64_t v8 = v6;
  int v9 = NSString;
  BOOL v10 = [v3 language];
  unint64_t v11 = [v9 stringWithFormat:@"%@/%@/%@", @"overrideAssetPath", v8, v10];

  uint64_t v12 = [v4 objectForKey:v11];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = v11;
LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 0;
    }
    id v7 = v16;

    goto LABEL_14;
  }
  id v14 = [NSString stringWithFormat:@"%@/%@", @"overrideAssetPath", v8];

  uint64_t v15 = [v4 objectForKey:v14];
  if (v15)
  {
    uint64_t v13 = (void *)v15;
    goto LABEL_10;
  }
  id v7 = 0;
LABEL_14:

LABEL_15:

  return v7;
}

+ (BOOL)isOverrideSupportedForAssetType:(unint64_t)a3
{
  if (SFIsInternalInstall_onceToken != -1) {
    dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1883);
  }
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFBLL) == 0 && SFIsInternalInstall_isInternal != 0;
}

+ (id)statusForAsset:(id)a3
{
  id v3 = a3;
  int v4 = [v3 location];
  uint64_t v5 = [v4 path];
  id v6 = @"Version";
  if (!v5) {
    id v6 = @"Not Installing";
  }
  id v7 = v6;

  uint64_t v8 = +[SFEntitledAssetManager modelAttributesForAsset:v3];
  int v9 = [v3 location];
  BOOL v10 = [v9 path];
  if (v10)
  {
    unint64_t v11 = NSString;
    uint64_t v12 = [v3 location];
    uint64_t v13 = [v12 path];
    [v11 stringWithFormat:@"ModelInfo=%@: ", v13];
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = &stru_1F10479F8;
  }

  uint64_t v15 = NSString;
  uint64_t v16 = [v3 _assetId];
  uint64_t v17 = [v15 stringWithFormat:@"AssetId=%@", v16];

  uint64_t v18 = [NSString stringWithFormat:@"%@: %@: %@%@:", v7, v8, v14, v17];

  return v18;
}

+ (id)modelAttributesForAsset:(id)a3
{
  id v3 = a3;
  if ([v3 _preferOverServer])
  {
    if ([v3 _supportsContinuousListening])
    {
      int v4 = [@"HQ" stringByAppendingFormat:@": %@", @"CL"];
    }
    else
    {
      int v4 = @"HQ";
    }
    if ([v3 _supportsOnDeviceSearch])
    {
      uint64_t v5 = [(__CFString *)v4 stringByAppendingFormat:@": %@", @"DS"];

      int v4 = (__CFString *)v5;
    }
    if ([v3 _supportsAutoPunctuation])
    {
      uint64_t v6 = [(__CFString *)v4 stringByAppendingFormat:@": %@", @"AP"];

      int v4 = (__CFString *)v6;
    }
    if ([v3 _supportsEmojiRecognition])
    {
      uint64_t v7 = [(__CFString *)v4 stringByAppendingFormat:@": %@", @"ER"];

      int v4 = (__CFString *)v7;
    }
    if ([v3 _supportsVoiceCommands])
    {
      uint64_t v8 = [(__CFString *)v4 stringByAppendingFormat:@": %@", @"VC"];

      int v4 = (__CFString *)v8;
    }
  }
  else
  {
    int v4 = @"LQ";
  }

  return v4;
}

+ (id)onDeviceDictationLocales
{
  if (onDeviceDictationLocales_onceToken != -1) {
    dispatch_once(&onDeviceDictationLocales_onceToken, &__block_literal_global_444);
  }
  v2 = (void *)onDeviceDictationLocales_onDeviceDictationLocales;

  return v2;
}

+ (id)assetSetUsagesForAssetType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F1CA80] set];
  if (a3 == 3)
  {
    uint64_t v5 = _AFPreferencesLanguageCode();
    uint64_t v6 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v5];

    if (v6) {
      [v4 addObject:v6];
    }
    uint64_t v7 = +[SFEntitledAssetManager offlineDictationLocales];
    [v4 addObjectsFromArray:v7];

    uint64_t v8 = +[SFEntitledAssetManager onDeviceDictationLocales];
    [v4 addObjectsFromArray:v8];
  }
  else
  {
    BOOL v9 = +[SFUtilities isGeneralASRSupportedOnDevice];
    if (a3 != 7 || v9)
    {
      unint64_t v11 = +[SFEntitledAssetManager assetSetNameForAssetType:a3];
      uint64_t v12 = +[SFEntitledAssetManager assetUsageTypeForAssetType:a3];
      uint64_t v13 = [MEMORY[0x1E4FB35A0] sharedManager];
      uint64_t v14 = [v13 knownUsagesForAssetSet:v11 usageType:v12];
      uint64_t v15 = (void *)v14;
      if (v14) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = MEMORY[0x1E4F1CBF0];
      }
      [v4 addObjectsFromArray:v16];
    }
    else
    {
      BOOL v10 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        id v20 = "+[SFEntitledAssetManager assetSetUsagesForAssetType:]";
        _os_log_impl(&dword_1B709D000, v10, OS_LOG_TYPE_DEFAULT, "%s GeneralASR is not supported on this device", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  uint64_t v17 = [v4 allObjects];

  return v17;
}

+ (id)assetSetNameForAssetType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0) {
    return off_1E61553F0[v3];
  }
  int v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = v4;
    if (v3 > 6) {
      uint64_t v7 = @"Unknown";
    }
    else {
      uint64_t v7 = off_1E6154988[v3];
    }
    uint64_t v8 = v7;
    int v9 = 136315394;
    BOOL v10 = "+[SFEntitledAssetManager assetSetNameForAssetType:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_error_impl(&dword_1B709D000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);
  }
  return &stru_1F10479F8;
}

+ (id)assetNameForAssetType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0) {
    return off_1E6155380[v3];
  }
  int v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = v4;
    if (v3 > 6) {
      uint64_t v7 = @"Unknown";
    }
    else {
      uint64_t v7 = off_1E6154988[v3];
    }
    uint64_t v8 = v7;
    int v9 = 136315394;
    BOOL v10 = "+[SFEntitledAssetManager assetNameForAssetType:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_error_impl(&dword_1B709D000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);
  }
  return &stru_1F10479F8;
}

+ (id)supportedLanguagesForAssetType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = +[SFEntitledAssetManager assetSetUsagesForAssetType:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_481(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 56);
    int v4 = [MEMORY[0x1E4F1CA48] array];
    [v3 setObject:v4 forKey:*(void *)(a1 + 40)];
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v6 = _Block_copy(*(const void **)(a1 + 48));
  [v5 addObject:v6];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4FB35A0] sharedManager];
    uint64_t v7 = [v8 observeAssetSet:*(void *)(a1 + 40) queue:0 handler:*(void *)(a1 + 56)];

    if (v7)
    {
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      int v9 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 136315394;
        long long v12 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_fault_impl(&dword_1B709D000, v9, OS_LOG_TYPE_FAULT, "%s Failed to initialize %@ asset set observer.", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v7 = 0;
    }
  }
}

- (SFEntitledAssetManager)initWithAssetSetDict:(id)a3 cleanupDuration:(unint64_t)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFEntitledAssetManager;
  uint64_t v7 = [(SFEntitledAssetManager *)&v23 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("SFEntitledAssetManager Queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("SFEntitledAssetManager Subscription Queue", 0);
    subscriptionQueue = v7->_subscriptionQueue;
    v7->_subscriptionQueue = (OS_dispatch_queue *)v10;

    unint64_t v12 = 18000;
    if (a4) {
      unint64_t v12 = a4;
    }
    v7->_cleanupDuration = v12;
    if (v6)
    {
      __int16 v13 = (NSMutableDictionary *)v6;
    }
    else
    {
      __int16 v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    assetSetDict = v7->_assetSetDict;
    v7->_assetSetDict = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    observers = v7->_observers;
    v7->_observers = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableDictionary *)v17;

    int v19 = v7->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SFEntitledAssetManager_initWithAssetSetDict_cleanupDuration___block_invoke;
    block[3] = &unk_1E61557A0;
    uint64_t v22 = v7;
    dispatch_sync(v19, block);
  }
  return v7;
}

+ (id)offlineDictationLocales
{
  if (offlineDictationLocales_onceToken != -1) {
    dispatch_once(&offlineDictationLocales_onceToken, &__block_literal_global_441);
  }
  v2 = (void *)offlineDictationLocales_offlineDictationLocales;

  return v2;
}

uint64_t __63__SFEntitledAssetManager_initWithAssetSetDict_cleanupDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCleanupTimer];
}

uint64_t __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unint64_t, BOOL))(result + 16))(result, (unint64_t)a3, a2 == 3);
  }
  return result;
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2_479(uint64_t a1, void *a2)
{
  id aBlock = a2;
  if (((*((uint64_t (**)(id, void))aBlock + 2))(aBlock, *(void *)(a1 + 32)) & 1) == 0)
  {
    unint64_t v3 = *(void **)(a1 + 40);
    int v4 = _Block_copy(aBlock);
    [v3 addObject:v4];
  }
}

BOOL __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained assetStatus:v3];
  }

  return v5 != 0;
}

+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6 completionHandler:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  if (!+[SFEntitledAssetManager isSubscribedToAssetWithConfig:v11 regionId:v12 subscriberId:v13])
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];

    if (v16)
    {
      uint64_t v17 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v49 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]";
        __int16 v50 = 2112;
        v51 = v13;
        _os_log_error_impl(&dword_1B709D000, v17, OS_LOG_TYPE_ERROR, "%s Subscriber identifier (%@) unexpectedly matches the profile of a UUID, forcing the prospective subscription to expire in 24 hours.", buf, 0x16u);
      }
      uint64_t v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v19 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v20 = [v18 dateByAddingUnit:16 value:1 toDate:v19 options:0];

      id v14 = (id)v20;
    }
    uint64_t v21 = +[SFEntitledAssetManager _assetSetSubscriptionWithConfig:v11 regionId:v12 expiration:v14];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithObject:v21];
      if ([v11 assetType] == 3)
      {
        objc_super v23 = [SFEntitledAssetConfig alloc];
        int v24 = [v11 language];
        uint64_t v25 = [(SFEntitledAssetConfig *)v23 initWithLanguage:v24 assetType:1];

        uint64_t v26 = +[SFEntitledAssetManager _assetSetSubscriptionWithConfig:v25 regionId:0 expiration:v14];
        [v22 addObject:v26];
      }
      id v27 = [MEMORY[0x1E4FB35A0] sharedManager];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __104__SFEntitledAssetManager_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler___block_invoke;
      v42[3] = &unk_1E6155120;
      __int16 v43 = v13;
      id v44 = v22;
      id v45 = v15;
      uint64_t v28 = v22;
      [v27 subscribe:v43 subscriptions:v28 queue:0 completion:v42];

      id v29 = v43;
      goto LABEL_19;
    }
    uint64_t v30 = [v11 assetType];
    if ((unint64_t)(v30 - 1) > 6) {
      uint64_t v31 = @"Unknown";
    }
    else {
      uint64_t v31 = off_1E6154988[v30 - 1];
    }
    uint64_t v28 = v31;
    __int16 v32 = NSString;
    uint64_t v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v34 = [v33 localizedStringForKey:@"No valid subscription resolved from asset type: %@, language: %@, regionId: %@", &stru_1F10479F8, @"Localizable" value table];
    uint64_t v35 = [v11 language];
    id v29 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v28, v35, v12);

    long long v36 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v40 = v36;
      unint64_t v41 = [v11 language];
      *(_DWORD *)buf = 136315907;
      long long v49 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]";
      __int16 v50 = 2112;
      v51 = v28;
      __int16 v52 = 2112;
      v53 = v41;
      __int16 v54 = 2113;
      id v55 = v12;
      _os_log_error_impl(&dword_1B709D000, v40, OS_LOG_TYPE_ERROR, "%s No valid subscription resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);

      if (!v15) {
        goto LABEL_18;
      }
    }
    else if (!v15)
    {
LABEL_18:
      uint64_t v21 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    long long v47 = v29;
    BOOL v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v39 = [v37 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v38];

    (*((void (**)(id, void *))v15 + 2))(v15, v39);
    goto LABEL_18;
  }
  if (v15) {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
LABEL_20:
}

- (void)downloadStatusWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void, uint64_t))a7;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__1617;
  v73 = __Block_byref_object_dispose__1618;
  id v74 = [(SFEntitledAssetManager *)self installedAssetWithConfig:v12 regionId:v13];
  if (!v70[5])
  {
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__1617;
    v67 = __Block_byref_object_dispose__1618;
    id v68 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__1617;
    v61 = __Block_byref_object_dispose__1618;
    id v62 = 0;
    uint64_t v46 = +[SFEntitledAssetManager subscriptionNameForConfig:v12 regionId:v13];
    if (![v46 length])
    {
      uint64_t v19 = [v12 assetType];
      if ((unint64_t)(v19 - 1) > 6) {
        uint64_t v20 = @"Unknown";
      }
      else {
        uint64_t v20 = off_1E6154988[v19 - 1];
      }
      uint64_t v18 = v20;
      __int16 v32 = NSString;
      uint64_t v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v34 = [v33 localizedStringForKey:@"No valid subscription name resolved from asset type: %@, language: %@, regionId: %@", &stru_1F10479F8, @"Localizable" value table];
      uint64_t v35 = [v12 language];
      uint64_t v36 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v18, v35, v13);
      id v37 = (void *)v64[5];
      v64[5] = v36;

      BOOL v38 = (id)SFLogFramework;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v44 = [v12 language];
        *(_DWORD *)buf = 136315907;
        v80 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:]";
        __int16 v81 = 2112;
        v82 = v18;
        __int16 v83 = 2112;
        v84 = v44;
        __int16 v85 = 2113;
        id v86 = v13;
        _os_log_error_impl(&dword_1B709D000, v38, OS_LOG_TYPE_ERROR, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);
      }
      if (v16)
      {
        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = v64[5];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        uint64_t v78 = v40;
        unint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        uint64_t v42 = [v39 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v41];
        __int16 v43 = (void *)v58[5];
        v58[5] = v42;

        v16[2](v16, 0, v58[5]);
      }
      goto LABEL_17;
    }
    if (+[SFEntitledAssetManager isSubscribedToAssetWithConfig:v12 regionId:v13 subscriberId:v14])
    {
      uint64_t v17 = [MEMORY[0x1E4FB35A0] sharedManager];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke;
      v55[3] = &unk_1E6155238;
      uint64_t v56 = (__CFString *)v15;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke_2;
      v47[3] = &unk_1E6155260;
      v51 = v16;
      v47[4] = self;
      id v48 = v12;
      id v49 = v13;
      __int16 v52 = &v69;
      v53 = &v63;
      id v50 = v46;
      __int16 v54 = &v57;
      [v17 updateAssetsForSubscriber:v14 subscriptionName:v50 policies:0 queue:0 progress:v55 completion:v47];

      uint64_t v18 = v56;
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v21 = NSString;
    uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v23 = [v22 localizedStringForKey:@"Cannot check the download status, %@ is not subscribed to %@", &stru_1F10479F8, @"Localizable" value table];
    uint64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v14, v46);
    uint64_t v25 = (void *)v64[5];
    v64[5] = v24;

    uint64_t v26 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      id v45 = (__CFString *)v64[5];
      *(_DWORD *)buf = 136315394;
      v80 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:]";
      __int16 v81 = 2112;
      v82 = v45;
      _os_log_error_impl(&dword_1B709D000, v26, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (!v16) {
        goto LABEL_18;
      }
    }
    else if (!v16)
    {
LABEL_18:

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v63, 8);

      goto LABEL_19;
    }
    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = v64[5];
    uint64_t v75 = *MEMORY[0x1E4F28568];
    uint64_t v76 = v28;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    uint64_t v30 = [v27 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v29];
    uint64_t v31 = (void *)v58[5];
    v58[5] = v30;

    v16[2](v16, 0, v58[5]);
    goto LABEL_18;
  }
  if (v16) {
    ((void (*)(void (**)(id, void, uint64_t)))v16[2])(v16);
  }
LABEL_19:
  _Block_object_dispose(&v69, 8);
}

- (id)installedAssetWithConfig:(id)a3 regionId:(id)a4
{
  return [(SFEntitledAssetManager *)self installedAssetWithConfig:a3 regionId:0 shouldSubscribe:0 subscriberId:0 expiration:0];
}

- (id)_installedAssetWithConfig:(id)a3 regionId:(id)a4 shouldSubscribe:(BOOL)a5 subscriberId:(id)a6 expiration:(id)a7
{
  BOOL v9 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = +[SFEntitledAssetManager _overridePathForConfig:v12];
  if (v16)
  {
    uint64_t v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v17;
      uint64_t v19 = [v12 assetType];
      if ((unint64_t)(v19 - 1) > 6) {
        uint64_t v20 = @"Unknown";
      }
      else {
        uint64_t v20 = off_1E6154988[v19 - 1];
      }
      uint64_t v28 = v20;
      id v29 = [v12 language];
      *(_DWORD *)__int16 v54 = 136315906;
      *(void *)&v54[4] = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v28;
      *(_WORD *)&v54[22] = 2112;
      id v55 = v29;
      LOWORD(v56) = 2112;
      *(void *)((char *)&v56 + 2) = v16;
      _os_log_impl(&dword_1B709D000, v18, OS_LOG_TYPE_DEFAULT, "%s Using override path for asset type: %@, language: %@, at path: %@", v54, 0x2Au);
    }
    id v27 = v16;
  }
  else
  {
    uint64_t v21 = [v12 language];

    if (v21)
    {
      if (v14 && v9)
      {
        subscriptionQueue = self->_subscriptionQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke;
        block[3] = &unk_1E6155288;
        id v44 = v12;
        id v45 = v13;
        id v46 = v14;
        id v47 = v15;
        dispatch_async(subscriptionQueue, block);
      }
      *(void *)__int16 v54 = 0;
      *(void *)&v54[8] = v54;
      *(void *)&v54[16] = 0x3032000000;
      id v55 = __Block_byref_object_copy__1617;
      *(void *)&long long v56 = __Block_byref_object_dispose__1618;
      *((void *)&v56 + 1) = 0;
      uint64_t v37 = 0;
      BOOL v38 = &v37;
      uint64_t v39 = 0x3032000000;
      uint64_t v40 = __Block_byref_object_copy__1617;
      unint64_t v41 = __Block_byref_object_dispose__1618;
      id v42 = 0;
      queue = self->_queue;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke_2;
      v32[3] = &unk_1E61552B0;
      v32[4] = self;
      id v33 = v12;
      id v34 = v13;
      uint64_t v35 = v54;
      uint64_t v36 = &v37;
      dispatch_sync(queue, v32);
      uint64_t v24 = *(void **)(*(void *)&v54[8] + 40);
      if (v24)
      {
        uint64_t v25 = SFLogFramework;
        if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v38[5];
          *(_DWORD *)buf = 136315650;
          id v49 = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
          __int16 v50 = 2112;
          uint64_t v51 = v26;
          __int16 v52 = 2112;
          v53 = v24;
          _os_log_impl(&dword_1B709D000, v25, OS_LOG_TYPE_DEFAULT, "%s Found asset: %@, at path: %@", buf, 0x20u);
          uint64_t v24 = *(void **)(*(void *)&v54[8] + 40);
        }
      }
      id v27 = v24;

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(v54, 8);
    }
    else
    {
      uint64_t v31 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v54 = 136315138;
        *(void *)&v54[4] = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
        _os_log_error_impl(&dword_1B709D000, v31, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", v54, 0xCu);
      }
      id v27 = 0;
    }
  }

  return v27;
}

- (void)wait
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_417);
  subscriptionQueue = self->_subscriptionQueue;

  dispatch_sync(subscriptionQueue, &__block_literal_global_419);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assetSetDict, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_cleanupTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = SFLogFramework;
  if (self->_cleanupDuration == 18000)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[SFEntitledAssetManager _cleanupTimerFired]";
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SFEntitledAssetManager _cleanupTimerFired]";
    _os_log_impl(&dword_1B709D000, v3, OS_LOG_TYPE_DEFAULT, "%s Cleanup timer fired.", (uint8_t *)&v4, 0xCu);
  }
  [(SFEntitledAssetManager *)self releaseAssetSets];
}

void __47__SFEntitledAssetManager__scheduleCleanupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupTimerFired];
}

- (id)_assetSetsWithAssetType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = +[SFEntitledAssetManager assetSetNameForAssetType:a3];
  uint64_t v6 = [(NSMutableDictionary *)self->_assetSetDict objectForKey:v5];
  uint64_t v7 = [v6 allValues];

  return v7;
}

- (id)_assetsWithAssetType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(SFEntitledAssetManager *)self _assetSetsWithAssetType:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) assets];
        id v12 = [v11 allValues];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)installedAudioSamplingConfigWithAssetName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__1617;
  long long v16 = __Block_byref_object_dispose__1618;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFEntitledAssetManager_installedAudioSamplingConfigWithAssetName___block_invoke;
  block[3] = &unk_1E61552D8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __68__SFEntitledAssetManager_installedAudioSamplingConfigWithAssetName___block_invoke(uint64_t a1)
{
  id v8 = +[SFEntitledAssetManager assetSetNameForAssetType:3];
  v2 = [*(id *)(a1 + 32) _assetSetWithName:v8 usage:MEMORY[0x1E4F1CC08]];
  id v3 = [v2 assetNamed:*(void *)(a1 + 40)];
  id v4 = [v3 location];
  uint64_t v5 = [v4 path];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke(void *a1)
{
  return +[SFEntitledAssetManager subscribeToAssetWithConfig:a1[4] regionId:a1[5] subscriberId:a1[6] expiration:a1[7]];
}

- (id)installedAssetWithConfig:(id)a3
{
  return [(SFEntitledAssetManager *)self installedAssetWithConfig:a3 regionId:0];
}

uint64_t __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 64))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) refreshAssetSetWithConfig:*(void *)(v1 + 40) regionId:*(void *)(v1 + 48)];
    uint64_t v2 = [*(id *)(v1 + 32) installedAssetWithConfig:*(void *)(v1 + 40) regionId:*(void *)(v1 + 48)];
    uint64_t v3 = *(void *)(*(void *)(v1 + 72) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (!*(void *)(*(void *)(*(void *)(v1 + 72) + 8) + 40))
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"%@ asset not found after attempted download." value:&stru_1F10479F8 table:@"Localizable"];
      uint64_t v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, *(void *)(v1 + 56));
      uint64_t v9 = *(void *)(*(void *)(v1 + 80) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v11 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(*(void *)(v1 + 80) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        uint64_t v22 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:"
              "]_block_invoke_2";
        __int16 v23 = 2112;
        uint64_t v24 = v18;
        _os_log_error_impl(&dword_1B709D000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *(void *)(*(void *)(*(void *)(v1 + 80) + 8) + 40);
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v20 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v15 = [v12 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v14];
      uint64_t v16 = *(void *)(*(void *)(v1 + 88) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 64) + 16))();
  }
  return result;
}

- (id)detailedInstallationStatusForLanguagesWithAssetType:(unint64_t)a3 subscriberId:(id)a4
{
  return [(SFEntitledAssetManager *)self _installationStatusForLanguagesWithAssetType:a3 includeDetailedStatus:1 subscriberId:a4];
}

- (id)installedLanguagesForAssetType:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:");
  uint64_t v4 = +[SFEntitledAssetManager assetSetNameForAssetType:a3];
  id v27 = +[SFEntitledAssetManager assetUsageTypeForAssetType:a3];
  uint64_t v5 = +[SFEntitledAssetManager assetSetUsagesForAssetType:a3];
  uint64_t v6 = [MEMORY[0x1E4FB35A0] sharedManager];
  uint64_t v24 = (void *)v4;
  id v7 = [v6 retrieveAssetSet:v4 usages:MEMORY[0x1E4F1CC08]];

  unint64_t v25 = a3;
  BOOL v8 = +[SFEntitledAssetManager isOverrideSupportedForAssetType:a3];
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v14];
        if (v8)
        {
          uint64_t v16 = [[SFEntitledAssetConfig alloc] initWithLanguage:v15 assetType:v25];
          uint64_t v17 = +[SFEntitledAssetManager _overridePathForConfig:v16];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            [v9 addObject:v15];

            goto LABEL_12;
          }
        }
        id v33 = v27;
        uint64_t v34 = v14;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v16 = [v7 assetNamed:v28 withUsage:v19];

        uint64_t v20 = [(SFEntitledAssetConfig *)v16 location];
        uint64_t v21 = [v20 path];

        if (v21) {
          [v9 addObject:v15];
        }
LABEL_12:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v11);
  }

  uint64_t v22 = (void *)[v9 copy];

  return v22;
}

- (id)modelQualityTypeStatusStringWithConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SFEntitledAssetManager _overrideModelQualityForConfig:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1617;
    uint64_t v20 = __Block_byref_object_dispose__1618;
    id v21 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SFEntitledAssetManager_modelQualityTypeStatusStringWithConfig___block_invoke;
    block[3] = &unk_1E61552D8;
    uint64_t v15 = &v16;
    void block[4] = self;
    id v14 = v4;
    dispatch_sync(queue, block);
    uint64_t v9 = (void *)v17[5];
    if (v9)
    {
      int v10 = [v9 _preferOverServer];
      uint64_t v11 = @"LQ";
      if (v10) {
        uint64_t v11 = @"HQ";
      }
      id v7 = v11;
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }

  return v7;
}

uint64_t __65__SFEntitledAssetManager_modelQualityTypeStatusStringWithConfig___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _assetWithAssetConfig:*(void *)(a1 + 40) regionId:0];

  return MEMORY[0x1F41817F8]();
}

- (id)assetStatusForConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SFEntitledAssetManager _overridePathForConfig:v4];
  if (v5
    && (+[SFEntitledAssetManager _overrideStatusForConfig:v4], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    BOOL v8 = [NSString stringWithFormat:@"%@ ModelInfo=%@: AssetId=OVERRIDE:", v6, v5];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__1617;
    uint64_t v18 = __Block_byref_object_dispose__1618;
    id v19 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SFEntitledAssetManager_assetStatusForConfig___block_invoke;
    block[3] = &unk_1E61552D8;
    uint64_t v13 = &v14;
    void block[4] = self;
    id v12 = v4;
    dispatch_sync(queue, block);
    if (v15[5])
    {
      BOOL v8 = +[SFEntitledAssetManager statusForAsset:](SFEntitledAssetManager, "statusForAsset:");
    }
    else
    {
      BOOL v8 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

uint64_t __47__SFEntitledAssetManager_assetStatusForConfig___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _assetWithAssetConfig:*(void *)(a1 + 40) regionId:0];

  return MEMORY[0x1F41817F8]();
}

- (void)switchToNewAssetsForAssetType:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SFEntitledAssetManager_switchToNewAssetsForAssetType___block_invoke;
  v4[3] = &unk_1E6155148;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __56__SFEntitledAssetManager_switchToNewAssetsForAssetType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = v2;
    if ((unint64_t)(v3 - 1) > 6) {
      uint64_t v5 = @"Unknown";
    }
    else {
      uint64_t v5 = off_1E6154988[v3 - 1];
    }
    uint64_t v6 = v5;
    int v8 = 136315394;
    uint64_t v9 = "-[SFEntitledAssetManager switchToNewAssetsForAssetType:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Switching to new %@ assets.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = +[SFEntitledAssetManager assetSetNameForAssetType:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _refreshAssetSetsWithName:v7];
  [*(id *)(a1 + 32) _scheduleCleanupTimer];
}

- (void)refreshAssetSetWithConfig:(id)a3 regionId:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[SFEntitledAssetManager assetSetUsageForConfig:v6 regionId:v7];
  if (v8)
  {
    uint64_t v9 = +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", [v6 assetType]);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SFEntitledAssetManager_refreshAssetSetWithConfig_regionId___block_invoke;
    block[3] = &unk_1E61551C0;
    void block[4] = self;
    id v18 = v9;
    id v19 = v8;
    uint64_t v11 = v9;
    dispatch_sync(queue, block);
  }
  else
  {
    uint64_t v12 = (void *)SFLogFramework;
    if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v11 = v12;
    uint64_t v13 = [v6 assetType];
    if ((unint64_t)(v13 - 1) > 6) {
      uint64_t v14 = @"Unknown";
    }
    else {
      uint64_t v14 = off_1E6154988[v13 - 1];
    }
    uint64_t v15 = v14;
    uint64_t v16 = [v6 language];
    *(_DWORD *)buf = 136315907;
    id v21 = "-[SFEntitledAssetManager refreshAssetSetWithConfig:regionId:]";
    __int16 v22 = 2112;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    unint64_t v25 = v16;
    __int16 v26 = 2113;
    id v27 = v7;
    _os_log_error_impl(&dword_1B709D000, v11, OS_LOG_TYPE_ERROR, "%s No valid usage resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);
  }
LABEL_5:
}

void __61__SFEntitledAssetManager_refreshAssetSetWithConfig_regionId___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB35A0] sharedManager];
    id v4 = [v3 retrieveAssetSet:*(void *)(a1 + 40) usages:*(void *)(a1 + 48)];

    [v5 setObject:v4 forKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _scheduleCleanupTimer];
  }
}

- (void)releaseAssetSetsWithAssetType:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SFEntitledAssetManager_releaseAssetSetsWithAssetType___block_invoke;
  v4[3] = &unk_1E6155148;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __56__SFEntitledAssetManager_releaseAssetSetsWithAssetType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = v2;
    if ((unint64_t)(v3 - 1) > 6) {
      id v5 = @"Unknown";
    }
    else {
      id v5 = off_1E6154988[v3 - 1];
    }
    id v6 = v5;
    int v8 = 136315394;
    uint64_t v9 = "-[SFEntitledAssetManager releaseAssetSetsWithAssetType:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Releasing %@ assets sets.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = +[SFEntitledAssetManager assetNameForAssetType:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v7];
}

- (void)releaseAssetSets
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SFEntitledAssetManager_releaseAssetSets__block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __42__SFEntitledAssetManager_releaseAssetSets__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SFEntitledAssetManager releaseAssetSets]_block_invoke";
    _os_log_impl(&dword_1B709D000, v2, OS_LOG_TYPE_DEFAULT, "%s Releasing all asset sets.", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  return [*(id *)(a1 + 32) _cancelCleanupTimer];
}

- (id)assetSetDict
{
  return self->_assetSetDict;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFEntitledAssetManager_dealloc__block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)SFEntitledAssetManager;
  [(SFEntitledAssetManager *)&v4 dealloc];
}

uint64_t __33__SFEntitledAssetManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelCleanupTimer];
}

+ (id)_overrideModelQualityForConfig:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  uint64_t v6 = [v4 assetType];
  if ((unint64_t)(v6 - 1) > 6) {
    id v7 = @"Unknown";
  }
  else {
    id v7 = off_1E6154988[v6 - 1];
  }
  int v8 = v7;
  uint64_t v9 = NSString;
  __int16 v10 = [v4 language];

  uint64_t v11 = [v9 stringWithFormat:@"%@/%@/%@", @"overrideAssetStatus", v8, v10];

  uint64_t v12 = [v5 objectForKey:v11];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@/%@", @"overrideAssetStatus", v8];

    uint64_t v15 = [v5 objectForKey:v14];
    if (!v15)
    {
      id v16 = 0;
      goto LABEL_18;
    }
    uint64_t v13 = (void *)v15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v13 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v13 firstObject];
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }

LABEL_18:

  return v16;
}

+ (id)_overrideStatusForConfig:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!+[SFEntitledAssetManager isOverrideSupportedForAssetType:](SFEntitledAssetManager, "isOverrideSupportedForAssetType:", [v3 assetType]))
  {
    id v7 = 0;
    goto LABEL_25;
  }
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v3 assetType];
  if ((unint64_t)(v5 - 1) > 6) {
    uint64_t v6 = @"Unknown";
  }
  else {
    uint64_t v6 = off_1E6154988[v5 - 1];
  }
  int v8 = v6;
  uint64_t v9 = NSString;
  __int16 v10 = [v3 language];
  uint64_t v11 = [v9 stringWithFormat:@"%@/%@/%@", @"overrideAssetStatus", v8, v10];

  uint64_t v12 = [v4 objectForKey:v11];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = v11;
LABEL_10:
    id v16 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@:", @"Version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 appendFormat:@" %@:", v13];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v24 = v14;
        unint64_t v25 = v8;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = v13;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v16 appendFormat:@" %@:", v22];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v19);
        }

        int v8 = v25;
        uint64_t v14 = v24;
      }
    }
    id v7 = (void *)[v16 copy];

    goto LABEL_24;
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@/%@", @"overrideAssetStatus", v8];

  uint64_t v15 = [v4 objectForKey:v14];
  if (v15)
  {
    uint64_t v13 = (void *)v15;
    goto LABEL_10;
  }
  id v7 = 0;
LABEL_24:

LABEL_25:

  return v7;
}

+ (id)_assetSetSubscriptionWithConfig:(id)a3 regionId:(id)a4 expiration:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = +[SFEntitledAssetManager subscriptionNameForConfig:v7 regionId:v8];
  if ([v10 length])
  {
    uint64_t v11 = +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", [v7 assetType]);
    uint64_t v12 = +[SFEntitledAssetManager assetSetUsageForConfig:v7 regionId:v8];
    id v13 = objc_alloc(MEMORY[0x1E4FB35B0]);
    __int16 v23 = v11;
    __int16 v24 = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v15 = (void *)[v13 initWithName:v10 assetSets:v14 usageAliases:0 expires:v9];
  }
  else
  {
    id v16 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v16;
      uint64_t v19 = [v7 assetType];
      if ((unint64_t)(v19 - 1) > 6) {
        uint64_t v20 = @"Unknown";
      }
      else {
        uint64_t v20 = off_1E6154988[v19 - 1];
      }
      id v21 = v20;
      uint64_t v22 = [v7 language];
      *(_DWORD *)buf = 136315907;
      long long v26 = "+[SFEntitledAssetManager _assetSetSubscriptionWithConfig:regionId:expiration:]";
      __int16 v27 = 2112;
      long long v28 = v21;
      __int16 v29 = 2112;
      long long v30 = v22;
      __int16 v31 = 2113;
      id v32 = v8;
      _os_log_error_impl(&dword_1B709D000, v18, OS_LOG_TYPE_ERROR, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)_assetSetSubscriptionsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  id v7 = a5;
  unint64_t v32 = a3;
  id v8 = +[SFEntitledAssetManager subscriptionNamePrefixForAssetType:a3];
  if (![v8 length])
  {
    id v28 = [MEMORY[0x1E4F1C9E8] dictionary];
    goto LABEL_23;
  }
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [MEMORY[0x1E4FB35A0] sharedManager];
  id v27 = v7;
  __int16 v10 = [v9 subscriptionsForSubscriber:v7];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  id v13 = 0;
  uint64_t v31 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v34 != v31) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v16 = [v15 name];
      int v17 = [v16 hasPrefix:v8];

      if (!v17)
      {
        if (v32 != 3) {
          continue;
        }
        uint64_t v22 = [v15 name];
        int v23 = [v22 hasPrefix:@"hammer."];

        if (!v23) {
          continue;
        }
        id v21 = [v15 name];
        uint64_t v20 = [v21 substringFromIndex:objc_msgSend(@"hammer.", "length")];
        uint64_t v24 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v20];

        id v13 = (void *)v24;
        goto LABEL_13;
      }
      uint64_t v18 = [v15 name];
      uint64_t v19 = objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v8, "length"));
      uint64_t v20 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v19];

      if (v32 == 5)
      {
        id v21 = [v20 componentsSeparatedByString:@"."];
        id v13 = [v21 firstObject];
LABEL_13:

        goto LABEL_15;
      }
      id v13 = v20;
LABEL_15:
      if (([v30 containsObject:v13] & 1) == 0)
      {
        unint64_t v25 = [v15 name];
        [v28 setObject:v13 forKey:v25];
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v12);
LABEL_22:

  id v7 = v27;
LABEL_23:

  return v28;
}

+ (id)_assetPathWithStatus:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "componentsSeparatedByString:", @":", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasPrefix:@" ModelInfo="])
        {
          id v9 = [v8 stringByReplacingOccurrencesOfString:@" ModelInfo=" withString:&stru_1F10479F8];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  id v9 = +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", [v8 assetType]);
  __int16 v10 = +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", [v8 assetType]);
  long long v11 = +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", [v8 assetType]);
  long long v12 = [v8 language];

  long long v13 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v12];

  long long v14 = [MEMORY[0x1E4FB35A0] sharedManager];
  uint64_t v16 = v11;
  v17[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v14 disableCacheDelete:!v5 forAssetNamed:v9 assetSet:v10 usages:v15 queue:0 completion:v7];
}

+ (id)modelTasksForLocaleWithInstallationStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        __int16 v10 = [v3 objectForKey:v9];
        long long v11 = +[SFEntitledAssetManager _assetPathWithStatus:v10];
        if (v11) {
          +[SFModelTaskSet taskSetWithAssetPath:v11];
        }
        else {
        long long v12 = +[SFModelTaskSet set];
        }
        [v4 setObject:v12 forKey:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (void)unsubscribeFromAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[SFEntitledAssetManager isSubscribedToAssetWithConfig:v7 regionId:v8 subscriberId:v9])
  {
    __int16 v10 = +[SFEntitledAssetManager subscriptionNameForConfig:v7 regionId:v8];
    if ([v10 length])
    {
      long long v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
      if ([v7 assetType] == 3)
      {
        long long v12 = [SFEntitledAssetConfig alloc];
        long long v13 = [v7 language];
        long long v14 = [(SFEntitledAssetConfig *)v12 initWithLanguage:v13 assetType:1];

        long long v15 = +[SFEntitledAssetManager subscriptionNameForConfig:v14 regionId:0];
        [v11 addObject:v15];
      }
      long long v16 = [MEMORY[0x1E4FB35A0] sharedManager];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      id v23[2] = __79__SFEntitledAssetManager_unsubscribeFromAssetWithConfig_regionId_subscriberId___block_invoke;
      v23[3] = &unk_1E61557C8;
      id v24 = v9;
      id v25 = v11;
      long long v17 = v11;
      [v16 unsubscribe:v24 subscriptionNames:v17 queue:0 completion:v23];
    }
    else
    {
      long long v18 = (void *)SFLogFramework;
      if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      long long v17 = v18;
      uint64_t v19 = [v7 assetType];
      if ((unint64_t)(v19 - 1) > 6) {
        uint64_t v20 = @"Unknown";
      }
      else {
        uint64_t v20 = off_1E6154988[v19 - 1];
      }
      id v21 = v20;
      uint64_t v22 = [v7 language];
      *(_DWORD *)buf = 136315907;
      id v27 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]";
      __int16 v28 = 2112;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      __int16 v32 = 2113;
      id v33 = v8;
      _os_log_impl(&dword_1B709D000, v17, OS_LOG_TYPE_DEFAULT, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %{private}@", buf, 0x2Au);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __79__SFEntitledAssetManager_unsubscribeFromAssetWithConfig_regionId_subscriberId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v9 = 136315906;
      __int16 v10 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe %@ from %@, error: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 136315650;
    __int16 v10 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Unsubscribed %@ from %@", (uint8_t *)&v9, 0x20u);
  }
}

+ (id)unsubscribeFromAssetsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5
{
  id v7 = a5;
  uint64_t v8 = +[SFEntitledAssetManager _assetSetSubscriptionsWithAssetType:a3 exceptLanguages:a4 subscriberId:v7];
  int v9 = [v8 allKeys];
  __int16 v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  if ([v10 count])
  {
    __int16 v11 = [MEMORY[0x1E4FB35A0] sharedManager];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    long long v18 = __90__SFEntitledAssetManager_unsubscribeFromAssetsWithAssetType_exceptLanguages_subscriberId___block_invoke;
    uint64_t v19 = &unk_1E61557C8;
    id v20 = v7;
    id v21 = v10;
    [v11 unsubscribe:v20 subscriptionNames:v21 queue:0 completion:&v16];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  __int16 v13 = objc_msgSend(v8, "allValues", v16, v17, v18, v19);
  uint64_t v14 = [v12 setWithArray:v13];

  return v14;
}

void __90__SFEntitledAssetManager_unsubscribeFromAssetsWithAssetType_exceptLanguages_subscriberId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v9 = 136315906;
      __int16 v10 = "+[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe %@ from %@, error: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 136315650;
    __int16 v10 = "+[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Unsubscribed %@ from %@", (uint8_t *)&v9, 0x20u);
  }
}

void __104__SFEntitledAssetManager_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v10 = 136315906;
      __int16 v11 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to subscribe %@ to %@, error: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v10 = 136315650;
    __int16 v11 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Subscribed %@ to %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6
{
}

+ (unint64_t)_assetTypeForSubscriptionName:(id)a3
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v15[0] = @"hammer.";
  v15[1] = @"assistant.";
  v16[0] = &unk_1F1056B28;
  v16[1] = &unk_1F1056B40;
  v15[2] = @"geolmregion.";
  v15[3] = @"geolm.";
  v16[2] = &unk_1F1056B58;
  v16[3] = &unk_1F1056B70;
  v15[4] = @"language.identification";
  v15[5] = @"transcription.";
  v16[4] = &unk_1F1056B88;
  void v16[5] = &unk_1F1056BA0;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SFEntitledAssetManager__assetTypeForSubscriptionName___block_invoke;
  v8[3] = &unk_1E61550F8;
  id v5 = v3;
  id v9 = v5;
  int v10 = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __56__SFEntitledAssetManager__assetTypeForSubscriptionName___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 unsignedIntegerValue];
    *a4 = 1;
  }
}

+ (id)subscriptionsForSubscriberId:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4FB35A0] sharedManager];
  id v21 = v3;
  id v5 = [v4 subscriptionsForSubscriber:v3];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 name];
        unint64_t v12 = +[SFEntitledAssetManager _assetTypeForSubscriptionName:v11];
        if (v12)
        {
          unint64_t v13 = v12;
          if (v12 == 6)
          {
            uint64_t v14 = [[SFEntitledAssetConfig alloc] initWithLanguage:@"none" assetType:6];
            [v23 addObject:v14];
          }
          else
          {
            uint64_t v15 = +[SFEntitledAssetManager assetSetNameForAssetType:v12];
            __int16 v16 = [v10 assetSets];
            id v17 = [v16 objectForKey:v15];

            uint64_t v18 = [v17 objectForKey:@"asr.language"];
            uint64_t v19 = [v17 objectForKey:@"asr.geo"];
            uint64_t v14 = [[SFEntitledAssetConfig alloc] initWithAssetType:v13 language:v18 regionId:v19];
            [v23 addObject:v14];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v23;
}

+ (id)jsonFilenameForAssetType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x5Du >> v3) & 1) != 0) {
    return off_1E6155428[v3];
  }
  uint64_t v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = v4;
    if (v3 > 6) {
      uint64_t v7 = @"Unknown";
    }
    else {
      uint64_t v7 = off_1E6154988[v3];
    }
    uint64_t v8 = v7;
    int v9 = 136315394;
    int v10 = "+[SFEntitledAssetManager jsonFilenameForAssetType:]";
    __int16 v11 = 2112;
    unint64_t v12 = v8;
    _os_log_error_impl(&dword_1B709D000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);
  }
  return &stru_1F10479F8;
}

+ (id)installationStateForDownloadStatus:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 5) {
    return off_1E6155320[a3 - 1];
  }
  id v5 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[SFEntitledAssetManager installationStateForDownloadStatus:]";
    __int16 v8 = 2048;
    unint64_t v9 = a3;
    _os_log_error_impl(&dword_1B709D000, v5, OS_LOG_TYPE_ERROR, "%s Unsupported download status: %lu", (uint8_t *)&v6, 0x16u);
  }
  return @"Unknown";
}

+ (id)systemSubscriberId
{
  return @"com.apple.siri.embeddedspeech";
}

@end