@interface GEOAPUploadPolicies
+ (id)sharedPolicies;
- (GEOAPUploadPolicies)init;
- (double)ttlForUploadPolicyType:(int)a3;
- (id)uploadPolicyForUploadPolicyType:(int)a3;
- (void)_updatePolicyConfigForUploadPolicyConfigType:(int)a3 configKey:(id)a4;
@end

@implementation GEOAPUploadPolicies

+ (id)sharedPolicies
{
  if (qword_26B201BF8 != -1) {
    dispatch_once(&qword_26B201BF8, &__block_literal_global_19);
  }
  v2 = (void *)qword_26B201BF0;
  return v2;
}

void __55__GEOAPUploadPolicies_uploadPolicyForUploadPolicyType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)uploadPolicyForUploadPolicyType:(int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  isoQueue = self->_isoQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__GEOAPUploadPolicies_uploadPolicyForUploadPolicyType___block_invoke;
  block[3] = &unk_26534A240;
  block[4] = self;
  block[5] = &v8;
  int v7 = a3;
  dispatch_sync(isoQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __37__GEOAPUploadPolicies_sharedPolicies__block_invoke()
{
  qword_26B201BF0 = objc_alloc_init(GEOAPUploadPolicies);
  return MEMORY[0x270F9A758]();
}

- (GEOAPUploadPolicies)init
{
  v44.receiver = self;
  v44.super_class = (Class)GEOAPUploadPolicies;
  v2 = [(GEOAPUploadPolicies *)&v44 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create();
    isoQueue = v2->_isoQueue;
    v2->_isoQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    policyDict = v2->_policyDict;
    v2->_policyDict = v5;

    int v7 = v2->_isoQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__GEOAPUploadPolicies_init__block_invoke;
    block[3] = &unk_2653454E0;
    uint64_t v8 = v2;
    v43 = v8;
    dispatch_async(v7, block);
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    configListeners = v8->_configListeners;
    v8->_configListeners = (NSMutableArray *)v9;

    v11 = v8->_configListeners;
    v41 = v8;
    v12 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v11 addObject:v12];

    id v13 = v8->_configListeners;
    v40 = v41;
    v14 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v13 addObject:v14];

    v15 = v8->_configListeners;
    v39 = v40;
    v16 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v15 addObject:v16];

    v17 = v8->_configListeners;
    v38 = v39;
    v18 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v17 addObject:v18];

    v19 = v8->_configListeners;
    v37 = v38;
    v20 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v19 addObject:v20];

    v21 = v8->_configListeners;
    v36 = v37;
    v22 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v21 addObject:v22];

    v23 = v8->_configListeners;
    v35 = v36;
    v24 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v23 addObject:v24];

    v25 = v8->_configListeners;
    v34 = v35;
    v26 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v25 addObject:v26];

    v27 = v8->_configListeners;
    v33 = v34;
    v28 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v27 addObject:v28];

    v29 = v8->_configListeners;
    id v32 = v33;
    v30 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v29 addObject:v30];
  }
  return v2;
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 1, GeoAnalyticsUploadPolicyConfig_LOW_COST_7D_config, off_269A95F68);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 2, GeoAnalyticsUploadPolicyConfig_MED_COST_7D_config, off_269A95F78);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 3, GeoAnalyticsUploadPolicyConfig_HIGH_COST_7D_config, off_269A95F58);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 4, GeoAnalyticsUploadPolicyConfig_HIGHEST_COST_7D_config, off_269A95F48);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 5, GeoAnalyticsUploadPolicyConfig_MED_COST_90D_config, off_269A95F88);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 6, GeoAnalyticsUploadPolicyConfig_UP_POLICY_00_config, off_269A95F98);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 7, GeoAnalyticsUploadPolicyConfig_UP_POLICY_01_config, off_269A95FA8);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 8, GeoAnalyticsUploadPolicyConfig_UP_POLICY_02_config, off_269A95FB8);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 9, GeoAnalyticsUploadPolicyConfig_UP_POLICY_03_config, off_269A95FC8);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = GeoAnalyticsUploadPolicyConfig_POI_BUSYNESS_POLICY_config;
  id v4 = off_269A963C8;
  return objc_msgSend(v2, "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 10, v3, v4);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 1, GeoAnalyticsUploadPolicyConfig_LOW_COST_7D_config, off_269A95F68);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 2, GeoAnalyticsUploadPolicyConfig_MED_COST_7D_config, off_269A95F78);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 3, GeoAnalyticsUploadPolicyConfig_HIGH_COST_7D_config, off_269A95F58);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 4, GeoAnalyticsUploadPolicyConfig_HIGHEST_COST_7D_config, off_269A95F48);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 5, GeoAnalyticsUploadPolicyConfig_MED_COST_90D_config, off_269A95F88);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 6, GeoAnalyticsUploadPolicyConfig_UP_POLICY_00_config, off_269A95F98);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 7, GeoAnalyticsUploadPolicyConfig_UP_POLICY_01_config, off_269A95FA8);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 8, GeoAnalyticsUploadPolicyConfig_UP_POLICY_02_config, off_269A95FB8);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 9, GeoAnalyticsUploadPolicyConfig_UP_POLICY_03_config, off_269A95FC8);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 10, GeoAnalyticsUploadPolicyConfig_POI_BUSYNESS_POLICY_config, off_269A963C8);
}

