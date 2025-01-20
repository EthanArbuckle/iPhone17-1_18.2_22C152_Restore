@interface MessageListCellsController
+ (OS_os_log)log;
- (BOOL)wasItemRecentlyVisible:(id)a3;
- (EFCancelable)currentUpdateToken;
- (EFLocked)visibleItemIDs;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (MessageListCellsController)init;
- (NSMutableDictionary)failureCodeCount;
- (int64_t)loadAttempts;
- (int64_t)loadFailures;
- (int64_t)numberOfFlickeringCells;
- (int64_t)numberOfVisibleCells;
- (void)_reportBlankCellMetrics;
- (void)_reportFlickeringCellMetrics;
- (void)markItemIDsAsVisibleBeforeUpdate:(id)a3;
- (void)reportCellDidLoad:(BOOL)a3 error:(id)a4;
- (void)reportFlickeringCell:(BOOL)a3 duration:(double)a4;
- (void)reportMessageListCellMetrics;
- (void)setCurrentUpdateToken:(id)a3;
- (void)setFailureCodeCount:(id)a3;
- (void)setLoadAttempts:(int64_t)a3;
- (void)setLoadFailures:(int64_t)a3;
- (void)setNumberOfFlickeringCells:(int64_t)a3;
- (void)setNumberOfVisibleCells:(int64_t)a3;
- (void)setVisibleItemIDs:(id)a3;
@end

@implementation MessageListCellsController

- (void)reportMessageListCellMetrics
{
  -[MessageListCellsController _reportBlankCellMetrics]((os_unfair_lock_s *)self);
  -[MessageListCellsController _reportFlickeringCellMetrics]((uint64_t)self);
}

- (void)_reportFlickeringCellMetrics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)a1, "numberOfVisibleCells"));
    [v2 setObject:v3 forKeyedSubscript:@"numberOfVisibleCells"];

    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)a1, "numberOfFlickeringCells"));
    [v2 setObject:v4 forKeyedSubscript:@"numberOfFlickeringCells"];

    id v5 = *(id *)(a1 + 80);
    v6 = (void *)[v5 copy];
    [v2 setObject:v6 forKeyedSubscript:@"duration"];

    id v7 = *(id *)(a1 + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__MessageListCellsController__reportFlickeringCellMetrics__block_invoke;
    v14[3] = &unk_1E6D11828;
    id v8 = v2;
    id v15 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v14];

    [(id)a1 setNumberOfVisibleCells:0];
    [(id)a1 setNumberOfFlickeringCells:0];
    id v9 = *(id *)(a1 + 80);
    [v9 removeAllObjects];

    id v10 = *(id *)(a1 + 88);
    [v10 removeAllObjects];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.messagelist.flicker" collectionData:v8];
    v12 = [(id)a1 analyticsCollector];
    [v12 logOneTimeEvent:v11];

    v13 = +[MessageListCellsController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = a1;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_DEFAULT, "%p: Report flickering cell metrics to CoreAnalytics %{public}@", buf, 0x16u);
    }
  }
}

- (void)setNumberOfVisibleCells:(int64_t)a3
{
  self->_numberOfVisibleCells = a3;
}

- (void)setNumberOfFlickeringCells:(int64_t)a3
{
  self->_numberOfFlickeringCells = a3;
}

- (int64_t)numberOfVisibleCells
{
  return self->_numberOfVisibleCells;
}

- (int64_t)numberOfFlickeringCells
{
  return self->_numberOfFlickeringCells;
}

- (void)_reportBlankCellMetrics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_unfair_lock_lock(a1 + 2);
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[os_unfair_lock_s loadAttempts](a1, "loadAttempts"));
    [v2 setObject:v3 forKeyedSubscript:@"loadAttempts"];

    v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[os_unfair_lock_s loadFailures](a1, "loadFailures"));
    [v2 setObject:v4 forKeyedSubscript:@"loadFailures"];

    id v5 = [(os_unfair_lock_s *)a1 failureCodeCount];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__MessageListCellsController__reportBlankCellMetrics__block_invoke;
    v11[3] = &unk_1E6D11828;
    id v6 = v2;
    id v12 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    [(os_unfair_lock_s *)a1 setLoadAttempts:0];
    [(os_unfair_lock_s *)a1 setLoadFailures:0];
    id v7 = [(os_unfair_lock_s *)a1 failureCodeCount];
    [v7 removeAllObjects];

    os_unfair_lock_unlock(a1 + 2);
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.messagelist.loadingMessage" collectionData:v6];
    id v9 = [(os_unfair_lock_s *)a1 analyticsCollector];
    [v9 logOneTimeEvent:v8];

    id v10 = +[MessageListCellsController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v14 = a1;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "%p: Report blank cell metrics to CoreAnalytics %{public}@", buf, 0x16u);
    }
  }
}

