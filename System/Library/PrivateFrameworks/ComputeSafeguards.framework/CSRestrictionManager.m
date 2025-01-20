@interface CSRestrictionManager
+ (id)sharedInstanceWithDataProvider:(id)a3;
- (BOOL)applyDefaultRestrictionsToProcess:(id)a3;
- (BOOL)applyRestrictionsToProcess:(id)a3 forScenario:(id)a4;
- (CSProcessManager)processManager;
- (CSRestriction)defaultRestriction;
- (CSRestrictionDataProviding)dataProvider;
- (CSScenarioManager)scenarioManager;
- (NSDictionary)restrictionsByProcessPerScenario;
- (NSMutableDictionary)currentRestrictionsByProcess;
- (NSMutableDictionary)processesAffectedByScenarioMap;
- (NSMutableSet)monitors;
- (NSSet)currentActiveScenarios;
- (OS_os_log)logger;
- (id)_initWithDataProvider:(id)a3;
- (id)determineScenarioForProcess:(id)a3;
- (void)currentActiveScenarios:(id)a3 previousActiveScenarios:(id)a4;
- (void)observeNewRunningProcesses:(id)a3;
- (void)observeProcessChanges;
- (void)populateScenarios;
- (void)queueChangeForActivatedScenarios:(id)a3 deactivatedScenarios:(id)a4;
- (void)setCurrentActiveScenarios:(id)a3;
- (void)setCurrentRestrictionsByProcess:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDefaultRestriction:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setProcessManager:(id)a3;
- (void)setProcessesAffectedByScenarioMap:(id)a3;
- (void)setRestrictionsByProcessPerScenario:(id)a3;
- (void)setScenarioManager:(id)a3;
- (void)traverseRestrictionsData;
@end

@implementation CSRestrictionManager

- (BOOL)applyRestrictionsToProcess:(id)a3 forScenario:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSProcessManager *)self->_processManager processForIdentifier:v6];
  BOOL v9 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v9) {
      -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.7();
    }
    v10 = [(NSDictionary *)self->_restrictionsByProcessPerScenario objectForKey:v6];

    if (v10)
    {
      v11 = [(NSDictionary *)self->_restrictionsByProcessPerScenario objectForKeyedSubscript:v6];
      v12 = [v11 objectForKey:v7];

      if (v12)
      {
        v13 = [(NSDictionary *)self->_restrictionsByProcessPerScenario objectForKeyedSubscript:v6];
        v14 = [v13 objectForKeyedSubscript:v7];
        uint64_t v15 = [v14 restrictions];

        v40 = (void *)v15;
        v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
        v17 = [(NSMutableDictionary *)self->_currentRestrictionsByProcess objectForKey:v6];
        v41 = v16;
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 isEqualToSet:v17])
          {
            logger = self->_logger;
            BOOL v19 = 1;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v53 = v6;
              __int16 v54 = 2112;
              id v55 = v7;
              _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Restrictions are unchanged for process:%@ for scenario:%@", buf, 0x16u);
            }
LABEL_52:

            goto LABEL_53;
          }
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          v39 = v17;
          id v20 = v17;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            id v23 = v7;
            uint64_t v24 = *(void *)v47;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v47 != v24) {
                  objc_enumerationMutation(v20);
                }
                if (([*(id *)(*((void *)&v46 + 1) + 8 * i) releaseForProcess:v8] & 1) == 0)
                {
                  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
                    -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.6();
                  }
                  BOOL v19 = 0;
                  goto LABEL_31;
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v51 count:16];
              if (v22) {
                continue;
              }
              break;
            }
            BOOL v19 = 1;
