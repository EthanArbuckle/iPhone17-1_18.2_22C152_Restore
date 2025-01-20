@interface BCSCallerIdResolver
- (BCSItemCacheSkipping)itemCacheSkipper;
- (BCSItemCaching)itemCache;
- (BCSMetricFactoryProtocol)metricFactory;
- (BCSPIRServerEnvironmentProtocol)environment;
- (BCSRemoteFetchPIR)pirFetch;
- (id)cachedItemMatching:(id)a3;
- (id)initWithEnvironment:(void *)a3 itemCache:(void *)a4 cacheSkipper:(void *)a5 metricFactory:;
- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5;
- (void)setMetricFactory:(id)a3;
- (void)setPirFetch:(id)a3;
@end

@implementation BCSCallerIdResolver

- (id)initWithEnvironment:(void *)a3 itemCache:(void *)a4 cacheSkipper:(void *)a5 metricFactory:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)BCSCallerIdResolver;
    v14 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      v15 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v10, v13);
      id v16 = a1[5];
      a1[5] = v15;
    }
  }

  return a1;
}

- (id)cachedItemMatching:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 3)
  {
    v5 = [(BCSCallerIdResolver *)self itemCacheSkipper];
    char v6 = objc_msgSend(v5, "shouldSkipCacheForItemOfType:", objc_msgSend(v4, "type"));

    if (v6)
    {
      v7 = 0;
    }
    else
    {
      v8 = [(BCSCallerIdResolver *)self itemCache];
      v7 = [v8 itemMatching:v4];
    }
    if (![v7 isExpired] || objc_msgSend(v7, "type") == 3) {
      goto LABEL_11;
    }
    v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromBCSType([v4 type]);
      int v13 = 136315394;
      v14 = "-[BCSCallerIdResolver cachedItemMatching:]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v13, 0x16u);
    }
    id v11 = [(BCSCallerIdResolver *)self itemCache];
    [v11 deleteItemMatching:v4];
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  v43[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [v8 itemIdentifier];
  uint64_t v12 = [v11 type];

  if (v12 == 3)
  {
    int v13 = [v8 itemIdentifier];
    v14 = [(BCSCallerIdResolver *)self cachedItemMatching:v13];

    __int16 v15 = [(BCSCallerIdResolver *)self metricFactory];
    id v16 = [v15 measurementFactory];
    uint64_t v17 = [v8 itemIdentifier];
    objc_super v18 = [v16 itemCacheHitMeasurementForItemIdentifier:v17];
    [v9 setCacheHitMeasurement:v18];

    v19 = [v9 cacheHitMeasurement];
    [v19 setFlag:v14 != 0];

    v20 = ABSLogCommon();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v21)
      {
        v22 = [v8 itemIdentifier];
        v23 = NSStringFromBCSType([v22 type]);
        *(_DWORD *)buf = 136315394;
        v39 = "-[BCSCallerIdResolver itemMatching:metric:completion:]";
        __int16 v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);
      }
      v10[2](v10, v14, 0);
    }
    else
    {
      if (v21)
      {
        v25 = [v8 itemIdentifier];
        v26 = NSStringFromBCSType([v25 type]);
        *(_DWORD *)buf = 136315394;
        v39 = "-[BCSCallerIdResolver itemMatching:metric:completion:]";
        __int16 v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);
      }
      v27 = [(BCSCallerIdResolver *)self metricFactory];
      v28 = [v27 measurementFactory];
      v29 = [v8 itemIdentifier];
      v30 = [v28 businessCallerFetchTimingMeasurementForItemIdentifier:v29];

      [v30 begin];
      v31 = [(BCSCallerIdResolver *)self pirFetch];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __54__BCSCallerIdResolver_itemMatching_metric_completion___block_invoke;
      v33[3] = &unk_2642498F0;
      id v34 = v30;
      id v35 = v8;
      v36 = self;
      v37 = v10;
      id v32 = v30;
      [v31 fetchDataMatching:v35 timeout:30000000000 completion:v33];

      v14 = 0;
    }
  }
  else
  {
    uint64_t v42 = *MEMORY[0x263F08320];
    v43[0] = @"Invalid type";
    v24 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v14 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v24];

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v14);
  }
}

void __54__BCSCallerIdResolver_itemMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = a2;
  char v6 = a3;
  [*(id *)(a1 + 32) end];
  if (!v5)
  {
    v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      id v10 = "No match found in PIR for type: %@";
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
    v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v8 type]);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      v30 = v9;
      __int16 v31 = 2112;
      id v32 = v6;
      id v10 = "%s - Error fetching from PIR for - type: %@, error: %@";
      id v11 = v7;
      uint32_t v12 = 32;
LABEL_7:
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v13 = [[BCSCallerIdParquetMessage alloc] initWithData:v5];
  if (v13)
  {
    v14 = [[BCSBusinessCallerItem alloc] initWithParquetMessage:v13];
    __int16 v15 = [*(id *)(a1 + 48) itemCache];
    id v16 = [*(id *)(a1 + 40) itemIdentifier];
    [v15 updateItem:v14 withItemIdentifier:v16];

    uint64_t v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v18 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v18 type]);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      v30 = v19;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for - type: %@, item: %@", buf, 0x20u);
    }
    v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v25 = *MEMORY[0x263F08320];
    v26 = @"Failed to decode PIR record";
    BOOL v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v14 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v21];

    v22 = ABSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [*(id *)(a1 + 40) itemIdentifier];
      NSStringFromBCSType([v23 type]);
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      __int16 v29 = 2112;
      v30 = v24;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for - type: %@, data: %@", buf, 0x20u);
    }
    v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (BCSPIRServerEnvironmentProtocol)environment
{
  return self->_environment;
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

- (BCSRemoteFetchPIR)pirFetch
{
  return self->_pirFetch;
}

- (void)setPirFetch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirFetch, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end