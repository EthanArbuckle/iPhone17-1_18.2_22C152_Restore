@interface ENConfigurationStore
+ (id)legacyAppCacheURL;
- (BOOL)_removeSubdivisionListForRegion:(id)a3 error:(id *)a4;
- (BOOL)_saveCountrySubdivisionList:(id)a3 country:(id)a4 error:(id *)a5;
- (BOOL)_saveRegionConfiguration:(id)a3 error:(id *)a4;
- (BOOL)_saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5;
- (BOOL)_saveServerConfigurationResponse:(id)a3 error:(id *)a4;
- (BOOL)developerServerConfiguration;
- (BOOL)regionSupportsSubdivisions:(id)a3;
- (BOOL)removeConfigurationsForRegion:(id)a3 includingSubdivisions:(BOOL)a4 error:(id *)a5;
- (BOOL)removeConfigurationsForRegionCode:(id)a3 error:(id *)a4;
- (BOOL)removeSubdivisionListForRegion:(id)a3 error:(id *)a4;
- (BOOL)saveCountrySubdivisionList:(id)a3 region:(id)a4 error:(id *)a5;
- (BOOL)saveRegionConfiguration:(id)a3 error:(id *)a4;
- (BOOL)saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5;
- (BOOL)saveServerConfigurationResponse:(id)a3 error:(id *)a4;
- (BOOL)saveTemporaryServerConfigurations:(id)a3 error:(id *)a4;
- (ENConfigurationStore)init;
- (ENConfigurationStore)initWithDirectoryPath:(id)a3;
- (NSString)directoryPath;
- (NSString)regionIdentifierOverride;
- (OS_dispatch_queue)storeQueue;
- (id)_agencyConfigurationForRegion:(id)a3;
- (id)_allCachedServerResponseConfigurationsWithPrefix:(id)a3;
- (id)_configurationForRegion:(id)a3;
- (id)_directoryURLForCachedConfigurations;
- (id)_existingConfigurationForRegion:(id)a3;
- (id)_existingConfigurationForRegionPath:(id)a3;
- (id)_localeForRegion:(id)a3;
- (id)_localeIdentifiersForRegion:(id)a3;
- (id)_regionHashForRegion:(id)a3;
- (id)_serverConfigurationForRegion:(id)a3;
- (id)_serverConfigurationResponseForFileURL:(id)a3;
- (id)_serverConfigurationResponseForRegion:(id)a3;
- (id)_subdivisionListForRegion:(id)a3;
- (id)agencyConfigurationForRegion:(id)a3;
- (id)allCachedCountries;
- (id)allCachedRegions;
- (id)allRegionConfigurations;
- (id)allRegionServerConfigurations;
- (id)allRegionServerConfigurationsForCountryCode:(id)a3;
- (id)cachedAppConfiguationForBundleID:(id)a3 forRegionID:(id)a4;
- (id)configurationCacheURL;
- (id)configurationForRegion:(id)a3;
- (id)developerConfigurationsURL;
- (id)developerSubdivisionListCacheURL;
- (id)downloadConfigurationForRegion:(id)a3;
- (id)fileURLForCountryRegionHash:(id)a3;
- (id)fileURLforCountrySubdivisionList:(id)a3;
- (id)fileURLforRegionConfiguration:(id)a3;
- (id)fileURLforRegionServerConfiguration:(id)a3;
- (id)legacyAppConfiguationForMobileCountryCode:(id)a3;
- (id)localeForRegion:(id)a3;
- (id)localeIdentifiersForRegion:(id)a3;
- (id)regionCacheURL;
- (id)regionFromServerResponse:(id)a3;
- (id)regionHashForRegion:(id)a3;
- (id)serverConfigurationCacheURL;
- (id)serverConfigurationForRegion:(id)a3;
- (id)serverConfigurationResponseForRegion:(id)a3;
- (id)serverExposureConfigurationForRegion:(id)a3;
- (id)serverSubdivisionListCacheURL;
- (id)subdivisionListCacheURL;
- (id)subdivisionListForRegion:(id)a3;
- (id)systemConfigurationCacheURL;
- (void)_enumerateCachedServerResponseConfigurationsWithDirectoryURL:(id)a3 prefix:(id)a4 handler:(id)a5;
- (void)allAgencyServerRegionConfigurationsWithCompletion:(id)a3;
- (void)allCachedCountryCodesServerResponseWithDirectoryURL:(id)a3 handler:(id)a4;
- (void)allCachedServerResponseConfigurationsWithCompletion:(id)a3;
- (void)allCachedServerResponseConfigurationsWithCountryCode:(id)a3 completion:(id)a4;
- (void)allRegionConfigurationsWithCompletion:(id)a3;
- (void)allRegionServerConfigurationsWithCompletion:(id)a3;
- (void)clearTemporaryCountrySubdivisionList;
- (void)clearTemporaryServerConfigurations;
- (void)enumerateCachedRegionServerConfigurationsWithCountryCode:(id)a3 handler:(id)a4;
- (void)enumerateCachedRegionServerConfigurationsWithHandler:(id)a3;
- (void)prefsChanged;
- (void)resetStore;
- (void)setDeveloperServerConfiguration:(BOOL)a3;
- (void)setRegionIdentifierOverride:(id)a3;
- (void)setStoreQueue:(id)a3;
@end

@implementation ENConfigurationStore

- (void)clearTemporaryServerConfigurations
{
  v3 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ENConfigurationStore_clearTemporaryServerConfigurations__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)clearTemporaryCountrySubdivisionList
{
  v3 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ENConfigurationStore_clearTemporaryCountrySubdivisionList__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

void __88__ENConfigurationStore_allCachedServerResponseConfigurationsWithCountryCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _allCachedServerResponseConfigurationsWithPrefix:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __62__ENConfigurationStore_allRegionConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = objc_alloc(MEMORY[0x1E4F257C0]);
        v12 = objc_msgSend(v11, "initWithServerResponseDictionary:", v10, (void)v18);
        v13 = v12;
        if (v12)
        {
          v14 = *(void **)(a1 + 32);
          v15 = [v12 region];
          v16 = [v14 _configurationForRegion:v15];

          if (v16) {
            [v4 addObject:v16];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v4);
  }
}

