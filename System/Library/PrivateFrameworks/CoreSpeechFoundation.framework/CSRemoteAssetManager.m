@interface CSRemoteAssetManager
+ (id)sharedManager;
- (BOOL)_loadFromJsonFile:(id)a3;
- (BOOL)_loadPreinstalledAssetMetaIfNeeded;
- (BOOL)_writeToJsonFile:(id)a3;
- (CSRemoteAssetManager)init;
- (id)_loadJsonDataFromFile:(id)a3;
- (id)_remoteAssetMetaPath;
- (id)assetConfigVersionForAssetType:(unint64_t)a3;
- (id)assetForCurrentLanguageOfType:(unint64_t)a3;
- (id)assetHashForAssetType:(unint64_t)a3;
- (id)languageCode;
- (id)resourcePathForAssetType:(unint64_t)a3;
- (void)_setAssetsInfoFromMetaData:(id)a3;
- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)setLanguageCode:(id)a3 resourcePath:(id)a4 configVersion:(id)a5 assetHash:(id)a6 assetType:(unint64_t)a7;
@end

@implementation CSRemoteAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetHash, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (!a4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__CSRemoteAssetManager_removeObserver_forAssetType___block_invoke;
    v9[3] = &unk_1E6201030;
    v9[4] = self;
    id v10 = v6;
    dispatch_sync(queue, v9);
  }
}

uint64_t __52__CSRemoteAssetManager_removeObserver_forAssetType___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 48)) {
    return [*(id *)(*(void *)(result + 32) + 48) removeObject:*(void *)(result + 40)];
  }
  return result;
}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (!a4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__CSRemoteAssetManager_addObserver_forAssetType___block_invoke;
    v9[3] = &unk_1E6201030;
    v9[4] = self;
    id v10 = v6;
    dispatch_sync(queue, v9);
  }
}

uint64_t __49__CSRemoteAssetManager_addObserver_forAssetType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (id)resourcePathForAssetType:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = self->_resourcePath;
  }
  return v4;
}

- (id)assetHashForAssetType:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = self->_assetHash;
  }
  return v4;
}

- (id)assetConfigVersionForAssetType:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = self->_configVersion;
  }
  return v4;
}

- (id)languageCode
{
  return self->_currentLanguageCode;
}

- (void)setLanguageCode:(id)a3 resourcePath:(id)a4 configVersion:(id)a5 assetHash:(id)a6 assetType:(unint64_t)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "-[CSRemoteAssetManager setLanguageCode:resourcePath:configVersion:assetHash:assetType:]";
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2114;
    id v34 = v15;
    _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s LanguageCode : %{public}@, resourcePath : %{public}@, configVersion : %{public}@, assetHash : %{public}@", buf, 0x34u);
  }
  if (!a7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke;
    block[3] = &unk_1E6201008;
    block[4] = self;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    dispatch_sync(queue, block);
    v18 = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke_2;
    v19[3] = &unk_1E6201288;
    v19[4] = self;
    dispatch_async(v18, v19);
  }
}

void __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 56));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _remoteAssetMetaPath];
  [v2 _writeToJsonFile:v3];
}

void __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "CSRemoteAssetManagerDidDownloadNewAsset:", *(void *)(a1 + 32), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (id)_loadJsonDataFromFile:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    if (!v6)
    {
      uint64_t v14 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        __int16 v20 = 2114;
        id v21 = v3;
        _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot read configuration file : %{public}@", buf, 0x16u);
      }
      id v13 = 0;
      goto LABEL_18;
    }
    id v17 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v17];
    id v8 = v17;
    if (v8)
    {
      long long v9 = (void *)CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = v9;
        long long v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Cannot decode configuration json file : %{public}@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v7;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      id v15 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Configuration json file is not expected format", buf, 0xCu);
      }
    }
    id v13 = 0;
    goto LABEL_17;
  }
  long long v12 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Remote asset file is not exists : %{public}@", buf, 0x16u);
  }
  id v13 = 0;
LABEL_19:

  return v13;
}

- (void)_setAssetsInfoFromMetaData:(id)a3
{
  id v4 = a3;
  char v5 = [v4 objectForKeyedSubscript:@"languageCode"];
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  uint64_t v7 = [v4 objectForKeyedSubscript:@"resourcePath"];
  resourcePath = self->_resourcePath;
  self->_resourcePath = v7;

  long long v9 = [v4 objectForKeyedSubscript:@"configVersion"];
  configVersion = self->_configVersion;
  self->_configVersion = v9;

  long long v11 = [v4 objectForKeyedSubscript:@"assetHash"];

  assetHash = self->_assetHash;
  self->_assetHash = v11;
}

- (BOOL)_loadFromJsonFile:(id)a3
{
  id v4 = [(CSRemoteAssetManager *)self _loadJsonDataFromFile:a3];
  if (v4) {
    [(CSRemoteAssetManager *)self _setAssetsInfoFromMetaData:v4];
  }

  return v4 != 0;
}

