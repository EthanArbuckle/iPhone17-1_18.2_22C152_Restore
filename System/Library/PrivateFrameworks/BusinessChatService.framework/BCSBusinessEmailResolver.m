@interface BCSBusinessEmailResolver
- (BCSItemCacheSkipping)itemCacheSkipper;
- (BCSItemCaching)itemCache;
- (BCSMetricFactoryProtocol)metricFactory;
- (BCSRemoteFetchPIR)pirFetchLogo;
- (BCSRemoteFetchPIR)pirFetchMetadata;
- (id)cachedItemMatching:(id)a3;
- (id)initWithMetadataEnvironment:(void *)a3 logoEnvironment:(void *)a4 itemCache:(void *)a5 cacheSkipper:(void *)a6 metricFactory:;
- (void)_logoMatching:(id)a3 metric:(id)a4 completion:(id)a5;
- (void)_metadataMatching:(id)a3 metric:(id)a4 completion:(id)a5;
- (void)_metadataMatching:(id)a3 metric:(id)a4 perItemBlock:(id)a5 completion:(id)a6;
- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5;
- (void)itemsMatching:(id)a3 metric:(id)a4 perItemBlock:(id)a5 completion:(id)a6;
- (void)setMetricFactory:(id)a3;
- (void)setPirFetchLogo:(id)a3;
- (void)setPirFetchMetadata:(id)a3;
@end

@implementation BCSBusinessEmailResolver

- (id)initWithMetadataEnvironment:(void *)a3 logoEnvironment:(void *)a4 itemCache:(void *)a5 cacheSkipper:(void *)a6 metricFactory:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)BCSBusinessEmailResolver;
    v16 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a4);
      objc_storeStrong(a1 + 2, a5);
      objc_storeStrong(a1 + 3, a6);
      v17 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v11, v15);
      id v18 = a1[4];
      a1[4] = v17;

      v19 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v12, v15);
      id v20 = a1[5];
      a1[5] = v19;
    }
  }

  return a1;
}

- (id)cachedItemMatching:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 4)
  {
    v5 = [(BCSBusinessEmailResolver *)self itemCacheSkipper];
    char v6 = objc_msgSend(v5, "shouldSkipCacheForItemOfType:", objc_msgSend(v4, "type"));

    if (v6)
    {
      v7 = 0;
    }
    else
    {
      v8 = [(BCSBusinessEmailResolver *)self itemCache];
      v7 = [v8 itemMatching:v4];
    }
    if (![v7 isExpired] || objc_msgSend(v7, "type") == 4) {
      goto LABEL_11;
    }
    v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromBCSType([v4 type]);
      int v13 = 136315394;
      id v14 = "-[BCSBusinessEmailResolver cachedItemMatching:]";
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v13, 0x16u);
    }
    id v11 = [(BCSBusinessEmailResolver *)self itemCache];
    [v11 deleteItemMatching:v4];
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v12 = [v8 itemIdentifier];
  uint64_t v13 = [v12 type];

  if (v13 != 4)
  {
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = @"Invalid type";
    v25 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    __int16 v15 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v25];

    v10[2](v10, 0, v15);
    goto LABEL_9;
  }
  id v14 = [v8 itemIdentifier];
  __int16 v15 = [(BCSBusinessEmailResolver *)self cachedItemMatching:v14];

  v16 = [(BCSBusinessEmailResolver *)self metricFactory];
  uint64_t v17 = [v16 measurementFactory];
  id v18 = [v8 itemIdentifier];
  v19 = [v17 itemCacheHitMeasurementForItemIdentifier:v18];
  [v9 setCacheHitMeasurement:v19];

  id v20 = [v9 cacheHitMeasurement];
  [v20 setFlag:v15 != 0];

  v21 = ABSLogCommon();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v22)
    {
      v26 = [v8 itemIdentifier];
      v27 = NSStringFromBCSType([v26 type]);
      *(_DWORD *)buf = 136315394;
      v40 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);
    }
    if ([v8 cacheOnly])
    {
      v28 = ABSLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v8 itemIdentifier];
        v30 = NSStringFromBCSType([v29 type]);
        *(_DWORD *)buf = 136315394;
        v40 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
        __int16 v41 = 2112;
        v42 = v30;
        _os_log_impl(&dword_2154F4000, v28, OS_LOG_TYPE_DEFAULT, "%s - Query is cache-only, skipping fetch for item of type: %@", buf, 0x16u);
      }
      v31 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:47 errorDescription:@"Item not found in cache"];
      goto LABEL_21;
    }
    v32 = [v8 itemIdentifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(BCSBusinessEmailResolver *)self _metadataMatching:v8 metric:v9 completion:v10];
    }
    else
    {
      v34 = [v8 itemIdentifier];
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) == 0)
      {
        uint64_t v37 = *MEMORY[0x263F08320];
        v38 = @"Invalid identifier type";
        v36 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v31 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v36];

