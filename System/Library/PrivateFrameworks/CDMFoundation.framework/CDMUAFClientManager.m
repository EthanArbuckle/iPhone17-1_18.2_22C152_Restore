@interface CDMUAFClientManager
- (BOOL)shouldInitUAFAssetSetInSetupForLocale:(id)a3;
- (CDMUAFClientManager)initWithAssetSet:(id)a3 usages:(id)a4;
- (NSDictionary)usages;
- (NSString)assetSetName;
- (UAFAssetSet)assetSet;
- (id)description;
- (id)getAssetSet;
- (id)getFactors;
- (id)getLocale;
- (void)initUAFAssetSet;
- (void)setAssetSet:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation CDMUAFClientManager

- (UAFAssetSet)assetSet
{
  return self->_assetSet;
}

- (void)setLocale:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CDMUAFClientManager *)v5 getLocale];

  if (v6 != v4)
  {
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      usages = v5->_usages;
      *(_DWORD *)buf = 136315650;
      v31 = "-[CDMUAFClientManager setLocale:]";
      __int16 v32 = 2112;
      v33 = usages;
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Updating locale for usage: %@ to %@.", buf, 0x20u);
    }

    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v9 = [(NSDictionary *)v5->_usages keyEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v14 = [(NSDictionary *)v5->_usages objectForKey:v13];
          [v8 setObject:v14 forKey:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    v15 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:0];
    v16 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:3];
    v17 = [v8 objectForKey:v15];
    BOOL v18 = v17 == 0;

    v19 = v15;
    if (!v18
      || (objc_msgSend(v8, "objectForKey:", v16, v15),
          v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = v20 == 0,
          v20,
          v19 = v16,
          !v21))
    {
      [v8 setObject:v4 forKey:v19];
    }
    uint64_t v22 = [v8 copy];
    v23 = v5->_usages;
    v5->_usages = (NSDictionary *)v22;

    [(CDMUAFClientManager *)v5 initUAFAssetSet];
  }
  objc_sync_exit(v5);
}

- (id)getLocale
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:0];
  id v4 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:3];
  v5 = [(NSDictionary *)v2->_usages objectForKey:v3];

  usages = v2->_usages;
  if (v5)
  {
    v7 = v3;
  }
  else
  {
    id v8 = [(NSDictionary *)usages objectForKey:v4];

    if (!v8) {
      goto LABEL_6;
    }
    usages = v2->_usages;
    v7 = v4;
  }
  id v8 = [(NSDictionary *)usages objectForKey:v7];
LABEL_6:

  objc_sync_exit(v2);
  return v8;
}

- (NSDictionary)usages
{
  return self->_usages;
}

- (id)getAssetSet
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_assetSet;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_assetSet, 0);
}

- (id)getFactors
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263F84070] sharedManager];
  id v4 = [v3 assetNamesForAssetSet:v2->_assetSetName usages:v2->_usages];

  objc_sync_exit(v2);
  return v4;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [NSString stringWithFormat:@"[CDMUAFClientManager] - assetSetName: %@, Usages: %@.", v2->_assetSetName, v2->_usages];
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssetSet:(id)a3
{
  id v4 = (UAFAssetSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  assetSet = obj->_assetSet;
  obj->_assetSet = v4;

  objc_sync_exit(obj);
}

- (void)initUAFAssetSet
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    assetSetName = v2->_assetSetName;
    int v12 = 136315394;
    uint64_t v13 = "-[CDMUAFClientManager initUAFAssetSet]";
    __int16 v14 = 2112;
    v15 = assetSetName;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Start to init UAF client for AssetSet: %@.", (uint8_t *)&v12, 0x16u);
  }

  id v4 = [MEMORY[0x263F84070] sharedManager];
  uint64_t v5 = [v4 retrieveAssetSet:v2->_assetSetName usages:v2->_usages];
  assetSet = v2->_assetSet;
  v2->_assetSet = (UAFAssetSet *)v5;

  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = v2->_assetSet;
    v9 = v2->_assetSetName;
    usages = v2->_usages;
    int v12 = 136315906;
    uint64_t v13 = "-[CDMUAFClientManager initUAFAssetSet]";
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = usages;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has new assetSet %@ has usages %@", (uint8_t *)&v12, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (BOOL)shouldInitUAFAssetSetInSetupForLocale:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = objc_alloc_init(NSDictionary);
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v8 = (id)CDMLogContext;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    assetSetName = v5->_assetSetName;
    int v22 = 138412290;
    v23 = (const char *)assetSetName;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDMUAFClientManager", "getAssets in shouldInitUAFAssetSetInSetup %@", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v11 = [(UAFAssetSet *)v5->_assetSet assets];

  int v12 = (id)CDMLogContext;
  uint64_t v13 = v12;
  if (v7 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_INTERVAL_END, v7, "CDMUAFClientManager", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  __int16 v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    assetSet = v5->_assetSet;
    v19 = v5->_assetSetName;
    usages = v5->_usages;
    int v22 = 136316162;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    __int16 v24 = 2112;
    long long v25 = v19;
    __int16 v26 = 2112;
    long long v27 = assetSet;
    __int16 v28 = 2112;
    v29 = usages;
    __int16 v30 = 2112;
    v31 = v11;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has assetSet %@ has usages %@ has assets %@", (uint8_t *)&v22, 0x34u);
  }

  if (!v5->_assetSet)
  {
    v15 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:
      BOOL v16 = 1;
      goto LABEL_18;
    }
    int v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    v17 = "%s assetSet does not exist. Asset cache miss. Return Yes";
LABEL_20:
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v22, 0xCu);
    goto LABEL_17;
  }
  if (![v11 count])
  {
    v15 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    int v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    v17 = "%s No assets exist in assetSet. Asset cache miss. Return Yes";
    goto LABEL_20;
  }
  v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Asset cache hit. No need to get new assetSet in setup. Return No", (uint8_t *)&v22, 0xCu);
  }
  BOOL v16 = 0;
LABEL_18:

  objc_sync_exit(v5);
  return v16;
}

- (CDMUAFClientManager)initWithAssetSet:(id)a3 usages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMUAFClientManager;
  v9 = [(CDMUAFClientManager *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetName, a3);
    objc_storeStrong((id *)&v10->_usages, a4);
  }

  return v10;
}

@end