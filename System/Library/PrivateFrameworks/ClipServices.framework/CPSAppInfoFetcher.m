@interface CPSAppInfoFetcher
+ (id)_cachedIconFileURLForItemID:(id)a3;
+ (id)_sharedAMSBag;
- (CPSAppInfoFetcher)init;
- (void)_downloadIconIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)_lookUpClipDemoAMSMetadataWithBundleID:(id)a3 completion:(id)a4;
- (void)evictCachedMetadataForClipBundleID:(id)a3;
- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 URL:(id)a5 downloadIconIfNeeded:(BOOL)a6 skipCaching:(BOOL)a7 completionHandler:(id)a8;
- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 downloadIconIfNeeded:(BOOL)a5 skipCaching:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation CPSAppInfoFetcher

- (CPSAppInfoFetcher)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppInfoFetcher;
  v2 = [(CPSAppInfoFetcher *)&v7 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    appMetadataByBundleID = v2->_appMetadataByBundleID;
    v2->_appMetadataByBundleID = v3;

    [(NSCache *)v2->_appMetadataByBundleID setCountLimit:10];
    v5 = v2;
  }

  return v2;
}

- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 downloadIconIfNeeded:(BOOL)a5 skipCaching:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 URL:(id)a5 downloadIconIfNeeded:(BOOL)a6 skipCaching:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = (void (**)(id, void *, void))a8;
  if (v14)
  {
    if (objc_msgSend(v14, "cps_looksLikeUUIDOrWebClipIdentifier"))
    {
      v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CPSAppInfoFetcher lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:]((uint64_t)v15, (uint64_t)v14, v18);
      }
    }
    v19 = [(NSCache *)self->_appMetadataByBundleID objectForKey:v14];
    if (objc_msgSend(v14, "cps_isAMSPlaceholderBundleIdentifier"))
    {
      v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        id v38 = v14;
        __int16 v39 = 2113;
        id v40 = v16;
        _os_log_impl(&dword_21559C000, v20, OS_LOG_TYPE_INFO, "Look up metadata for AMS placeholder bundleID: %{private}@, URL: %{private}@", buf, 0x16u);
      }

      v19 = 0;
    }
    else if (v19)
    {
      v22 = [v19 amsDictionary];
      if (v22)
      {
        int v23 = [v19 isExpired];

        if (((v23 | v9) & 1) == 0)
        {
          v30 = [v19 amsDictionary];
          v31 = +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:v30];
          [v19 setInvocationPolicy:v31];

          if (v10) {
            [(CPSAppInfoFetcher *)self _downloadIconIfNeeded:v19 completionHandler:v17];
          }
          else {
            v17[2](v17, v19, 0);
          }
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    if (+[CPSClipURL usesDemoMetadata])
    {
      [(CPSAppInfoFetcher *)self _lookUpClipDemoAMSMetadataWithBundleID:v14 completion:v17];
    }
    else
    {
      v24 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21559C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "lookUpClipMetadataAction", "start looking up clip metadata", buf, 2u);
      }
      id v25 = objc_alloc(MEMORY[0x263F27BC0]);
      v26 = +[CPSAppInfoFetcher _sharedAMSBag];
      v27 = (void *)[v25 initWithClientID:@"com.apple.ClipServices.clipserviced" bundleID:v14 URL:v16 bag:v26];

      if ([v15 length])
      {
        v28 = (void *)[objc_alloc(MEMORY[0x263F27E08]) initWithBundleIdentifier:v15];
        [v27 setClientInfo:v28];
      }
      v29 = [v27 perform];
      objc_initWeak((id *)buf, self);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke;
      v32[3] = &unk_26424FB10;
      v34 = v17;
      objc_copyWeak(&v35, (id *)buf);
      id v33 = v14;
      BOOL v36 = v10;
      [v29 addFinishBlock:v32];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_20;
  }
  v21 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
  ((void (**)(id, void *, void *))v17)[2](v17, 0, v21);

LABEL_21:
}

