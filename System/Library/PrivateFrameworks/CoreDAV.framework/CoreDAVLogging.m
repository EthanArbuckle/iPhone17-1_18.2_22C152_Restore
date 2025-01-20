@interface CoreDAVLogging
+ (id)sharedLogging;
- (BOOL)_shouldOutputAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4;
- (BOOL)shouldLogAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4;
- (CoreDAVLogging)init;
- (id)_delegatesToLogForProvider:(id)a3;
- (id)delegatesToLogTransmittedDataForAccountInfoProvider:(id)a3;
- (id)logHandleForAccountInfoProvider:(id)a3;
- (void)addLogDelegate:(id)a3 forAccountInfoProvider:(id)a4;
- (void)logDiagnosticForProvider:(id)a3 withLevel:(int64_t)a4 format:(id)a5 args:(char *)a6;
- (void)removeLogDelegate:(id)a3 forAccountInfoProvider:(id)a4;
@end

@implementation CoreDAVLogging

+ (id)sharedLogging
{
  if (sharedLogging_onceToken != -1) {
    dispatch_once(&sharedLogging_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedLogging___sharedLogging;
  return v2;
}

uint64_t __31__CoreDAVLogging_sharedLogging__block_invoke()
{
  v0 = objc_alloc_init(CoreDAVLogging);
  uint64_t v1 = sharedLogging___sharedLogging;
  sharedLogging___sharedLogging = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (CoreDAVLogging)init
{
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVLogging;
  v2 = [(CoreDAVLogging *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    logDelegates = v2->_logDelegates;
    v2->_logDelegates = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    primaryLogDelegate = v2->_primaryLogDelegate;
    v2->_primaryLogDelegate = (NSMapTable *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.coredav.logdelegate", 0);
    delegateMuckingQueue = v2->_delegateMuckingQueue;
    v2->_delegateMuckingQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)addLogDelegate:(id)a3 forAccountInfoProvider:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 accountID];
  v8 = (void *)v7;
  v9 = @"GenericDelegate";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  objc_super v10 = v9;

  if ((objc_opt_respondsToSelector() & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[CoreDAVLogging addLogDelegate:forAccountInfoProvider:]();
  }
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CoreDAVLogging_addLogDelegate_forAccountInfoProvider___block_invoke;
  block[3] = &unk_2641DFCB0;
  block[4] = self;
  v15 = v10;
  id v16 = v6;
  id v12 = v6;
  v13 = v10;
  dispatch_sync(delegateMuckingQueue, block);
}

void __56__CoreDAVLogging_addLogDelegate_forAccountInfoProvider___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  if (!v2)
  {
    id v4 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    [*(id *)(a1[4] + 8) setObject:v4 forKeyedSubscript:a1[5]];
    v2 = v4;
  }
  id v5 = v2;
  [v2 addObject:a1[6]];
  uint64_t v3 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (v3)
  {
  }
  else if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1[4] + 16) setObject:a1[6] forKey:a1[5]];
  }
}

- (void)removeLogDelegate:(id)a3 forAccountInfoProvider:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 accountID];
  v8 = (void *)v7;
  v9 = @"GenericDelegate";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  objc_super v10 = v9;

  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CoreDAVLogging_removeLogDelegate_forAccountInfoProvider___block_invoke;
  block[3] = &unk_2641DFCB0;
  block[4] = self;
  v15 = v10;
  id v16 = v6;
  id v12 = v6;
  v13 = v10;
  dispatch_sync(delegateMuckingQueue, block);
}

