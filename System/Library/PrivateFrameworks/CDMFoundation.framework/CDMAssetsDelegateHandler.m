@interface CDMAssetsDelegateHandler
- (BOOL)assetsAvailableForAssetSet:(id)a3 forLocale:(id)a4;
- (BOOL)assetsUnavailableForAssetSet:(id)a3;
- (CDMAssetsDelegateHandler)initWithAssetsDelegate:(id)a3 forAssetSets:(id)a4 withAssetAvailabilityType:(int64_t)a5;
- (void)notifyDelegate;
@end

@implementation CDMAssetsDelegateHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsAvailabilities, 0);
  objc_storeStrong((id *)&self->_assetSetNames, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)notifyDelegate
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Start to notify assets delegate.", buf, 0xCu);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v4 = self->_assetSetNames;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v35;
    while (2)
    {
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        v12 = -[NSMutableDictionary objectForKey:](self->_assetsAvailabilities, "objectForKey:", v11, (void)v34);

        if (!v12)
        {
          v7 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
            __int16 v40 = 2112;
            v41 = v11;
          }
          goto LABEL_20;
        }
        v7 = [(NSMutableDictionary *)self->_assetsAvailabilities valueForKey:v11];
        if (v10 && ([v10 isEqualToString:v7] & 1) == 0)
        {
          v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
            __int16 v40 = 2112;
            v41 = v7;
            __int16 v42 = 2112;
            int64_t v43 = (int64_t)v11;
            __int16 v44 = 2112;
            v45 = v10;
          }

LABEL_20:
          int v13 = 0;
          v7 = v10;
          goto LABEL_21;
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v48 count:16];
      int v13 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = 0;
    int v13 = 1;
  }
LABEL_21:

  v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    assetsAvailabilities = self->_assetsAvailabilities;
    *(_DWORD *)buf = 136315394;
    v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
    __int16 v40 = 2112;
    v41 = assetsAvailabilities;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Current assets availabilities status: %@.", buf, 0x16u);
  }

  if (v7) {
    int v16 = v13;
  }
  else {
    int v16 = 0;
  }
  v17 = CDMOSLoggerForCategory(0);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v16 == 1)
  {
    if (v18)
    {
      assetSetNames = self->_assetSetNames;
      int64_t assetAvailabilityType = self->_assetAvailabilityType;
      *(_DWORD *)buf = 136316162;
      v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
      __int16 v40 = 2112;
      v41 = assetSetNames;
      __int16 v42 = 2112;
      int64_t v43 = (int64_t)v7;
      __int16 v44 = 2112;
      v45 = v7;
      __int16 v46 = 2048;
      int64_t v47 = assetAvailabilityType;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s All assets are available for assetSetNames: %@ for locale: %@. Call assets delegate's assetsAvailable for locale: %@  for assetAvailabilityType: %ld", buf, 0x34u);
    }

    char v21 = objc_opt_respondsToSelector();
    v22 = CDMOSLoggerForCategory(0);
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s Selector found for assetsAvailableForLocale:withType:", buf, 0xCu);
      }

      delegate = self->_delegate;
      v25 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
      [(CDMTrialAssetsDelegate *)delegate assetsAvailableForLocale:v25 withType:self->_assetAvailabilityType];
    }
    else
    {
      if (v23)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s Selector not found for assetsAvailableForLocale:withType:", buf, 0xCu);
      }

      v31 = self->_delegate;
      v32 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
      [(CDMTrialAssetsDelegate *)v31 assetsAvailableForLocale:v32];
    }
  }
  else
  {
    if (v18)
    {
      v26 = self->_assetSetNames;
      int64_t v27 = self->_assetAvailabilityType;
      *(_DWORD *)buf = 136315650;
      v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
      __int16 v40 = 2112;
      v41 = v26;
      __int16 v42 = 2048;
      int64_t v43 = v27;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s Not all assets are available for assetSetNames: %@. Call assets delegate's assetsUnavailable for assetAvailabilityType: %ld", buf, 0x20u);
    }

    char v28 = objc_opt_respondsToSelector();
    v29 = CDMOSLoggerForCategory(0);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_2263A0000, v29, OS_LOG_TYPE_INFO, "%s Selector found for assetsUnavailableWithType:", buf, 0xCu);
      }

      [(CDMTrialAssetsDelegate *)self->_delegate assetsUnavailableWithType:self->_assetAvailabilityType];
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_2263A0000, v29, OS_LOG_TYPE_INFO, "%s Selector not found for assetsUnavailableWithType:", buf, 0xCu);
      }

      [(CDMTrialAssetsDelegate *)self->_delegate assetsUnavailable];
    }
  }
}

- (BOOL)assetsUnavailableForAssetSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NSArray *)self->_assetSetNames containsObject:v4];
  uint64_t v6 = CDMOSLoggerForCategory(0);
  v7 = (NSMutableDictionary *)v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "-[CDMAssetsDelegateHandler assetsUnavailableForAssetSet:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_debug_impl(&dword_2263A0000, &v7->super.super, OS_LOG_TYPE_DEBUG, "%s Asset is unavailable for assetSetName: %@.", (uint8_t *)&v10, 0x16u);
    }

    v7 = self->_assetsAvailabilities;
    objc_sync_enter(v7);
    [(NSMutableDictionary *)self->_assetsAvailabilities removeObjectForKey:v4];
    [(CDMAssetsDelegateHandler *)self notifyDelegate];
    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    assetSetNames = self->_assetSetNames;
    int v10 = 136315650;
    v11 = "-[CDMAssetsDelegateHandler assetsUnavailableForAssetSet:]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = assetSetNames;
    _os_log_impl(&dword_2263A0000, &v7->super.super, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find assetSetName: %@ in assetSetName array: %@", (uint8_t *)&v10, 0x20u);
  }

  return v5;
}

- (BOOL)assetsAvailableForAssetSet:(id)a3 forLocale:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (NSArray *)a4;
  BOOL v8 = [(NSArray *)self->_assetSetNames containsObject:v6];
  uint64_t v9 = CDMOSLoggerForCategory(0);
  int v10 = (NSMutableDictionary *)v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      __int16 v14 = "-[CDMAssetsDelegateHandler assetsAvailableForAssetSet:forLocale:]";
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      BOOL v18 = v7;
      _os_log_debug_impl(&dword_2263A0000, &v10->super.super, OS_LOG_TYPE_DEBUG, "%s Asset is available for assetSetName: %@ for locale: %@.", (uint8_t *)&v13, 0x20u);
    }

    int v10 = self->_assetsAvailabilities;
    objc_sync_enter(v10);
    [(NSMutableDictionary *)self->_assetsAvailabilities setObject:v7 forKeyedSubscript:v6];
    [(CDMAssetsDelegateHandler *)self notifyDelegate];
    objc_sync_exit(v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    assetSetNames = self->_assetSetNames;
    int v13 = 136315650;
    __int16 v14 = "-[CDMAssetsDelegateHandler assetsAvailableForAssetSet:forLocale:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    BOOL v18 = assetSetNames;
    _os_log_impl(&dword_2263A0000, &v10->super.super, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find assetSetName: %@ in assetSetName array: %@", (uint8_t *)&v13, 0x20u);
  }

  return v8;
}

- (CDMAssetsDelegateHandler)initWithAssetsDelegate:(id)a3 forAssetSets:(id)a4 withAssetAvailabilityType:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDMAssetsDelegateHandler;
  v11 = [(CDMAssetsDelegateHandler *)&v16 init];
  if (v11)
  {
    __int16 v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v18 = "-[CDMAssetsDelegateHandler initWithAssetsDelegate:forAssetSets:withAssetAvailabilityType:]";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Initialize CDMAssetsDelegateHandler for assetSetNames: %@.", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_delegate, a3);
    objc_storeStrong((id *)&v11->_assetSetNames, a4);
    int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsAvailabilities = v11->_assetsAvailabilities;
    v11->_assetsAvailabilities = v13;

    v11->_int64_t assetAvailabilityType = a5;
  }

  return v11;
}

@end