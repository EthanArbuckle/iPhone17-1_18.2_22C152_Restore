@interface DBSmartWidgetSource
+ (NSArray)predictionClasses;
+ (NSArray)registeredSources;
+ (id)sourceName;
+ (void)load;
+ (void)registerSource:(Class)a3;
- (BOOL)defaultsDisabled;
- (BOOL)disabled;
- (BOOL)shouldKeepPrediction:(id)a3;
- (DBSmartWidgetSource)initWithDelegate:(id)a3 resourceProvider:(id)a4;
- (DBSmartWidgetSourceDelegate)delegate;
- (NSArray)predictions;
- (NSDate)lastRefresh;
- (NSDictionary)currentPredictions;
- (NSString)sourceName;
- (OS_dispatch_queue)workQueue;
- (id)description;
- (id)freshPredictions;
- (void)handleEvent:(id)a3;
- (void)refreshDisabled;
- (void)refreshPredictions;
- (void)setCurrentPredictions:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setLastRefresh:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DBSmartWidgetSource

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[DBSmartWidgetSource registerSource:v3];
  }
}

+ (void)registerSource:(Class)a3
{
  if (registerSource__onceToken != -1) {
    dispatch_once(&registerSource__onceToken, &__block_literal_global_33);
  }
  id obj = (id)_registeredSources;
  objc_sync_enter(obj);
  [(id)_registeredSources addObject:a3];
  objc_sync_exit(obj);
}

uint64_t __38__DBSmartWidgetSource_registerSource___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _registeredSources;
  _registeredSources = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (NSArray)registeredSources
{
  id v2 = (id)_registeredSources;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredSources copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

+ (id)sourceName
{
  return @"invalid";
}

- (BOOL)defaultsDisabled
{
  return 0;
}

+ (NSArray)predictionClasses
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (BOOL)shouldKeepPrediction:(id)a3
{
  return 0;
}

- (DBSmartWidgetSource)initWithDelegate:(id)a3 resourceProvider:(id)a4
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DBSmartWidgetSource;
  v6 = [(DBSmartWidgetSource *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@.workQueue", v11];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v14;

    [(DBSmartWidgetSource *)v7 refreshDisabled];
  }

  return v7;
}

- (NSArray)predictions
{
  id v2 = [(DBSmartWidgetSource *)self currentPredictions];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)refreshPredictions
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "start %{public}@", (uint8_t *)&v2, 0xCu);
}

void __41__DBSmartWidgetSource_refreshPredictions__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained disabled])
  {
    [WeakRetained setCurrentPredictions:MEMORY[0x263EFFA78]];
    char v3 = 0;
  }
  else
  {
    v22 = v1;
    uint64_t v4 = [WeakRetained freshPredictions];
    id v5 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v12 = [WeakRetained currentPredictions];
          id v13 = [v11 uniqueIdentifier];
          dispatch_queue_t v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            uint64_t v15 = [v14 score];
            if (([v14 updateWithPrediction:v11] & 1) != 0 || v15 != objc_msgSend(v14, "score")) {
              char v8 = 1;
            }
            v16 = [v14 uniqueIdentifier];
            [v5 setObject:v14 forKeyedSubscript:v16];
          }
          else
          {
            v16 = [v11 uniqueIdentifier];
            [v5 setObject:v11 forKeyedSubscript:v16];
            char v8 = 1;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
    }

    objc_super v17 = [WeakRetained currentPredictions];
    uint64_t v18 = [v17 count];
    BOOL v19 = v18 != [v5 count];

    char v3 = v19 | v8;
    [WeakRetained setCurrentPredictions:v5];

    uint64_t v1 = v22;
  }
  v20 = [MEMORY[0x263EFF910] now];
  [WeakRetained setLastRefresh:v20];

  v21 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __41__DBSmartWidgetSource_refreshPredictions__block_invoke_cold_1((uint64_t)WeakRetained, v3 & 1, v21);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DBSmartWidgetSource_refreshPredictions__block_invoke_15;
  block[3] = &unk_2649B62E8;
  objc_copyWeak(&v25, v1);
  char v26 = v3 & 1;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v25);
}

void __41__DBSmartWidgetSource_refreshPredictions__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained delegate];
  [v2 sourceDidRefresh:WeakRetained predictionsUpdated:*(unsigned __int8 *)(a1 + 40)];
}

- (id)freshPredictions
{
  return (id)MEMORY[0x263EFFA78];
}

- (void)refreshDisabled
{
  BOOL v3 = [(DBSmartWidgetSource *)self disabled];
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = NSString;
  uint64_t v6 = [(id)objc_opt_class() sourceName];
  uint64_t v7 = [v5 stringWithFormat:@"CARSmartWidgetDisablePrediction_%@", v6];
  id v9 = [v4 objectForKey:v7];

  if (v9) {
    uint64_t v8 = [v9 BOOLValue];
  }
  else {
    uint64_t v8 = [(DBSmartWidgetSource *)self defaultsDisabled];
  }
  [(DBSmartWidgetSource *)self setDisabled:v8];
  if (v3 != [(DBSmartWidgetSource *)self disabled]) {
    [(DBSmartWidgetSource *)self refreshPredictions];
  }
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if ([(DBSmartWidgetSource *)self disabled]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = [(DBSmartWidgetSource *)self lastRefresh];
  uint64_t v8 = +[DBDateFormatter formattedDateTimeStamp:v7];
  id v9 = [(DBSmartWidgetSource *)self predictions];
  v10 = [v3 stringWithFormat:@"<%@: %p disabled=%@ lastRefresh=%@ predictions.count=%lu>", v5, self, v6, v8, objc_msgSend(v9, "count")];

  return v10;
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetSource *)self delegate];
  [v5 handleEvent:v4];
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (DBSmartWidgetSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSmartWidgetSourceDelegate *)WeakRetained;
}

- (NSDate)lastRefresh
{
  return self->_lastRefresh;
}

- (void)setLastRefresh:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSDictionary)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastRefresh, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceName, 0);
}

void __41__DBSmartWidgetSource_refreshPredictions__block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = @"YES";
  if ((a2 & 1) == 0) {
    BOOL v3 = @"NO";
  }
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "done %{public}@ predictionsDidUpdate=%{public}@", (uint8_t *)&v4, 0x16u);
}

@end