@interface VCPMADResourceManager
+ (id)sharedManager;
- (VCPMADResourceManager)init;
- (id)activateResource:(id)a3;
- (id)entryForResource:(id)a3;
- (int64_t)currentBudget;
- (int64_t)validateCost:(int64_t)a3;
- (void)_purgeAllResources;
- (void)_reserveBudget:(int64_t)a3;
- (void)_setBudget:(int64_t)a3;
- (void)checkTimeout;
- (void)deactivateResource:(id)a3;
- (void)dealloc;
- (void)purgeAllResources;
- (void)purgeInactiveResources;
- (void)reserveBudget:(int64_t)a3;
- (void)reserveBudgetNormalized:(double)a3;
@end

@implementation VCPMADResourceManager

- (VCPMADResourceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPMADResourceManager;
  v2 = [(VCPMADResourceManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_budget = 100;
    dispatch_queue_t v4 = dispatch_queue_create("VCPMADResourceManager", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    resources = v3->_resources;
    v3->_resources = (NSMutableArray *)v6;
  }
  return v3;
}

+ (id)sharedManager
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  dispatch_queue_t v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_96];

  return v5;
}

VCPMADResourceManager *__38__VCPMADResourceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(VCPMADResourceManager);
  return v0;
}

- (void)dealloc
{
  [(VCPMADResourceManager *)self purgeAllResources];
  v3.receiver = self;
  v3.super_class = (Class)VCPMADResourceManager;
  [(VCPMADResourceManager *)&v3 dealloc];
}

- (int64_t)validateCost:(int64_t)a3
{
  int64_t v3 = 100;
  if (a3 < 100) {
    int64_t v3 = a3;
  }
  uint64_t v4 = v3 & ~(v3 >> 63);
  if (v4 != a3)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(VCPMADResourceManager *)a3 validateCost:v6];
    }
  }
  return v4;
}

- (int64_t)currentBudget
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__VCPMADResourceManager_currentBudget__block_invoke;
  v5[3] = &unk_1E629CFD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__VCPMADResourceManager_currentBudget__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_setBudget:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int64_t budget = self->_budget;
      int v7 = 134218240;
      int64_t v8 = budget;
      __int16 v9 = 2048;
      int64_t v10 = a3;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[ResourceManager] Updating budget (%ld --> %ld)", (uint8_t *)&v7, 0x16u);
    }
  }
  self->_int64_t budget = a3;
}

- (void)checkTimeout
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCPMADResourceManager_checkTimeout__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__VCPMADResourceManager_checkTimeout__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 40)];
    double v4 = v3;

    if (v4 > 30.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "[ResourceManager] Hit usage timeout; purging resources",
            v6,
            2u);
        }
      }
      [*(id *)(a1 + 32) _purgeAllResources];
    }
  }
}

- (id)entryForResource:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_resources;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        __int16 v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "resource", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_reserveBudget:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int64_t budget = self->_budget;
      *(_DWORD *)buf = 134218240;
      int64_t v41 = budget;
      __int16 v42 = 2048;
      int64_t v43 = a3;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to reserve budget [Budget: %ld][Target: %ld]", buf, 0x16u);
    }
  }
  if (self->_budget < a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[ResourceManager] Pruning inactive resources", buf, 2u);
      }
    }
    int64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    __int16 v9 = self->_resources;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (![v14 activeCount]) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    [v8 sortUsingComparator:&__block_literal_global_47];
    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v8;
    uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v31;
      *(void *)&long long v17 = 138412290;
      long long v28 = v17;
LABEL_21:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v30 + 1) + 8 * v20);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          int64_t v22 = a3;
          v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v24 = [v21 resource];
            *(_DWORD *)buf = v28;
            int64_t v41 = (int64_t)v24;
            _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[ResourceManager] Purging inactive resource (%@)", buf, 0xCu);
          }
          a3 = v22;
        }
        v25 = objc_msgSend(v21, "resource", v28);
        [v25 purge];

        [v15 addObject:v21];
        -[VCPMADResourceManager _setBudget:](self, "_setBudget:", [v21 currentCost] + self->_budget);
        if (self->_budget >= a3) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v18) {
            goto LABEL_21;
          }
          break;
        }
      }
    }

    [(NSMutableArray *)self->_resources removeObjectsInArray:v15];
    if (self->_budget < a3 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int64_t v27 = self->_budget;
        *(_DWORD *)buf = 134218240;
        int64_t v41 = v27;
        __int16 v42 = 2048;
        int64_t v43 = a3;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[ResourceManager] Failed to reserve budget [Budget: %ld][Target: %ld]", buf, 0x16u);
      }
    }
  }
}

