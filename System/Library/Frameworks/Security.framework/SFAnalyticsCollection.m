@interface SFAnalyticsCollection
+ (id)parseVersion:(id)a3 platform:(id)a4;
- (BOOL)allowedVersionsWithSelf:(id)a3;
- (BOOL)excludedVersion;
- (BOOL)matchRuleWithSelf:(id)a3;
- (NSMutableDictionary)allowedEvents;
- (NSMutableDictionary)matchingRules;
- (NSString)processName;
- (OS_dispatch_queue)queue;
- (SECSFAVersion)selfVersion;
- (SFAnalyticsCollection)init;
- (SFAnalyticsCollection)initWithActionInterface:(id)a3 product:(id)a4 build:(id)a5;
- (SFAnalyticsCollectionAction)actions;
- (id)parseCollection:(id)a3 logger:(id)a4;
- (id)tearDownMetricsHook;
- (unsigned)match:(id)a3 eventClass:(int64_t)a4 attributes:(id)a5 bucket:(unsigned int)a6 logger:(id)a7;
- (void)dealloc;
- (void)drainSetupQueue;
- (void)loadCollection:(id)a3;
- (void)onQueue_stopMetricCollection;
- (void)setActions:(id)a3;
- (void)setAllowedEvents:(id)a3;
- (void)setExcludedVersion:(BOOL)a3;
- (void)setMatchingRules:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSelfVersion:(id)a3;
- (void)setTearDownMetricsHook:(id)a3;
- (void)setupMetricsHook:(id)a3;
- (void)stopMetricCollection;
- (void)storeCollection:(id)a3 logger:(id)a4;
@end

@implementation SFAnalyticsCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_tearDownMetricsHook, 0);
  objc_storeStrong((id *)&self->_allowedEvents, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_matchingRules, 0);
}

- (void)setSelfVersion:(id)a3
{
}

- (SECSFAVersion)selfVersion
{
  return (SECSFAVersion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActions:(id)a3
{
}

- (SFAnalyticsCollectionAction)actions
{
  return (SFAnalyticsCollectionAction *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTearDownMetricsHook:(id)a3
{
}

- (id)tearDownMetricsHook
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setAllowedEvents:(id)a3
{
}

- (NSMutableDictionary)allowedEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchingRules:(id)a3
{
}

- (NSMutableDictionary)matchingRules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExcludedVersion:(BOOL)a3
{
  self->_excludedVersion = a3;
}

- (BOOL)excludedVersion
{
  return self->_excludedVersion;
}

- (void)drainSetupQueue
{
  v2 = [(SFAnalyticsCollection *)self queue];
  dispatch_sync(v2, &__block_literal_global_191);
}

- (unsigned)match:(id)a3 eventClass:(int64_t)a4 attributes:(id)a5 bucket:(unsigned int)a6 logger:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  v14 = getOSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v11;
    _os_log_debug_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEBUG, "matching rules %@", buf, 0xCu);
  }

  v15 = [(SFAnalyticsCollection *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke;
  v21[3] = &unk_1E54776F0;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v25 = &v27;
  int64_t v26 = a4;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync(v15, v21);

  unsigned int v19 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return v19;
}

void __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) matchingRules];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3 && [v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = *(void *)(a1 + 48);
          uint64_t v11 = *(void *)(a1 + 72);
          id v12 = objc_msgSend(*(id *)(a1 + 32), "processName", (void)v15);
          LODWORD(v10) = [v9 matchAttributes:v10 eventClass:v11 processName:v12 logger:*(void *)(a1 + 56)];

          if (v10)
          {
            id v13 = [*(id *)(a1 + 32) actions];
            *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v9 doAction:v13 attributes:*(void *)(a1 + 48) logger:*(void *)(a1 + 56)];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v4 = getOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v14;
      _os_log_debug_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEBUG, "no rules %@", buf, 0xCu);
    }
  }
}

- (void)storeCollection:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = -86;
  v8 = [(SFAnalyticsCollection *)self parseCollection:v6 logger:v7];
  v9 = [(SFAnalyticsCollection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SFAnalyticsCollection_storeCollection_logger___block_invoke;
  block[3] = &unk_1E54776C8;
  long long v16 = &v17;
  id v10 = v8;
  id v14 = v10;
  long long v15 = self;
  dispatch_sync(v9, block);

  if (v7 && *((unsigned char *)v18 + 24))
  {
    uint64_t v11 = getOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Setting up new rules", v12, 2u);
    }

    [v7 setDataProperty:v6 forKey:@"SFCollectionConfig"];
    [(SFAnalyticsCollection *)self setupMetricsHook:v7];
  }

  _Block_object_dispose(&v17, 8);
}