- (id)_allCachedServerResponseConfigurationsWithPrefix:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA40];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(ENConfigurationStore *)self _directoryURLForCachedConfigurations];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__ENConfigurationStore__allCachedServerResponseConfigurationsWithPrefix___block_invoke;
  v11[3] = &unk_1E69AE2F0;
  id v12 = v6;
  id v8 = v6;
  [(ENConfigurationStore *)self _enumerateCachedServerResponseConfigurationsWithDirectoryURL:v7 prefix:v5 handler:v11];

  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (void)_enumerateCachedServerResponseConfigurationsWithDirectoryURL:(id)a3 prefix:(id)a4 handler:(id)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31 = (void (**)(id, void *))a5;
  uint64_t v9 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v10 = *MEMORY[0x1E4F1C6F0];
  uint64_t v11 = *MEMORY[0x1E4F1C620];
  v46[0] = *MEMORY[0x1E4F1C6F0];
  v46[1] = v11;
  id v12 = [MEMORY[0x1E4F1C970] arrayWithObjects:v46 count:2];
  v30 = v7;
  v13 = [v9 enumeratorAtURL:v7 includingPropertiesForKeys:v12 options:5 errorHandler:&__block_literal_global_72];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v13;
  uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v42;
    uint64_t v33 = v10;
    id v34 = v8;
    uint64_t v32 = v11;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D9439DC0]();
        id v40 = 0;
        [v15 getResourceValue:&v40 forKey:v10 error:0];
        id v17 = v40;
        id v39 = 0;
        [v15 getResourceValue:&v39 forKey:v11 error:0];
        id v18 = v39;
        if (([v18 BOOLValue] & 1) == 0)
        {
          if (![v8 length]
            || ([v8 lowercaseString],
                long long v19 = objc_claimAutoreleasedReturnValue(),
                int v20 = [v17 hasPrefix:v19],
                v19,
                v20))
          {
            long long v21 = objc_msgSend(MEMORY[0x1E4F1C9B0], "dataWithContentsOfURL:", v15, v29);
            if (v21)
            {
              v22 = (void *)MEMORY[0x1E4F1CAD8];
              uint64_t v23 = objc_opt_class();
              uint64_t v24 = objc_opt_class();
              objc_opt_class();
              objc_opt_class();
              id v29 = (id)v24;
              v35 = [v22 setWithObjects:v23];
              v25 = objc_msgSend(MEMORY[0x1E4F28DB8], "unarchivedObjectOfClasses:fromData:error:");
              id v26 = 0;
              if (v26)
              {
                uint64_t v10 = v33;
                id v8 = v34;
                if (gLogCategory__ENConfigurationStore <= 90
                  && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  id v29 = v26;
                  LogPrintF_safe();
                }
              }
              else
              {
                v27 = +[ENLoggingPrefs sharedENLoggingPrefs];
                int v28 = [v27 isSensitiveLoggingAllowed];

                if (v28
                  && gLogCategory_ENConfigurationStore <= 10
                  && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  id v29 = v15;
                  LogPrintF_safe();
                }
                v31[2](v31, v25);
                uint64_t v10 = v33;
                id v8 = v34;
              }

              uint64_t v11 = v32;
            }
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v38);
  }
}

- (id)_directoryURLForCachedConfigurations
{
  if ([(ENConfigurationStore *)self developerServerConfiguration]) {
    goto LABEL_4;
  }
  uint64_t v3 = [(ENConfigurationStore *)self regionIdentifierOverride];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  id v5 = [(ENConfigurationStore *)self regionIdentifierOverride];
  uint64_t v6 = [v5 length];

  if (v6)
  {
LABEL_4:
    id v7 = [(ENConfigurationStore *)self developerConfigurationsURL];
  }
  else
  {
LABEL_5:
    id v7 = [(ENConfigurationStore *)self serverConfigurationCacheURL];
  }

  return v7;
}

- (id)serverConfigurationCacheURL
{
  id v2 = [(ENConfigurationStore *)self configurationCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Server"];
  v4 = [v3 path];

  id v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (NSString)regionIdentifierOverride
{
  return self->_regionIdentifierOverride;
}

- (BOOL)developerServerConfiguration
{
  return self->_developerServerConfiguration;
}

void __60__ENConfigurationStore_clearTemporaryCountrySubdivisionList__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) developerSubdivisionListCacheURL];
  id v2 = [v1 path];

  char v9 = 1;
  uint64_t v3 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v9];

  if (!v4)
  {
LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }
  id v5 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v8 = 0;
  int v6 = [v5 removeItemAtPath:v2 error:&v8];
  id v7 = v8;

  if (v6 && !v7)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_12:
}

void __58__ENConfigurationStore_clearTemporaryServerConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) developerConfigurationsURL];
  id v2 = [v1 path];

  char v9 = 1;
  uint64_t v3 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v9];

  if (!v4)
  {
LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }
  id v5 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v8 = 0;
  int v6 = [v5 removeItemAtPath:v2 error:&v8];
  id v7 = v8;

  if (v6 && !v7)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_12:
}

- (id)developerSubdivisionListCacheURL
{
  id v2 = [(ENConfigurationStore *)self subdivisionListCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Developer"];
  int v4 = [v3 path];

  id v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)subdivisionListCacheURL
{
  id v2 = [(ENConfigurationStore *)self regionCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Subdivisions"];
  int v4 = [v3 path];

  id v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)configurationCacheURL
{
  id v2 = [(ENConfigurationStore *)self regionCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Configurations"];
  int v4 = [v3 path];

  id v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)regionCacheURL
{
  id v2 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:@"Regions"];
  uint64_t v3 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v2 isDirectory:1];

  return v3;
}

- (id)developerConfigurationsURL
{
  id v2 = [(ENConfigurationStore *)self configurationCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"developer"];

  return v3;
}

- (void)allRegionConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ENConfigurationStore_allRegionConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E69AE278;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENConfigurationStore *)self allCachedServerResponseConfigurationsWithCompletion:v6];
}

- (void)allCachedServerResponseConfigurationsWithCountryCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ENConfigurationStore_allCachedServerResponseConfigurationsWithCountryCode_completion___block_invoke;
  block[3] = &unk_1E69AE2C8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)allCachedServerResponseConfigurationsWithCompletion:(id)a3
{
}

BOOL __100__ENConfigurationStore__enumerateCachedServerResponseConfigurationsWithDirectoryURL_prefix_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (ENConfigurationStore)init
{
  uint64_t v3 = ENDataVaultPath();
  id v4 = [(ENConfigurationStore *)self initWithDirectoryPath:v3];

  return v4;
}

- (ENConfigurationStore)initWithDirectoryPath:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ENConfigurationStore;
  id v5 = [(ENConfigurationStore *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    directoryPath = v5->_directoryPath;
    v5->_directoryPath = (NSString *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.exposureNotification.configuration.store", v8);
    [(ENConfigurationStore *)v5 setStoreQueue:v9];

    [(ENConfigurationStore *)v5 setDeveloperServerConfiguration:CFPrefs_GetInt64() != 0];
    CFStringGetTypeID();
    id v10 = (void *)CFPrefs_CopyTypedValue();
    [(ENConfigurationStore *)v5 setRegionIdentifierOverride:v10];

    uint64_t v11 = [(ENConfigurationStore *)v5 regionCacheURL];
    uint64_t v12 = *MEMORY[0x1E4F1C638];
    id v33 = 0;
    char v13 = [v11 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v12 error:&v33];
    id v14 = v33;

    if ((v13 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v23 = [(ENConfigurationStore *)v5 regionCacheURL];
      id v26 = v14;
      LogPrintF_safe();
    }
    v15 = [(ENConfigurationStore *)v5 configurationCacheURL];
    id v32 = v14;
    char v16 = [v15 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v12 error:&v32];
    id v17 = v32;

    if ((v16 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = [(ENConfigurationStore *)v5 configurationCacheURL];
      id v27 = v17;
      LogPrintF_safe();
    }
    id v18 = [(ENConfigurationStore *)v5 systemConfigurationCacheURL];
    id v31 = v17;
    char v19 = [v18 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v12 error:&v31];
    id v20 = v31;

    if ((v19 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v25 = [(ENConfigurationStore *)v5 systemConfigurationCacheURL];
      id v28 = v20;
      LogPrintF_safe();
    }
    long long v21 = [(ENConfigurationStore *)v5 storeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__ENConfigurationStore_initWithDirectoryPath___block_invoke;
    block[3] = &unk_1E69ACA50;
    v30 = v5;
    dispatch_async(v21, block);
  }
  return v5;
}

void __46__ENConfigurationStore_initWithDirectoryPath___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) subdivisionListCacheURL];
  id v2 = [MEMORY[0x1E4F28CC0] defaultManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = *MEMORY[0x1E4F1C620];
  uint64_t v21 = *MEMORY[0x1E4F1C620];
  id v4 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v21 count:1];
  id v5 = [v2 contentsOfDirectoryAtURL:v1 includingPropertiesForKeys:v4 options:4 error:0];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v15 = v1;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v11 = v8;
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        int v13 = [v12 getResourceValue:&v16 forKey:v3 error:0];
        id v8 = v16;

        if (v13 && ([v8 BOOLValue] & 1) == 0)
        {
          if (gLogCategory_ENConfigurationStore <= 30
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v2, "removeItemAtURL:error:", v12, 0, v12);
          }
          else
          {
            objc_msgSend(v2, "removeItemAtURL:error:", v12, 0, v14);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);

    uint64_t v1 = v15;
  }
}

- (id)configurationForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  id v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ENConfigurationStore_configurationForRegion___block_invoke;
  block[3] = &unk_1E69ACB90;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__ENConfigurationStore_configurationForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _configurationForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_configurationForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ENConfigurationStore *)self _serverConfigurationResponseForRegion:v4];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F257C0]) initWithServerResponseDictionary:v5];
    id v7 = (void *)v6;
    if (!v5 || !v6)
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v14 = 0;
      goto LABEL_19;
    }
    id v8 = [(ENConfigurationStore *)self _existingConfigurationForRegion:v4];
    if (!v8) {
      id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F257B0]), "initWithVersion:region:", objc_msgSend(v7, "enVersion"), v4);
    }
    uint64_t v9 = [v8 userConsent];
    if (!v9 && (unint64_t)[v7 enVersion] >= 2)
    {
      id v10 = [v7 legalConsentVersion];

      if (!v10)
      {
LABEL_11:
        uint64_t v12 = [v8 region];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v8;
        }
        else
        {
          if (gLogCategory__ENConfigurationStore <= 90
            && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            id v16 = [v8 region];
            LogPrintF_safe();
          }
          id v14 = 0;
        }

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v9 = [v7 legalConsentVersion];
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F257D8]) initWithConsentVersion:v9];
      [v8 setUserConsent:v11];
    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v14 = 0;