uint64_t __40__VCPMADResourceManager__reserveBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 currentCost];
  if (v6 >= [v5 currentCost])
  {
    uint64_t v8 = [v5 currentCost];
    if (v8 >= [v4 currentCost]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)activateResource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __42__VCPMADResourceManager_activateResource___block_invoke;
  long long v13 = &unk_1E6297790;
  id v14 = v4;
  long long v15 = self;
  id v6 = v4;
  dispatch_sync(queue, &v10);
  uint64_t v7 = [VCPMADResourceLock alloc];
  uint64_t v8 = -[VCPMADResourceLock initWithResourceManager:andResource:](v7, "initWithResourceManager:andResource:", self, v6, v10, v11, v12, v13);

  return v8;
}

void __42__VCPMADResourceManager_activateResource___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v3;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to activate %@", buf, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(void *)(v4 + 48))
  {
    uint64_t v5 = os_transaction_create();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __42__VCPMADResourceManager_activateResource___block_invoke_50;
    v33[3] = &unk_1E629BF70;
    objc_copyWeak(&v34, (id *)buf);
    uint64_t v8 = +[VCPTimer timerWithIntervalSeconds:10 isOneShot:0 andBlock:v33];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
    uint64_t v4 = *(void *)(a1 + 40);
  }
  uint64_t v11 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v12 = [*(id *)(a1 + 40) entryForResource:*(void *)(a1 + 32)];
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "validateCost:", objc_msgSend(*(id *)(a1 + 32), "activeCost"));
  if (v12)
  {
    BOOL v14 = [(VCPMADResourceEntry *)v12 activeCount] == 0;
    int v15 = MediaAnalysisLogLevel();
    if (v14)
    {
      if (v15 >= 7)
      {
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v26;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource cached but not active (%@)", buf, 0xCu);
        }
      }
      [(VCPMADResourceEntry *)v12 setActiveCount:[(VCPMADResourceEntry *)v12 activeCount] + 1];
      uint64_t v27 = v13 - [(VCPMADResourceEntry *)v12 currentCost];
      [*(id *)(a1 + 40) _reserveBudget:v27];
      [(VCPMADResourceEntry *)v12 setCurrentCost:v13];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        long long v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v29 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v29;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "[ResourceManager] Activating resource (%@)", buf, 0xCu);
        }
      }
      [*(id *)(a1 + 40) _setBudget:*(void *)(*(void *)(a1 + 40) + 8) - v27];
    }
    else
    {
      if (v15 >= 7)
      {
        uint64_t v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v17;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource cached and active (%@)", buf, 0xCu);
        }
      }
      if (v13 > [(VCPMADResourceEntry *)v12 currentCost])
      {
        uint64_t v18 = v13 - [(VCPMADResourceEntry *)v12 currentCost];
        [*(id *)(a1 + 40) _reserveBudget:v18];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = v20;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[ResourceManager] Active resource cost has increased (%@)", buf, 0xCu);
          }
        }
        [*(id *)(a1 + 40) _setBudget:*(void *)(*(void *)(a1 + 40) + 8) - v18];
        [(VCPMADResourceEntry *)v12 setCurrentCost:v13];
      }
      [(VCPMADResourceEntry *)v12 setActiveCount:[(VCPMADResourceEntry *)v12 activeCount] + 1];
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource not cached (%@)", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) _reserveBudget:v13];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v24;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[ResourceManager] Activating resource (%@)", buf, 0xCu);
      }
    }
    uint64_t v12 = [[VCPMADResourceEntry alloc] initWithResource:*(void *)(a1 + 32)];
    [(VCPMADResourceEntry *)v12 setActiveCount:[(VCPMADResourceEntry *)v12 activeCount] + 1];
    [(VCPMADResourceEntry *)v12 setCurrentCost:v13];
    [*(id *)(*(void *)(a1 + 40) + 24) addObject:v12];
    [*(id *)(a1 + 40) _setBudget:*(void *)(*(void *)(a1 + 40) + 8) - v13];
  }
  if ((*(void *)(*(void *)(a1 + 40) + 8) & 0x8000000000000000) != 0)
  {
    long long v30 = VCPLogInstance();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      __42__VCPMADResourceManager_activateResource___block_invoke_cold_1(v30);
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v31 = VCPLogInstance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v32 = [(VCPMADResourceEntry *)v12 activeCount];
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v32;
      _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "[ResourceManager] Active count %d", buf, 8u);
    }
  }
}