LABEL_31:
            id v7 = v23;
            v16 = v41;
          }
          else
          {
            BOOL v19 = 1;
          }
        }
        else
        {
          v39 = 0;
          BOOL v19 = 1;
        }
        currentRestrictionsByProcess = self->_currentRestrictionsByProcess;
        v27 = [MEMORY[0x263EFF9C0] set];
        [(NSMutableDictionary *)currentRestrictionsByProcess setObject:v27 forKey:v6];

        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
          -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.5();
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v28 = v16;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          id v38 = v7;
          uint64_t v31 = *(void *)v43;
          while (2)
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v43 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              char v34 = objc_msgSend(v33, "applyToProcess:", v8, v38);
              v35 = self->_logger;
              if ((v34 & 1) == 0)
              {
                if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
                  -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.4();
                }
                BOOL v19 = 0;
                goto LABEL_50;
              }
              if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v53 = v33;
                __int16 v54 = 2112;
                id v55 = v6;
                _os_log_impl(&dword_24A698000, v35, OS_LOG_TYPE_INFO, "Successfully applied restriction: %@ to process: %@", buf, 0x16u);
              }
              v36 = [(NSMutableDictionary *)self->_currentRestrictionsByProcess objectForKeyedSubscript:v6];
              [v36 addObject:v33];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          BOOL v19 = 1;
LABEL_50:
          id v7 = v38;
        }

        v16 = v41;
        v17 = v39;
        goto LABEL_52;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        -[CSRestrictionManager applyRestrictionsToProcess:forScenario:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      -[CSRestrictionManager applyRestrictionsToProcess:forScenario:]();
    }
  }
  else if (v9)
  {
    -[CSRestrictionManager applyRestrictionsToProcess:forScenario:]();
  }
  BOOL v19 = 0;
LABEL_53:

  return v19;
}

- (void)observeNewRunningProcesses:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = -[CSRestrictionManager determineScenarioForProcess:](self, "determineScenarioForProcess:", v10, v13);
        if (v11)
        {
          [(CSRestrictionManager *)self applyRestrictionsToProcess:v10 forScenario:v11];
        }
        else
        {
          v12 = [(CSRestrictionManager *)self logger];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v10;
            _os_log_impl(&dword_24A698000, v12, OS_LOG_TYPE_INFO, "No scenarios available for process: %@. Proceeding to apply default policy.", buf, 0xCu);
          }

          [(CSRestrictionManager *)self applyDefaultRestrictionsToProcess:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)applyDefaultRestrictionsToProcess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSProcessManager *)self->_processManager processForIdentifier:v4];
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    -[CSRestrictionManager applyDefaultRestrictionsToProcess:].cold.4();
  }
  long long v6 = [(NSMutableDictionary *)self->_currentRestrictionsByProcess objectForKey:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        -[CSRestrictionManager applyDefaultRestrictionsToProcess:]();
      }
      char v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    currentRestrictionsByProcess = self->_currentRestrictionsByProcess;
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)currentRestrictionsByProcess setObject:v10 forKey:v4];
  }
  char v8 = [(CSRestriction *)self->_defaultRestriction applyToProcess:v5];
  logger = self->_logger;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      -[CSRestrictionManager applyDefaultRestrictionsToProcess:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    [(CSRestrictionManager *)&self->_defaultRestriction applyDefaultRestrictionsToProcess:logger];
  }
  v12 = [(NSMutableDictionary *)self->_currentRestrictionsByProcess objectForKeyedSubscript:v4];
  [v12 addObject:self->_defaultRestriction];

LABEL_15:
  return v8;
}

- (id)determineScenarioForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFF9C0];
  long long v6 = [(NSDictionary *)self->_restrictionsByProcessPerScenario objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allKeys];
  char v8 = [v5 setWithArray:v7];

  [v8 intersectSet:self->_currentActiveScenarios];
  if ([v8 count] == 1)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      -[CSRestrictionManager determineScenarioForProcess:]();
    }
    BOOL v9 = [v8 anyObject];
  }
  else
  {
    BOOL v9 = [v8 anyObject];
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      -[CSRestrictionManager determineScenarioForProcess:]();
    }
  }

  return v9;
}

- (void)applyDefaultRestrictionsToProcess:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24A698000, v0, v1, "Failed to apply default restrictions to process:%@ (restrictions already exists)", v2, v3, v4, v5, v6);
}

- (void)determineScenarioForProcess:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24A698000, v0, v1, "Picking scenario for process:%@ at random from multiple options.", v2, v3, v4, v5, v6);
}