LABEL_21:
        v10[2](v10, 0, v31);

        goto LABEL_22;
      }
      [(BCSBusinessEmailResolver *)self _logoMatching:v8 metric:v9 completion:v10];
    }
LABEL_22:
    __int16 v15 = 0;
    goto LABEL_9;
  }
  if (v22)
  {
    v23 = [v8 itemIdentifier];
    v24 = NSStringFromBCSType([v23 type]);
    *(_DWORD *)buf = 136315394;
    v40 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
    __int16 v41 = 2112;
    v42 = v24;
    _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);
  }
  ((void (**)(id, void *, void *))v10)[2](v10, v15, 0);
LABEL_9:
}

- (void)itemsMatching:(id)a3 metric:(id)a4 perItemBlock:(id)a5 completion:(id)a6
{
  v74[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v57 = a4;
  v56 = (void (**)(id, void *, void *, void))a5;
  id v11 = (void (**)(id, void *))a6;
  id v12 = ABSLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "-[BCSBusinessEmailResolver itemsMatching:metric:perItemBlock:completion:]";
    _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v13 = [v10 itemIdentifier];
  uint64_t v14 = [v13 type];

  if (v14 != 4)
  {
    uint64_t v73 = *MEMORY[0x263F08320];
    v74[0] = @"Invalid type";
    v19 = NSDictionary;
    id v20 = (__CFString **)v74;
    v21 = &v73;
LABEL_24:
    uint64_t v17 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    uint64_t v18 = 42;
    goto LABEL_25;
  }
  __int16 v15 = [v10 itemIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v71 = *MEMORY[0x263F08320];
    v72 = @"Unsupported type (batch requests for logos are unimplemented)";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    uint64_t v18 = 44;
LABEL_25:
    v38 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:v18 userInfo:v17];

    v11[2](v11, v38);
    goto LABEL_26;
  }
  BOOL v22 = [v10 itemIdentifier];
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  if ((v23 & 1) == 0)
  {
    uint64_t v69 = *MEMORY[0x263F08320];
    v70 = @"Invalid identifier type";
    v19 = NSDictionary;
    id v20 = &v70;
    v21 = &v69;
    goto LABEL_24;
  }
  v52 = v11;
  id v24 = objc_alloc(MEMORY[0x263EFF9C0]);
  v25 = [v10 itemIdentifiers];
  v55 = (void *)[v24 initWithArray:v25];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v53 = v10;
  id obj = [v10 itemIdentifiers];
  uint64_t v26 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v59 != v28) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v31 = -[BCSBusinessEmailResolver cachedItemMatching:](self, "cachedItemMatching:", v30, v52);
        v32 = [(BCSBusinessEmailResolver *)self metricFactory];
        v33 = [v32 measurementFactory];
        v34 = [v33 itemCacheHitMeasurementForItemIdentifier:v30];
        [v57 setCacheHitMeasurement:v34];

        char v35 = [v57 cacheHitMeasurement];
        [v35 setFlag:v31 != 0];

        if (v31)
        {
          v36 = ABSLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = NSStringFromBCSType([v30 type]);
            *(_DWORD *)buf = 136315394;
            v63 = "-[BCSBusinessEmailResolver itemsMatching:metric:perItemBlock:completion:]";
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v37;
            _os_log_impl(&dword_2154F4000, v36, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);
          }
          [v55 removeObject:v30];
          v56[2](v56, v30, v31, 0);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v27);
  }

  v38 = v55;
  uint64_t v39 = [v55 count];
  v40 = ABSLogCommon();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    id v11 = v52;
    id v10 = v53;
    if (v41)
    {
      uint64_t v42 = [v55 count];
      uint64_t v43 = [v53 itemIdentifier];
      v44 = NSStringFromBCSType([v43 type]);
      *(_DWORD *)buf = 136315650;
      v63 = "-[BCSBusinessEmailResolver itemsMatching:metric:perItemBlock:completion:]";
      __int16 v64 = 2048;
      uint64_t v65 = v42;
      __int16 v66 = 2112;
      v67 = v44;
      _os_log_impl(&dword_2154F4000, v40, OS_LOG_TYPE_DEFAULT, "%s - %ld items not found in cache for - type: %@", buf, 0x20u);
    }
    v45 = [BCSBatchQuery alloc];
    v46 = [v55 allObjects];
    v47 = [v53 config];
    v48 = [v53 clientBundleId];
    v49 = -[BCSBatchQuery initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:](v45, "initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:", v46, v47, v48, [v53 shardType], objc_msgSend(v53, "skipRegistrationCheck"));

    [(BCSBusinessEmailResolver *)self _metadataMatching:v49 metric:v57 perItemBlock:v56 completion:v52];
  }
  else
  {
    id v11 = v52;
    id v10 = v53;
    if (v41)
    {
      v50 = [v53 itemIdentifier];
      v51 = NSStringFromBCSType([v50 type]);
      *(_DWORD *)buf = 136315394;
      v63 = "-[BCSBusinessEmailResolver itemsMatching:metric:perItemBlock:completion:]";
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v51;
      _os_log_impl(&dword_2154F4000, v40, OS_LOG_TYPE_DEFAULT, "%s - All items found in cache for type: %@", buf, 0x16u);
    }
    v52[2](v52, 0);
  }