void __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "lookUpClipMetadataAction", "end looking up clip metadata", (uint8_t *)&v37, 2u);
  }
  v8 = objc_alloc_init(CPSClipMetadata);
  if (v6)
  {
    BOOL v9 = [v6 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F27850]])
    {
      uint64_t v10 = [v6 code];

      if (v10 == 405)
      {
        v11 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:8];
        [(CPSClipMetadata *)v8 setInvocationPolicy:v11];

        v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_20:
        v12();
        goto LABEL_24;
      }
    }
    else
    {
    }
    v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_20;
  }
  v13 = [v5 responseDataItems];
  id v14 = [v13 firstObject];

  if (v14)
  {
    [(CPSClipMetadata *)v8 updateWithStoreClipMetadata:v14];
    id v15 = [v5 responseHeaders];
    [v15 maxAge];
    double v17 = v16;

    if (v17 < 10.0)
    {
      v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    v26 = [MEMORY[0x263EFF910] now];
    v27 = [v26 dateByAddingTimeInterval:v17];
    [(CPSClipMetadata *)v8 setExpirationDate:v27];

    v28 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = v28;
      v30 = [(CPSClipMetadata *)v8 expirationDate];
      int v37 = 134218242;
      id v38 = v8;
      __int16 v39 = 2114;
      id v40 = v30;
      _os_log_impl(&dword_21559C000, v29, OS_LOG_TYPE_INFO, "Set expiration date for metadata: (%p) to: %{public}@", (uint8_t *)&v37, 0x16u);
    }
    v31 = +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:v14];
    [(CPSClipMetadata *)v8 setInvocationPolicy:v31];

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained && (objc_msgSend(*(id *)(a1 + 32), "cps_isAMSPlaceholderBundleIdentifier") & 1) == 0)
    {
      id v33 = (void *)WeakRetained[1];
      v34 = [(CPSClipMetadata *)v8 clipBundleID];
      [v33 setObject:v8 forKey:v34];
    }
    uint64_t v35 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [WeakRetained _downloadIconIfNeeded:v8 completionHandler:v35];
    }
    else {
      (*(void (**)(void, CPSClipMetadata *, void))(v35 + 16))(*(void *)(a1 + 40), v8, 0);
    }
  }
  else
  {
    uint64_t v36 = *(void *)(a1 + 40);
    WeakRetained = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v36 + 16))(v36, 0, WeakRetained);
  }

LABEL_24:
}

- (void)evictCachedMetadataForClipBundleID:(id)a3
{
  if (a3) {
    -[NSCache removeObjectForKey:](self->_appMetadataByBundleID, "removeObjectForKey:");
  }
}

+ (id)_sharedAMSBag
{
  if (_sharedAMSBag_onceToken != -1) {
    dispatch_once(&_sharedAMSBag_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_sharedAMSBag_bag;

  return v2;
}

uint64_t __34__CPSAppInfoFetcher__sharedAMSBag__block_invoke()
{
  v0 = (void *)MEMORY[0x263F27B40];
  v1 = [MEMORY[0x263F27BC0] bagKeySet];
  [v0 registerBagKeySet:v1 forProfile:@"clipserviced" profileVersion:@"1"];

  _sharedAMSBag_bag = [MEMORY[0x263F27B28] bagForProfile:@"clipserviced" profileVersion:@"1"];

  return MEMORY[0x270F9A758]();
}

+ (id)_cachedIconFileURLForItemID:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v29 = 0;
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v29];
  id v6 = v29;

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[CPSAppInfoFetcher _cachedIconFileURLForItemID:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = 0;
  }
  else
  {
    id v15 = [v5 URLByAppendingPathComponent:@"com.apple.ClipServices/Icons" isDirectory:1];
    double v16 = [MEMORY[0x263F08850] defaultManager];
    id v28 = 0;
    [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v6 = v28;

    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[CPSAppInfoFetcher _cachedIconFileURLForItemID:]((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
      }
      id v14 = 0;
    }
    else
    {
      uint64_t v24 = NSString;
      uint64_t v25 = [v3 stringValue];
      v26 = [v24 stringWithFormat:@"%@.png", v25];

      id v14 = [v15 URLByAppendingPathComponent:v26 isDirectory:0];
    }
  }

  return v14;
}

- (void)_downloadIconIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  uint64_t v7 = [v5 fullAppIconURL];
  if (v7)
  {
    uint64_t v8 = [v5 fullAppCachedIconFilePath];
    if (![v8 length]
      || ([NSURL fileURLWithPath:v8],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v10 = [v5 itemID];
      uint64_t v9 = [(id)objc_opt_class() _cachedIconFileURLForItemID:v10];
    }
    uint64_t v11 = [v9 path];

    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    int v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      [v5 setFullAppCachedIconFilePath:v11];
      v6[2](v6, v5, 0);
    }
    else
    {
      id v15 = [MEMORY[0x263F08BF8] sharedSession];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke;
      v17[3] = &unk_26424FB38;
      uint64_t v20 = v6;
      id v18 = v5;
      id v19 = v11;
      double v16 = [v15 dataTaskWithURL:v7 completionHandler:v17];

      [v16 resume];
    }
  }
  else
  {
    id v14 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CPSAppInfoFetcher _downloadIconIfNeeded:completionHandler:](v14);
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 7);
    ((void (**)(id, id, void *))v6)[2](v6, v5, v11);
  }
}

