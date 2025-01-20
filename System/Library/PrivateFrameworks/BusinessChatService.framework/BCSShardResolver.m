@interface BCSShardResolver
- (id)initWithShardCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:;
- (void)shardItemMatching:(id)a3 clientBundleID:(id)a4 cacheOnly:(BOOL)a5 metric:(id)a6 completion:(id)a7;
- (void)shardItemMatching:(id)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6;
- (void)shardItemsMatching:(id)a3 metric:(id)a4 completion:(id)a5;
- (void)triggerMegashardFetchForShardType:(uint64_t)a3 reason:(void *)a4 completion:;
@end

@implementation BCSShardResolver

- (id)initWithShardCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)BCSShardResolver;
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

- (void)triggerMegashardFetchForShardType:(uint64_t)a3 reason:(void *)a4 completion:
{
  id v7 = a4;
  if (a1)
  {
    v8 = *(void **)(a1 + 40);
    if (!v8)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.businessservicesd.BCSShardResolver", 0);
      id v10 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v9;

      v8 = *(void **)(a1 + 40);
    }
    id v11 = v8;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__BCSShardResolver_triggerMegashardFetchForShardType_reason_completion___block_invoke;
    v12[3] = &unk_264249D18;
    v12[4] = a1;
    uint64_t v14 = a3;
    uint64_t v15 = a2;
    id v13 = v7;
    dispatch_async(v11, v12);
  }
}

void __72__BCSShardResolver_triggerMegashardFetchForShardType_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 24);
  }
  else {
    v2 = 0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__BCSShardResolver_triggerMegashardFetchForShardType_reason_completion___block_invoke_2;
  v4[3] = &unk_264249CF0;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  [v2 triggerFetchForReason:v3 completion:v4];
}

void __72__BCSShardResolver_triggerMegashardFetchForShardType_reason_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = ABSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromBCSShardType(*(void *)(a1 + 40));
    int v9 = 136315650;
    id v10 = "-[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Result of fetching megashards of type %@: %d", (uint8_t *)&v9, 0x1Cu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)shardItemsMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v39 = a4;
  id v37 = a5;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__5;
  v54 = __Block_byref_object_dispose__5;
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  int v9 = [v40 itemIdentifiers];
  id v55 = (id)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  if (self) {
    shardCacheSkipper = self->_shardCacheSkipper;
  }
  else {
    shardCacheSkipper = 0;
  }
  __int16 v11 = shardCacheSkipper;
  unint64_t v12 = [v40 shardType] - 2;
  if (v12 > 3) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = qword_215570B98[v12];
  }
  char v14 = -[BCSShardCacheSkipping shouldSkipCacheForShardItemOfType:](v11, "shouldSkipCacheForShardItemOfType:", v13, v37);

  if (v14)
  {
    uint64_t v15 = 1;
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    objc_super v16 = [v40 shardIdentifiers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v47;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v16);
          }
          if (self) {
            shardCache = self->_shardCache;
          }
          else {
            shardCache = 0;
          }
          v21 = *(void **)(*((void *)&v46 + 1) + 8 * v19);
          v22 = shardCache;
          v23 = [(BCSShardCaching *)v22 shardItemMatching:v21];

          if (!v23 && [(id)v51[5] count])
          {
            [(id)v51[5] removeAllObjects];
            uint64_t v15 = 0;
            goto LABEL_27;
          }
          if ([v23 isExpired])
          {
            v24 = ABSLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = NSStringFromBCSShardType([v21 type]);
              *(_DWORD *)buf = 136315394;
              v57 = "-[BCSShardResolver shardItemsMatching:metric:completion:]";
              __int16 v58 = 2112;
              v59 = v25;
              _os_log_impl(&dword_2154F4000, v24, OS_LOG_TYPE_DEFAULT, "%s cached shard item found but expired - type: %@ --> will use expired shard but will attempt to download megashard from server in background", buf, 0x16u);
            }
            -[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]((uint64_t)self, [v21 type], 4, 0);
          }
          [(id)v51[5] setObject:v23 forKeyedSubscript:v21];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v26 = [v16 countByEnumeratingWithState:&v46 objects:v60 count:16];
        uint64_t v17 = v26;
      }
      while (v26);
    }
    uint64_t v15 = 1;