- (void)applyDefaultRestrictionsToProcess:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_24A698000, a2, a3, "Failed to apply default restriction:%@ to process:%@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

+ (id)sharedInstanceWithDataProvider:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CSRestrictionManager_sharedInstanceWithDataProvider___block_invoke;
  block[3] = &unk_26528B0A8;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithDataProvider__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithDataProvider__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithDataProvider___sharedInstance;

  return v6;
}

uint64_t __55__CSRestrictionManager_sharedInstanceWithDataProvider___block_invoke(uint64_t a1)
{
  sharedInstanceWithDataProvider___sharedInstance = [[CSRestrictionManager alloc] _initWithDataProvider:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (id)_initWithDataProvider:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSRestrictionManager;
  id v6 = [(CSRestrictionManager *)&v30 init];
  if (v6)
  {
    uint64_t v7 = +[CSLogger logForCategory:@"CSRestrictionManager"];
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
    uint64_t v9 = +[CSScenarioManager sharedInstance];
    scenarioManager = v6->_scenarioManager;
    v6->_scenarioManager = (CSScenarioManager *)v9;

    v11 = [(CSRestrictionDataProviding *)v6->_dataProvider processesSet];
    v12 = [(CSRestrictionDataProviding *)v6->_dataProvider exemptProcessesSet];
    uint64_t v13 = +[CSProcessManager sharedInstanceWithEnrolledProcesses:v11 andExemptions:v12];
    processManager = v6->_processManager;
    v6->_processManager = (CSProcessManager *)v13;

    uint64_t v15 = [(CSRestrictionDataProviding *)v6->_dataProvider restrictionsByProcessPerScenario];
    restrictionsByProcessPerScenario = v6->_restrictionsByProcessPerScenario;
    v6->_restrictionsByProcessPerScenario = (NSDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    processesAffectedByScenarioMap = v6->_processesAffectedByScenarioMap;
    v6->_processesAffectedByScenarioMap = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    monitors = v6->_monitors;
    v6->_monitors = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    currentRestrictionsByProcess = v6->_currentRestrictionsByProcess;
    v6->_currentRestrictionsByProcess = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    currentActiveScenarios = v6->_currentActiveScenarios;
    v6->_currentActiveScenarios = (NSSet *)v23;

    [(CSRestrictionManager *)v6 populateScenarios];
    [(CSRestrictionManager *)v6 observeProcessChanges];
    [(CSRestrictionManager *)v6 traverseRestrictionsData];
    v25 = [MEMORY[0x263EFF980] array];
    uint64_t v26 = +[CSRestrictionFactory restrictionForClass:@"CPUTimeRestrictionBand" withProperties:&unk_26FE34A78 errors:v25];
    defaultRestriction = v6->_defaultRestriction;
    v6->_defaultRestriction = (CSRestriction *)v26;

    id v28 = v6;
  }

  return v6;
}

- (void)traverseRestrictionsData
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_restrictionsByProcessPerScenario;
  uint64_t v16 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v5 = [(NSDictionary *)self->_restrictionsByProcessPerScenario objectForKeyedSubscript:v4];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v18 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              v11 = [(NSMutableDictionary *)self->_processesAffectedByScenarioMap objectForKey:v10];

              if (!v11)
              {
                v12 = [MEMORY[0x263EFF9C0] set];
                [(NSMutableDictionary *)self->_processesAffectedByScenarioMap setObject:v12 forKeyedSubscript:v10];
              }
              uint64_t v13 = [(NSMutableDictionary *)self->_processesAffectedByScenarioMap objectForKeyedSubscript:v10];
              [v13 addObject:v4];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v7);
        }
      }
      uint64_t v16 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)populateScenarios
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(CSRestrictionDataProviding *)self->_dataProvider scenariosDictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v3, "objectForKey:", v9, v13);
        if (v10)
        {
          v11 = +[CSScenarioFactory scenarioForIdentifier:v9 withProperties:v10];
          [(CSScenarioManager *)self->_scenarioManager registerScenario:v11];
        }
        else
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v9;
            _os_log_fault_impl(&dword_24A698000, logger, OS_LOG_TYPE_FAULT, "Encountered nil scenarioDescription for scenarioIdentifier:%@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
  [(CSScenarioManager *)self->_scenarioManager addObserver:self];
  [(CSScenarioManager *)self->_scenarioManager evaluateScenariosPostInit];
}

