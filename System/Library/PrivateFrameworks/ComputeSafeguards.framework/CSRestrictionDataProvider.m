@interface CSRestrictionDataProvider
- (BOOL)_isAKnownScenario:(id)a3;
- (CSRestrictionDataProvider)init;
- (NSDictionary)restrictionsByProcessForScenario;
- (NSDictionary)scenarios;
- (NSDictionary)scenariosMap;
- (NSSet)exemptProcesses;
- (NSSet)processes;
- (OS_os_log)logger;
- (id)_buildScenariosMap;
- (id)_exemptProcessesSetWithErrors:(id)a3;
- (id)_processesSetWithErrors:(id)a3;
- (id)_scenariosDictWithErrors:(id)a3;
- (id)_templatesByScenarioForProcess:(id)a3 errors:(id)a4;
- (id)configureRestrictionsFromTemplateDictionary:(id)a3 errors:(id)a4;
- (id)exemptProcessesSet;
- (id)processesSet;
- (id)restrictionsByProcessPerScenario;
- (id)scenariosDictionary;
- (void)_templatesByProcessWithErrors:(id)a3;
- (void)loadAllRestrictionsData;
- (void)setExemptProcesses:(id)a3;
- (void)setLogger:(id)a3;
- (void)setProcesses:(id)a3;
- (void)setRestrictionsByProcessForScenario:(id)a3;
- (void)setScenarios:(id)a3;
- (void)setScenariosMap:(id)a3;
@end

@implementation CSRestrictionDataProvider

- (CSRestrictionDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSRestrictionDataProvider;
  v2 = [(CSRestrictionDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CSLogger logForCategory:@"CSRestrictionDataProvider"];
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    [(CSRestrictionDataProvider *)v2 loadAllRestrictionsData];
  }
  return v2;
}

- (void)loadAllRestrictionsData
{
  id v3 = [MEMORY[0x263EFF980] array];
  [(CSRestrictionDataProvider *)self _templatesByProcessWithErrors:v3];
}