- (void)_updatePolicyConfigForUploadPolicyConfigType:(int)a3 configKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v61 = *MEMORY[0x263EF8340];
  v5 = objc_alloc_init(GEOAPUploadPolicy);
  unsigned int v46 = v4;
  [(GEOAPUploadPolicy *)v5 setType:v4];
  uint64_t v6 = [(GEOAPUploadPolicy *)v5 type];
  if (v6 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v7 = off_26534A260[(int)v6];
  }
  uint64_t v8 = GEOConfigGetDictionary();
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ttl"];
  unint64_t v10 = 0x263F08000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = GEOGetUploadPoliciesAnalyticsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_ERROR, "'ttl' not set for %@ upload policy (using default value)", buf, 0xCu);
    }

    uint64_t v9 = &unk_270162B48;
  }
  [v9 doubleValue];
  -[GEOAPUploadPolicy setTtl:](v5, "setTtl:");
  v12 = [v8 objectForKeyedSubscript:@"immediately"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = GEOGetUploadPoliciesAnalyticsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_24FE56000, v13, OS_LOG_TYPE_ERROR, "'immediately' not set for %@ upload policy (using default value)", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x263EFFA80];
  }
  -[GEOAPUploadPolicy setSendImmediately:](v5, "setSendImmediately:", [v12 BOOLValue]);
  v14 = [v8 objectForKeyedSubscript:@"stages"];
  objc_opt_class();
  v43 = v9;
  objc_super v44 = v8;
  v42 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = GEOGetUploadPoliciesAnalyticsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_24FE56000, v15, OS_LOG_TYPE_ERROR, "bad upload stages for %@ upload policy (must be an array of dictionaries)", buf, 0xCu);
    }

    v14 = 0;
  }
  v47 = v5;
  id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v17)
  {
    v49 = 0;
    v51 = 0;
    goto LABEL_56;
  }
  uint64_t v18 = v17;
  v49 = 0;
  v51 = 0;
  uint64_t v19 = *(void *)v53;
  v50 = v7;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v53 != v19) {
        objc_enumerationMutation(v16);
      }
      v21 = *(void **)(*((void *)&v52 + 1) + 8 * v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [v21 objectForKeyedSubscript:@"ttl"];
        uint64_t v23 = [v21 objectForKeyedSubscript:@"type"];
        v24 = (void *)v23;
        if (v22) {
          BOOL v25 = v23 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        if (v25)
        {
          v26 = GEOGetUploadPoliciesAnalyticsLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v7;
            v27 = v26;
            v28 = "bad upload stage in %@ upload policy (missing \"ttl\" or \"type\" keys)";
            goto LABEL_38;
          }
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v30 = [v24 intValue];
              v31 = +[GEOAPURLSessionConfig configForURLSessionConfigType:v30];

              if ([v31 type])
              {
                [v22 doubleValue];
                if (v32 <= 0.0)
                {
                  if (v30 >= 7)
                  {
                    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
                    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v35 = off_26534A2C0[(int)v30];
                  }
                  v36 = GEOGetUploadPoliciesAnalyticsLog();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v57 = v35;
                    __int16 v58 = 2112;
                    v59 = v50;
                    _os_log_impl(&dword_24FE56000, v36, OS_LOG_TYPE_ERROR, "bad upload stage %@ in %@ upload policy (ttl is <= 0)", buf, 0x16u);
                  }
                }
                else
                {
                  v33 = [[GEOAPUploadStage alloc] initWithURLSessionConfig:v31 ttl:v32];

                  [v48 addObject:v33];
                  v49 = v33;
                }
              }
              else
              {
                v34 = GEOGetUploadPoliciesAnalyticsLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = v50;
                  __int16 v58 = 1024;
                  LODWORD(v59) = v30;
                  _os_log_impl(&dword_24FE56000, v34, OS_LOG_TYPE_ERROR, "bad upload stage in %@ upload policy (unknown session config type %d)", buf, 0x12u);
                }
              }
              v51 = v31;
              int v7 = v50;
              unint64_t v10 = 0x263F08000;
              goto LABEL_40;
            }
          }
          v26 = GEOGetUploadPoliciesAnalyticsLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v7;
            v27 = v26;
            v28 = "bad upload stage in %@ upload policy (ttl and type must be of type NSNumber)";