LABEL_26:
}

- (void)_metadataMatching:(id)a3 metric:(id)a4 perItemBlock:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(BCSBusinessEmailResolver *)self metricFactory];
  uint64_t v13 = [v12 measurementFactory];
  uint64_t v14 = [v9 itemIdentifier];
  __int16 v15 = [v13 businessEmailFetchTimingMeasurementForItemIdentifier:v14];

  [v15 begin];
  v16 = [(BCSBusinessEmailResolver *)self pirFetchMetadata];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__BCSBusinessEmailResolver__metadataMatching_metric_perItemBlock_completion___block_invoke;
  v24[3] = &unk_2642498C8;
  uint64_t v26 = self;
  id v27 = v10;
  id v25 = v9;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__BCSBusinessEmailResolver__metadataMatching_metric_perItemBlock_completion___block_invoke_25;
  v21[3] = &unk_2642495A8;
  id v22 = v15;
  id v23 = v11;
  id v17 = v11;
  id v18 = v15;
  id v19 = v9;
  id v20 = v10;
  [v16 fetchDataMatchingBatch:v19 timeout:30000000000 perItemBlock:v24 completion:v21];
}

uint64_t __77__BCSBusinessEmailResolver__metadataMatching_metric_perItemBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
    {
      id v11 = [[BCSEmailMetadataParquetMessage alloc] initWithData:v8];
      if (v11)
      {
        id v12 = [[BCSBusinessEmailItem alloc] initWithEmailMessage:v11];
        uint64_t v13 = [*(id *)(a1 + 40) itemCache];
        [v13 updateItem:v12 withItemIdentifier:v7];

        uint64_t v14 = ABSLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [*(id *)(a1 + 32) itemIdentifier];
          v16 = NSStringFromBCSType([v15 type]);
          int v22 = 136315650;
          id v23 = "-[BCSBusinessEmailResolver _metadataMatching:metric:perItemBlock:completion:]_block_invoke";
          __int16 v24 = 2112;
          id v25 = v16;
          __int16 v26 = 2112;
          id v27 = v12;
          _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for metadata - type: %@, item: %@", (uint8_t *)&v22, 0x20u);
        }
      }
      else
      {
        uint64_t v28 = *MEMORY[0x263F08320];
        v29 = @"Failed to decode PIR record";
        id v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        id v12 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v18];

        uint64_t v14 = ABSLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [*(id *)(a1 + 32) itemIdentifier];
          id v20 = NSStringFromBCSType([v19 type]);
          int v22 = 136315650;
          id v23 = "-[BCSBusinessEmailResolver _metadataMatching:metric:perItemBlock:completion:]_block_invoke";
          __int16 v24 = 2112;
          id v25 = v20;
          __int16 v26 = 2112;
          id v27 = v8;
          _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for metadata - type: %@, data: %@", (uint8_t *)&v22, 0x20u);
        }
      }

      uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v30 = *MEMORY[0x263F08320];
      v31[0] = @"No data received";
      id v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
      id v11 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v17];

      uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  return v10;
}

void __77__BCSBusinessEmailResolver__metadataMatching_metric_perItemBlock_completion___block_invoke_25(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 end];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_metadataMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(BCSBusinessEmailResolver *)self metricFactory];
  uint64_t v10 = [v9 measurementFactory];
  id v11 = [v7 itemIdentifier];
  id v12 = [v10 businessEmailFetchTimingMeasurementForItemIdentifier:v11];

  [v12 begin];
  uint64_t v13 = [(BCSBusinessEmailResolver *)self pirFetchMetadata];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__BCSBusinessEmailResolver__metadataMatching_metric_completion___block_invoke;
  v17[3] = &unk_2642498F0;
  id v18 = v12;
  id v19 = v7;
  id v20 = self;
  id v21 = v8;
  id v14 = v8;
  id v15 = v7;
  id v16 = v12;
  [v13 fetchDataMatching:v15 timeout:30000000000 completion:v17];
}