LABEL_20:

  return v14;
}

- (id)_existingConfigurationForRegion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 regionCode];
    uint64_t v7 = [(ENConfigurationStore *)self fileURLforRegionConfiguration:v6];
    id v8 = [(id)v7 path];

    uint64_t v9 = [MEMORY[0x1E4F28CC0] defaultManager];
    LOBYTE(v7) = [v9 fileExistsAtPath:v8];

    if ((v7 & 1) == 0)
    {
      id v10 = [v5 countryCode];
      uint64_t v11 = [(ENConfigurationStore *)self fileURLforRegionConfiguration:v10];
      uint64_t v12 = [v11 path];

      id v8 = (void *)v12;
    }
    char v13 = [(ENConfigurationStore *)self _existingConfigurationForRegionPath:v8];
  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    char v13 = 0;
  }

  return v13;
}

- (id)_existingConfigurationForRegionPath:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (gLogCategory_ENConfigurationStore > 90
      || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_31;
    }
LABEL_27:
    LogPrintF_safe();
LABEL_31:
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  id v4 = [MEMORY[0x1E4F28CC0] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    if (gLogCategory_ENConfigurationStore > 10
      || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  id v16 = 0;
  uint64_t v6 = [MEMORY[0x1E4F1C9B0] dataWithContentsOfFile:v3 options:0 error:&v16];
  id v7 = v16;
  if (!v7 && v6) {
    goto LABEL_10;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    id v14 = [v3 lastPathComponent];
    LogPrintF_safe();
  }
  if (v6)
  {
LABEL_10:
    id v8 = (void *)MEMORY[0x1E4F1CAD8];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v15 = v7;
    uint64_t v11 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClasses:v10 fromData:v6 error:&v15];
    id v12 = v15;

    if (v12)
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = v7;
  }

LABEL_19:

  return v11;
}

- (BOOL)saveRegionConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v7 = [(ENConfigurationStore *)self storeQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ENConfigurationStore_saveRegionConfiguration_error___block_invoke;
  v10[3] = &unk_1E69ACE88;
  v10[4] = self;
  id v11 = v6;
  id v12 = &v14;
  char v13 = a4;
  id v8 = v6;
  dispatch_barrier_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __54__ENConfigurationStore_saveRegionConfiguration_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveRegionConfiguration:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveRegionConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    id v7 = [v6 region];
    id v8 = [v7 regionCode];
    uint64_t v9 = [(ENConfigurationStore *)self fileURLforRegionConfiguration:v8];

    id v10 = v6;
    id v11 = [v10 region];
    id v12 = [(ENConfigurationStore *)self _existingConfigurationForRegion:v11];

    char v13 = v10;
    if (v12)
    {
      char v13 = v10;
      if (([v12 isEqual:v10] & 1) == 0)
      {
        char v13 = [v12 updatedWithConfiguration:v10];

        if (gLogCategory_ENConfigurationStore <= 30
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          uint64_t v23 = v13;
          LogPrintF_safe();
        }
      }
    }

    if (v9)
    {
      uint64_t v14 = [v9 URLByDeletingLastPathComponent];
      id v15 = [MEMORY[0x1E4F28CC0] defaultManager];
      id v28 = 0;
      int v16 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v28];
      id v17 = v28;

      if (v16)
      {
        uint64_t v18 = *MEMORY[0x1E4F1C638];
        id v27 = v17;
        char v19 = [v14 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v18 error:&v27];
        id v20 = v27;

        if ((v19 & 1) == 0
          && gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          uint64_t v23 = v14;
          id v25 = v20;
          LogPrintF_safe();
        }
        id v26 = v20;
        LOBYTE(v16) = 1;
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28DA8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v26, v23, v25);
        id v17 = v26;

        if (!v17)
        {
          if ([v21 writeToURL:v9 atomically:1])
          {
            if (gLogCategory_ENConfigurationStore <= 10
              && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
          }
          else
          {
            if (gLogCategory__ENConfigurationStore <= 90
              && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
            {
              uint64_t v24 = [v10 region];
              LogPrintF_safe();
            }
            LOBYTE(v16) = 0;
          }
        }
      }
      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      LOBYTE(v16) = 0;
      id v17 = 0;
    }
  }
  else
  {
    ENErrorF();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)saveCountrySubdivisionList:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v10 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ENConfigurationStore_saveCountrySubdivisionList_region_error___block_invoke;
  block[3] = &unk_1E69ACAC8;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = &v19;
  uint64_t v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);

  LOBYTE(self) = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __64__ENConfigurationStore_saveCountrySubdivisionList_region_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveCountrySubdivisionList:*(void *)(a1 + 40) country:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveCountrySubdivisionList:(id)a3 country:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 countryCode];
  id v10 = [(ENConfigurationStore *)self fileURLforCountrySubdivisionList:v9];

  id v11 = [v10 URLByDeletingLastPathComponent];
  id v12 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a5];

  if (v13)
  {
    uint64_t v14 = *MEMORY[0x1E4F1C638];
    id v21 = 0;
    char v15 = [v11 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v14 error:&v21];
    id v16 = v21;
    if ((v15 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = v11;
      id v20 = v16;
      LogPrintF_safe();
    }
    int v17 = objc_msgSend(v8, "writeToURL:error:", v10, a5, v19, v20);
    if (v17
      && gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v10 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ENConfigurationStore_saveRegionHash_region_error___block_invoke;
  block[3] = &unk_1E69ACAC8;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  int v17 = &v19;
  uint64_t v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);

  LOBYTE(self) = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __52__ENConfigurationStore_saveRegionHash_region_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveRegionHash:*(void *)(a1 + 40) region:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 countryCode];
  id v10 = [(ENConfigurationStore *)self fileURLForCountryRegionHash:v9];

  id v11 = [v10 URLByDeletingLastPathComponent];
  id v12 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a5];

  if (!v13)
  {
    BOOL v22 = 0;
    goto LABEL_24;
  }
  uint64_t v14 = *MEMORY[0x1E4F1C638];
  id v25 = 0;
  char v15 = [v11 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v14 error:&v25];
  id v16 = v25;
  if ((v15 & 1) == 0
    && gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (!v8)
  {
    int v17 = [MEMORY[0x1E4F28CC0] defaultManager];
    id v24 = 0;
    char v18 = [v17 removeItemAtURL:v10 error:&v24];
    id v19 = v24;

    if ((v18 & 1) == 0)
    {
      if ([v19 code] != 4
        || ([v19 domain],
            id v20 = objc_claimAutoreleasedReturnValue(),
            char v21 = [v20 isEqualToString:*MEMORY[0x1E4F281F0]],
            v20,
            (v21 & 1) == 0))
      {
        if (a5) {
          *a5 = v19;
        }

        goto LABEL_20;
      }
    }

LABEL_12:
    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    BOOL v22 = 1;
    goto LABEL_23;
  }
  if ([v8 writeToURL:v10 atomically:1 encoding:4 error:a5]) {
    goto LABEL_12;
  }
LABEL_20:
  BOOL v22 = 0;
LABEL_23:

LABEL_24:
  return v22;
}

