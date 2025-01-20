@interface CDMServiceCenterUtils
+ (BOOL)isHostedInDaemon;
+ (BOOL)isServiceCenterEnabled:(id)a3;
+ (BOOL)needEmbeddingConfigsFor:(id)a3;
+ (id)getAvailableServiceGraphs:(id)a3;
+ (id)tryInitDAGServices:(id)a3;
+ (id)tryInitGraphServices:(id)a3;
+ (unsigned)getServiceCenterQueueQOS;
@end

@implementation CDMServiceCenterUtils

+ (id)tryInitDAGServices:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = [v3 availableServiceGraphs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(NSString **)(*((void *)&v28 + 1) + 8 * i);
        Class v11 = NSClassFromString(v10);
        if (v11)
        {
          v12 = [(objc_class *)v11 requiredDAGServices];
          [v4 unionSet:v12];
        }
        else
        {
          v12 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
            __int16 v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(NSString **)(*((void *)&v24 + 1) + 8 * j);
        v20 = NSClassFromString(v19);
        if (v20)
        {
          v21 = [[v20 alloc] initWithConfig:v3];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v13 addObject:v21];
          }
          else
          {
            v22 = CDMOSLoggerForCategory(3);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
              __int16 v35 = 2112;
              v36 = v19;
              _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Unexpected class type in config: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v21 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
            __int16 v35 = 2112;
            v36 = v19;
            _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (BOOL)isServiceCenterEnabled:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = +[CDMFeatureFlags isSiriMiniEnabled];
  id v4 = CDMOSLoggerForCategory(3);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      uint64_t v8 = "+[CDMServiceCenterUtils isServiceCenterEnabled:]";
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s FeatureFlag: SiriNL-> sirimini_nl_on_device is ON.", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    uint64_t v8 = "+[CDMServiceCenterUtils isServiceCenterEnabled:]";
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: FeatureFlag: SiriNL-> sirimini_nl_on_device is OFF. CDM will not be able to process any request.", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

+ (unsigned)getServiceCenterQueueQOS
{
  return 25;
}

+ (BOOL)needEmbeddingConfigsFor:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isHostedInDaemon
{
  if (isHostedInDaemon_once != -1) {
    dispatch_once(&isHostedInDaemon_once, &__block_literal_global_1267);
  }
  return isHostedInDaemon_isHostedInDaemon;
}

+ (id)getAvailableServiceGraphs:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 availableServiceGraphs];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = [v3 availableServiceGraphs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(NSString **)(*((void *)&v15 + 1) + 8 * i);
        if (NSClassFromString(v12))
        {
          [v6 addObject:v12];
        }
        else
        {
          uint64_t v13 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "+[CDMServiceCenterUtils getAvailableServiceGraphs:]";
            __int16 v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v9);
  }

  return v6;
}

void __41__CDMServiceCenterUtils_isHostedInDaemon__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  isHostedInDaemon_isHostedInDaemon = 0;
  v0 = [MEMORY[0x263F08AB0] processInfo];
  v1 = [v0 processName];

  v2 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    id v4 = "+[CDMServiceCenterUtils isHostedInDaemon]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = v1;
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDM's ServiceCenter is hosted in process: %@", (uint8_t *)&v3, 0x16u);
  }

  isHostedInDaemon_isHostedInDaemon = [v1 isEqualToString:@"assistant_cdmd"];
}

+ (id)tryInitGraphServices:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v21 = v3;
  __int16 v5 = [v3 availableServiceGraphs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(NSString **)(*((void *)&v26 + 1) + 8 * i);
        Class v11 = NSClassFromString(v10);
        if (v11)
        {
          v12 = [(objc_class *)v11 requiredCDMGraphServices];
          [v4 unionSet:v12];
        }
        else
        {
          v12 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "+[CDMServiceCenterUtils tryInitGraphServices:]";
            __int16 v33 = 2112;
            v34 = v10;
            _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v7);
  }

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_alloc_init(*(Class *)(*((void *)&v22 + 1) + 8 * j));
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  return v13;
}

@end