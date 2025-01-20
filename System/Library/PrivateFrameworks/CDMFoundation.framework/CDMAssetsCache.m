@interface CDMAssetsCache
+ (id)getAssetsFromUAFAssetSet:(id)a3;
+ (id)getHashKeyForAssetSetName:(id)a3 withUsages:(id)a4;
+ (id)getNameFromUAFAssetSet:(id)a3;
+ (id)getUsagesFromUAFAssetSet:(id)a3;
+ (id)initUAFAssetSetWithAssetSetName:(id)a3 andUsages:(id)a4;
+ (void)subscribeToAssetSet:(int64_t)a3 withUsages:(id)a4 forSubscriber:(id)a5 withSubscriptionName:(id)a6 withExpiration:(id)a7;
- (CDMAssetsCache)initWithValidateAssetSetHandler:(id)a3;
- (id)getCurrentAssetSetForAssetSetName:(int64_t)a3 withUsages:(id)a4;
- (void)markAssetSetValidated:(id)a3;
@end

@implementation CDMAssetsCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetObservers, 0);
  objc_storeStrong((id *)&self->_validatedAssetSets, 0);
  objc_storeStrong(&self->_validateAssetSetHandler, 0);
}

- (void)markAssetSetValidated:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_validatedAssetSets;
  objc_sync_enter(v5);
  v6 = +[CDMAssetsCache getNameFromUAFAssetSet:v4];
  uint64_t v7 = +[CDMAssetsCache getUsagesFromUAFAssetSet:v4];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315650;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s AssetSetName: %@ and usages: %@ can not be nil.", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Start to mark asset set %@ validated for assetSetName: %@ and usages: %@.", (uint8_t *)&v14, 0x2Au);
    }

    v10 = +[CDMAssetsCache getHashKeyForAssetSetName:v6 withUsages:v8];
    [(NSMutableDictionary *)self->_validatedAssetSets setObject:v4 forKey:v10];
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Marked asset set %@ validated for assetSetName: %@ and usages: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  objc_sync_exit(v5);
}

- (id)getCurrentAssetSetForAssetSetName:(int64_t)a3 withUsages:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = self->_validatedAssetSets;
  objc_sync_enter(v7);
  v8 = +[CDMAssetsUtils cdmAssetSetToStr:a3];
  uint64_t v9 = [v6 getUsages];
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: AssetSetName and usagesDict cannot be nil - assetSetName: %@ and usages: %@.", buf, 0x20u);
    }
  }
  else
  {
    v12 = +[CDMAssetsCache getHashKeyForAssetSetName:v8 withUsages:v9];
    v13 = self->_assetSetObservers;
    objc_sync_enter(v13);
    int v14 = [(NSMutableDictionary *)self->_assetSetObservers objectForKey:v12];

    if (!v14)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__CDMAssetsCache_getCurrentAssetSetForAssetSetName_withUsages___block_invoke;
      aBlock[3] = &unk_2647A4380;
      aBlock[4] = self;
      id v25 = v8;
      id v27 = v25;
      id v24 = v10;
      id v28 = v24;
      v15 = (void (**)(void))_Block_copy(aBlock);
      __int16 v16 = [MEMORY[0x263F84070] sharedManager];
      id v17 = [v16 observeAssetSet:v25 queue:0 handler:v15];

      if (v17)
      {
        __int16 v18 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
          __int16 v31 = 2112;
          id v32 = v25;
          __int16 v33 = 2112;
          id v34 = v24;
          _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Registered asset set observer for assetSetName: %@ and usages: %@", buf, 0x20u);
        }

        [(NSMutableDictionary *)self->_assetSetObservers setObject:v17 forKeyedSubscript:v12];
      }
      v15[2](v15);
    }
    objc_sync_exit(v13);

    v19 = [(NSMutableDictionary *)self->_validatedAssetSets objectForKey:v12];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      v21 = [(NSMutableDictionary *)self->_validatedAssetSets objectForKey:v12];
      goto LABEL_20;
    }
    uint64_t v22 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s Validated asset set does not exist for assetSetName: %@ and usages: %@.", buf, 0x20u);
    }
  }
  v21 = 0;
LABEL_20:

  objc_sync_exit(v7);
  return v21;
}

void __63__CDMAssetsCache_getCurrentAssetSetForAssetSetName_withUsages___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  v3 = +[CDMAssetsCache initUAFAssetSetWithAssetSetName:*(void *)(a1 + 40) andUsages:*(void *)(a1 + 48)];
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))()) {
    [*(id *)(a1 + 32) markAssetSetValidated:v3];
  }
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 136315650;
    v8 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Validation failed for assetSetName: %@ and usages: %@.", (uint8_t *)&v7, 0x20u);
  }

  objc_sync_exit(v2);
}