void __48__SFAnalyticsCollection_storeCollection_logger___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) matchingRules];
  v3 = [*(id *)(a1 + 40) matchingRules];
  if (v2 == v3)
  {
    v4 = [*(id *)(a1 + 32) allowedEvents];
    uint64_t v5 = [*(id *)(a1 + 40) allowedEvents];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 != v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  id v6 = [*(id *)(a1 + 32) matchingRules];
  [*(id *)(a1 + 40) setMatchingRules:v6];

  objc_msgSend(*(id *)(a1 + 40), "setExcludedVersion:", objc_msgSend(*(id *)(a1 + 32), "excludedVersion"));
  id v7 = [*(id *)(a1 + 32) allowedEvents];
  [*(id *)(a1 + 40) setAllowedEvents:v7];
}

- (void)loadCollection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 dataPropertyForKey:@"SFCollectionConfig"];
  id v6 = [(SFAnalyticsCollection *)self parseCollection:v5 logger:v4];
  id v7 = [(SFAnalyticsCollection *)self queue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __40__SFAnalyticsCollection_loadCollection___block_invoke;
  id v13 = &unk_1E54776A0;
  id v14 = self;
  id v8 = v6;
  id v15 = v8;
  dispatch_sync(v7, &v10);

  v9 = getOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "Loading matching rules: %@", buf, 0xCu);
  }

  -[SFAnalyticsCollection setupMetricsHook:](self, "setupMetricsHook:", v4, v10, v11, v12, v13, v14);
}

void __40__SFAnalyticsCollection_loadCollection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) matchingRules];
  [*(id *)(a1 + 32) setMatchingRules:v2];

  objc_msgSend(*(id *)(a1 + 32), "setExcludedVersion:", objc_msgSend(*(id *)(a1 + 40), "excludedVersion"));
  id v3 = [*(id *)(a1 + 40) allowedEvents];
  [*(id *)(a1 + 32) setAllowedEvents:v3];
}

- (void)stopMetricCollection
{
  id v3 = [(SFAnalyticsCollection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SFAnalyticsCollection_stopMetricCollection__block_invoke;
  block[3] = &unk_1E5484B08;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __45__SFAnalyticsCollection_stopMetricCollection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueue_stopMetricCollection");
}

- (void)onQueue_stopMetricCollection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4411;
  uint64_t v11 = __Block_byref_object_dispose__4412;
  id v12 = 0;
  uint64_t v3 = [(SFAnalyticsCollection *)self tearDownMetricsHook];
  id v4 = (void *)v8[5];
  v8[5] = v3;

  [(SFAnalyticsCollection *)self setTearDownMetricsHook:0];
  if (v8[5])
  {
    uint64_t v5 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke;
    block[3] = &unk_1E5484FA0;
    void block[4] = &v7;
    dispatch_async(v5, block);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)setupMetricsHook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFAnalyticsCollection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke;
  v7[3] = &unk_1E54776A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tearDownMetricsHook];

  if (!v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 40));
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2;
    aBlock[3] = &unk_1E5477630;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    uint64_t v3 = _Block_copy(aBlock);
    if ([*(id *)(a1 + 32) excludedVersion]) {
      id v4 = (id)[*(id *)(a1 + 40) AddMultiSamplerForName:@"SFACollection" withTimeInterval:&__block_literal_global_4413 block:-1.0];
    }
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_4;
    uint64_t v9 = &unk_1E5477678;
    objc_copyWeak(&v11, &location);
    id v5 = v3;
    id v10 = v5;
    [*(id *)(a1 + 32) setTearDownMetricsHook:&v6];
    if (v5) {
      objc_msgSend(*(id *)(a1 + 40), "addMetricsHook:", v5, v6, v7, v8, v9);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

uint64_t __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = v12;
  uint64_t v14 = 0;
  if (WeakRetained && v12)
  {
    if ([v12 excludedVersion])
    {
      uint64_t v14 = 1;
    }
    else
    {
      id v15 = [v13 allowedEvents];
      long long v16 = [v15 objectForKeyedSubscript:v9];

      if (v16
        && ([v16 integerValue] < 1
         || (uint64_t v17 = [v16 integerValue], v17 <= arc4random_uniform(0x64u))))
      {
        uint64_t v14 = [v13 match:v9 eventClass:a3 attributes:v10 bucket:a5 logger:WeakRetained];
      }
      else
      {
        uint64_t v14 = 1;
      }
    }
  }

  return v14;
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeMetricsHook:*(void *)(a1 + 32)];
}

