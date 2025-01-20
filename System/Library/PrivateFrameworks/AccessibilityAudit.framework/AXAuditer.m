@interface AXAuditer
+ (void)initialize;
- (AXAuditer)init;
- (AXAuditerDelegate)delegate;
- (NSArray)_auditCategories;
- (NSArray)_currentTypesToAuditFor;
- (NSMutableArray)_results;
- (NSMutableArray)currentRunningCategories;
- (NSString)description;
- (OS_dispatch_queue)auditQueue;
- (id)_allCategoriesDescription;
- (id)_auditCategoryForClass:(Class)a3;
- (id)_currentTime;
- (id)allSupportedAuditTypes;
- (id)detectionResultsFromImageData:(id)a3;
- (int)targetPid;
- (unint64_t)categoryType;
- (void)_clearCurrentRunningCategories;
- (void)_initializeAuditCategories;
- (void)_runCategories:(id)a3;
- (void)auditCategory:(id)a3 didEncounterIssue:(id)a4;
- (void)auditCategoryResult:(id)a3 didAppendLogWithMessage:(id)a4;
- (void)didCompleteCategory:(id)a3;
- (void)init;
- (void)runCategories:(id)a3;
- (void)setAuditQueue:(id)a3;
- (void)setCategoryType:(unint64_t)a3;
- (void)setCurrentRunningCategories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTargetPid:(int)a3;
- (void)set_auditCategories:(id)a3;
- (void)set_currentTypesToAuditFor:(id)a3;
- (void)set_results:(id)a3;
- (void)startWithAuditTypes:(id)a3;
@end

@implementation AXAuditer

+ (void)initialize
{
}

id __23__AXAuditer_initialize__block_invoke()
{
  return +[AXAuditPluginManager sharedManager];
}

- (AXAuditer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditer;
  v2 = [(AXAuditer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    results = v2->__results;
    v2->__results = (NSMutableArray *)v3;

    [(AXAuditer *)v2 _initializeAuditCategories];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[AXAuditer init]();
    }
    v5 = +[AXAuditAssetManager shared];
    [v5 downloadAssetsIfNecessary];

    [(AXAuditer *)v2 setAuditQueue:MEMORY[0x263EF83A0]];
  }
  return v2;
}

- (void)_initializeAuditCategories
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXAuditer *)self _auditCategories];

  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [&unk_26FB7A580 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(&unk_26FB7A580);
          }
          if (NSClassFromString(*(NSString **)(*((void *)&v10 + 1) + 8 * v8)))
          {
            v9 = objc_opt_new();
            [v9 setDelegate:self];
            [v4 addObject:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_26FB7A580 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    [(AXAuditer *)self set_auditCategories:v4];
  }
}

- (id)_allCategoriesDescription
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  v4 = [(AXAuditer *)self _auditCategories];
  objc_msgSend(v3, "appendFormat:", @"\nContains %i categories {\n", objc_msgSend(v4, "count"));
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"   Test %i: %@", v9 + i + 1, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v9 = (v9 + i);
    }
    while (v8);
  }

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n   ", 1, 0, objc_msgSend(v5, "length"));
  [v3 appendString:v5];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)AXAuditer;
  v4 = [(AXAuditer *)&v7 description];
  [v3 appendString:v4];

  uint64_t v5 = [(AXAuditer *)self _allCategoriesDescription];
  [v3 appendString:v5];

  return (NSString *)v3;
}

- (id)_auditCategoryForClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(AXAuditer *)self _auditCategories];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", a3, (void)v12))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)allSupportedAuditTypes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  id v4 = [(AXAuditer *)self _auditCategories];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) allSupportedAuditTypes];
        if ([v9 count]) {
          [v3 unionSet:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  id v10 = (void *)[v3 copy];

  return v10;
}

- (void)_clearCurrentRunningCategories
{
  uint64_t v3 = [(AXAuditer *)self currentRunningCategories];

  if (v3)
  {
    id v4 = [(AXAuditer *)self currentRunningCategories];
    [v4 removeAllObjects];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF980] array];
    [(AXAuditer *)self setCurrentRunningCategories:v4];
  }

  id v5 = [MEMORY[0x263EFF8C0] array];
  [(AXAuditer *)self set_currentTypesToAuditFor:v5];
}

- (void)startWithAuditTypes:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXAuditer *)self _clearCurrentRunningCategories];
  id v5 = +[AXAuditScreenshotManager sharedManager];
  [v5 clear];

  if (!v4 || ![v4 count])
  {
    uint64_t v6 = [(AXAuditer *)self allSupportedAuditTypes];
    uint64_t v7 = [v6 allObjects];

    id v4 = (id)v7;
  }
  uint64_t v8 = (void *)[v4 copy];
  [(AXAuditer *)self set_currentTypesToAuditFor:v8];

  uint64_t v9 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v22 = self;
  obuint64_t j = [(AXAuditer *)self _auditCategories];
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v12 = [MEMORY[0x263EFF980] array];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v13 = v4;
        id v14 = v4;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * j);
              if ([v11 supportsAuditTestType:v19])
              {
                [v12 addObject:v19];
                if (([v9 containsObject:v11] & 1) == 0) {
                  [v9 addObject:v11];
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v16);
        }

        if ([v12 count])
        {
          v20 = [MEMORY[0x263EFFA08] setWithArray:v12];
          [v11 setCurrentAuditTypesToTestFor:v20];
        }
        id v4 = v13;
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }

  v21 = [v9 allObjects];
  [(AXAuditer *)v22 runCategories:v21];
}

