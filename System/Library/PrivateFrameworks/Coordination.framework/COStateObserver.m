@interface COStateObserver
- (COStateObserver)initWithDispatchQueue:(id)a3 predicate:(id)a4 block:(id)a5;
- (NSMutableDictionary)lastChanges;
- (NSPredicate)predicate;
- (OS_dispatch_queue)dispatchQueue;
- (id)block;
- (id)description;
- (void)notify:(id)a3;
@end

@implementation COStateObserver

- (COStateObserver)initWithDispatchQueue:(id)a3 predicate:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)COStateObserver;
  v12 = [(COStateObserver *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dispatchQueue, a3);
    uint64_t v14 = MEMORY[0x21D4BD7F0](v11);
    id block = v13->_block;
    v13->_id block = (id)v14;

    objc_storeStrong((id *)&v13->_predicate, a4);
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    lastChanges = v13->_lastChanges;
    v13->_lastChanges = (NSMutableDictionary *)v16;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(COStateObserver *)self predicate];
  v5 = [v3 stringWithFormat:@"<COStateObserver: %p Predicate: %@>", self, v4];

  return v5;
}

- (void)notify:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(COStateObserver *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__COStateObserver_notify___block_invoke;
  block[3] = &unk_2644449F0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__COStateObserver_notify___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    v38 = [MEMORY[0x263EFF9C0] set];
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"COStateManagerChangesCluster"];
    v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"COStateManagerChangesUpdatedKeyPaths"];
    v35 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"COStateManagerChangesRemovedKeyPaths"];
    id v6 = COLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __26__COStateObserver_notify___block_invoke_cold_1();
    }
    v37 = (void *)v4;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v13 = objc_msgSend(WeakRetained, "predicate", v35);
          uint64_t v14 = [v12 absoluteString];
          int v15 = [v13 evaluateWithObject:v14];

          if (v15)
          {
            uint64_t v16 = [WeakRetained[4] objectForKeyedSubscript:v37];
            v17 = [v16 objectForKey:v12];

            v18 = [v7 objectForKeyedSubscript:v12];
            if (([v17 isEqual:v18] & 1) == 0) {
              [v3 setObject:v18 forKey:v12];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v56 count:16];
      }
      while (v9);
    }
    v36 = v3;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v35;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v25 = objc_msgSend(WeakRetained, "predicate", v35);
          v26 = [v24 absoluteString];
          int v27 = [v25 evaluateWithObject:v26];

          if (v27) {
            [v38 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v21);
    }

    if ([v36 count] || objc_msgSend(v38, "count"))
    {
      v53[0] = @"COStateManagerChangesCluster";
      v53[1] = @"COStateManagerChangesUpdatedKeyPaths";
      v54[0] = v37;
      v54[1] = v36;
      v53[2] = @"COStateManagerChangesRemovedKeyPaths";
      v54[2] = v38;
      v28 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 3, v35);
      v29 = [WeakRetained[4] objectForKeyedSubscript:v37];
      if (v29)
      {
        v30 = [WeakRetained[4] objectForKeyedSubscript:v37];
        v31 = (void *)[v30 mutableCopy];
      }
      else
      {
        v31 = [MEMORY[0x263EFF9A0] dictionary];
      }

      if ([v36 count]) {
        [v31 addEntriesFromDictionary:v36];
      }
      if ([v19 count])
      {
        v32 = [v38 allObjects];
        [v31 removeObjectsForKeys:v32];
      }
      [WeakRetained[4] setObject:v31 forKey:v37];
      v33 = COLogForCategory(4);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v48 = WeakRetained;
        __int16 v49 = 2112;
        v50 = v28;
        __int16 v51 = 2112;
        v52 = v37;
        _os_log_impl(&dword_21D3E0000, v33, OS_LOG_TYPE_DEFAULT, "Observer %@ informing client of changes %@ for cluster %@", buf, 0x20u);
      }

      v34 = [WeakRetained block];
      ((void (**)(void, void *))v34)[2](v34, v28);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)block
{
  return self->_block;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSMutableDictionary)lastChanges
{
  return self->_lastChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChanges, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __26__COStateObserver_notify___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21D3E0000, v0, (uint64_t)v0, "Observer %@ got changes from the service for cluster %@", v1);
}

@end