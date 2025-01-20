@interface DBSmartWidgetHomeSource
+ (id)predictionClasses;
+ (id)sourceName;
+ (void)load;
- (DBHomeManager)homeManager;
- (DBSmartWidgetHomeSource)initWithDelegate:(id)a3 resourceProvider:(id)a4;
- (id)freshPredictions;
- (void)dealloc;
- (void)freshPredictions;
- (void)home:(id)a3 didUpdateLastUsedServiceOfType:(id)a4;
- (void)homeDidChangeInRange:(id)a3;
- (void)homeDidUpdateAccess:(id)a3;
- (void)homeManager:(id)a3 didUpdateHomes:(id)a4;
- (void)homeManager:(id)a3 willRemoveHomes:(id)a4;
@end

@implementation DBSmartWidgetHomeSource

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___DBSmartWidgetHomeSource;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)sourceName
{
  return @"Home";
}

+ (id)predictionClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (DBSmartWidgetHomeSource)initWithDelegate:(id)a3 resourceProvider:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DBSmartWidgetHomeSource;
  v7 = [(DBSmartWidgetSource *)&v14 initWithDelegate:a3 resourceProvider:v6];
  if (v7)
  {
    uint64_t v8 = [v6 homeManager];
    homeManager = v7->_homeManager;
    v7->_homeManager = (DBHomeManager *)v8;

    [(DBHomeManager *)v7->_homeManager addObserver:v7];
    v10 = [(DBSmartWidgetHomeSource *)v7 homeManager];
    v11 = [(DBSmartWidgetHomeSource *)v7 homeManager];
    v12 = [v11 homes];
    [(DBSmartWidgetHomeSource *)v7 homeManager:v10 didUpdateHomes:v12];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(DBSmartWidgetHomeSource *)self homeManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DBSmartWidgetHomeSource;
  [(DBSmartWidgetHomeSource *)&v4 dealloc];
}

- (id)freshPredictions
{
  v3 = +[DBApplicationController sharedInstance];
  objc_super v4 = [v3 homeApplication];

  if (!v4)
  {
    v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetHomeSource *)v5 freshPredictions];
    }
    goto LABEL_7;
  }
  if ([v4 isLockedOrHidden])
  {
    v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetHomeSource *)v5 freshPredictions];
    }
LABEL_7:
    v20 = MEMORY[0x263EFFA68];
    goto LABEL_9;
  }
  v21 = objc_opt_new();
  v22 = [(DBSmartWidgetHomeSource *)self homeManager];
  v23 = [v22 homes];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __43__DBSmartWidgetHomeSource_freshPredictions__block_invoke;
  v27[3] = &unk_2649B44F8;
  v27[4] = self;
  id v24 = v21;
  id v28 = v24;
  [v23 enumerateKeysAndObjectsUsingBlock:v27];

  v25 = v28;
  v5 = v24;

  v20 = v5;
LABEL_9:

  return v20;
}

void __43__DBSmartWidgetHomeSource_freshPredictions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 inRange] && objc_msgSend(v4, "hasGarageDoor"))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(v4, "garageDoors", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [[DBSmartWidgetHomePrediction alloc] initWithGarageDoor:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          [(DBSmartWidgetPrediction *)v10 setDelegate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)homeManager:(id)a3 willRemoveHomes:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __55__DBSmartWidgetHomeSource_homeManager_willRemoveHomes___block_invoke;
  v4[3] = &unk_2649B4520;
  v4[4] = self;
  [a4 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __55__DBSmartWidgetHomeSource_homeManager_willRemoveHomes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObserver:*(void *)(a1 + 32)];
}

- (void)homeManager:(id)a3 didUpdateHomes:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__DBSmartWidgetHomeSource_homeManager_didUpdateHomes___block_invoke;
  v5[3] = &unk_2649B4520;
  v5[4] = self;
  [a4 enumerateKeysAndObjectsUsingBlock:v5];
  [(DBSmartWidgetSource *)self refreshPredictions];
}

uint64_t __54__DBSmartWidgetHomeSource_homeManager_didUpdateHomes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addObserver:*(void *)(a1 + 32)];
}

- (void)home:(id)a3 didUpdateLastUsedServiceOfType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomeSource home:didUpdateLastUsedServiceOfType:]((uint64_t)v6, (uint64_t)v7, v8);
  }

  [(DBSmartWidgetSource *)self refreshPredictions];
}

- (void)homeDidChangeInRange:(id)a3
{
  id v4 = a3;
  v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomeSource homeDidChangeInRange:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(DBSmartWidgetSource *)self refreshPredictions];
}

- (void)homeDidUpdateAccess:(id)a3
{
  id v4 = a3;
  v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomeSource homeDidUpdateAccess:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(DBSmartWidgetSource *)self refreshPredictions];
}

- (DBHomeManager)homeManager
{
  return self->_homeManager;
}

- (void).cxx_destruct
{
}

- (void)freshPredictions
{
}

- (void)home:(os_log_t)log didUpdateLastUsedServiceOfType:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "Home did update last used service of type %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)homeDidChangeInRange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)homeDidUpdateAccess:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end