- (id)_processesSetWithErrors:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = 0;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEFAULT, "Loading processes.plist", (uint8_t *)&v22, 2u);
  }
  objc_super v6 = getCSProcesses();
  v7 = v6;
  if (v6)
  {
    v8 = CSArrayForKey(v6, @"processes");
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
      if (v9)
      {
        v10 = (void *)v9;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
        -[CSRestrictionDataProvider _processesSetWithErrors:]();
      }
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"Could not create processes set from plist"];
      v28[0] = v15;
      v16 = NSDictionary;
      v17 = (void **)v28;
      v18 = &v27;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
        -[CSRestrictionDataProvider _processesSetWithErrors:]();
      }
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"Processes array missing"];
      v26 = v15;
      v16 = NSDictionary;
      v17 = &v26;
      v18 = &v25;
    }
    v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    v20 = [v14 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v19];

    [v4 addObject:v20];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
      -[CSRestrictionDataProvider _processesSetWithErrors:]();
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08338];
    v12 = [NSString stringWithFormat:@"Processes plist failure"];
    v24 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v8 = [v11 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v13];

    [v4 addObject:v8];
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (id)_exemptProcessesSetWithErrors:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = 0;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEFAULT, "Loading exempt_processes.plist", (uint8_t *)&v22, 2u);
  }
  objc_super v6 = getCSExemptProcesses();
  v7 = v6;
  if (v6)
  {
    v8 = CSArrayForKey(v6, @"exempt_processes");
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
      if (v9)
      {
        v10 = (void *)v9;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
        -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:]();
      }
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"Could not create exempt_processes set from plist"];
      v28[0] = v15;
      v16 = NSDictionary;
      v17 = (void **)v28;
      v18 = &v27;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
        -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:]();
      }
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"Exempt Processes array missing"];
      v26 = v15;
      v16 = NSDictionary;
      v17 = &v26;
      v18 = &v25;
    }
    v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    v20 = [v14 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v19];

    [v4 addObject:v20];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
      -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:]();
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08338];
    v12 = [NSString stringWithFormat:@"Exempt Processes plist failure"];
    v24 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v8 = [v11 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v13];

    [v4 addObject:v8];
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)_isAKnownScenario:(id)a3
{
  id v3 = [(NSDictionary *)self->_scenarios objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_buildScenariosMap
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_scenarios;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_scenariosDictWithErrors:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = 0;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEFAULT, "Loading scenarios.plist", (uint8_t *)&v17, 2u);
  }
  uint64_t v6 = getCSScenarios();
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = CSDictionaryForKey(v6, @"scenarios");
    if (v8) {
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
      -[CSRestrictionDataProvider _scenariosDictWithErrors:]();
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08338];
    long long v10 = [NSString stringWithFormat:@"Scenarios dictionary missing"];
    v21[0] = v10;
    long long v11 = NSDictionary;
    long long v12 = (void **)v21;
    long long v13 = &v20;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
      -[CSRestrictionDataProvider _scenariosDictWithErrors:]();
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08338];
    long long v10 = [NSString stringWithFormat:@"Scenarios plist failure"];
    v19 = v10;
    long long v11 = NSDictionary;
    long long v12 = &v19;
    long long v13 = &v18;
  }
  v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  uint64_t v15 = [v9 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v14];

  [v4 addObject:v15];
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)configureRestrictionsFromTemplateDictionary:(id)a3 errors:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v31 = objc_alloc_init(CSScenarioRestrictionsAttributesTemplate);
  v32 = [MEMORY[0x263EFF980] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    uint64_t v35 = *MEMORY[0x263F08338];
    v33 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [v12 objectForKey:@"RestrictionType"];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = +[CSRestrictionFactory restrictionForClass:v13 withProperties:v12 errors:v7];
              if (v14)
              {
                [v32 addObject:v14];
LABEL_22:

                goto LABEL_23;
              }
              logger = self->_logger;
              if (os_log_type_enabled(logger, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v12;
                _os_log_fault_impl(&dword_24A698000, logger, OS_LOG_TYPE_FAULT, "Could not create restriction with properties: %@", buf, 0xCu);
              }
              uint64_t v25 = (void *)MEMORY[0x263F087E8];
              uint64_t v46 = v35;
              v26 = [NSString stringWithFormat:@"Could not create restriction with properties: %@.", v12];
              v47 = v26;
              uint64_t v27 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
              v28 = [v25 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:3 userInfo:v27];

              [v7 addObject:v28];
LABEL_21:
              self = v33;
              goto LABEL_22;
            }
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
              -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:](&v36, v37);
            }
            v21 = (void *)MEMORY[0x263F087E8];
            uint64_t v50 = v35;
            __int16 v22 = [NSString stringWithFormat:@"Expected string value type for key RestrictionType."];
            v51 = v22;
            uint64_t v23 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
            v14 = [v21 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:2 userInfo:v23];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
              -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:](&v38, v39);
            }
            uint64_t v18 = (void *)MEMORY[0x263F087E8];
            uint64_t v52 = v35;
            v19 = [NSString stringWithFormat:@"RestrictionType not found in ScenarioDescription dictionary."];
            v53 = v19;
            uint64_t v20 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
            v14 = [v18 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v20];
          }
          [v7 addObject:v14];
          goto LABEL_21;
        }
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
          -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:](&v40, v41);
        }
        uint64_t v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v54 = v35;
        v16 = [NSString stringWithFormat:@"ScenarioDescription is not a dictionary."];
        v55 = v16;
        __int16 v17 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        long long v13 = [v15 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:2 userInfo:v17];

        [v7 addObject:v13];
LABEL_23:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
      uint64_t v9 = v29;
    }
    while (v29);
  }

  [(CSScenarioRestrictionsAttributesTemplate *)v31 setRestrictions:v32];
  return v31;
}