- (BOOL)_writeToJsonFile:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  currentLanguageCode = self->_currentLanguageCode;
  v35[0] = @"languageCode";
  v35[1] = @"resourcePath";
  long long v37 = *(_OWORD *)&self->_resourcePath;
  v35[2] = @"configVersion";
  v35[3] = @"assetHash";
  v36 = currentLanguageCode;
  assetHash = self->_assetHash;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:v35 count:4];
  id v28 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:3 error:&v28];
  id v8 = v28;
  if (v7)
  {
    long long v9 = [v4 stringByDeletingLastPathComponent];
    long long v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v11 = [v10 fileExistsAtPath:v9];

    if ((v11 & 1) == 0)
    {
      long long v12 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
        __int16 v31 = 2114;
        id v32 = v9;
        _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Creating directory : %{public}@", buf, 0x16u);
      }
      id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
    }
    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v15 = [v14 fileExistsAtPath:v4];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v27 = v8;
      char v17 = [v16 removeItemAtPath:v4 error:&v27];
      id v18 = v27;

      if ((v17 & 1) == 0)
      {
        v19 = (void *)CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
        {
          v25 = v19;
          v26 = [v18 localizedDescription];
          *(_DWORD *)buf = 136315650;
          id v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
          __int16 v31 = 2114;
          id v32 = v4;
          __int16 v33 = 2114;
          id v34 = v26;
          _os_log_error_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_ERROR, "%s Cannot remove asset meta file : %{public}@, %{public}@", buf, 0x20u);
        }
        char v20 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      id v18 = v8;
    }
    char v20 = [v7 writeToFile:v4 atomically:1];
LABEL_16:

    id v8 = v18;
    goto LABEL_17;
  }
  id v21 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    id v23 = v21;
    id v24 = [v8 localizedDescription];
    *(_DWORD *)buf = 136315394;
    id v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
    __int16 v31 = 2114;
    id v32 = v24;
    _os_log_error_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_ERROR, "%s Cannot create json file : %{public}@", buf, 0x16u);
  }
  char v20 = 0;
LABEL_17:

  return v20;
}

- (id)assetForCurrentLanguageOfType:(unint64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    long long v10 = __Block_byref_object_copy__12656;
    char v11 = __Block_byref_object_dispose__12657;
    id v12 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CSRemoteAssetManager_assetForCurrentLanguageOfType___block_invoke;
    block[3] = &unk_1E6200FE0;
    block[4] = self;
    void block[5] = &v7;
    block[6] = 0;
    dispatch_sync(queue, block);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

uint64_t __54__CSRemoteAssetManager_assetForCurrentLanguageOfType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadPreinstalledAssetMetaIfNeeded];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[CSAsset assetForAssetType:*(void *)(a1 + 48) resourcePath:*(void *)(*(void *)(a1 + 32) + 16) configVersion:*(void *)(*(void *)(a1 + 32) + 24)];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)_remoteAssetMetaPath
{
  v2 = +[CSFPreferences sharedPreferences];
  id v3 = [v2 baseDir];

  id v4 = [v3 stringByAppendingPathComponent:@"VoiceTrigger/assetMeta.json"];

  return v4;
}

- (BOOL)_loadPreinstalledAssetMetaIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isDarwinOS]
    && (+[CSFPreferences sharedPreferences],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 languageCodeDarwin],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    char v5 = +[CSFPreferences sharedPreferences];
    uint64_t v6 = [v5 languageCodeDarwin];
  }
  else
  {
    uint64_t v6 = @"en-US";
  }
  if ([(NSString *)self->_currentLanguageCode isEqualToString:v6]
    && ([(CSRemoteAssetManager *)self _remoteAssetMetaPath],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [(CSRemoteAssetManager *)self _loadFromJsonFile:v7],
        v7,
        v8))
  {
    uint64_t v9 = CSLogCategoryAsset;
    BOOL v10 = 1;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      id v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_INFO, "%s Skip reload assets, already up-to-date", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (+[CSUtils isDarwinOS])
  {
    char v11 = +[CSAsset fallBackAssetResourcePath];
    id v12 = [v11 stringByAppendingPathComponent:@"preinstalledMeta.json"];

    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      int v15 = [(CSRemoteAssetManager *)self _loadJsonDataFromFile:v12];
      uint64_t v16 = [v15 objectForKeyedSubscript:v6];
      char v17 = (void *)v16;
      if (v15 && v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(CSRemoteAssetManager *)self _setAssetsInfoFromMetaData:v17];
        id v18 = [(CSRemoteAssetManager *)self _remoteAssetMetaPath];
        BOOL v10 = [(CSRemoteAssetManager *)self _writeToJsonFile:v18];
      }
      else
      {
        char v20 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315394;
          id v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
          __int16 v24 = 2114;
          v25 = v15;
          _os_log_error_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_ERROR, "%s Invalid rawRemoteAssetMeta : %{public}@", (uint8_t *)&v22, 0x16u);
        }
        BOOL v10 = 0;
      }
    }
    else
    {
      v19 = CSLogCategoryAsset;
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315394;
        id v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
        __int16 v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s preinstalled model meta not found : %{public}@", (uint8_t *)&v22, 0x16u);
        BOOL v10 = 0;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (CSRemoteAssetManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSRemoteAssetManager;
  v2 = [(CSRemoteAssetManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSRemoteAssetManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    currentLanguageCode = v2->_currentLanguageCode;
    v2->_currentLanguageCode = (NSString *)@"en-US";

    BOOL v8 = [(CSRemoteAssetManager *)v2 _remoteAssetMetaPath];
    [(CSRemoteAssetManager *)v2 _loadFromJsonFile:v8];
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_12679 != -1) {
    dispatch_once(&sharedManager_onceToken_12679, &__block_literal_global_12680);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __37__CSRemoteAssetManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(CSRemoteAssetManager);
  return MEMORY[0x1F41817F8]();
}

@end