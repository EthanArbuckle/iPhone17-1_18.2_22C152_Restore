@interface CSScenarioManager
+ (CSScenarioManager)sharedInstance;
- (NSMutableDictionary)affectedScenarioByContextIdentifier;
- (NSMutableDictionary)allScenariosByIdentifier;
- (NSMutableSet)activeScenarios;
- (NSMutableSet)observers;
- (NSSet)activeScenariosLastEvaluation;
- (NSSet)activeScenariosLastPublished;
- (OS_os_log)logger;
- (id)_init;
- (id)description;
- (id)scenarioForIdentifier:(id)a3;
- (void)_addContextStoreObserverForIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)evaluateScenarios:(id)a3;
- (void)evaluateScenariosPostInit;
- (void)notifyObserversOfActiveScenarios:(id)a3 previousScenarios:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerScenario:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveScenarios:(id)a3;
- (void)setActiveScenariosLastEvaluation:(id)a3;
- (void)setActiveScenariosLastPublished:(id)a3;
- (void)setAffectedScenarioByContextIdentifier:(id)a3;
- (void)setAllScenariosByIdentifier:(id)a3;
- (void)setLogger:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CSScenarioManager

+ (CSScenarioManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__sharedInstance_0;
  return (CSScenarioManager *)v2;
}

uint64_t __35__CSScenarioManager_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_0 = [[CSScenarioManager alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)CSScenarioManager;
  v2 = [(CSScenarioManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[CSLogger logForCategory:@"CSScenarioManager"];
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    allScenariosByIdentifier = v2->_allScenariosByIdentifier;
    v2->_allScenariosByIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    activeScenarios = v2->_activeScenarios;
    v2->_activeScenarios = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    activeScenariosLastEvaluation = v2->_activeScenariosLastEvaluation;
    v2->_activeScenariosLastEvaluation = (NSSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFFA08] set];
    activeScenariosLastPublished = v2->_activeScenariosLastPublished;
    v2->_activeScenariosLastPublished = (NSSet *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    affectedScenarioByContextIdentifier = v2->_affectedScenarioByContextIdentifier;
    v2->_affectedScenarioByContextIdentifier = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v15;

    v17 = v2;
  }

  return v2;
}

- (void)registerScenario:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    -[CSScenarioManager registerScenario:](logger, v4);
  }
  v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_allScenariosByIdentifier objectForKey:v6];

  if (v7)
  {
    v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSScenarioManager registerScenario:](v8, v4);
    }
  }
  [(NSMutableDictionary *)self->_allScenariosByIdentifier setObject:v4 forKeyedSubscript:v6];
  v23 = v4;
  uint64_t v9 = [v4 scenarioCriteria];
  v10 = [v9 allKeys];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v17 = [(CSScenarioManager *)self affectedScenarioByContextIdentifier];
        v18 = [v17 objectForKey:v16];

        if (!v18)
        {
          objc_super v19 = [(CSScenarioManager *)self affectedScenarioByContextIdentifier];
          v20 = [MEMORY[0x263EFF9C0] set];
          [v19 setObject:v20 forKey:v16];

          [(CSScenarioManager *)self _addContextStoreObserverForIdentifier:v16];
        }
        v21 = [(CSScenarioManager *)self affectedScenarioByContextIdentifier];
        v22 = [v21 objectForKeyedSubscript:v16];
        [v22 addObject:v6];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (void)evaluateScenariosPostInit
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  id v4 = getMainQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke;
  block[3] = &unk_26528B0A8;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

void __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke_cold_1(v2);
  }

  dispatch_time_t v3 = *(void **)(a1 + 32);
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = [v3 allScenariosByIdentifier];
  v6 = [v5 allKeys];
  uint64_t v7 = [v4 setWithArray:v6];
  [v3 evaluateScenarios:v7];
}

- (void)_addContextStoreObserverForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CSContextStore sharedInstance];
  [v5 addObserver:self forContextIdentifier:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    -[CSScenarioManager observeValueForKeyPath:ofObject:change:context:]();
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_affectedScenarioByContextIdentifier objectForKeyedSubscript:v12];
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    -[CSScenarioManager observeValueForKeyPath:ofObject:change:context:]();
  }
  objc_initWeak(&location, self);
  uint64_t v14 = getMainQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CSScenarioManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_26528B1A8;
  objc_copyWeak(&v18, &location);
  id v17 = v13;
  id v15 = v13;
  dispatch_async(v14, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __68__CSScenarioManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained evaluateScenarios:*(void *)(a1 + 32)];
}