- (void)observeProcessChanges
{
}

- (void)queueChangeForActivatedScenarios:(id)a3 deactivatedScenarios:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Queueing change for activated scenarios:%@ to be re-revaluated after some debounce", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v9 = dispatch_time(0, 20000000000);
  uint64_t v10 = getMainQueue();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke;
  v13[3] = &unk_26528B0D0;
  id v14 = v6;
  id v11 = v6;
  objc_copyWeak(&v17, (id *)buf);
  id v15 = v7;
  long long v16 = self;
  id v12 = v7;
  dispatch_after(v9, v10, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke(id *a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v53 = [MEMORY[0x263EFF9C0] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v67;
    *(void *)&long long v4 = 138412290;
    long long v52 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v67 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained(a1 + 7);
        uint64_t v10 = [WeakRetained currentActiveScenarios];
        int v11 = [v10 containsObject:v8];

        id v12 = objc_loadWeakRetained(a1 + 7);
        long long v13 = [v12 logger];

        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v11)
        {
          if (v14)
          {
            *(_DWORD *)buf = v52;
            uint64_t v74 = v8;
            _os_log_debug_impl(&dword_24A698000, v13, OS_LOG_TYPE_DEBUG, "Scenario %@ is still active.", buf, 0xCu);
          }

          [v53 addObject:v8];
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = v52;
            uint64_t v74 = v8;
            _os_log_debug_impl(&dword_24A698000, v13, OS_LOG_TYPE_DEBUG, "Scenario %@ no longer active, ignoring.", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v5);
  }

  id v15 = objc_loadWeakRetained(a1 + 7);
  long long v16 = [v15 logger];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_4();
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v17 = a1[5];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v63;
    *(void *)&long long v19 = 138412290;
    long long v52 = v19;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v63 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        id v24 = objc_loadWeakRetained(a1 + 7);
        v25 = [v24 currentActiveScenarios];
        char v26 = [v25 containsObject:v23];

        id v27 = objc_loadWeakRetained(a1 + 7);
        id v28 = [v27 logger];

        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        if (v26)
        {
          if (v29)
          {
            *(_DWORD *)buf = v52;
            uint64_t v74 = v23;
            _os_log_debug_impl(&dword_24A698000, v28, OS_LOG_TYPE_DEBUG, "Scenario %@ no longer deactive, ignoring.", buf, 0xCu);
          }
        }
        else
        {
          if (v29)
          {
            *(_DWORD *)buf = v52;
            uint64_t v74 = v23;
            _os_log_debug_impl(&dword_24A698000, v28, OS_LOG_TYPE_DEBUG, "Scenario %@ is still inactive.", buf, 0xCu);
          }

          [v53 addObject:v23];
        }
      }
      uint64_t v20 = [v17 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v20);
  }

  id v30 = objc_loadWeakRetained(a1 + 7);
  uint64_t v31 = [v30 logger];

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_3();
  }

  v32 = [MEMORY[0x263EFF9C0] set];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v33 = v53;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * k);
        v39 = objc_msgSend(a1[6], "processesAffectedByScenarioMap", v52);
        v40 = [v39 objectForKeyedSubscript:v38];
        [v32 unionSet:v40];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v35);
  }

  id v41 = objc_loadWeakRetained(a1 + 7);
  long long v42 = [v41 logger];

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_2();
  }

  id v43 = objc_loadWeakRetained(a1 + 7);
  long long v44 = [v43 logger];

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_1(v44);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v45 = v32;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v54 + 1) + 8 * m);
        v51 = objc_msgSend(a1[6], "determineScenarioForProcess:", v50, v52);
        if (v51) {
          [a1[6] applyRestrictionsToProcess:v50 forScenario:v51];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v54 objects:v70 count:16];
    }
    while (v47);
  }
}