- (BOOL)saveServerConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v7 = [(ENConfigurationStore *)self storeQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ENConfigurationStore_saveServerConfigurationResponse_error___block_invoke;
  v10[3] = &unk_1E69ACE88;
  v10[4] = self;
  id v11 = v6;
  id v12 = &v14;
  int v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __62__ENConfigurationStore_saveServerConfigurationResponse_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveServerConfigurationResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveServerConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"config"];
  id v8 = [v7 objectForKeyedSubscript:@"enVersion"];
  id v9 = v8;
  if (v8 && (int)[v8 intValue] > 0)
  {
    id v10 = [(ENConfigurationStore *)self regionFromServerResponse:v6];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 regionCode];
      int v13 = [(ENConfigurationStore *)self fileURLforRegionServerConfiguration:v12];

      uint64_t v14 = [v13 URLByDeletingLastPathComponent];
      char v15 = [MEMORY[0x1E4F28CC0] defaultManager];
      int v16 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:a4];

      if (v16)
      {
        id v33 = v7;
        uint64_t v17 = *MEMORY[0x1E4F1C638];
        id v34 = 0;
        char v18 = [v14 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v17 error:&v34];
        id v19 = v34;
        if ((v18 & 1) == 0
          && gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          id v29 = v14;
          id v31 = v19;
          LogPrintF_safe();
        }
        id v32 = v19;
        id v20 = objc_msgSend(MEMORY[0x1E4F28DA8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4, v29, v31);
        char v21 = v20;
        if (v20 && [v20 writeToURL:v13 options:1 error:a4])
        {
          if (gLogCategory_ENConfigurationStore <= 10
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            v30 = v13;
            LogPrintF_safe();
          }
          BOOL v22 = -[ENConfigurationStore _existingConfigurationForRegion:](self, "_existingConfigurationForRegion:", v11, v30);
          uint64_t v23 = v22;
          BOOL v27 = 1;
          if (v22)
          {
            uint64_t v24 = [v22 enVersion];
            if (v24 != [v9 unsignedIntegerValue])
            {
              id v25 = [(ENConfigurationStore *)self _configurationForRegion:v11];
              objc_msgSend(v25, "setEnVersion:", objc_msgSend(v9, "unsignedIntegerValue"));
              BOOL v26 = [(ENConfigurationStore *)self _saveRegionConfiguration:v25 error:a4];

              if (!v26) {
                BOOL v27 = 0;
              }
            }
          }
        }
        else
        {
          BOOL v27 = 0;
        }

        id v7 = v33;
      }
      else
      {
        BOOL v27 = 0;
      }
    }
    else if (a4)
    {
      ENErrorF();
      BOOL v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else if (a4)
  {
    ENErrorF();
    BOOL v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)removeConfigurationsForRegion:(id)a3 includingSubdivisions:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v9 = [v8 countryCode];
  BOOL v10 = [(ENConfigurationStore *)self removeConfigurationsForRegionCode:v9 error:a5];
  *((unsigned char *)v17 + 24) = v10;

  if (v6)
  {
    id v11 = [v8 countryCode];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__ENConfigurationStore_removeConfigurationsForRegion_includingSubdivisions_error___block_invoke;
    v15[3] = &unk_1E69AE190;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = a5;
    [(ENConfigurationStore *)self enumerateCachedRegionServerConfigurationsWithCountryCode:v11 handler:v15];
  }
  else
  {
    id v11 = [v8 regionCode];
    BOOL v12 = [(ENConfigurationStore *)self removeConfigurationsForRegionCode:v11 error:a5];
    *((unsigned char *)v17 + 24) = v12;
  }

  char v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __82__ENConfigurationStore_removeConfigurationsForRegion_includingSubdivisions_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = [a2 region];
  char v5 = [v4 regionCode];
  [v3 removeConfigurationsForRegionCode:v5 error:a1[6]];

  if (*(void *)a1[6]) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
}

- (BOOL)removeConfigurationsForRegionCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v7 = [(ENConfigurationStore *)self storeQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ENConfigurationStore_removeConfigurationsForRegionCode_error___block_invoke;
  v10[3] = &unk_1E69AE1B8;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = &v14;
  char v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __64__ENConfigurationStore_removeConfigurationsForRegionCode_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fileURLforRegionConfiguration:*(void *)(a1 + 40)];
  id v3 = [v2 path];

  char v12 = 0;
  id v4 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v12];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CC0] defaultManager];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 removeItemAtPath:v3 error:*(void *)(a1 + 56)];

    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      id v11 = v3;
      LogPrintF_safe();
    }
  }
  id v7 = objc_msgSend(*(id *)(a1 + 32), "fileURLforRegionServerConfiguration:", *(void *)(a1 + 40), v11);
  id v8 = [v7 path];

  id v9 = [MEMORY[0x1E4F28CC0] defaultManager];
  LODWORD(v7) = [v9 fileExistsAtPath:v8 isDirectory:&v12];

  if (v7)
  {
    BOOL v10 = [MEMORY[0x1E4F28CC0] defaultManager];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 removeItemAtPath:v8 error:*(void *)(a1 + 56)];

    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (BOOL)removeSubdivisionListForRegion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v7 = [(ENConfigurationStore *)self storeQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ENConfigurationStore_removeSubdivisionListForRegion_error___block_invoke;
  v10[3] = &unk_1E69ACE88;
  v10[4] = self;
  id v11 = v6;
  char v12 = &v14;
  char v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __61__ENConfigurationStore_removeSubdivisionListForRegion_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeSubdivisionListForRegion:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_removeSubdivisionListForRegion:(id)a3 error:(id *)a4
{
  id v6 = [a3 countryCode];
  id v7 = [(ENConfigurationStore *)self fileURLforCountrySubdivisionList:v6];
  id v8 = [v7 path];

  id v9 = [MEMORY[0x1E4F28CC0] defaultManager];
  LODWORD(v7) = [v9 fileExistsAtPath:v8];

  if (v7)
  {
    BOOL v10 = [MEMORY[0x1E4F28CC0] defaultManager];
    char v11 = [v10 removeItemAtPath:v8 error:a4];

    if (*a4) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v11;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)enumerateCachedRegionServerConfigurationsWithHandler:(id)a3
{
}

- (void)enumerateCachedRegionServerConfigurationsWithCountryCode:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__7;
  char v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  id v8 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke;
  block[3] = &unk_1E69ADE30;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(v8, block);

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  id v15 = 0;
  uint64_t v9 = v18[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke_2;
  v11[3] = &unk_1E69AE1E0;
  char v13 = v14;
  id v10 = v7;
  id v12 = v10;
  [(ENConfigurationStore *)self _enumerateCachedServerResponseConfigurationsWithDirectoryURL:v9 prefix:v6 handler:v11];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _directoryURLForCachedConfigurations];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F257C0];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithServerResponseDictionary:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v8();
  }
}