void *__42__SFAnalyticsCollection_setupMetricsHook___block_invoke_3()
{
  return &unk_1ED86CD20;
}

- (id)parseCollection:(id)a3 logger:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v45 = a4;
  id v54 = 0;
  uint64_t v6 = [a3 decompressedDataUsingAlgorithm:0 error:&v54];
  id v7 = v54;
  if (v6)
  {
    id v8 = [[SECSFARules alloc] initWithData:v6];
    id v9 = objc_alloc_init(SecSFAParsedCollection);
    id v10 = [(SECSFARules *)v8 allowedBuilds];
    [(SecSFAParsedCollection *)v9 setExcludedVersion:[(SFAnalyticsCollection *)self allowedVersionsWithSelf:v10] ^ 1];

    if (![(SecSFAParsedCollection *)v9 excludedVersion])
    {
      id v41 = v7;
      v42 = v6;
      v44 = self;
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(SecSFAParsedCollection *)v9 setAllowedEvents:v11];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v43 = v8;
      id v12 = [(SECSFARules *)v8 eventFilters];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([v17 dropRate])
            {
              if ([v17 dropRate] < 1 || objc_msgSend(v17, "dropRate") > 100)
              {
                uint64_t v18 = 0;
              }
              else
              {
                uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "dropRate"));
              }
            }
            else
            {
              uint64_t v18 = &unk_1ED86CBE8;
            }
            uint64_t v19 = [(SecSFAParsedCollection *)v9 allowedEvents];
            char v20 = [v17 event];
            [v19 setObject:v18 forKeyedSubscript:v20];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v14);
      }

      uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
      [(SecSFAParsedCollection *)v9 setMatchingRules:v21];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v22 = [(SECSFARules *)v43 eventRules];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            uint64_t v28 = [v27 versions];
            if (v28)
            {
              uint64_t v29 = (void *)v28;
              int v30 = [v27 versions];
              BOOL v31 = [(SFAnalyticsCollection *)v44 matchRuleWithSelf:v30];

              if (!v31) {
                continue;
              }
            }
            id v32 = [(SecSFAParsedCollection *)v9 matchingRules];
            uint64_t v33 = [v27 eventType];
            v34 = [v32 objectForKeyedSubscript:v33];

            if (!v34)
            {
              v34 = [MEMORY[0x1E4F1CA80] set];
              v35 = [(SecSFAParsedCollection *)v9 matchingRules];
              v36 = [v27 eventType];
              [v35 setObject:v34 forKeyedSubscript:v36];
            }
            v37 = [[SFAnalyticsMatchingRule alloc] initWithSFARule:v27 logger:v45];
            if (v37) {
              [v34 addObject:v37];
            }
            v38 = [(SecSFAParsedCollection *)v9 allowedEvents];
            v39 = [v27 eventType];
            [v38 setObject:&unk_1ED86CBE8 forKeyedSubscript:v39];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v24);
      }

      id v7 = v41;
      uint64_t v6 = v42;
      id v8 = v43;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)allowedVersionsWithSelf:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || ![v4 versionsCount])
  {
    BOOL v14 = 1;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = objc_msgSend(v4, "versions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v11 = [v10 productName];
          id v12 = [(SFAnalyticsCollection *)self selfVersion];
          int v13 = [v12 productName];

          if (v11 == v13)
          {
            uint64_t v15 = [v10 major];
            long long v16 = [(SFAnalyticsCollection *)self selfVersion];
            uint64_t v17 = [v16 major];

            if (v15 > v17
              && (uint64_t v18 = [v10 minor],
                  [(SFAnalyticsCollection *)self selfVersion],
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v20 = [v19 minor],
                  v19,
                  v18 >= v20))
            {
              uint64_t v21 = [v10 minor];
              uint64_t v22 = [(SFAnalyticsCollection *)self selfVersion];
              if (v21 == [v22 minor])
              {
                uint64_t v23 = [v10 build];
                uint64_t v24 = [(SFAnalyticsCollection *)self selfVersion];
                BOOL v14 = v23 <= [v24 build];
              }
              else
              {
                BOOL v14 = 0;
              }
            }
            else
            {
              BOOL v14 = 1;
            }
            goto LABEL_20;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_20:
  }
  return v14;
}

- (BOOL)matchRuleWithSelf:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || ![v4 versionsCount])
  {
    BOOL v17 = 1;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = objc_msgSend(v4, "versions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v11 = [v10 productName];
          id v12 = [(SFAnalyticsCollection *)self selfVersion];
          int v13 = [v12 productName];

          if (v11 == v13)
          {
            uint64_t v14 = [v10 major];
            uint64_t v15 = [(SFAnalyticsCollection *)self selfVersion];
            uint64_t v16 = [v15 major];

            if (v14 <= v16)
            {
              uint64_t v18 = [v10 minor];
              uint64_t v19 = [(SFAnalyticsCollection *)self selfVersion];
              uint64_t v20 = [v19 minor];

              if (v18 == v20)
              {
                uint64_t v21 = [v10 build];
                uint64_t v22 = [(SFAnalyticsCollection *)self selfVersion];
                BOOL v17 = v21 >= [v22 build];
              }
              else
              {
                uint64_t v23 = [v10 minor];
                uint64_t v22 = [(SFAnalyticsCollection *)self selfVersion];
                BOOL v17 = v23 < [v22 minor];
              }

              goto LABEL_18;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 0;
LABEL_18:
  }
  return v17;
}

- (void)dealloc
{
  [(SFAnalyticsCollection *)self onQueue_stopMetricCollection];
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsCollection;
  [(SFAnalyticsCollection *)&v3 dealloc];
}

- (SFAnalyticsCollection)initWithActionInterface:(id)a3 product:(id)a4 build:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [(id)objc_opt_class() parseVersion:v9 platform:v10];

  if (v11
    && (v16.receiver = self,
        v16.super_class = (Class)SFAnalyticsCollection,
        (self = [(SFAnalyticsCollection *)&v16 init]) != 0))
  {
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("SFAnalyticsCollection", v12);
    [(SFAnalyticsCollection *)self setQueue:v13];

    [(SFAnalyticsCollection *)self setActions:v8];
    [(SFAnalyticsCollection *)self setSelfVersion:v11];
    self = self;
    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (SFAnalyticsCollection)init
{
  objc_super v3 = (void *)_CFCopySystemVersionDictionary();
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v7 = [v6 processName];
    [(SFAnalyticsCollection *)self setProcessName:v7];

    id v8 = objc_alloc_init(DefaultCollectionActions);
    self = [(SFAnalyticsCollection *)self initWithActionInterface:v8 product:v5 build:v4];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)parseVersion:(id)a3 platform:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(SECSFAVersion);
  if (([v6 isEqual:@"macOS"] & 1) != 0
    || ([v6 isEqual:@"Mac OS X"] & 1) != 0)
  {
    uint64_t v8 = 1;
  }
  else if ([v6 isEqual:@"iPhone OS"])
  {
    uint64_t v8 = 2;
  }
  else if ([v6 isEqual:@"Apple TVOS"])
  {
    uint64_t v8 = 5;
  }
  else if ([v6 isEqual:@"xrOS"])
  {
    uint64_t v8 = 3;
  }
  else
  {
    if (![v6 isEqual:@"Watch OS"])
    {
      dispatch_queue_t v13 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = 4;
  }
  [(SECSFAVersion *)v7 setProductName:v8];
  uint64_t v24 = 0;
  id v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(\\d+)([A-Z])(\\d+)" options:0 error:&v24];
  id v10 = objc_msgSend(v9, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  int v11 = v10;
  if (v10 && [v10 count] == 1)
  {
    id v12 = [v11 objectAtIndex:0];
    dispatch_queue_t v13 = 0;
    if ([v12 numberOfRanges] == 4)
    {
      uint64_t v14 = [v12 rangeAtIndex:1];
      objc_super v16 = objc_msgSend(v5, "substringWithRange:", v14, v15);
      -[SECSFAVersion setMajor:](v7, "setMajor:", (int)[v16 intValue]);

      uint64_t v17 = [v12 rangeAtIndex:2];
      uint64_t v19 = objc_msgSend(v5, "substringWithRange:", v17, v18);
      -[SECSFAVersion setMinor:](v7, "setMinor:", [v19 characterAtIndex:0] - 64);

      uint64_t v20 = [v12 rangeAtIndex:3];
      uint64_t v22 = objc_msgSend(v5, "substringWithRange:", v20, v21);
      -[SECSFAVersion setBuild:](v7, "setBuild:", (int)[v22 intValue]);

      dispatch_queue_t v13 = v7;
    }
  }
  else
  {
    dispatch_queue_t v13 = 0;
  }

LABEL_11:

  return v13;
}

@end