void __59__CoreDAVLogging_removeLogDelegate_forAccountInfoProvider___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 removeObject:a1[6]];
    if (![v3 count]) {
      [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
    }
  }
  id v4 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  id v5 = (void *)a1[6];

  if (v4 == v5)
  {
    [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", v11, a1[5], (void)v12);
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

- (id)_delegatesToLogForProvider:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CoreDAVLogging__delegatesToLogForProvider___block_invoke;
  block[3] = &unk_2641DFD88;
  uint64_t v11 = self;
  long long v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(delegateMuckingQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __45__CoreDAVLogging__delegatesToLogForProvider___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = *(void **)(v3 + 8);
  if (v2)
  {
    id v5 = [v2 accountID];
    id v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 setRepresentation];
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if ([*(id *)(*(void *)(a1[6] + 8) + 40) count]) {
      return;
    }
    id v10 = *(void **)(a1[5] + 8);
  }
  else
  {
    id v10 = *(void **)(v3 + 8);
  }
  id v14 = [v10 objectForKeyedSubscript:@"GenericDelegate"];
  uint64_t v11 = [v14 setRepresentation];
  uint64_t v12 = *(void *)(a1[6] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (BOOL)shouldLogAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(CoreDAVLogging *)self _delegatesToLogForProvider:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "coreDAVLogLevel", (void)v13) >= a3)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)_shouldOutputAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(CoreDAVLogging *)self _delegatesToLogForProvider:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "coreDAVOutputLevel", (void)v13) >= a3)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)delegatesToLogTransmittedDataForAccountInfoProvider:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CoreDAVLogging_delegatesToLogTransmittedDataForAccountInfoProvider___block_invoke;
  block[3] = &unk_2641DFD88;
  BOOL v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(delegateMuckingQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __70__CoreDAVLogging_delegatesToLogTransmittedDataForAccountInfoProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountID];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  id v11 = (id)v2;
  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) accountID];
    id v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 setRepresentation];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v4 = [v3 objectForKeyedSubscript:@"GenericDelegate"];
    uint64_t v9 = [v4 setRepresentation];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)logHandleForAccountInfoProvider:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v5 = [v4 accountID];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"GenericDelegate";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CoreDAVLogging_logHandleForAccountInfoProvider___block_invoke;
  block[3] = &unk_2641DFDB0;
  uint64_t v15 = &v16;
  void block[4] = self;
  uint64_t v10 = v8;
  long long v14 = v10;
  dispatch_sync(delegateMuckingQueue, block);
  id v11 = [(id)v17[5] logHandle];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __50__CoreDAVLogging_logHandleForAccountInfoProvider___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) logHandle];

  if (!v5)
  {
    uint64_t v6 = [*(id *)(a1[4] + 16) objectForKey:@"GenericDelegate"];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 40);
    *(void *)(v7 + 40) = v6;
    MEMORY[0x270F9A758](v6, v8);
  }
}

- (void)logDiagnosticForProvider:(id)a3 withLevel:(int64_t)a4 format:(id)a5 args:(char *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = [(CoreDAVLogging *)self shouldLogAtLevel:a4 forAccountInfoProvider:v10];
  BOOL v13 = [(CoreDAVLogging *)self _shouldOutputAtLevel:a4 forAccountInfoProvider:v10];
  BOOL v14 = v13;
  if (v12 || v13)
  {
    uint64_t v15 = [[NSString alloc] initWithFormat:v11 arguments:a6];
    uint64_t v16 = (void *)v15;
    if (v14) {
      NSLog(&stru_26C4B73A0.isa, v15);
    }
    if (v12)
    {
      id v25 = v11;
      id v26 = v10;
      uint64_t v17 = [(CoreDAVLogging *)self _delegatesToLogForProvider:v10];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              [v22 coreDAVLogDiagnosticMessage:v16 atLevel:a4];
            }
            else if (objc_opt_respondsToSelector())
            {
              v23 = [v22 logHandle];
              os_log_type_t v24 = oldLevelToOSLogLevel[a4];
              if (os_log_type_enabled(v23, v24))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v16;
                _os_log_impl(&dword_213BFC000, v23, v24, "%@", buf, 0xCu);
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v19);
      }

      id v11 = v25;
      id v10 = v26;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMuckingQueue, 0);
  objc_storeStrong((id *)&self->_primaryLogDelegate, 0);
  objc_storeStrong((id *)&self->_logDelegates, 0);
}

- (void)addLogDelegate:forAccountInfoProvider:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_213BFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Added a logging delegate (type %{public}@) that doesn't implement -logHandle. This will degrade performance and result in completely useless, entirely redacted logs. Please migrate to os_log.", (uint8_t *)&v2, 0xCu);
}

@end