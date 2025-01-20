@interface ACHRemoteTemplateSource
- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)backCompatAvailabilityKeyWriter;
- (ACHMobileAssetProvider)mobileAssetProvider;
- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider;
- (ACHRemoteTemplateSource)initWithMobileAssetProvider:(id)a3 backCompatWriter:(id)a4 remoteTemplateAvailabilityKeyProvider:(id)a5;
- (ACHTemplateAssetSourceDelegate)assetSourceDelegate;
- (ACHTemplateSourceDelegate)delegate;
- (BOOL)sourceShouldRunForDate:(id)a3;
- (NSDictionary)assetVersionsByUniqueName;
- (NSDictionary)resourceAssetURLsByUniqueName;
- (NSDictionary)stickerAssetURLsByUniqueName;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)_resourceAssetURLForTemplate:(id)a3;
- (id)buildVersion;
- (id)stickerBundleURLForTemplate:(id)a3;
- (int)availabilityChangeToken;
- (int64_t)mobileAssetVersionForTemplate:(id)a3;
- (int64_t)runCadence;
- (void)_addAssetVersionsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4;
- (void)_addURLsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4;
- (void)_removeURLsByUniqueNameFromDictionary:(id)a3 fromAsset:(id)a4;
- (void)dealloc;
- (void)setAssetSourceDelegate:(id)a3;
- (void)setAssetVersionsByUniqueName:(id)a3;
- (void)setAvailabilityChangeToken:(int)a3;
- (void)setBackCompatAvailabilityKeyWriter:(id)a3;
- (void)setBuildVersionOverride:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMobileAssetProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3;
- (void)setResourceAssetURLsByUniqueName:(id)a3;
- (void)setStickerAssetURLsByUniqueName:(id)a3;
- (void)templatesForDate:(id)a3 completion:(id)a4;
@end

@implementation ACHRemoteTemplateSource

- (ACHRemoteTemplateSource)initWithMobileAssetProvider:(id)a3 backCompatWriter:(id)a4 remoteTemplateAvailabilityKeyProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ACHRemoteTemplateSource;
  v12 = [(ACHRemoteTemplateSource *)&v29 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mobileAssetProvider, a3);
    objc_storeStrong((id *)&v13->_backCompatAvailabilityKeyWriter, a4);
    objc_storeStrong((id *)&v13->_remoteTemplateAvailabilityKeyProvider, a5);
    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [NSDictionary dictionary];
    resourceAssetURLsByUniqueName = v13->_resourceAssetURLsByUniqueName;
    v13->_resourceAssetURLsByUniqueName = (NSDictionary *)v16;

    uint64_t v18 = [NSDictionary dictionary];
    stickerAssetURLsByUniqueName = v13->_stickerAssetURLsByUniqueName;
    v13->_stickerAssetURLsByUniqueName = (NSDictionary *)v18;

    uint64_t v20 = [NSDictionary dictionary];
    assetVersionsByUniqueName = v13->_assetVersionsByUniqueName;
    v13->_assetVersionsByUniqueName = (NSDictionary *)v20;

    objc_initWeak(&location, v13);
    v22 = (const char *)[(id)*MEMORY[0x263F235B0] UTF8String];
    v23 = MEMORY[0x263EF83A0];
    id v24 = MEMORY[0x263EF83A0];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __110__ACHRemoteTemplateSource_initWithMobileAssetProvider_backCompatWriter_remoteTemplateAvailabilityKeyProvider___block_invoke;
    v26[3] = &unk_264515D40;
    objc_copyWeak(&v27, &location);
    notify_register_dispatch(v22, &v13->_availabilityChangeToken, v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __110__ACHRemoteTemplateSource_initWithMobileAssetProvider_backCompatWriter_remoteTemplateAvailabilityKeyProvider___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  [v3 templateSourceDidUpdateAssets:v4];

  id v7 = objc_loadWeakRetained(v1);
  v5 = [v7 assetSourceDelegate];
  id v6 = objc_loadWeakRetained(v1);
  [v5 templateAssetSourceDidUpdateAssets:v6];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_availabilityChangeToken)) {
    notify_cancel(self->_availabilityChangeToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHRemoteTemplateSource;
  [(ACHRemoteTemplateSource *)&v3 dealloc];
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23628];
}