- (id)_templatesByScenarioForProcess:(id)a3 errors:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263EFF9A0] dictionary];
  v53 = v6;
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = getCSProcessRestrictions((uint64_t)v6);
  uint64_t v9 = v8;
  if (v8)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v77 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0x263F08000uLL;
      uint64_t v13 = *(void *)v61;
      uint64_t v55 = *MEMORY[0x263F08338];
      uint64_t v49 = *(void *)v61;
      uint64_t v50 = v9;
      do
      {
        uint64_t v14 = 0;
        uint64_t v51 = v11;
        do
        {
          if (*(void *)v61 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v60 + 1) + 8 * v14);
          objc_opt_class();
          uint64_t v52 = v14;
          if (objc_opt_isKindOfClass())
          {
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v16 = v15;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v74 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v57;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v57 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    __int16 v22 = [(NSDictionary *)self->_scenariosMap objectForKeyedSubscript:v21];
                    logger = self->_logger;
                    if (v22)
                    {
                      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v69 = v22;
                        __int16 v70 = 2112;
                        v71 = v53;
                        _os_log_debug_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEBUG, "Reading restrictions for scenario: %@ for process: %@", buf, 0x16u);
                      }
                      v24 = CSArrayForKeyWithErrors(v16, v22, v7);
                      if (v24)
                      {
                        uint64_t v25 = [(CSRestrictionDataProvider *)self configureRestrictionsFromTemplateDictionary:v24 errors:v7];
                        [v54 setObject:v25 forKeyedSubscript:v22];
                      }
                    }
                    else
                    {
                      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v69 = 0;
                        __int16 v70 = 2114;
                        v71 = v53;
                        _os_log_error_impl(&dword_24A698000, logger, OS_LOG_TYPE_ERROR, "Unknown scenario: %{public}@ found in: %{public}@", buf, 0x16u);
                      }
                      v30 = (void *)MEMORY[0x263F087E8];
                      uint64_t v66 = v55;
                      v31 = [*(id *)(v12 + 2880) stringWithFormat:@"Scenario %@ not known", 0];
                      v67 = v31;
                      v32 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
                      v24 = [v30 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:4 userInfo:v32];

                      unint64_t v12 = 0x263F08000;
                      [v7 addObject:v24];
                    }
                  }
                  else
                  {
                    v26 = self->_logger;
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v69 = v53;
                      _os_log_fault_impl(&dword_24A698000, v26, OS_LOG_TYPE_FAULT, "Expected string value type for scenario name for process: %@", buf, 0xCu);
                    }
                    uint64_t v27 = (void *)MEMORY[0x263F087E8];
                    uint64_t v72 = v55;
                    v28 = [*(id *)(v12 + 2880) stringWithFormat:@"Expected string value type for scenario name"];
                    v73 = v28;
                    uint64_t v29 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
                    __int16 v22 = [v27 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:2 userInfo:v29];

                    unint64_t v12 = 0x263F08000;
                    [v7 addObject:v22];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v74 count:16];
              }
              while (v18);
              uint64_t v9 = v50;
              uint64_t v11 = v51;
              uint64_t v13 = v49;
            }
          }
          else
          {
            v33 = self->_logger;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = v53;
              _os_log_fault_impl(&dword_24A698000, v33, OS_LOG_TYPE_FAULT, "Expected dictionary value type for scenario items for process: %@", buf, 0xCu);
            }
            v34 = (void *)MEMORY[0x263F087E8];
            uint64_t v75 = v55;
            uint64_t v35 = [*(id *)(v12 + 2880) stringWithFormat:@"Expected dictionary value type for scenario items"];
            v76 = v35;
            char v36 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            id v16 = [v34 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:2 userInfo:v36];

            [v7 addObject:v16];
          }

          uint64_t v14 = v52 + 1;
        }
        while (v52 + 1 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v60 objects:v77 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v37 = self->_logger;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[CSRestrictionDataProvider _templatesByScenarioForProcess:errors:]((uint64_t)v6, v37, v38, v39, v40, v41, v42, v43);
    }
    long long v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08338];
    long long v45 = [NSString stringWithFormat:@"Restrictions plist failure for process: %@", v6];
    v65 = v45;
    uint64_t v46 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v47 = [v44 errorWithDomain:@"CSRestrictionDataProviderErrorDomain" code:1 userInfo:v46];

    [v7 addObject:v47];
  }

  return v54;
}