- (id)allCachedCountries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  char v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA88]);
  uint64_t v3 = [(ENConfigurationStore *)self storeQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__ENConfigurationStore_allCachedCountries__block_invoke;
  v6[3] = &unk_1E69AE230;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] allObjects];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__ENConfigurationStore_allCachedCountries__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _directoryURLForCachedConfigurations];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ENConfigurationStore_allCachedCountries__block_invoke_2;
  v4[3] = &unk_1E69AE208;
  uint64_t v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v3 allCachedCountryCodesServerResponseWithDirectoryURL:v2 handler:v4];
}

void __42__ENConfigurationStore_allCachedCountries__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F257A8] regionWithCode:a2];
  id v5 = [v3 countryCode];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    id v4 = v5;
  }
}

- (id)allCachedRegions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  char v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA88]);
  uint64_t v3 = [(ENConfigurationStore *)self storeQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ENConfigurationStore_allCachedRegions__block_invoke;
  v6[3] = &unk_1E69AE230;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] allObjects];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__ENConfigurationStore_allCachedRegions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _directoryURLForCachedConfigurations];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__ENConfigurationStore_allCachedRegions__block_invoke_2;
  v4[3] = &unk_1E69AE208;
  uint64_t v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v3 allCachedCountryCodesServerResponseWithDirectoryURL:v2 handler:v4];
}

uint64_t __40__ENConfigurationStore_allCachedRegions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F257A8] regionWithCode:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)allCachedCountryCodesServerResponseWithDirectoryURL:(id)a3 handler:(id)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = (void (**)(id, void *))a4;
  uint64_t v6 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C6F0];
  uint64_t v8 = *MEMORY[0x1E4F1C620];
  v35[0] = *MEMORY[0x1E4F1C6F0];
  v35[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C970] arrayWithObjects:v35 count:2];
  uint64_t v24 = v5;
  id v10 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:v9 options:5 errorHandler:&__block_literal_global_4];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      uint64_t v26 = v12;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1D9439DC0](v11);
        id v29 = 0;
        [v15 getResourceValue:&v29 forKey:v7 error:0];
        id v17 = v29;
        id v28 = 0;
        [v15 getResourceValue:&v28 forKey:v8 error:0];
        id v18 = v28;
        if (([v18 BOOLValue] & 1) == 0)
        {
          uint64_t v19 = v8;
          uint64_t v20 = v7;
          char v21 = [v17 stringByReplacingOccurrencesOfString:@".json" withString:&stru_1F2B29B10];
          id v22 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v23 = [v22 isSensitiveLoggingAllowed];

          if (v23
            && gLogCategory_ENConfigurationStore <= 10
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v25[2](v25, v21);

          uint64_t v7 = v20;
          uint64_t v8 = v19;
          uint64_t v12 = v26;
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }
}

BOOL __84__ENConfigurationStore_allCachedCountryCodesServerResponseWithDirectoryURL_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (id)allRegionConfigurations
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  id v25 = [MEMORY[0x1E4F1C970] array];
  uint64_t v3 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ENConfigurationStore_allRegionConfigurations__block_invoke;
  block[3] = &unk_1E69ADE30;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_async_and_wait(v3, block);

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend((id)v21[5], "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)v21[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F257C0]) initWithServerResponseDictionary:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v8)
        {
          uint64_t v9 = [(ENConfigurationStore *)self storeQueue];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __47__ENConfigurationStore_allRegionConfigurations__block_invoke_2;
          v13[3] = &unk_1E69ACD00;
          v13[4] = self;
          v13[5] = v8;
          id v14 = v4;
          dispatch_sync(v9, v13);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v5);
  }

  id v10 = (void *)[v4 copy];
  _Block_object_dispose(&v20, 8);

  return v10;
}

uint64_t __47__ENConfigurationStore_allRegionConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allCachedServerResponseConfigurationsWithPrefix:&stru_1F2B29B10];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __47__ENConfigurationStore_allRegionConfigurations__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) region];
  id v5 = [v2 _configurationForRegion:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (id)allRegionServerConfigurationsForCountryCode:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__7;
  id v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  id v29 = [MEMORY[0x1E4F1C970] array];
  id v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ENConfigurationStore_allRegionServerConfigurationsForCountryCode___block_invoke;
  block[3] = &unk_1E69ACB90;
  int v23 = &v24;
  void block[4] = self;
  id v6 = v4;
  id v22 = v6;
  dispatch_async_and_wait(v5, block);

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend((id)v25[5], "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)v25[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_alloc(MEMORY[0x1E4F257C0]);
        id v14 = objc_msgSend(v13, "initWithServerResponseDictionary:", v12, (void)v17);
        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v7 copy];
  _Block_object_dispose(&v24, 8);

  return v15;
}

uint64_t __68__ENConfigurationStore_allRegionServerConfigurationsForCountryCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allCachedServerResponseConfigurationsWithPrefix:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)allRegionServerConfigurations
{
  return [(ENConfigurationStore *)self allRegionServerConfigurationsForCountryCode:&stru_1F2B29B10];
}

- (void)allRegionServerConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__ENConfigurationStore_allRegionServerConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E69AE2A0;
  id v7 = v4;
  id v5 = v4;
  [(ENConfigurationStore *)self allCachedServerResponseConfigurationsWithCompletion:v6];
}

void __68__ENConfigurationStore_allRegionServerConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = objc_alloc(MEMORY[0x1E4F257C0]);
        uint64_t v12 = objc_msgSend(v11, "initWithServerResponseDictionary:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v4);
  }
}

- (void)allAgencyServerRegionConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__ENConfigurationStore_allAgencyServerRegionConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E69AE278;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENConfigurationStore *)self allCachedServerResponseConfigurationsWithCompletion:v6];
}