LABEL_27:
  }
  if (self) {
    metricFactory = self->_metricFactory;
  }
  else {
    metricFactory = 0;
  }
  v28 = metricFactory;
  v29 = [(BCSMetricFactoryProtocol *)v28 measurementFactory];
  v30 = [v40 shardIdentifiers];
  v31 = [v30 firstObject];
  v32 = [v29 shardCacheHitMeasurementForShardIdentifier:v31];
  [v39 setCacheHitMeasurement:v32];

  v33 = [v39 cacheHitMeasurement];
  [v33 setFlag:v15];

  if (v15 && [(id)v51[5] count])
  {
    v38[2](v38, v51[5], 0);
  }
  else
  {
    v34 = ABSLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromBCSShardType([v40 shardType]);
      *(_DWORD *)buf = 136315394;
      v57 = "-[BCSShardResolver shardItemsMatching:metric:completion:]";
      __int16 v58 = 2112;
      v59 = v36;
      _os_log_error_impl(&dword_2154F4000, v34, OS_LOG_TYPE_ERROR, "%s shard item missing!!! - type: %@ --> blocking to download megashard from server", buf, 0x16u);
    }
    uint64_t v35 = [v40 shardType];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __57__BCSShardResolver_shardItemsMatching_metric_completion___block_invoke;
    v41[3] = &unk_264249D40;
    id v42 = v40;
    v43 = self;
    v45 = &v50;
    v44 = v38;
    -[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]((uint64_t)self, v35, 5, v41);
  }
  _Block_object_dispose(&v50, 8);
}

void __57__BCSShardResolver_shardItemsMatching_metric_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v19 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = [*(id *)(a1 + 32) shardIdentifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
          uint64_t v13 = *(void *)(a1 + 40);
          if (v13) {
            char v14 = *(void **)(v13 + 8);
          }
          else {
            char v14 = 0;
          }
          uint64_t v15 = [v14 shardItemMatching:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v15 forKeyedSubscript:v12];
          if (!v15)
          {
            objc_super v16 = ABSLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v17 = NSStringFromBCSShardType([*(id *)(a1 + 32) shardType]);
              *(_DWORD *)buf = 136315394;
              v25 = "-[BCSShardResolver shardItemsMatching:metric:completion:]_block_invoke";
              __int16 v26 = 2112;
              v27 = v17;
              _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "%s - Successfully fetched megashard of type %@ but did not find shard in cache", buf, 0x16u);
            }
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v18 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        uint64_t v9 = v18;
      }
      while (v18);
    }

    uint64_t v6 = v19;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)shardItemMatching:(id)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6
{
}