- (void)_templatesByProcessWithErrors:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEFAULT, "Loading Processes, ExemptProcesses, Scenarios and Restrictions", buf, 2u);
  }
  id v7 = [(CSRestrictionDataProvider *)self _processesSetWithErrors:v4];
  processes = self->_processes;
  self->_processes = v7;

  uint64_t v9 = self->_logger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:]((uint64_t)&self->_processes, v9, v10, v11, v12, v13, v14, v15);
  }
  id v16 = [(CSRestrictionDataProvider *)self _exemptProcessesSetWithErrors:v4];
  exemptProcesses = self->_exemptProcesses;
  self->_exemptProcesses = v16;

  uint64_t v18 = self->_logger;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:]((uint64_t)&self->_exemptProcesses, v18, v19, v20, v21, v22, v23, v24);
  }
  uint64_t v25 = [(CSRestrictionDataProvider *)self _scenariosDictWithErrors:v4];
  scenarios = self->_scenarios;
  self->_scenarios = v25;

  uint64_t v27 = self->_logger;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:]((uint64_t)&self->_scenarios, v27, v28, v29, v30, v31, v32, v33);
  }
  v34 = [(CSRestrictionDataProvider *)self _buildScenariosMap];
  scenariosMap = self->_scenariosMap;
  self->_scenariosMap = v34;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  char v36 = self->_processes;
  uint64_t v37 = [(NSSet *)v36 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v42 = -[CSRestrictionDataProvider _templatesByScenarioForProcess:errors:](self, "_templatesByScenarioForProcess:errors:", v41, v4, (void)v44);
        [(NSDictionary *)v5 setObject:v42 forKeyedSubscript:v41];
      }
      uint64_t v38 = [(NSSet *)v36 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v38);
  }

  restrictionsByProcessForScenario = self->_restrictionsByProcessForScenario;
  self->_restrictionsByProcessForScenario = v5;
}

- (id)exemptProcessesSet
{
  return self->_exemptProcesses;
}

- (id)processesSet
{
  return self->_processes;
}

- (id)scenariosDictionary
{
  return self->_scenarios;
}

- (id)restrictionsByProcessPerScenario
{
  return self->_restrictionsByProcessForScenario;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogger:(id)a3
{
}

- (NSSet)processes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcesses:(id)a3
{
}

- (NSSet)exemptProcesses
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExemptProcesses:(id)a3
{
}

- (NSDictionary)scenariosMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScenariosMap:(id)a3
{
}

- (NSDictionary)scenarios
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScenarios:(id)a3
{
}

- (NSDictionary)restrictionsByProcessForScenario
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRestrictionsByProcessForScenario:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionsByProcessForScenario, 0);
  objc_storeStrong((id *)&self->_scenarios, 0);
  objc_storeStrong((id *)&self->_scenariosMap, 0);
  objc_storeStrong((id *)&self->_exemptProcesses, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)_processesSetWithErrors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Processes plist failure", v2, v3, v4, v5, v6);
}

- (void)_processesSetWithErrors:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Processes array missing", v2, v3, v4, v5, v6);
}

- (void)_processesSetWithErrors:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Could not create processes set from plist", v2, v3, v4, v5, v6);
}

- (void)_exemptProcessesSetWithErrors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Exempt Processes plist failure", v2, v3, v4, v5, v6);
}

- (void)_exemptProcessesSetWithErrors:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Exempt Processes array missing", v2, v3, v4, v5, v6);
}

- (void)_exemptProcessesSetWithErrors:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Could not create exempt_processes set from plist", v2, v3, v4, v5, v6);
}

- (void)_scenariosDictWithErrors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "Scenarios plist failure", v2, v3, v4, v5, v6);
}

- (void)_scenariosDictWithErrors:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A698000, v0, v1, "scenarios dictionary missing", v2, v3, v4, v5, v6);
}

- (void)configureRestrictionsFromTemplateDictionary:(unsigned char *)a1 errors:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_4_0(&dword_24A698000, v2, v3, "RestrictionType not found in ScenarioDescription dictionary", v4);
}

- (void)configureRestrictionsFromTemplateDictionary:(unsigned char *)a1 errors:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_4_0(&dword_24A698000, v2, v3, "Expected string value type for key RestrictionType", v4);
}

- (void)configureRestrictionsFromTemplateDictionary:(unsigned char *)a1 errors:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_4_0(&dword_24A698000, v2, v3, "ScenarioDescription array does not contains elements of type dictionary", v4);
}

- (void)_templatesByScenarioForProcess:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end