void __64__BCSBusinessEmailResolver__metadataMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = a2;
  char v6 = a3;
  [*(id *)(a1 + 32) end];
  if (!v5)
  {
    id v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v9;
      uint64_t v10 = "No match found in PIR for metadata of type: %@";
      id v11 = v7;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (v6)
  {
    id v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      __int16 v31 = 2112;
      v32 = v6;
      uint64_t v10 = "%s - Error fetching from PIR for metadata - type: %@, error: %@";
      id v11 = v7;
      uint32_t v12 = 32;
LABEL_7:
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [[BCSEmailMetadataParquetMessage alloc] initWithData:v5];
  if (v13)
  {
    id v14 = [[BCSBusinessEmailItem alloc] initWithEmailMessage:v13];
    id v15 = [*(id *)(a1 + 48) itemCache];
    id v16 = [*(id *)(a1 + 40) itemIdentifier];
    [v15 updateItem:v14 withItemIdentifier:v16];

    id v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v18 type]);
      id v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for metadata - type: %@, item: %@", buf, 0x20u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v25 = *MEMORY[0x263F08320];
    __int16 v26 = @"Failed to decode PIR record";
    id v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v14 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v21];

    int v22 = ABSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v23 type]);
      __int16 v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for metadata - type: %@, data: %@", buf, 0x20u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (void)_logoMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(BCSBusinessEmailResolver *)self metricFactory];
  uint64_t v10 = [v9 measurementFactory];
  id v11 = [v7 itemIdentifier];
  uint32_t v12 = [v10 businessEmailFetchTimingMeasurementForItemIdentifier:v11];

  [v12 begin];
  uint64_t v13 = [(BCSBusinessEmailResolver *)self pirFetchLogo];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__BCSBusinessEmailResolver__logoMatching_metric_completion___block_invoke;
  v17[3] = &unk_2642498F0;
  id v18 = v12;
  id v19 = v7;
  id v20 = self;
  id v21 = v8;
  id v14 = v8;
  id v15 = v7;
  id v16 = v12;
  [v13 fetchDataMatching:v15 timeout:30000000000 completion:v17];
}

void __60__BCSBusinessEmailResolver__logoMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = a2;
  char v6 = a3;
  [*(id *)(a1 + 32) end];
  if (!v5)
  {
    id v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v9;
      uint64_t v10 = "No match found in PIR for logo of type: %@";
      id v11 = v7;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (v6)
  {
    id v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      __int16 v31 = 2112;
      v32 = v6;
      uint64_t v10 = "%s - Error fetching from PIR for logo - type: %@, error: %@";
      id v11 = v7;
      uint32_t v12 = 32;
LABEL_7:
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [[BCSEmailLogoParquetMessage alloc] initWithData:v5];
  if (v13)
  {
    id v14 = [[BCSBusinessLogo alloc] initWithMessage:v13 logoURL:0];
    id v15 = [*(id *)(a1 + 48) itemCache];
    id v16 = [*(id *)(a1 + 40) itemIdentifier];
    [v15 updateItem:v14 withItemIdentifier:v16];

    id v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v18 type]);
      id v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for logo - type: %@, item: %@", buf, 0x20u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v25 = *MEMORY[0x263F08320];
    __int16 v26 = @"Failed to decode PIR record";
    id v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v14 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v21];

    int v22 = ABSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v23 type]);
      __int16 v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for logo - type: %@, data: %@", buf, 0x20u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (BCSItemCaching)itemCache
{
  return self->_itemCache;
}

- (BCSItemCacheSkipping)itemCacheSkipper
{
  return self->_itemCacheSkipper;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (void)setMetricFactory:(id)a3
{
}

- (BCSRemoteFetchPIR)pirFetchMetadata
{
  return self->_pirFetchMetadata;
}

- (void)setPirFetchMetadata:(id)a3
{
}

- (BCSRemoteFetchPIR)pirFetchLogo
{
  return self->_pirFetchLogo;
}

- (void)setPirFetchLogo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirFetchLogo, 0);
  objc_storeStrong((id *)&self->_pirFetchMetadata, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);

  objc_storeStrong((id *)&self->_itemCache, 0);
}

@end