- (int64_t)runCadence
{
  return 2;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x263F0A980] sharedBehavior];
    int v9 = [v8 isStandalonePhoneFitnessMode];

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFFA08]);
      (*((void (**)(id, id, void, void))v7 + 2))(v7, v10, 0, 0);
    }
    else
    {
      id v11 = [(ACHRemoteTemplateSource *)self mobileAssetProvider];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke;
      v12[3] = &unk_264516E68;
      v12[4] = self;
      id v13 = v7;
      [v11 availableAssetsWithCompletion:v12];
    }
  }
}

void __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke_2;
  block[3] = &unk_264516AB0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v57;
    uint64_t v5 = *MEMORY[0x263F236F8];
    uint64_t v6 = *MEMORY[0x263F23700];
    uint64_t v42 = *MEMORY[0x263F23710];
    uint64_t v41 = *MEMORY[0x263F23718];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v57 != v4) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x223C50570]();
        uint64_t v10 = [v8 attributes];
        id v11 = [v10 objectForKeyedSubscript:v5];

        if ([v11 isEqualToString:v6])
        {
          [v45 addObject:v8];
          [*(id *)(a1 + 40) _addAssetVersionsByUniqueNameToDictionary:v43 fromAsset:v8];
          goto LABEL_13;
        }
        if ([v11 isEqualToString:v42])
        {
          v12 = *(void **)(a1 + 40);
          id v13 = v49;
        }
        else
        {
          if (![v11 isEqualToString:v41]) {
            goto LABEL_13;
          }
          v12 = *(void **)(a1 + 40);
          id v13 = v44;
        }
        [v12 _addURLsByUniqueNameToDictionary:v13 fromAsset:v8];
LABEL_13:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    }
    while (v3);
  }

  uint64_t v14 = ACHLogAssets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = [v45 count];
    uint64_t v39 = [v49 count];
    uint64_t v40 = [v44 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v62 = v38;
    __int16 v63 = 2048;
    uint64_t v64 = v39;
    __int16 v65 = 2048;
    uint64_t v66 = v40;
    _os_log_debug_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEBUG, "Available assets: %lu template assets, %lu resource assets, %lu sticker assets", buf, 0x20u);
  }

  [*(id *)(a1 + 40) setResourceAssetURLsByUniqueName:v49];
  [*(id *)(a1 + 40) setStickerAssetURLsByUniqueName:v44];
  [*(id *)(a1 + 40) setAssetVersionsByUniqueName:v43];
  id obja = [MEMORY[0x263EFF9C0] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v46 = v45;
  uint64_t v15 = [v46 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v53;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v53 != v17) {
          objc_enumerationMutation(v46);
        }
        uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * v18);
        uint64_t v20 = (void *)MEMORY[0x223C50570]();
        v21 = [*(id *)(a1 + 40) buildVersion];
        v22 = RemoteAchievementTemplateFromTemplateAssetAndBuildVersion();

        v23 = *(void **)(a1 + 40);
        if (v22)
        {
          id v24 = [v23 backCompatAvailabilityKeyWriter];
          id v51 = 0;
          char v25 = [v24 markTemplateAvailable:v22 error:&v51];
          id v26 = v51;

          if ((v25 & 1) == 0)
          {
            id v27 = ACHLogTemplates();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v32 = [v22 uniqueName];
              *(_DWORD *)buf = 138543618;
              uint64_t v62 = (uint64_t)v32;
              __int16 v63 = 2114;
              uint64_t v64 = (uint64_t)v26;
              _os_log_error_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_ERROR, "Error writing backcompat availability key for template %{public}@: %{public}@", buf, 0x16u);
            }
          }
          v28 = [*(id *)(a1 + 40) remoteTemplateAvailabilityKeyProvider];
          id v50 = 0;
          char v29 = [v28 markTemplateAvailable:v22 error:&v50];
          id v30 = v50;

          if ((v29 & 1) == 0)
          {
            v31 = ACHLogTemplates();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v33 = [v22 uniqueName];
              *(_DWORD *)buf = 138543618;
              uint64_t v62 = (uint64_t)v33;
              __int16 v63 = 2114;
              uint64_t v64 = (uint64_t)v30;
              _os_log_error_impl(&dword_21F5DA000, v31, OS_LOG_TYPE_ERROR, "Error writing remote template availability key for template %{public}@: %{public}@", buf, 0x16u);
            }
          }
          [obja addObject:v22];
        }
        else
        {
          [v23 _removeURLsByUniqueNameFromDictionary:v49 fromAsset:v19];
          [*(id *)(a1 + 40) _removeURLsByUniqueNameFromDictionary:v44 fromAsset:v19];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v46 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v16);
  }

  uint64_t v34 = *(void *)(a1 + 48);
  v35 = (void *)[obja copy];
  (*(void (**)(uint64_t, void *, void, void))(v34 + 16))(v34, v35, 0, 0);

  v36 = [*(id *)(a1 + 40) delegate];
  [v36 templateSourceDidUpdateAssets:*(void *)(a1 + 40)];

  v37 = [*(id *)(a1 + 40) assetSourceDelegate];
  [v37 templateAssetSourceDidUpdateAssets:*(void *)(a1 + 40)];
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(ACHRemoteTemplateSource *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ACHRemoteTemplateSource_stickerBundleURLForTemplate___block_invoke;
  block[3] = &unk_2645165A8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__ACHRemoteTemplateSource_stickerBundleURLForTemplate___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) stickerAssetURLsByUniqueName];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueName];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (int64_t)mobileAssetVersionForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(ACHRemoteTemplateSource *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ACHRemoteTemplateSource_mobileAssetVersionForTemplate___block_invoke;
  block[3] = &unk_2645165A8;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  int64_t v7 = [(id)v13[5] integerValue];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ACHRemoteTemplateSource_mobileAssetVersionForTemplate___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) assetVersionsByUniqueName];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueName];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)buildVersion
{
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_12);
  }
  if (self->_buildVersionOverride) {
    buildVersionOverride = self->_buildVersionOverride;
  }
  else {
    buildVersionOverride = (NSString *)buildVersion_buildNumber;
  }
  return buildVersionOverride;
}