void __74__ENConfigurationStore_allAgencyServerRegionConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [*(id *)(a1 + 32) regionFromServerResponse:v9];
        if (v10)
        {
          id v11 = objc_alloc(MEMORY[0x1E4F257B8]);
          uint64_t v12 = [*(id *)(a1 + 32) _localeForRegion:v10];
          uint64_t v13 = (void *)[v11 initWithServerResponseDictionary:v9 locale:v12];

          if (v13) {
            [v15 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

- (id)serverConfigurationResponseForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__7;
    long long v15 = __Block_byref_object_dispose__7;
    id v16 = 0;
    uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ENConfigurationStore_serverConfigurationResponseForRegion___block_invoke;
    block[3] = &unk_1E69ACB90;
    uint64_t v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __61__ENConfigurationStore_serverConfigurationResponseForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _serverConfigurationResponseForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_serverConfigurationResponseForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 regionCode];
  id v6 = [(ENConfigurationStore *)self fileURLforRegionServerConfiguration:v5];

  uint64_t v7 = [(ENConfigurationStore *)self _serverConfigurationResponseForFileURL:v6];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
  }
  else
  {
    id v9 = [v6 path];
    uint64_t v10 = [MEMORY[0x1E4F28CC0] defaultManager];
    char v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v12 = [v4 countryCode];
      uint64_t v13 = [(ENConfigurationStore *)self fileURLforRegionServerConfiguration:v12];

      uint64_t v8 = [(ENConfigurationStore *)self _serverConfigurationResponseForFileURL:v13];
      id v6 = (void *)v13;
    }
  }

  return v8;
}

- (id)_serverConfigurationResponseForFileURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 path];
    id v20 = 0;
    id v6 = [MEMORY[0x1E4F1C9B0] dataWithContentsOfFile:v5 options:0 error:&v20];
    id v7 = v20;
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    if (!v8) {
      goto LABEL_12;
    }
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      long long v18 = [v5 lastPathComponent];
      LogPrintF_safe();
    }
    if (!v6)
    {
      uint64_t v14 = 0;
      id v15 = v7;
    }
    else
    {
LABEL_12:
      id v9 = (void *)MEMORY[0x1E4F1CAD8];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
      id v19 = v7;
      uint64_t v14 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClasses:v13 fromData:v6 error:&v19];
      id v15 = v19;

      if ((v15 || !v14)
        && gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    id v16 = v14;
  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v16 = 0;
  }

  return v16;
}

uint64_t __73__ENConfigurationStore__allCachedServerResponseConfigurationsWithPrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)regionSupportsSubdivisions:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[ENConfigurationStore subdivisionListForRegion:](self, "subdivisionListForRegion:");
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)serverConfigurationForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__7;
    id v15 = __Block_byref_object_dispose__7;
    id v16 = 0;
    uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ENConfigurationStore_serverConfigurationForRegion___block_invoke;
    block[3] = &unk_1E69ACB90;
    uint64_t v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __53__ENConfigurationStore_serverConfigurationForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _serverConfigurationForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_serverConfigurationForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ENConfigurationStore *)self _serverConfigurationResponseForRegion:v4];
    if (v5) {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F257C0]) initWithServerResponseDictionary:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)serverExposureConfigurationForRegion:(id)a3
{
  uint64_t v3 = [(ENConfigurationStore *)self serverConfigurationResponseForRegion:a3];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F257C8]) initWithServerResponseDictionary:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)agencyConfigurationForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ENConfigurationStore *)self serverConfigurationResponseForRegion:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F257B8]);
    id v7 = [(ENConfigurationStore *)self localeForRegion:v4];
    BOOL v8 = (void *)[v6 initWithServerResponseDictionary:v5 locale:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_agencyConfigurationForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ENConfigurationStore *)self _serverConfigurationResponseForRegion:v4];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F257B8]);
      id v7 = [(ENConfigurationStore *)self _localeForRegion:v4];
      BOOL v8 = (void *)[v6 initWithServerResponseDictionary:v5 locale:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)downloadConfigurationForRegion:(id)a3
{
  uint64_t v3 = [(ENConfigurationStore *)self serverConfigurationResponseForRegion:a3];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F257D0]) initWithServerResponseDictionary:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)regionFromServerResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"countryCode"];
    if (!v5)
    {
      id v7 = 0;
      goto LABEL_12;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = 0;
    if (!self || (isKindOfClass & 1) == 0) {
      goto LABEL_12;
    }
    BOOL v8 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length])
    {
      if (([MEMORY[0x1E4F257A8] validSubdivisionCode:v8 forCountryCode:v5] & 1) == 0)
      {
        if (gLogCategory_ENConfigurationStore <= 30
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        id v7 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v5 subdivisionCode:v8];
    }
    else
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v5];
    }
    id v7 = (void *)v9;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

- (id)subdivisionListForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ENConfigurationStore_subdivisionListForRegion___block_invoke;
  block[3] = &unk_1E69ACB90;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __49__ENConfigurationStore_subdivisionListForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _subdivisionListForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_subdivisionListForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 countryCode];
    id v7 = [(ENConfigurationStore *)self fileURLforCountrySubdivisionList:v6];
    BOOL v8 = [v7 path];

    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = [v5 countryCode];
      uint64_t v14 = v8;
      LogPrintF_safe();
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v13, v14);
    int v10 = [v9 fileExistsAtPath:v8];

    if (v10) {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C970]) initWithContentsOfFile:v8];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)regionHashForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ENConfigurationStore_regionHashForRegion___block_invoke;
  block[3] = &unk_1E69ACB90;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __44__ENConfigurationStore_regionHashForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _regionHashForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_regionHashForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 countryCode];
    id v7 = [(ENConfigurationStore *)self fileURLForCountryRegionHash:v6];

    BOOL v8 = [v7 path];
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = [v5 countryCode];
      id v15 = v7;
      LogPrintF_safe();
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v14, v15);
    int v10 = [v9 fileExistsAtPath:v8];

    if (v10)
    {
      id v16 = 0;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29020]) initWithContentsOfURL:v7 encoding:4 error:&v16];
      id v12 = v16;
      if (!v11
        && gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)localeIdentifiersForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ENConfigurationStore_localeIdentifiersForRegion___block_invoke;
  block[3] = &unk_1E69ACB90;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __51__ENConfigurationStore_localeIdentifiersForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _localeIdentifiersForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_localeIdentifiersForRegion:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v32 = v4;
    uint64_t v31 = [(ENConfigurationStore *)self _serverConfigurationResponseForRegion:v4];
    uint64_t v5 = [v31 objectForKeyedSubscript:@"config"];
    id v6 = [MEMORY[0x1E4F1CA40] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v30 = v5;
    id v7 = [v5 allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      uint64_t v33 = *(void *)v36;
      do
      {
        uint64_t v11 = 0;
        uint64_t v34 = v9;
        do
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
          if ([v12 hasPrefix:@"agencyMessage"])
          {
            uint64_t v13 = [v12 componentsSeparatedByString:@"_"];
            if ([v13 count] == 3)
            {
              uint64_t v14 = (void *)MEMORY[0x1E4F29020];
              id v15 = [v13 objectAtIndexedSubscript:1];
              [v15 lowercaseString];
              id v17 = v16 = v7;
              long long v18 = [v13 objectAtIndexedSubscript:2];
              [v18 uppercaseString];
              v20 = id v19 = v6;
              uint64_t v21 = [v14 stringWithFormat:@"%@_%@", v17, v20];

              id v6 = v19;
              id v7 = v16;
              uint64_t v9 = v34;

              uint64_t v10 = v33;
              [v19 addObject:v21];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }

    id v4 = v32;
    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      id v28 = v32;
      id v29 = v6;
      LogPrintF_safe();
    }
    if (objc_msgSend(v6, "count", v28, v29))
    {
      id v22 = v6;
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F1CA28] currentLocale];
      uint64_t v27 = [v26 localeIdentifier];
      id v39 = v27;
      id v22 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v39 count:1];
    }
    uint64_t v24 = v30;
    int v23 = v31;
  }
  else
  {
    int v23 = [MEMORY[0x1E4F1CA28] currentLocale];
    uint64_t v24 = [v23 localeIdentifier];
    v41[0] = v24;
    id v22 = [MEMORY[0x1E4F1C970] arrayWithObjects:v41 count:1];
  }

  return v22;
}

