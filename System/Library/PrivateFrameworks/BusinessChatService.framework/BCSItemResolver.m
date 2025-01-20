@interface BCSItemResolver
- (id)cachedItemMatching:(id)a3;
- (id)initWithItemCache:(void *)a3 cacheSkipper:(void *)a4 remoteFetcher:(void *)a5 metricFactory:;
- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5;
@end

@implementation BCSItemResolver

- (id)initWithItemCache:(void *)a3 cacheSkipper:(void *)a4 remoteFetcher:(void *)a5 metricFactory:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)BCSItemResolver;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (id)cachedItemMatching:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    itemCacheSkipper = self->_itemCacheSkipper;
  }
  else {
    itemCacheSkipper = 0;
  }
  v6 = itemCacheSkipper;
  char v7 = -[BCSItemCacheSkipping shouldSkipCacheForItemOfType:](v6, "shouldSkipCacheForItemOfType:", [v4 type]);

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    if (self) {
      itemCache = self->_itemCache;
    }
    else {
      itemCache = 0;
    }
    v8 = [(BCSItemCaching *)itemCache itemMatching:v4];
  }
  if ([v8 isExpired] && objc_msgSend(v8, "type") != 1)
  {
    id v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromBCSType([v4 type]);
      int v14 = 136315394;
      v15 = "-[BCSItemResolver cachedItemMatching:]";
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v14, 0x16u);
    }
    if (self) {
      id v12 = self->_itemCache;
    }
    else {
      id v12 = 0;
    }
    [(BCSItemCaching *)v12 deleteItemMatching:v4];

    v8 = 0;
  }

  return v8;
}

- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 itemIdentifier];
  id v12 = [v8 config];
  uint64_t v13 = [v12 buckets];
  if (self)
  {
    if (0x7FFFFFFFFFFFFFFFLL / v13 <= 25) {
      uint64_t v14 = 25;
    }
    else {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL / v13;
    }
    signed int v15 = vcvtmd_s64_f64((double)[v11 truncatedHash] / (double)v14);
    uint64_t v16 = v14 * v15;
    uint64_t v17 = v14 * (v15 + 1);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __50__BCSItemResolver_itemMatching_metric_completion___block_invoke;
  v35[3] = &unk_2642489D8;
  v35[4] = self;
  uint64_t v38 = v16;
  uint64_t v39 = v17;
  id v18 = v8;
  id v36 = v18;
  id v19 = v9;
  id v37 = v19;
  v20 = (void (**)(void))MEMORY[0x2166BDB40](v35);
  v21 = [v18 itemIdentifier];
  v22 = [(BCSItemResolver *)self cachedItemMatching:v21];

  if (self) {
    metricFactory = self->_metricFactory;
  }
  else {
    metricFactory = 0;
  }
  v24 = metricFactory;
  v25 = [(BCSMetricFactoryProtocol *)v24 measurementFactory];
  v26 = [v18 itemIdentifier];

  v27 = [v25 itemCacheHitMeasurementForItemIdentifier:v26];
  [v10 setCacheHitMeasurement:v27];

  v28 = [v10 cacheHitMeasurement];

  [v28 setFlag:v22 != 0];
  v29 = ABSLogCommon();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v30)
    {
      v31 = [v18 itemIdentifier];
      v32 = NSStringFromBCSType([v31 type]);
      *(_DWORD *)buf = 136315394;
      v41 = "-[BCSItemResolver itemMatching:metric:completion:]";
      __int16 v42 = 2112;
      v43 = v32;
      _os_log_impl(&dword_2154F4000, v29, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);
    }
    (*((void (**)(id, void *, void))v19 + 2))(v19, v22, 0);
  }
  else
  {
    if (v30)
    {
      v33 = [v18 itemIdentifier];
      v34 = NSStringFromBCSType([v33 type]);
      *(_DWORD *)buf = 136315394;
      v41 = "-[BCSItemResolver itemMatching:metric:completion:]";
      __int16 v42 = 2112;
      v43 = v34;
      _os_log_impl(&dword_2154F4000, v29, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);
    }
    v20[2](v20);
  }
}

