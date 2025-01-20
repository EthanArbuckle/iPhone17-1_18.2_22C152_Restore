@interface CSContextStore
+ (CSContextStore)sharedInstance;
- (BOOL)satisfiesCriteriaForScenario:(id)a3;
- (NSMutableDictionary)currentContext;
- (OS_os_log)logger;
- (id)_init;
- (id)description;
- (id)getStateForIdentifier:(id)a3;
- (void)addObserver:(id)a3 forContextIdentifier:(id)a4;
- (void)setCurrentContext:(id)a3;
- (void)setLogger:(id)a3;
- (void)updateState:(id)a3 forIdentifier:(id)a4;
@end

@implementation CSContextStore

+ (CSContextStore)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance__sharedInstance_1;
  return (CSContextStore *)v2;
}

uint64_t __32__CSContextStore_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_1 = [[CSContextStore alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CSContextStore;
  v2 = [(CSContextStore *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[CSLogger logForCategory:@"CSContextStore"];
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    currentContext = v2->_currentContext;
    v2->_currentContext = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)satisfiesCriteriaForScenario:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [a3 scenarioCriteria];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
      v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentContext, "objectForKeyedSubscript:", v9, (void)v14);
      if (!v10) {
        break;
      }
      v11 = [v4 objectForKeyedSubscript:v9];
      int v12 = [v10 isEqualToNumber:v11];

      if (!v12)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(v10) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CSContextStore: %@", self->_currentContext];
}

- (void)updateState:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_currentContext objectForKey:v7];

  BOOL v9 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG);
  if (v8 == v6)
  {
    if (v9) {
      -[CSContextStore updateState:forIdentifier:]();
    }
  }
  else
  {
    if (v9) {
      -[CSContextStore updateState:forIdentifier:]();
    }
    [(NSMutableDictionary *)self->_currentContext setValue:v6 forKey:v7];
  }
}

- (id)getStateForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_currentContext objectForKeyedSubscript:a3];
}

- (void)addObserver:(id)a3 forContextIdentifier:(id)a4
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (NSMutableDictionary)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)updateState:forIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24A698000, v0, v1, "Value for contextIdentifier:%@ was already set to %@");
}

- (void)updateState:forIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24A698000, v0, v1, "Value for contextIdentifier:%@ updated to %@");
}

@end