- (void)shardItemMatching:(id)a3 clientBundleID:(id)a4 cacheOnly:(BOOL)a5 metric:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v11 = a3;
  uint64_t v12 = (void (**)(id, void *, void))a7;
  if (self) {
    shardCacheSkipper = self->_shardCacheSkipper;
  }
  else {
    shardCacheSkipper = 0;
  }
  char v14 = shardCacheSkipper;
  id v15 = a6;
  unint64_t v16 = [v11 type] - 2;
  if (v16 > 3) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = qword_215570B98[v16];
  }
  char v18 = [(BCSShardCacheSkipping *)v14 shouldSkipCacheForShardItemOfType:v17];

  if (v18)
  {
    id v19 = 0;
  }
  else
  {
    if (self) {
      shardCache = self->_shardCache;
    }
    else {
      shardCache = 0;
    }
    id v19 = [(BCSShardCaching *)shardCache shardItemMatching:v11];
  }
  if ([v19 isExpired])
  {
    long long v21 = ABSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = NSStringFromBCSShardType([v11 type]);
      *(_DWORD *)buf = 136315394;
      id v39 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]";
      __int16 v40 = 2112;
      v41 = v22;
      _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "%s cached shard item found but expired - type: %@ --> will use expired shard but will attempt to download megashard from server in background", buf, 0x16u);
    }
    -[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]((uint64_t)self, [v11 type], 4, 0);
  }
  if (self) {
    metricFactory = self->_metricFactory;
  }
  else {
    metricFactory = 0;
  }
  v24 = metricFactory;
  v25 = [(BCSMetricFactoryProtocol *)v24 measurementFactory];
  __int16 v26 = [v25 shardCacheHitMeasurementForShardIdentifier:v11];

  [v15 setCacheHitMeasurement:v26];
  v27 = [v15 cacheHitMeasurement];

  [v27 setFlag:v19 != 0];
  if (v19)
  {
    v12[2](v12, v19, 0);
  }
  else
  {
    v28 = ABSLogCommon();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v29)
      {
        v32 = NSStringFromBCSShardType([v11 type]);
        *(_DWORD *)buf = 136315394;
        id v39 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]";
        __int16 v40 = 2112;
        v41 = v32;
        _os_log_error_impl(&dword_2154F4000, v28, OS_LOG_TYPE_ERROR, "%s shard item missing!!! - type: %@ --> triggering BACKGROUND download of megashard from server", buf, 0x16u);
      }
      -[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]((uint64_t)self, [v11 type], 5, &__block_literal_global_11);
      v30 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:47 errorDescription:@"Query is cache-only, skipping shard fetch"];
      ((void (**)(id, void *, void *))v12)[2](v12, 0, v30);
    }
    else
    {
      if (v29)
      {
        v33 = NSStringFromBCSShardType([v11 type]);
        *(_DWORD *)buf = 136315394;
        id v39 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]";
        __int16 v40 = 2112;
        v41 = v33;
        _os_log_error_impl(&dword_2154F4000, v28, OS_LOG_TYPE_ERROR, "%s shard item missing!!! - type: %@ --> blocking to download megashard from server", buf, 0x16u);
      }
      uint64_t v31 = [v11 type];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __81__BCSShardResolver_shardItemMatching_clientBundleID_cacheOnly_metric_completion___block_invoke_5;
      v34[3] = &unk_264249D68;
      id v35 = v11;
      v36 = self;
      id v37 = v12;
      -[BCSShardResolver triggerMegashardFetchForShardType:reason:completion:]((uint64_t)self, v31, 5, v34);
    }
  }
}

void __81__BCSShardResolver_shardItemMatching_clientBundleID_cacheOnly_metric_completion___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = ABSLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v7)
    {
      uint64_t v12 = NSStringFromBCSShardType([*(id *)(a1 + 32) type]);
      int v13 = 136315650;
      char v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
      __int16 v15 = 2112;
      unint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Failed to fetch Megashard of type %@ - Error: %@", (uint8_t *)&v13, 0x20u);
      goto LABEL_11;
    }
LABEL_12:

    id v11 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v8 = NSStringFromBCSShardType([*(id *)(a1 + 32) type]);
    int v13 = 136315394;
    char v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
    __int16 v15 = 2112;
    unint64_t v16 = v8;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Successfully fetched megashard of type %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    uint64_t v10 = *(void **)(v9 + 8);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [v10 shardItemMatching:*(void *)(a1 + 32)];
  if (!v11)
  {
    uint64_t v6 = ABSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromBCSShardType([*(id *)(a1 + 32) type]);
      int v13 = 136315394;
      char v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
      __int16 v15 = 2112;
      unint64_t v16 = v12;
      _os_log_error_impl(&dword_2154F4000, v6, OS_LOG_TYPE_ERROR, "%s - Successfully fetched megashard of type %@ but did not find shard in cache", (uint8_t *)&v13, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_megashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_shardCacheSkipper, 0);

  objc_storeStrong((id *)&self->_shardCache, 0);
}

@end