- (void)evaluateScenarios:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[(NSMutableSet *)self->_activeScenarios copy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412290;
    long long v20 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(NSMutableSet **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_allScenariosByIdentifier, "objectForKeyedSubscript:", v11, v20);
        uint64_t v13 = +[CSContextStore sharedInstance];
        int v14 = [v13 satisfiesCriteriaForScenario:v12];

        int v15 = [v5 containsObject:v11];
        if (v14)
        {
          if ((v15 & 1) == 0)
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              long long v27 = v11;
              _os_log_debug_impl(&dword_24A698000, logger, OS_LOG_TYPE_DEBUG, "Scenario:%@ is now active, was previously inactive", buf, 0xCu);
            }
            [(NSMutableSet *)self->_activeScenarios addObject:v11];
          }
        }
        else if (v15)
        {
          id v17 = self->_logger;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            long long v27 = v11;
            _os_log_debug_impl(&dword_24A698000, v17, OS_LOG_TYPE_DEBUG, "Scenario:%@ is now inactive, was previously active", buf, 0xCu);
          }
          [(NSMutableSet *)self->_activeScenarios removeObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }

  id v18 = self->_logger;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    activeScenarios = self->_activeScenarios;
    *(_DWORD *)buf = 138412546;
    long long v27 = activeScenarios;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    _os_log_impl(&dword_24A698000, v18, OS_LOG_TYPE_INFO, "Active Scenarios: %@, Previous Scenarios: %@", buf, 0x16u);
  }
  [(CSScenarioManager *)self notifyObserversOfActiveScenarios:self->_activeScenarios previousScenarios:v5];
}

- (void)notifyObserversOfActiveScenarios:(id)a3 previousScenarios:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "currentActiveScenarios:previousActiveScenarios:", v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CSScenarioManager: ActiveScenarios: %@ AllScenarios: %@", self->_activeScenarios, self->_allScenariosByIdentifier];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)scenarioForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_allScenariosByIdentifier objectForKeyedSubscript:a3];
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (NSMutableDictionary)allScenariosByIdentifier
{
  return self->_allScenariosByIdentifier;
}

- (void)setAllScenariosByIdentifier:(id)a3
{
}

- (NSMutableSet)activeScenarios
{
  return self->_activeScenarios;
}

- (void)setActiveScenarios:(id)a3
{
}

- (NSMutableDictionary)affectedScenarioByContextIdentifier
{
  return self->_affectedScenarioByContextIdentifier;
}

- (void)setAffectedScenarioByContextIdentifier:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSSet)activeScenariosLastEvaluation
{
  return self->_activeScenariosLastEvaluation;
}

- (void)setActiveScenariosLastEvaluation:(id)a3
{
}

- (NSSet)activeScenariosLastPublished
{
  return self->_activeScenariosLastPublished;
}

- (void)setActiveScenariosLastPublished:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScenariosLastPublished, 0);
  objc_storeStrong((id *)&self->_activeScenariosLastEvaluation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_affectedScenarioByContextIdentifier, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_allScenariosByIdentifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)registerScenario:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = a1;
  id v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24A698000, v3, OS_LOG_TYPE_ERROR, "Scenario: %@ already exists in allScenarios. Replacing.", v5, 0xCu);
}

- (void)registerScenario:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = a1;
  id v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_24A698000, v3, OS_LOG_TYPE_DEBUG, "Registering Scenario: %@", v5, 0xCu);
}

void __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "Evaluating all scenarios after initial registration of scenarios.", v1, 2u);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_24A698000, v1, OS_LOG_TYPE_DEBUG, "Scenarios:%@ need to be re-evaluated as they are affected by changed to ContextKey: %@", v2, 0x16u);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_24A698000, v0, OS_LOG_TYPE_DEBUG, "State for ContextKey: %@ has changed", v1, 0xCu);
}

@end