void __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if (v7)
    {
      if ([v7 writeToFile:*(void *)(a1 + 40) atomically:1])
      {
        [*(id *)(a1 + 32) setFullAppCachedIconFilePath:*(void *)(a1 + 40)];
        uint64_t v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 40);
          int v23 = 138739971;
          uint64_t v24 = v12;
          _os_log_impl(&dword_21559C000, v11, OS_LOG_TYPE_INFO, "Successful in writing icon data to disk at path: %{sensitive}@", (uint8_t *)&v23, 0xCu);
        }
        uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_3;
      }
      int v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke_cold_1(a1 + 40, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 7);
    (*(void (**)(uint64_t, uint64_t, void *))(v20 + 16))(v20, v21, v22);

    goto LABEL_12;
  }
  uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_3:
  v10();
LABEL_12:
}

- (void)_lookUpClipDemoAMSMetadataWithBundleID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[CPSClipURL usesDemoMetadata])
  {
    id v7 = NSURL;
    id v8 = [NSString stringWithFormat:@"https://test-safari.apple.com/amp/%@/", v5];
    id v9 = [v7 URLWithString:v8];

    uint64_t v10 = [v9 URLByAppendingPathComponent:@"/Info.json"];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v10 cachePolicy:1 timeoutInterval:5.0];
    uint64_t v12 = [MEMORY[0x263F08BF8] sharedSession];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke;
    v16[3] = &unk_26424FB60;
    id v17 = v10;
    id v18 = v6;
    id v13 = v10;
    uint64_t v14 = [v12 dataTaskWithRequest:v11 completionHandler:v16];

    [v14 resume];
  }
  else
  {
    uint64_t v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CPSAppInfoFetcher _lookUpClipDemoAMSMetadataWithBundleID:completion:](v15);
    }
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 10);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || ![v7 length])
  {
    uint64_t v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v16 = 0;
    uint64_t v11 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v16];
    id v12 = v16;
    if (v12)
    {
      id v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_2();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v14 = objc_alloc_init(CPSClipMetadata);
      [(CPSClipMetadata *)v14 updateWithStoreClipMetadata:v11];
      uint64_t v15 = +[CPSClipInvocationPolicy eligiblePolicy];
      [(CPSClipMetadata *)v14 setInvocationPolicy:v15];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void).cxx_destruct
{
}

- (void)lookUpClipMetadataByBundleID:(NSObject *)a3 sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543619;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2117;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21559C000, a2, a3, "%{public}@ is attempting to look up app clip metadata with web clip identifier %{sensitive}@. This is not supported.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cachedIconFileURLForItemID:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_downloadIconIfNeeded:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Unexpected invalid icon URL from App Store", v1, 2u);
}

void __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_lookUpClipDemoAMSMetadataWithBundleID:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Error: looking up metadata from demo server but usesDemoMetadata flag is not true.", v1, 2u);
}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "An error occurred when looking up demo metadata from %@, Error: %@");
}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_6();
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_21559C000, v0, OS_LOG_TYPE_ERROR, "An error occurred when decoding demo metadata from %@, Error: %@", v1, 0x16u);
}

@end