void __42__VCPMADResourceManager_activateResource___block_invoke_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained checkTimeout];
    id WeakRetained = v2;
  }
}

- (void)deactivateResource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__VCPMADResourceManager_deactivateResource___block_invoke;
  v7[3] = &unk_1E6297790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __44__VCPMADResourceManager_deactivateResource___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v3;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to deactivate %@", buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 40) entryForResource:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __44__VCPMADResourceManager_deactivateResource___block_invoke_cold_1((uint64_t *)(a1 + 32), v13);
    }
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v4, "setActiveCount:", objc_msgSend(v4, "activeCount") - 1);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [v5 activeCount];
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[ResourceManager] Active count %d", buf, 8u);
    }
  }
  if (![v5 activeCount])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = [v5 resource];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource transition active --> inactive (%@)", buf, 0xCu);
      }
    }
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = [v5 resource];
    uint64_t v12 = objc_msgSend(v10, "validateCost:", objc_msgSend(v11, "inactiveCost"));

    objc_msgSend(*(id *)(a1 + 40), "_setBudget:", *(void *)(*(void *)(a1 + 40) + 8) - v12 + objc_msgSend(v5, "currentCost"));
    [v5 setCurrentCost:v12];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = *(id *)(*(void *)(a1 + 40) + 24);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
LABEL_17:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "activeCount", (void)v20) > 0) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15) {
            goto LABEL_17;
          }
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:

      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v13 = *(NSObject **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    goto LABEL_26;
  }
LABEL_27:
}

- (void)reserveBudget:(int64_t)a3
{
  int64_t v4 = [(VCPMADResourceManager *)self validateCost:a3];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__VCPMADResourceManager_reserveBudget___block_invoke;
  v6[3] = &unk_1E629B400;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(queue, v6);
}

uint64_t __39__VCPMADResourceManager_reserveBudget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reserveBudget:*(void *)(a1 + 40)];
}

- (void)reserveBudgetNormalized:(double)a3
{
}

- (void)purgeInactiveResources
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCPMADResourceManager_purgeInactiveResources__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __47__VCPMADResourceManager_purgeInactiveResources__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[ResourceManager] Request to purge inactive resources", buf, 2u);
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v24 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "activeCount", v24, (void)v25);
        int v12 = MediaAnalysisLogLevel();
        if (v11 < 1)
        {
          if (v12 >= 7)
          {
            uint64_t v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v16 = [v10 resource];
              *(_DWORD *)buf = v24;
              long long v30 = v16;
              _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[ResourceManager] Purging %@", buf, 0xCu);
            }
          }
          uint64_t v17 = [v10 resource];
          [v17 purge];

          [v3 addObject:v10];
          objc_msgSend(*(id *)(a1 + 32), "_setBudget:", objc_msgSend(v10, "currentCost") + *(void *)(*(void *)(a1 + 32) + 8));
        }
        else if (v12 >= 7)
        {
          uint64_t v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = [v10 resource];
            *(_DWORD *)buf = v24;
            long long v30 = v14;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "[ResourceManager] Skipping active resource (%@)", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectsInArray:v3];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 32) destroy];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(v18 + 32);
    *(void *)(v18 + 32) = 0;

    uint64_t v20 = *(void *)(a1 + 32);
    long long v21 = *(void **)(v20 + 48);
    *(void *)(v20 + 48) = 0;

    uint64_t v22 = *(void *)(a1 + 32);
    long long v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0;
  }
}

- (void)_purgeAllResources
{
  uint64_t v7 = [a2 resource];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_fault_impl(&dword_1BBEDA000, a4, OS_LOG_TYPE_FAULT, "[ResourceManager] Purging active resource (%@)", a1, 0xCu);
}

- (void)purgeAllResources
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCPMADResourceManager_purgeAllResources__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __42__VCPMADResourceManager_purgeAllResources__block_invoke(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[ResourceManager] Request to purge all resources", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _purgeAllResources];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_inactiveDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)validateCost:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "[ResourceManager] Invalid cost detected (%ld); clipped to %ld",
    (uint8_t *)&v3,
    0x16u);
}

void __42__VCPMADResourceManager_activateResource___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "[ResourceManager] Active resources exceed budget", v1, 2u);
}

void __44__VCPMADResourceManager_deactivateResource___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1BBEDA000, a2, OS_LOG_TYPE_FAULT, "[ResourceManager] Received request to deactivate un-tracked resource (%@)", (uint8_t *)&v3, 0xCu);
}

@end