void __50__BCSItemResolver_itemMatching_metric_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[3];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v6 = v2;
  char v7 = [v5 itemIdentifier];
  uint64_t v8 = [v7 type];
  id v9 = [*(id *)(a1 + 40) clientBundleId];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__BCSItemResolver_itemMatching_metric_completion___block_invoke_2;
  v11[3] = &unk_2642489B0;
  id v10 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  id v13 = *(id *)(a1 + 48);
  [v6 fetchItemsWithBucketStartIndex:v3 endIndex:v4 type:v8 forClientBundleID:v9 completion:v11];
}

void __50__BCSItemResolver_itemMatching_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  if (v6)
  {
    char v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 40) itemIdentifier];
      id v9 = NSStringFromBCSType([v8 type]);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v45 = v6;
      _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Error remote fetching buckets for - type: %@ - %@", buf, 0x20u);
    }
LABEL_4:
    id v10 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) itemIdentifier];
  id v13 = v5;
  id v14 = v12;
  signed int v15 = v14;
  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    id v47 = 0;
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __47__BCSItemResolver__firstItemInBucket_matching___block_invoke;
    v41 = &unk_264248A00;
    id v42 = v14;
    v43 = buf;
    [v13 enumerateObjectsUsingBlock:&v38];
    id v10 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = 0;
  }

  char v7 = ABSLogCommon();
  BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v16)
    {
      v34 = [*(id *)(a1 + 40) itemIdentifier];
      v35 = NSStringFromBCSType([v34 type]);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v35;
      _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Failed to find matching item in bucket - type: %@", buf, 0x16u);
    }
    goto LABEL_4;
  }
  if (v16)
  {
    uint64_t v17 = [*(id *)(a1 + 40) itemIdentifier];
    id v18 = NSStringFromBCSType([v17 type]);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Successfully found matching item in bucket - type: %@", buf, 0x16u);
  }
  id v19 = [*(id *)(a1 + 40) config];
  v20 = [v19 itemTTL];
  if (!v20) {
    goto LABEL_14;
  }
  v21 = [*(id *)(a1 + 40) config];
  v22 = [v21 itemTTL];
  [v22 doubleValue];
  BOOL v24 = v23 > 0.0;

  if (v24)
  {
    v25 = (void *)MEMORY[0x263EFF910];
    v26 = [*(id *)(a1 + 40) config];
    v27 = [v26 itemTTL];
    [v27 doubleValue];
    id v19 = objc_msgSend(v25, "dateWithTimeIntervalSinceNow:");

    [v10 setExpirationDate:v19];
LABEL_14:
  }
  if (objc_msgSend(v10, "isExpired", v38, v39, v40, v41) && objc_msgSend(v10, "type") != 1)
  {
    char v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [*(id *)(a1 + 40) itemIdentifier];
      id v37 = NSStringFromBCSType([v36 type]);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Not caching matching item because it is already expired - type: %@", buf, 0x16u);
    }
  }
  else
  {
    v28 = ABSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [*(id *)(a1 + 40) itemIdentifier];
      BOOL v30 = NSStringFromBCSType([v29 type]);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_impl(&dword_2154F4000, v28, OS_LOG_TYPE_DEFAULT, "%s - Caching matching item - type: %@", buf, 0x16u);
    }
    v31 = *(void **)(a1 + 32);
    if (v31) {
      v31 = (void *)v31[1];
    }
    v32 = *(void **)(a1 + 40);
    v33 = v31;
    char v7 = [v32 itemIdentifier];
    [v33 updateItem:v10 withItemIdentifier:v7];
  }
LABEL_5:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __47__BCSItemResolver__firstItemInBucket_matching___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 matchesItemIdentifying:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemRemoteFetcher, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);

  objc_storeStrong((id *)&self->_itemCache, 0);
}

@end