void __39__ACHRemoteTemplateSource_buildVersion__block_invoke()
{
  id v2 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v0 = [v2 currentOSBuild];
  v1 = (void *)buildVersion_buildNumber;
  buildVersion_buildNumber = v0;
}

- (id)_resourceAssetURLForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(ACHRemoteTemplateSource *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ACHRemoteTemplateSource__resourceAssetURLForTemplate___block_invoke;
  block[3] = &unk_2645165A8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__ACHRemoteTemplateSource__resourceAssetURLForTemplate___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) resourceAssetURLsByUniqueName];
  id v2 = [*(id *)(a1 + 40) uniqueName];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_addURLsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 attributes];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F23708]];

  v8 = [v5 getLocalFileUrl];

  [v6 setObject:v8 forKeyedSubscript:v9];
}

- (void)_removeURLsByUniqueNameFromDictionary:(id)a3 fromAsset:(id)a4
{
  id v5 = a3;
  id v6 = [a4 attributes];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F23708]];

  [v5 setObject:0 forKeyedSubscript:v7];
}

- (void)_addAssetVersionsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 attributes];
  id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x263F23708]];

  v8 = NSNumber;
  id v9 = [v5 attributes];

  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F55868]];
  id v11 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "integerValue"));

  [v6 setObject:v11 forKeyedSubscript:v12];
}

- (void)setBuildVersionOverride:(id)a3
{
}

- (ACHTemplateAssetSourceDelegate)assetSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assetSourceDelegate);
  return (ACHTemplateAssetSourceDelegate *)WeakRetained;
}

- (void)setAssetSourceDelegate:(id)a3
{
}

- (ACHTemplateSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (ACHTemplateSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
}

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)backCompatAvailabilityKeyWriter
{
  return self->_backCompatAvailabilityKeyWriter;
}

- (void)setBackCompatAvailabilityKeyWriter:(id)a3
{
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
}

- (NSDictionary)resourceAssetURLsByUniqueName
{
  return self->_resourceAssetURLsByUniqueName;
}

- (void)setResourceAssetURLsByUniqueName:(id)a3
{
}

- (NSDictionary)stickerAssetURLsByUniqueName
{
  return self->_stickerAssetURLsByUniqueName;
}

- (void)setStickerAssetURLsByUniqueName:(id)a3
{
}

- (NSDictionary)assetVersionsByUniqueName
{
  return self->_assetVersionsByUniqueName;
}

- (void)setAssetVersionsByUniqueName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)availabilityChangeToken
{
  return self->_availabilityChangeToken;
}

- (void)setAvailabilityChangeToken:(int)a3
{
  self->_availabilityChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetVersionsByUniqueName, 0);
  objc_storeStrong((id *)&self->_stickerAssetURLsByUniqueName, 0);
  objc_storeStrong((id *)&self->_resourceAssetURLsByUniqueName, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_storeStrong((id *)&self->_backCompatAvailabilityKeyWriter, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->assetSourceDelegate);
  objc_storeStrong((id *)&self->_buildVersionOverride, 0);
}

@end