- (void)reportCellDidLoad:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v16 = a4;
  p_analyticsLock = &self->_analyticsLock;
  os_unfair_lock_lock(&self->_analyticsLock);
  [(MessageListCellsController *)self setLoadAttempts:[(MessageListCellsController *)self loadAttempts] + 1];
  [(MessageListCellsController *)self setLoadFailures:[(MessageListCellsController *)self loadFailures] + !v4];
  if (v16)
  {
    id v7 = [(MessageListCellsController *)self failureCodeCount];
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "code"));
    id v9 = [v8 stringValue];
    uint64_t v10 = [v7 objectForKeyedSubscript:v9];

    if (v10) {
      v11 = (void *)v10;
    }
    else {
      v11 = &unk_1F39E1D28;
    }
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);
    v13 = [(MessageListCellsController *)self failureCodeCount];
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "code"));
    __int16 v15 = [v14 stringValue];
    [v13 setObject:v12 forKeyedSubscript:v15];
  }
  os_unfair_lock_unlock(p_analyticsLock);
}

- (void)setLoadFailures:(int64_t)a3
{
  self->_loadFailures = a3;
}

- (void)setLoadAttempts:(int64_t)a3
{
  self->_loadAttempts = a3;
}

- (int64_t)loadFailures
{
  return self->_loadFailures;
}

- (int64_t)loadAttempts
{
  return self->_loadAttempts;
}

- (NSMutableDictionary)failureCodeCount
{
  return self->_failureCodeCount;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MessageListCellsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  id v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

- (MessageListCellsController)init
{
  v16.receiver = self;
  v16.super_class = (Class)MessageListCellsController;
  id v2 = [(MessageListCellsController *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = [v3 initWithObject:v4];
    visibleItemIDs = v2->_visibleItemIDs;
    v2->_visibleItemIDs = (EFLocked *)v5;

    v2->_loadAttempts = 0;
    v2->_loadFailures = 0;
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    failureCodeCount = v2->_failureCodeCount;
    v2->_failureCodeCount = v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rawFlickerDurations = v2->_rawFlickerDurations;
    v2->_rawFlickerDurations = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bucketedFlickerDurations = v2->_bucketedFlickerDurations;
    v2->_bucketedFlickerDurations = v11;

    v13 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E4F60258]);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v13;

    v2->_analyticsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

void __33__MessageListCellsController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (void)markItemIDsAsVisibleBeforeUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MessageListCellsController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    __int16 v19 = 2048;
    uint64_t v20 = [v4 count];
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Mark item %lu ids as visible before update: %{public}@", buf, 0x20u);
  }

  id v6 = [(MessageListCellsController *)self currentUpdateToken];
  [v6 cancel];

  id v7 = [(MessageListCellsController *)self visibleItemIDs];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke;
  v16[3] = &unk_1E6D117B0;
  id v8 = v4;
  id v17 = v8;
  [v7 performWhileLocked:v16];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_2;
  v14 = &unk_1E6D117D8;
  objc_copyWeak(&v15, (id *)buf);
  uint64_t v10 = [v9 afterDelay:&v11 performBlock:2.0];
  -[MessageListCellsController setCurrentUpdateToken:](self, "setCurrentUpdateToken:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllObjects];
  [v3 addObjectsFromArray:*(void *)(a1 + 32)];
}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained visibleItemIDs];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_3;
    v4[3] = &unk_1E6D117B0;
    v4[4] = v2;
    [v3 performWhileLocked:v4];
  }
}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfVisibleCells:", objc_msgSend(*(id *)(a1 + 32), "numberOfVisibleCells") + objc_msgSend(v4, "count"));
  os_unfair_lock_unlock(v3);
  [v4 removeAllObjects];
}

- (BOOL)wasItemRecentlyVisible:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(MessageListCellsController *)self visibleItemIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MessageListCellsController_wasItemRecentlyVisible___block_invoke;
  v8[3] = &unk_1E6D11800;
  uint64_t v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 performWhileLocked:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __53__MessageListCellsController_wasItemRecentlyVisible___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [v3 removeObject:*(void *)(a1 + 32)];
  }
}