LABEL_38:
            _os_log_impl(&dword_24FE56000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
          }
        }

LABEL_40:
        goto LABEL_41;
      }
      v22 = GEOGetUploadPoliciesAnalyticsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v7;
        _os_log_impl(&dword_24FE56000, v22, OS_LOG_TYPE_ERROR, "bad upload stage in %@ upload policy (stage must be a dictionary)", buf, 0xCu);
      }
LABEL_41:

      ++v20;
    }
    while (v18 != v20);
    uint64_t v37 = [v16 countByEnumeratingWithState:&v52 objects:v60 count:16];
    uint64_t v18 = v37;
  }
  while (v37);
LABEL_56:

  if (![v48 count])
  {
    if (qword_26B201C00 != -1) {
      dispatch_once(&qword_26B201C00, &__block_literal_global_118_1);
    }
    [v48 addObject:qword_26B201C08];
    v38 = GEOGetUploadPoliciesAnalyticsLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_24FE56000, v38, OS_LOG_TYPE_ERROR, "no upload stages declared for %@ upload policy; applying default upload stage",
        buf,
        0xCu);
    }
  }
  v39 = (void *)[v48 copy];
  [(GEOAPUploadPolicy *)v47 setUploadStages:v39];

  policyDict = self->_policyDict;
  v41 = [*(id *)(v10 + 2584) numberWithInt:v46];
  [(NSMutableDictionary *)policyDict setObject:v47 forKeyedSubscript:v41];
}

void __78__GEOAPUploadPolicies__updatePolicyConfigForUploadPolicyConfigType_configKey___block_invoke()
{
  id v2 = +[GEOAPURLSessionConfig configForURLSessionConfigType:5];
  v0 = [[GEOAPUploadStage alloc] initWithURLSessionConfig:v2 ttl:604800.0];
  v1 = (void *)qword_26B201C08;
  qword_26B201C08 = (uint64_t)v0;
}

- (double)ttlForUploadPolicyType:(int)a3
{
  uint64_t v3 = [(GEOAPUploadPolicies *)self uploadPolicyForUploadPolicyType:*(void *)&a3];
  [v3 ttl];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configListeners, 0);
  objc_storeStrong((id *)&self->_policyDict, 0);
  objc_storeStrong((id *)&self->_isoQueue, 0);
}

@end