- (id)localeForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ENConfigurationStore_localeForRegion___block_invoke;
  block[3] = &unk_1E69ACB90;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __40__ENConfigurationStore_localeForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _localeForRegion:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_localeForRegion:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28B58];
    uint64_t v4 = -[ENConfigurationStore _localeIdentifiersForRegion:](self, "_localeIdentifiersForRegion:");
    uint64_t v5 = [MEMORY[0x1E4F1CA28] preferredLanguages];
    id v6 = [v3 preferredLocalizationsFromArray:v4 forPreferences:v5];
    id v7 = [v6 firstObject];

    uint64_t v8 = [MEMORY[0x1E4F1CA28] localeWithLocaleIdentifier:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA28] currentLocale];
  }

  return v8;
}

- (void)prefsChanged
{
  uint64_t v3 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ENConfigurationStore_prefsChanged__block_invoke;
  block[3] = &unk_1E69ACA50;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __36__ENConfigurationStore_prefsChanged__block_invoke(uint64_t a1)
{
  uint64_t Int64 = CFPrefs_GetInt64();
  if ((Int64 != 0) != [*(id *)(a1 + 32) developerServerConfiguration])
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [*(id *)(a1 + 32) developerServerConfiguration];
      BOOL v10 = Int64 != 0;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "setDeveloperServerConfiguration:", Int64 != 0, v8, v10);
  }
  CFStringGetTypeID();
  uint64_t v3 = (void *)CFPrefs_CopyTypedValue();
  uint64_t v4 = [*(id *)(a1 + 32) regionIdentifierOverride];
  id v11 = v3;
  id v5 = v4;
  if (v11 == v5)
  {

LABEL_18:
    id v7 = v11;
    goto LABEL_19;
  }
  if ((v11 == 0) == (v5 != 0))
  {

    goto LABEL_13;
  }
  char v6 = [v11 isEqual:v5];

  id v7 = v11;
  if ((v6 & 1) == 0)
  {
LABEL_13:
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = [*(id *)(a1 + 32) regionIdentifierOverride];
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 32), "setRegionIdentifierOverride:", v11, v9, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setRegionIdentifierOverride:", v11, v8, v10);
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)saveTemporaryServerConfigurations:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__7;
  id v40 = __Block_byref_object_dispose__7;
  id v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke;
  v31[3] = &unk_1E69AE318;
  v31[5] = &v36;
  v31[6] = a4;
  v31[4] = &v32;
  uint64_t v21 = (void (**)(void))MEMORY[0x1D9439FF0](v31);
  if ([(ENConfigurationStore *)self developerServerConfiguration]
    || ([(ENConfigurationStore *)self regionIdentifierOverride],
        (char v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(ENConfigurationStore *)self regionIdentifierOverride],
        id v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [v7 length] == 0,
        v7,
        v6,
        !v8))
  {
    uint64_t v24 = [MEMORY[0x1E4F28CC0] defaultManager];
    uint64_t v9 = [(ENConfigurationStore *)self developerConfigurationsURL];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v22;
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (!v10) {
      goto LABEL_27;
    }
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (!v13
          || (uint64_t v14 = (id *)(v37 + 5),
              id v26 = (id)v37[5],
              int v15 = [v24 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v26], objc_storeStrong(v14, v26), !v15))
        {
          if (v37[5])
          {
            if (gLogCategory_ENConfigurationStore > 90
              || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          else
          {
            uint64_t v18 = ENErrorF();
            id v19 = (void *)v37[5];
            v37[5] = v18;

            if (gLogCategory_ENConfigurationStore > 90
              || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          LogPrintF_safe();
          goto LABEL_27;
        }
        id v16 = [(ENConfigurationStore *)self storeQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke_2;
        block[3] = &unk_1E69ADE80;
        void block[4] = self;
        void block[5] = v13;
        void block[6] = &v32;
        block[7] = &v36;
        dispatch_sync(v16, block);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_27:

    BOOL v17 = *((unsigned char *)v33 + 24) != 0;
  }
  else if (a4)
  {
    ENErrorF();
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
  v21[2](v21);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

void __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) && *(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v2)
    {
      **(void **)(a1 + 48) = v2;
    }
    else
    {
      ENErrorF();
      id v3 = objc_claimAutoreleasedReturnValue();
      **(void **)(a1 + 48) = v3;
    }
  }
}

void __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _saveServerConfigurationResponse:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (void)resetStore
{
  uint64_t v3 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v4 = +[ENConfigurationStore legacyAppCacheURL];
  id v19 = 0;
  int v5 = [v3 removeItemAtURL:v4 error:&v19];
  id v6 = v19;

  if (v5)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90 {
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  }
  {
    id v15 = v6;
LABEL_8:
    LogPrintF_safe();
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v15);
  BOOL v8 = [(ENConfigurationStore *)self configurationCacheURL];
  id v18 = v6;
  int v9 = [v7 removeItemAtURL:v8 error:&v18];
  id v10 = v18;

  if (v9)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90 {
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  }
  {
    id v16 = v10;
LABEL_19:
    LogPrintF_safe();
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v16);
  uint64_t v12 = [(ENConfigurationStore *)self subdivisionListCacheURL];
  id v17 = v10;
  int v13 = [v11 removeItemAtURL:v12 error:&v17];
  id v14 = v17;

  if (v13)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
LABEL_29:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90 {
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_29;
  }
}

- (id)systemConfigurationCacheURL
{
  uint64_t v2 = [(ENConfigurationStore *)self configurationCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System"];
  uint64_t v4 = [v3 path];

  int v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)fileURLforRegionConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(ENConfigurationStore *)self systemConfigurationCacheURL];
  id v6 = (void *)MEMORY[0x1E4F29020];
  id v7 = [v4 lowercaseString];

  BOOL v8 = [v6 stringWithFormat:@"%@.data", v7];
  int v9 = [v5 URLByAppendingPathComponent:v8];

  return v9;
}

- (id)fileURLforRegionServerConfiguration:(id)a3
{
  id v4 = a3;
  if ([(ENConfigurationStore *)self developerServerConfiguration]) {
    goto LABEL_4;
  }
  uint64_t v5 = [(ENConfigurationStore *)self regionIdentifierOverride];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [(ENConfigurationStore *)self regionIdentifierOverride];
  uint64_t v8 = [v7 length];

  if (v8)
  {
LABEL_4:
    uint64_t v9 = [(ENConfigurationStore *)self developerConfigurationsURL];
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(ENConfigurationStore *)self serverConfigurationCacheURL];
  }
  id v10 = (void *)v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F29020];
  uint64_t v12 = [v4 lowercaseString];
  int v13 = [v11 stringWithFormat:@"%@.json", v12];
  id v14 = [v10 URLByAppendingPathComponent:v13];

  return v14;
}