- (void)runCategories:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v12 supportAuditGroup:2] & 1) != 0
          || [v12 supportAuditGroup:4])
        {
          [v6 addObject:v12];
          [v5 removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  id v13 = [(AXAuditer *)self currentRunningCategories];
  [v13 addObjectsFromArray:v5];

  id v14 = [(AXAuditer *)self currentRunningCategories];
  [v14 addObjectsFromArray:v6];

  uint64_t v15 = [(AXAuditer *)self auditQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__AXAuditer_runCategories___block_invoke;
  block[3] = &unk_26520D2E0;
  block[4] = self;
  id v16 = v5;
  id v25 = v16;
  dispatch_async(v15, block);

  if ([v6 count])
  {
    uint64_t v17 = [(AXAuditer *)self delegate];
    uint64_t v18 = [v17 fetchScreenshot];

    uint64_t v19 = [v18 objectForKey:@"imageData"];
    if ([v19 length])
    {
      v20 = +[AXAuditScreenshotManager sharedManager];
      v21 = [(AXAuditer *)self _currentTime];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __27__AXAuditer_runCategories___block_invoke_2;
      v22[3] = &unk_26520D2E0;
      v22[4] = self;
      id v23 = v6;
      [v20 addScreenshotWithInfo:v18 timestamp:v21 completion:v22];
    }
  }
}

uint64_t __27__AXAuditer_runCategories___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runCategories:*(void *)(a1 + 40)];
}

void __27__AXAuditer_runCategories___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) auditQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__AXAuditer_runCategories___block_invoke_3;
  v4[3] = &unk_26520D2E0;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __27__AXAuditer_runCategories___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runCategories:*(void *)(a1 + 40)];
}

- (void)_runCategories:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count]) {
    [(AXAuditer *)self didCompleteCategory:0];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        objc_msgSend(v10, "setTargetPid:", -[AXAuditer targetPid](self, "targetPid", (void)v12));
        objc_msgSend(v10, "setCategoryType:", -[AXAuditer categoryType](self, "categoryType"));
        long long v11 = [v10 result];
        [v11 setDelegate:self];
        [v10 run];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)didCompleteCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(AXAuditer *)self currentRunningCategories];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [v4 setCurrentAuditTypesToTestFor:0];
    uint64_t v7 = [v4 result];
    if (v7)
    {
      uint64_t v8 = [(AXAuditer *)self _results];
      [v8 addObject:v7];
    }
    uint64_t v9 = [(AXAuditer *)self currentRunningCategories];
    [v9 removeObject:v4];

    uint64_t v10 = [(AXAuditer *)self currentRunningCategories];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      long long v12 = [(AXAuditer *)self delegate];
      long long v13 = [(AXAuditer *)self _results];
      [v12 auditer:self didCompleteWithResults:v13];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[AXAuditer didCompleteCategory:](v4);
  }
}

- (void)auditCategoryResult:(id)a3 didAppendLogWithMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(AXAuditer *)self delegate];
  [v6 auditer:self didAppendLogWithMessage:v5];
}

- (void)auditCategory:(id)a3 didEncounterIssue:(id)a4
{
  id v5 = a4;
  id v6 = [(AXAuditer *)self delegate];
  [v6 auditer:self didEncounterIssue:v5];
}

- (id)detectionResultsFromImageData:(id)a3
{
  id v3 = a3;
  id v4 = +[AXAuditImageDetectionManager sharedManager];
  id v5 = [v4 detectionResultsFromImageData:v3];

  return v5;
}

- (id)_currentTime
{
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  id v4 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v2 setTimeZone:v4];

  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v5 = [v2 stringFromDate:v3];

  return v5;
}

- (AXAuditerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAuditerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (NSMutableArray)currentRunningCategories
{
  return self->_currentRunningCategories;
}

- (void)setCurrentRunningCategories:(id)a3
{
}

- (OS_dispatch_queue)auditQueue
{
  return self->_auditQueue;
}

- (void)setAuditQueue:(id)a3
{
}

- (NSArray)_auditCategories
{
  return self->__auditCategories;
}

- (void)set_auditCategories:(id)a3
{
}

- (NSMutableArray)_results
{
  return self->__results;
}

- (void)set_results:(id)a3
{
}

- (NSArray)_currentTypesToAuditFor
{
  return self->__currentTypesToAuditFor;
}

- (void)set_currentTypesToAuditFor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTypesToAuditFor, 0);
  objc_storeStrong((id *)&self->__results, 0);
  objc_storeStrong((id *)&self->__auditCategories, 0);
  objc_storeStrong((id *)&self->_auditQueue, 0);
  objc_storeStrong((id *)&self->_currentRunningCategories, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  v1 = "-[AXAuditer init]";
  _os_log_debug_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s: Preparing to download assets", (uint8_t *)&v0, 0xCu);
}

- (void)didCompleteCategory:(void *)a1 .cold.1(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 title];
  id v3 = [a1 lastCaseSelectorFinishedName];
  int v4 = 136315650;
  id v5 = "-[AXAuditer didCompleteCategory:]";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: currentRunningCategories is empty but %@:%@ is incorrectly finishing up.", (uint8_t *)&v4, 0x20u);
}

@end