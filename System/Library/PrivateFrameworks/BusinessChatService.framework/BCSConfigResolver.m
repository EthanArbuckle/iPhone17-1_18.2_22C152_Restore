@interface BCSConfigResolver
- (id)initWithConfigCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:;
- (void)configItemWithType:(int64_t)a3 clientBundleID:(id)a4 cacheOnly:(BOOL)a5 metric:(id)a6 completion:(id)a7;
- (void)configItemWithType:(int64_t)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6;
@end

@implementation BCSConfigResolver

- (id)initWithConfigCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)BCSConfigResolver;
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

- (void)configItemWithType:(int64_t)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6
{
}

- (void)configItemWithType:(int64_t)a3 clientBundleID:(id)a4 cacheOnly:(BOOL)a5 metric:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = (void (**)(id, void, void *))a7;
  if (v12)
  {
    if (self)
    {
      if ([(BCSConfigCacheSkipping *)self->_configCacheSkipper shouldSkipCacheForConfigItemOfType:a3])
      {
        id v13 = 0;
        goto LABEL_7;
      }
      configCache = self->_configCache;
    }
    else
    {
      char v29 = [0 shouldSkipCacheForConfigItemOfType:a3];
      configCache = 0;
      id v13 = 0;
      if (v29)
      {
LABEL_7:
        if ([v13 isExpired])
        {
          v15 = ABSLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v16 = NSStringFromBCSType(a3);
            *(_DWORD *)buf = 136315394;
            v35 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]";
            __int16 v36 = 2112;
            v37 = v16;
            _os_log_impl(&dword_2154F4000, v15, OS_LOG_TYPE_DEFAULT, "%s cached config item found but expired - type: %@ --> still using it but will download megashard in background with new config for later use", buf, 0x16u);
          }
          if (self)
          {
            serialDispatchQueue = self->_serialDispatchQueue;
            if (!serialDispatchQueue)
            {
              v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.businessservicesd.BCSConfigResolver", 0);
              v19 = self->_serialDispatchQueue;
              self->_serialDispatchQueue = v18;

              serialDispatchQueue = self->_serialDispatchQueue;
            }
            v20 = serialDispatchQueue;
          }
          else
          {
            v20 = 0;
          }
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke;
          block[3] = &unk_264248788;
          block[4] = self;
          block[5] = a3;
          dispatch_async(v20, block);
        }
        if (v8)
        {
          if (!v13)
          {
            v25 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:47 errorDescription:@"Query is cache-only, skipping config fetch"];
            v12[2](v12, 0, v25);

            goto LABEL_28;
          }
        }
        else
        {
          if (self) {
            metricFactory = self->_metricFactory;
          }
          else {
            metricFactory = 0;
          }
          v22 = [(BCSMetricFactoryProtocol *)metricFactory measurementFactory];
          v23 = [v22 configCacheHitMeasurementForConfigType:a3];
          [v11 setCacheHitMeasurement:v23];

          v24 = [v11 cacheHitMeasurement];
          [v24 setFlag:v13 != 0];

          if (!v13)
          {
            v26 = ABSLogCommon();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v28 = NSStringFromBCSType(a3);
              *(_DWORD *)buf = 136315394;
              v35 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]";
              __int16 v36 = 2112;
              v37 = v28;
              _os_log_error_impl(&dword_2154F4000, v26, OS_LOG_TYPE_ERROR, "%s config missing!!! - type: %@ --> blocking to download megashard from server", buf, 0x16u);
            }
            if (self) {
              megashardFetchTrigger = self->_megashardFetchTrigger;
            }
            else {
              megashardFetchTrigger = 0;
            }
            v30[0] = MEMORY[0x263EF8330];
            v30[1] = 3221225472;
            v30[2] = __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke_4;
            v30[3] = &unk_2642487B0;
            int64_t v32 = a3;
            v30[4] = self;
            v31 = v12;
            [(BCSFetchTrigger *)megashardFetchTrigger triggerFetchForReason:5 completion:v30];

            goto LABEL_28;
          }
        }
        ((void (**)(id, void *, void *))v12)[2](v12, v13, 0);
LABEL_28:

        goto LABEL_29;
      }
    }
    id v13 = [(BCSConfigCaching *)configCache configItemForType:a3];
    goto LABEL_7;
  }
LABEL_29:
}

uint64_t __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[3];
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke_2;
  v3[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
  v3[4] = *(void *)(a1 + 40);
  return [v1 triggerFetchForReason:2 completion:v3];
}

void __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromBCSType(*(void *)(a1 + 32));
    int v6 = 136315650;
    v7 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "%s - Result of fetching megashards of type %@: %d", (uint8_t *)&v6, 0x1Cu);
  }
}

void __83__BCSConfigResolver_configItemWithType_clientBundleID_cacheOnly_metric_completion___block_invoke_4(void *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = ABSLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v7)
    {
      uint64_t v12 = NSStringFromBCSType(a1[6]);
      int v13 = 136315650;
      v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
      __int16 v15 = 2112;
      objc_super v16 = v12;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Failed to fetch Config and Megashard of type %@ - Error: %@", (uint8_t *)&v13, 0x20u);
      goto LABEL_11;
    }
LABEL_12:

    int v11 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    __int16 v8 = NSStringFromBCSType(a1[6]);
    int v13 = 136315394;
    v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Successfully fetched megashards of type %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = a1[4];
  if (v9) {
    __int16 v10 = *(void **)(v9 + 8);
  }
  else {
    __int16 v10 = 0;
  }
  int v11 = [v10 configItemForType:a1[6]];
  if (!v11)
  {
    int v6 = ABSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromBCSType(a1[6]);
      int v13 = 136315394;
      v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:cacheOnly:metric:completion:]_block_invoke";
      __int16 v15 = 2112;
      objc_super v16 = v12;
      _os_log_error_impl(&dword_2154F4000, v6, OS_LOG_TYPE_ERROR, "%s - Successfully fetched megashard of type %@ but did not find config in cache", (uint8_t *)&v13, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(a1[5] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_megashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_configCacheSkipper, 0);

  objc_storeStrong((id *)&self->_configCache, 0);
}

@end