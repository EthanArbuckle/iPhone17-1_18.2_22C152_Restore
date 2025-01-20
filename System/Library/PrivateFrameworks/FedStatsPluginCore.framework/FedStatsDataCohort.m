@interface FedStatsDataCohort
+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4;
+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6;
+ (id)sharedInstance;
- (FedStatsDataCohort)init;
- (NSDictionary)namespaceMap;
@end

@implementation FedStatsDataCohort

- (FedStatsDataCohort)init
{
  v8.receiver = self;
  v8.super_class = (Class)FedStatsDataCohort;
  v2 = [(FedStatsDataCohort *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"FedStatsCohortAllowList" ofType:@"plist"];

    uint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:v4];
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = (NSDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__FedStatsDataCohort_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_282 != -1) {
    dispatch_once(&sharedInstance_onceToken_282, block);
  }
  v2 = (void *)sharedInstance_sharedDataCohortInstance;
  return v2;
}

uint64_t __36__FedStatsDataCohort_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedDataCohortInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[FedStatsDataCohort sharedInstance];
  objc_super v8 = [v7 namespaceMap];
  v9 = [v8 objectForKey:v6];

  if (v9) {
    char v10 = [v9 containsObject:v5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v36 = a5;
  v11 = +[FedStatsDataCohort sharedInstance];
  v12 = [v11 namespaceMap];
  uint64_t v13 = [v12 objectForKey:v10];

  v37 = (void *)v13;
  if (v13)
  {
    v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      v18 = v14;
      v32 = v11;
      id v33 = v9;
      id v34 = v10;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
        if (([v37 containsObject:v20] & 1) == 0) {
          break;
        }
        v21 = +[FedStatsCohortFactory cohortQueryFieldByName:v20];
        if (!v21)
        {
          v11 = v32;
          id v9 = v33;
          id v10 = v34;
          if (a6)
          {
            [NSString stringWithFormat:@"\"%@\" cohort is not implemented.", v20, v31];
            v29 = LABEL_25:;
            *a6 = +[FedStatsPluginError errorWithCode:300 description:v29];

            v14 = v18;
          }
          goto LABEL_26;
        }
        v22 = v21;
        id v38 = 0;
        v23 = [v21 cohortKeyForParameters:v36 possibleError:&v38];
        id v24 = v38;
        v25 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v44 = v20;
          __int16 v45 = 2112;
          id v46 = v23;
          __int16 v47 = 2112;
          id v48 = v34;
          _os_log_debug_impl(&dword_24DF73000, v25, OS_LOG_TYPE_DEBUG, "cohortName:cohortKey => %@=%@ for namespace %@", buf, 0x20u);
        }

        if (v24)
        {
          v26 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = v20;
            __int16 v45 = 2112;
            id v46 = v24;
            _os_log_debug_impl(&dword_24DF73000, v26, OS_LOG_TYPE_DEBUG, "\"%@\" cohort error while creating the key: %@", buf, 0x16u);
          }
        }
        v14 = v18;
        [v18 addObject:v23];

        if (v16 == ++v19)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
          v11 = v32;
          id v9 = v33;
          id v10 = v34;
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      v11 = v32;
      id v9 = v33;
      id v10 = v34;
      if (a6)
      {
        [NSString stringWithFormat:@"\"%@\" cohort is not approved for \"%@\" namespace.", v20, v34];
        goto LABEL_25;
      }
LABEL_26:

      v27 = 0;
      goto LABEL_27;
    }
LABEL_17:

    v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v14];
LABEL_27:
  }
  else
  {
    if (a6)
    {
      v28 = [NSString stringWithFormat:@"\"%@\" namespace is invalid.", v10];
      *a6 = +[FedStatsPluginError errorWithCode:300 description:v28];
    }
    v27 = 0;
  }

  return v27;
}

- (NSDictionary)namespaceMap
{
  return self->_namespaceMap;
}

- (void).cxx_destruct
{
}

@end