- (CDMAssetsCache)initWithValidateAssetSetHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMAssetsCache;
  uint64_t v5 = [(CDMAssetsCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = _Block_copy(v4);
    id validateAssetSetHandler = v5->_validateAssetSetHandler;
    v5->_id validateAssetSetHandler = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    validatedAssetSets = v5->_validatedAssetSets;
    v5->_validatedAssetSets = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetObservers = v5->_assetSetObservers;
    v5->_assetSetObservers = v10;
  }
  return v5;
}

+ (id)getUsagesFromUAFAssetSet:(id)a3
{
  return (id)[a3 usages];
}

+ (id)getNameFromUAFAssetSet:(id)a3
{
  return (id)[a3 name];
}

+ (id)initUAFAssetSetWithAssetSetName:(id)a3 andUsages:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  __int16 v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDMAssetsCache", "init UAFAssetSet with assetSetName: %@ and usage: %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v10 = [MEMORY[0x263F84070] sharedManager];
  __int16 v11 = [v10 retrieveAssetSet:v5 usages:v6];

  uint64_t v12 = (id)CDMLogContext;
  objc_super v13 = v12;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_INTERVAL_END, v7, "CDMAssetsCache", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
  }

  return v11;
}

+ (id)getAssetsFromUAFAssetSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CDMAssetsCache getNameFromUAFAssetSet:v3];
  id v5 = +[CDMAssetsCache getUsagesFromUAFAssetSet:v3];
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v7 = (id)CDMLogContext;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v13 = 138412546;
    int v14 = v4;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CDMAssetsCache", "assets from UAFAssetSet with assetSetName: %@ and usage: %@", (uint8_t *)&v13, 0x16u);
  }

  __int16 v9 = [v3 assets];
  uint64_t v10 = (id)CDMLogContext;
  __int16 v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v11, OS_SIGNPOST_INTERVAL_END, v6, "CDMAssetsCache", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  return v9;
}

+ (void)subscribeToAssetSet:(int64_t)a3 withUsages:(id)a4 forSubscriber:(id)a5 withSubscriptionName:(id)a6 withExpiration:(id)a7
{
  v30[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  __int16 v15 = +[CDMAssetsUtils cdmAssetSetToStr:a3];
  v29 = v15;
  id v16 = [v14 getUsages];

  v30[0] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];

  id v18 = (void *)[objc_alloc(MEMORY[0x263F84080]) initWithName:v13 assetSets:v17 usageAliases:0 expires:v12];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F84070] sharedManager];
    id v24 = v18;
    BOOL v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __99__CDMAssetsCache_subscribeToAssetSet_withUsages_forSubscriber_withSubscriptionName_withExpiration___block_invoke;
    v22[3] = &unk_2647A5480;
    v23 = v17;
    [v19 subscribe:v11 subscriptions:v20 queue:0 completion:v22];

    v21 = v23;
  }
  else
  {
    v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[CDMAssetsCache subscribeToAssetSet:withUsages:forSubscriber:withSubscriptionName:withExpiration:]";
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_error_impl(&dword_2263A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to initialize UAFAssetSetSubscription subscription; aborting subscription for assetSetName: usage - %@ ",
        buf,
        0x16u);
    }
  }
}

void __99__CDMAssetsCache_subscribeToAssetSet_withUsages_forSubscriber_withSubscriptionName_withExpiration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315394;
      os_signpost_id_t v6 = "+[CDMAssetsCache subscribeToAssetSet:withUsages:forSubscriber:withSubscriptionName:withExpiration:]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_2263A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Creating subscription failed assetSetName: usage - %@ ", (uint8_t *)&v5, 0x16u);
    }
  }
}

+ (id)getHashKeyForAssetSetName:(id)a3 withUsages:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v21 = v5;
  __int16 v7 = [MEMORY[0x263F089D8] stringWithString:v5];
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      __int16 v15 = v7;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        uint64_t v17 = [v6 objectForKey:v16];
        __int16 v7 = [MEMORY[0x263F089D8] stringWithFormat:@"%@.%@.%@", v15, v16, v17];

        ++v14;
        __int16 v15 = v7;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v12);
  }

  id v18 = [NSString stringWithString:v7];
  uint64_t v19 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v27 = "+[CDMAssetsCache getHashKeyForAssetSetName:withUsages:]";
    __int16 v28 = 2112;
    v29 = v21;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    __int16 v33 = v7;
    _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Hash key for assetSetName: %@ and usages: %@ is %@", buf, 0x2Au);
  }

  return v18;
}

@end