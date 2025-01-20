@interface RPStoreManager
+ (id)sharedManager;
- (void)loadItemDetailsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation RPStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sStoreManager;

  return v2;
}

uint64_t __31__RPStoreManager_sharedManager__block_invoke()
{
  sStoreManager = objc_alloc_init(RPStoreManager);

  return MEMORY[0x270F9A758]();
}

- (void)loadItemDetailsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v41 = 0;
  v7 = objc_alloc_init(RPStoreInfo);
  v8 = (void *)MEMORY[0x263F27B28];
  v9 = [MEMORY[0x263F27CC0] bagSubProfile];
  v10 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  v11 = [v8 bagForProfile:v9 profileVersion:v10];

  v12 = (void *)MEMORY[0x263F27B40];
  v13 = [MEMORY[0x263F27CC0] bagKeySet];
  v14 = [MEMORY[0x263F27CC0] bagSubProfile];
  v15 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  [v12 registerBagKeySet:v13 forProfile:v14 profileVersion:v15];

  id v16 = objc_alloc(MEMORY[0x263F27CC0]);
  v17 = (void *)[v16 initWithBag:v11 caller:@"com.apple.replayd" keyProfile:*MEMORY[0x263F27938]];
  v42[0] = v5;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
  v19 = [v17 performLookupWithBundleIdentifiers:v18 itemIdentifiers:0];

  v20 = [v19 resultWithError:&v41];
  v21 = v20;
  if (v41)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPStoreManager loadItemDetailsForBundleIdentifier:completionHandler:](&v41);
    }
  }
  else
  {
    id v37 = v5;
    v22 = [v20 allItems];
    v23 = [v22 firstObject];

    v24 = [v23 bundleIdentifier];
    if (v24)
    {
      v25 = [v23 bundleIdentifier];
      [(RPStoreInfo *)v7 setBundleID:v25];
    }
    else
    {
      [(RPStoreInfo *)v7 setBundleID:&stru_26D117F38];
    }

    v26 = [v23 displayName];
    if (v26) {
      [v23 displayName];
    }
    else {
    v27 = [MEMORY[0x263F086E0] _rpLocalizedAppNameFromBundleID:v37];
    }
    [(RPStoreInfo *)v7 setAppName:v27];

    v28 = [v23 artistName];
    if (v28)
    {
      v29 = [v23 artistName];
      [(RPStoreInfo *)v7 setAuthor:v29];
    }
    else
    {
      [(RPStoreInfo *)v7 setAuthor:&stru_26D117F38];
    }

    v30 = [v23 productPageURL];
    [(RPStoreInfo *)v7 setItemURL:v30];

    v31 = [v23 artwork];
    v32 = [v31 firstObject];
    v33 = [v32 URLWithHeight:128 width:128 cropStyle:*MEMORY[0x263F27910] format:*MEMORY[0x263F27920]];
    [(RPStoreInfo *)v7 setAppArtworkURL:v33];

    v34 = [(RPStoreInfo *)v7 appArtworkURL];

    if (!v34 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPStoreManager loadItemDetailsForBundleIdentifier:completionHandler:]();
    }

    id v5 = v37;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__RPStoreManager_loadItemDetailsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26451D920;
  v39 = v7;
  id v40 = v6;
  v35 = v7;
  id v36 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__RPStoreManager_loadItemDetailsForBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadItemDetailsForBundleIdentifier:completionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "RPStoreManager::AMSLookupItemArtwork::URLWithHeight could not find artwork with specified parameters", v0, 2u);
}

- (void)loadItemDetailsForBundleIdentifier:(uint64_t *)a1 completionHandler:.cold.2(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "RPStoreManager::performLookupWithBundleIdentifiers could not complete lookup with error:%@", (uint8_t *)&v2, 0xCu);
}

@end