- (void)reportFlickeringCell:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  p_analyticsLock = &self->_analyticsLock;
  os_unfair_lock_lock(&self->_analyticsLock);
  [(MessageListCellsController *)self setNumberOfVisibleCells:[(MessageListCellsController *)self numberOfVisibleCells] + 1];
  if (v5)
  {
    [(MessageListCellsController *)self setNumberOfFlickeringCells:[(MessageListCellsController *)self numberOfFlickeringCells] + 1];
    if (self) {
      rawFlickerDurations = self->_rawFlickerDurations;
    }
    else {
      rawFlickerDurations = 0;
    }
    id v9 = rawFlickerDurations;
    uint64_t v10 = [NSNumber numberWithDouble:a4];
    [(NSMutableArray *)v9 addObject:v10];

    if (self) {
      bucketedFlickerDurations = self->_bucketedFlickerDurations;
    }
    else {
      bucketedFlickerDurations = 0;
    }
    uint64_t v12 = bucketedFlickerDurations;
    uint64_t v13 = v12;
    if (a4 >= 0.01)
    {
      if (a4 >= 0.02)
      {
        if (a4 >= 0.03)
        {
          if (a4 >= 0.04)
          {
            if (a4 >= 0.05)
            {
              if (a4 >= 0.1)
              {
                if (a4 >= 0.5)
                {
                  if (a4 >= 1.0)
                  {
                    if (a4 >= 1.5) {
                      char v14 = @"duration_1_5_to_2_0";
                    }
                    else {
                      char v14 = @"duration_1_0_to_1_5";
                    }
                  }
                  else
                  {
                    char v14 = @"duration_0_5_to_1_0";
                  }
                }
                else
                {
                  char v14 = @"duration_0_1_to_0_5";
                }
              }
              else
              {
                char v14 = @"duration_0_05_to_0_1";
              }
            }
            else
            {
              char v14 = @"duration_0_04_to_0_05";
            }
          }
          else
          {
            char v14 = @"duration_0_03_to_0_04";
          }
        }
        else
        {
          char v14 = @"duration_0_02_to_0_03";
        }
      }
      else
      {
        char v14 = @"duration_0_01_to_0_02";
      }
    }
    else
    {
      char v14 = @"duration_0_005_to_0_01";
    }
    uint64_t v15 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v14];
    objc_super v16 = (void *)v15;
    id v17 = &unk_1F39E1D28;
    if (v15) {
      id v17 = (void *)v15;
    }
    id v18 = v17;

    __int16 v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    if (a4 >= 0.01)
    {
      if (a4 >= 0.02)
      {
        if (a4 >= 0.03)
        {
          if (a4 >= 0.04)
          {
            if (a4 >= 0.05)
            {
              if (a4 >= 0.1)
              {
                if (a4 >= 0.5)
                {
                  if (a4 >= 1.0)
                  {
                    if (a4 >= 1.5) {
                      uint64_t v20 = @"duration_1_5_to_2_0";
                    }
                    else {
                      uint64_t v20 = @"duration_1_0_to_1_5";
                    }
                  }
                  else
                  {
                    uint64_t v20 = @"duration_0_5_to_1_0";
                  }
                }
                else
                {
                  uint64_t v20 = @"duration_0_1_to_0_5";
                }
              }
              else
              {
                uint64_t v20 = @"duration_0_05_to_0_1";
              }
            }
            else
            {
              uint64_t v20 = @"duration_0_04_to_0_05";
            }
          }
          else
          {
            uint64_t v20 = @"duration_0_03_to_0_04";
          }
        }
        else
        {
          uint64_t v20 = @"duration_0_02_to_0_03";
        }
      }
      else
      {
        uint64_t v20 = @"duration_0_01_to_0_02";
      }
    }
    else
    {
      uint64_t v20 = @"duration_0_005_to_0_01";
    }
    [(NSMutableDictionary *)v13 setObject:v19 forKeyedSubscript:v20];
  }
  os_unfair_lock_unlock(p_analyticsLock);
}

uint64_t __53__MessageListCellsController__reportBlankCellMetrics__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __58__MessageListCellsController__reportFlickeringCellMetrics__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (EFLocked)visibleItemIDs
{
  return self->_visibleItemIDs;
}

- (void)setVisibleItemIDs:(id)a3
{
}

- (EFCancelable)currentUpdateToken
{
  return self->_currentUpdateToken;
}

- (void)setCurrentUpdateToken:(id)a3
{
}

- (void)setFailureCodeCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketedFlickerDurations, 0);
  objc_storeStrong((id *)&self->_rawFlickerDurations, 0);
  objc_storeStrong((id *)&self->_failureCodeCount, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_currentUpdateToken, 0);
  objc_storeStrong((id *)&self->_visibleItemIDs, 0);
}

@end