- (void)currentActiveScenarios:(id)a3 previousActiveScenarios:(id)a4
{
  objc_storeStrong((id *)&self->_currentActiveScenarios, a3);
  id v7 = a3;
  id v8 = a4;
  id v10 = [MEMORY[0x263EFF9C0] setWithSet:v7];
  [v10 minusSet:v8];
  dispatch_time_t v9 = [MEMORY[0x263EFF9C0] setWithSet:v8];

  [v9 minusSet:v7];
  [(CSRestrictionManager *)self queueChangeForActivatedScenarios:v10 deactivatedScenarios:v9];
}

- (void)setLogger:(id)a3
{
}

- (CSRestrictionDataProviding)dataProvider
{
  return (CSRestrictionDataProviding *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataProvider:(id)a3
{
}

- (CSScenarioManager)scenarioManager
{
  return (CSScenarioManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScenarioManager:(id)a3
{
}

- (CSProcessManager)processManager
{
  return (CSProcessManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessManager:(id)a3
{
}

- (NSDictionary)restrictionsByProcessPerScenario
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRestrictionsByProcessPerScenario:(id)a3
{
}

- (NSMutableDictionary)processesAffectedByScenarioMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessesAffectedByScenarioMap:(id)a3
{
}

- (NSMutableDictionary)currentRestrictionsByProcess
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentRestrictionsByProcess:(id)a3
{
}

- (NSSet)currentActiveScenarios
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentActiveScenarios:(id)a3
{
}

- (NSMutableSet)monitors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMonitors:(id)a3
{
}

- (CSRestriction)defaultRestriction
{
  return (CSRestriction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultRestriction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultRestriction, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_currentActiveScenarios, 0);
  objc_storeStrong((id *)&self->_currentRestrictionsByProcess, 0);
  objc_storeStrong((id *)&self->_processesAffectedByScenarioMap, 0);
  objc_storeStrong((id *)&self->_restrictionsByProcessPerScenario, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_scenarioManager, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)applyRestrictionsToProcess:forScenario:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Could not locate object corresponding to processName:%@", v2, v3, v4, v5, v6);
}

- (void)applyRestrictionsToProcess:forScenario:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24A698000, v0, v1, "Could not locate Process: %@ in _restrictionsByProcessPerScenario", v2, v3, v4, v5, v6);
}

- (void)applyRestrictionsToProcess:forScenario:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24A698000, v0, v1, "Could not locate Scenario:%@ for Process:%@ in _restrictionsByProcessPerScenario");
}

- (void)applyRestrictionsToProcess:forScenario:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24A698000, v0, v1, "Failed to apply restriction:%@ to process:%@, skipping any further restrictions");
}

- (void)applyRestrictionsToProcess:forScenario:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24A698000, v0, v1, "Applying restrictions:%@ to process:%@");
}

- (void)applyRestrictionsToProcess:forScenario:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24A698000, v0, v1, "Failed to release restriction:%@ for process:%@, skipping any further restrictions");
}

- (void)applyRestrictionsToProcess:forScenario:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24A698000, v0, v1, "Determining restrictions for process:%@ in scenario:%@");
}

- (void)applyDefaultRestrictionsToProcess:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Successfully applied default restriction to process: %@", v2, v3, v4, v5, v6);
}

- (void)applyDefaultRestrictionsToProcess:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Applying default restrictions for process:%@", v2, v3, v4, v5, v6);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "Determining prevailing active scenarios for affected processes", v1, 2u);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Scenario changes may affect processes: %@", v2, v3, v4, v5, v6);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Scenarios that remain changed after deounce: %@", v2, v3, v4, v5, v6);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Scenarios that remain active after deounce: %@", v2, v3, v4, v5, v6);
}

- (void)determineScenarioForProcess:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24A698000, v0, v1, "Picking only available active scenario for process:%@.", v2, v3, v4, v5, v6);
}

@end