- (id)serverSubdivisionListCacheURL
{
  uint64_t v2 = [(ENConfigurationStore *)self subdivisionListCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Server"];
  id v4 = [v3 path];

  uint64_t v5 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)fileURLforCountrySubdivisionList:(id)a3
{
  id v4 = a3;
  if ([(ENConfigurationStore *)self developerServerConfiguration]) {
    goto LABEL_4;
  }
  uint64_t v5 = [(ENConfigurationStore *)self regionIdentifierOverride];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [(ENConfigurationStore *)self regionIdentifierOverride];
  uint64_t v8 = [v7 length];

  if (v8)
  {
LABEL_4:
    uint64_t v9 = [(ENConfigurationStore *)self developerSubdivisionListCacheURL];
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(ENConfigurationStore *)self serverSubdivisionListCacheURL];
  }
  id v10 = (void *)v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F29020];
  uint64_t v12 = [v4 lowercaseString];
  int v13 = [v11 stringWithFormat:@"%@.plist", v12];
  id v14 = [v10 URLByAppendingPathComponent:v13];

  return v14;
}

- (id)fileURLForCountryRegionHash:(id)a3
{
  id v4 = a3;
  if ([(ENConfigurationStore *)self developerServerConfiguration]) {
    goto LABEL_4;
  }
  uint64_t v5 = [(ENConfigurationStore *)self regionIdentifierOverride];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [(ENConfigurationStore *)self regionIdentifierOverride];
  uint64_t v8 = [v7 length];

  if (v8)
  {
LABEL_4:
    uint64_t v9 = [(ENConfigurationStore *)self developerSubdivisionListCacheURL];
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(ENConfigurationStore *)self serverSubdivisionListCacheURL];
  }
  id v10 = (void *)v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F29020];
  uint64_t v12 = [v4 lowercaseString];

  int v13 = [v11 stringWithFormat:@"%@_region_hash.plist", v12];
  id v14 = [v10 URLByAppendingPathComponent:v13];

  return v14;
}

+ (id)legacyAppCacheURL
{
  if (legacyAppCacheURL_onceToken != -1) {
    dispatch_once(&legacyAppCacheURL_onceToken, &__block_literal_global_154);
  }
  uint64_t v2 = (void *)legacyAppCacheURL_cacheURL;

  return v2;
}

void __41__ENConfigurationStore_legacyAppCacheURL__block_invoke()
{
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3
      && gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      id v7 = v1;
      LogPrintF_safe();
    }
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB08], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0, v7);
    uint64_t v5 = [v4 URLByAppendingPathComponent:@"Library/Caches/Cloud/"];
    id v6 = (void *)legacyAppCacheURL_cacheURL;
    legacyAppCacheURL_cacheURL = v5;

    free(v1);
  }
  else if (gLogCategory__ENConfigurationStore <= 90 {
         && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (id)cachedAppConfiguationForBundleID:(id)a3 forRegionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__7;
  uint64_t v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  uint64_t v8 = [(ENConfigurationStore *)self storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ENConfigurationStore_cachedAppConfiguationForBundleID_forRegionID___block_invoke;
  block[3] = &unk_1E69AE340;
  id v14 = v7;
  id v15 = v6;
  id v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__ENConfigurationStore_cachedAppConfiguationForBundleID_forRegionID___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = +[ENConfigurationStore legacyAppCacheURL];
    int v3 = [v2 URLByAppendingPathComponent:a1[4]];
    id v4 = [MEMORY[0x1E4F29020] stringWithFormat:@"%@.plist", a1[5]];
    uint64_t v5 = [v3 URLByAppendingPathComponent:v4];

    id v6 = [MEMORY[0x1E4F1C9B0] dataWithContentsOfURL:v5];
    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F1CAD8];
      uint64_t v8 = objc_opt_class();
      id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      id v18 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClasses:v9 fromData:v6 error:&v18];
      id v11 = v18;
      uint64_t v12 = *(void *)(a1[6] + 8);
      int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v10;

      if (v11
        || ([*(id *)(*(void *)(a1[6] + 8) + 40) appID],
            id v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v14 isEqualToString:a1[5]],
            v14,
            (v15 & 1) == 0))
      {
        if (gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        uint64_t v16 = *(void *)(a1[6] + 8);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = 0;
      }
      else if (gLogCategory_ENConfigurationStore <= 90 {
             && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90 {
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (id)legacyAppConfiguationForMobileCountryCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (gLogCategory__ENConfigurationStore <= 90
      && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v6 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__7;
    char v15 = __Block_byref_object_dispose__7;
    id v16 = 0;
    uint64_t v5 = [(ENConfigurationStore *)self storeQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke;
    v8[3] = &unk_1E69AE230;
    id v9 = 0;
    uint64_t v10 = &v11;
    dispatch_sync(v5, v8);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke(uint64_t a1)
{
  v52[2] = *MEMORY[0x1E4F143B8];
  if (gLogCategory_ENConfigurationStore <= 30
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    uint64_t v35 = *(void *)(a1 + 32);
    LogPrintF_safe();
  }
  uint64_t v2 = +[ENConfigurationStore legacyAppCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:*(void *)(a1 + 32)];

  id v4 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C620];
  v52[0] = *MEMORY[0x1E4F1C6F0];
  uint64_t v5 = v52[0];
  v52[1] = v6;
  id v7 = [MEMORY[0x1E4F1C970] arrayWithObjects:v52 count:2];
  uint64_t v38 = (void *)v3;
  uint64_t v8 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:4 errorHandler:&__block_literal_global_168];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v9 = v8;
  uint64_t v10 = v5;
  id v11 = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    id v39 = v11;
    uint64_t v41 = v6;
    uint64_t v43 = *(void *)v48;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v42 = v13;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
        id v46 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v46, v10, 0, v36, v37);
        id v17 = v46;
        id v45 = 0;
        [v16 getResourceValue:&v45 forKey:v6 error:0];
        id v18 = v45;
        if (([v18 BOOLValue] & 1) == 0)
        {
          uint64_t v19 = [MEMORY[0x1E4F1C9B0] dataWithContentsOfURL:v16];
          if (v19)
          {
            id v20 = (void *)MEMORY[0x1E4F1CAD8];
            uint64_t v21 = objc_opt_class();
            uint64_t v36 = objc_opt_class();
            id v37 = 0;
            id v22 = [v20 setWithObjects:v21];
            id v44 = 0;
            uint64_t v23 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClasses:v22 fromData:v19 error:&v44];
            id v24 = v44;
            uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
            id v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v23;

            if (v24)
            {
              if (gLogCategory__ENConfigurationStore <= 90
                && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
              {
                uint64_t v36 = *(void *)(a1 + 32);
                id v37 = v24;
                LogPrintF_safe();
              }
              uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v33 = *(void **)(v32 + 40);
              *(void *)(v32 + 40) = 0;
            }
            else
            {
              id v40 = v22;
              long long v27 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) regionID];
              uint64_t v28 = a1;
              int v29 = [v27 isEqualToString:*(void *)(a1 + 32)];

              long long v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v31 = [v30 isSensitiveLoggingAllowed];

              a1 = v28;
              if (v29)
              {
                if (v31
                  && gLogCategory_ENConfigurationStore <= 30
                  && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }

                id v11 = v39;
                goto LABEL_37;
              }
              id v11 = v39;
              id v22 = v40;
              if (v31
                && gLogCategory_ENConfigurationStore <= 30
                && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
              {
                uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                LogPrintF_safe();
              }
            }

            uint64_t v6 = v41;
            uint64_t v13 = v42;
          }

          uint64_t v14 = v43;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v34 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
      uint64_t v13 = v34;
      if (v34) {
        continue;
      }
      break;
    }
  }
LABEL_37:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

BOOL __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setStoreQueue:(id)a3
{
}

- (void)setDeveloperServerConfiguration:(BOOL)a3
{
  self->_developerServerConfiguration = a3;
}

- (void)setRegionIdentifierOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);

  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end