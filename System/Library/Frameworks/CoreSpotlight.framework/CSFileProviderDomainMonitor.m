@interface CSFileProviderDomainMonitor
+ (id)sharedInstance;
- (BOOL)updateActiveProviders:(id)a3;
- (CSFileProviderDomainMonitor)init;
- (NSURL)fileProviderDomainURL;
- (OS_dispatch_queue)domainDeleteQueue;
- (OS_dispatch_queue)domainUpdateQueue;
- (OS_dispatch_queue)providerMonitorQueue;
- (id)domainCleaner;
- (id)fileProviderDelegate;
- (id)getProviderIDForBundle:(id)a3;
- (id)providerMonitor;
- (id)removedDomainFilterQueries;
- (unint64_t)loadSavedDomains:(id)a3;
- (void)dealloc;
- (void)notifyActiveProviderChanged;
- (void)saveAllDomains:(id)a3;
- (void)setDomainCleaner:(id)a3;
- (void)setDomainDeleteQueue:(id)a3;
- (void)setDomainUpdateQueue:(id)a3;
- (void)setFileProviderDelegate:(id)a3;
- (void)setProviderMonitor:(id)a3;
- (void)setProviderMonitorQueue:(id)a3;
- (void)startMonitoring;
- (void)updateActiveDomains:(id)a3;
- (void)updateRemovedDomains:(id)a3;
@end

@implementation CSFileProviderDomainMonitor

- (id)removedDomainFilterQueries
{
  v2 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_removedDomainsLock = &self->_removedDomainsLock;
  pthread_rwlock_rdlock(&self->_removedDomainsLock);
  removedDomains = v2->_removedDomains;
  if (removedDomains && [(NSMutableOrderedSet *)removedDomains count])
  {
    v32 = p_removedDomainsLock;
    id v35 = (id)objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v33 = v2;
    obuint64_t j = v2->_removedDomains;
    uint64_t v5 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v10 = NSString;
          v11 = [v9 objectAtIndexedSubscript:0];
          v12 = [v9 objectAtIndexedSubscript:1];
          v13 = [v9 objectAtIndexedSubscript:2];
          v14 = [v10 stringWithFormat:@"(!((%@==\"%@\", @"_kMDItemBundleID", v11, @"kMDItemFileProviderID", v12, @"_kMDItemDomainIdentifier"", v13];
          [v35 addObject:v14];
        }
        uint64_t v6 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v6);
    }

    p_removedDomainsLock = v32;
    v2 = v33;
    v15 = v35;
  }
  else
  {
    v15 = 0;
  }
  pthread_rwlock_unlock(p_removedDomainsLock);
  p_activeDomainsLock = &v2->_activeDomainsLock;
  pthread_rwlock_rdlock(&v2->_activeDomainsLock);
  activeDomains = v2->_activeDomains;
  if (activeDomains && [(NSDictionary *)activeDomains count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v36 = v2->_activeDomains;
    uint64_t v18 = [(NSDictionary *)v36 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v36);
          }
          v22 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v23 = [(NSDictionary *)v2->_activeDomains objectForKeyedSubscript:v22];
          char v24 = [v23 BOOLValue];

          if ((v24 & 1) == 0)
          {
            if (!v15) {
              v15 = objc_opt_new();
            }
            v25 = NSString;
            v26 = [v22 objectAtIndexedSubscript:0];
            [v22 objectAtIndexedSubscript:1];
            v28 = v27 = v15;
            v29 = [v22 objectAtIndexedSubscript:2];
            v30 = [v25 stringWithFormat:@"(!((%@==\"%@\", @"_kMDItemBundleID", v26, @"kMDItemFileProviderID", v28, @"_kMDItemDomainIdentifier"", v29];
            [v27 addObject:v30];

            v15 = v27;
          }
        }
        uint64_t v19 = [(NSDictionary *)v36 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v19);
    }

    p_activeDomainsLock = &v2->_activeDomainsLock;
  }
  pthread_rwlock_unlock(p_activeDomainsLock);

  return v15;
}

- (id)getProviderIDForBundle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_activeDomainsLock = &self->_activeDomainsLock;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_activeDomains;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", 0, (void)v16);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = NSString;
          v14 = [v10 objectAtIndexedSubscript:1];
          uint64_t v7 = [v13 stringWithString:v14];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  pthread_rwlock_unlock(p_activeDomainsLock);

  return v7;
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_13(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v28 = v2;
  id v4 = [v2 allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v10 = [v9 FPDomainItem];
        if (v10)
        {
          if ([v9 isHidden] & 1) != 0 || (objc_msgSend(v9, "isHiddenByUser"))
          {
            uint64_t v11 = 0;
          }
          else
          {
            int v12 = [v9 domain];
            uint64_t v11 = [v12 userEnabled];
          }
          v13 = [NSNumber numberWithBool:v11];
          [v3 setObject:v13 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  id v14 = *(id *)(a1 + 32);
  v15 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v16 = [v14 allValues];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v22 = [v21 providerID];
        v23 = [v21 topLevelBundleIdentifier];
        [v15 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  char v24 = [*(id *)(a1 + 40) domainCleaner];

  if (v24)
  {
    char v24 = (void *)[*(id *)(a1 + 40) loadSavedDomains:v3];
    [*(id *)(a1 + 40) updateRemovedDomains:v3];
    [*(id *)(a1 + 40) saveAllDomains:v3];
  }
  [*(id *)(a1 + 40) updateActiveDomains:v3];
  if ([*(id *)(a1 + 40) updateActiveProviders:v15]) {
    [*(id *)(a1 + 40) notifyActiveProviderChanged];
  }
  v25 = [*(id *)(a1 + 40) domainCleaner];

  if (v25)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    v27 = *(NSObject **)(v26 + 656);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_2;
    block[3] = &unk_1E5549528;
    block[4] = v26;
    block[5] = v24;
    dispatch_async(v27, block);
  }
}

- (id)domainCleaner
{
  return objc_getProperty(self, a2, 640, 1);
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 224));
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 216) count];
  unint64_t v3 = *(void *)(a1 + 40);
  if (v2 <= 3 && v3 == 0)
  {
    int v12 = (pthread_rwlock_t *)(*(void *)(a1 + 32) + 224);
    pthread_rwlock_unlock(v12);
  }
  else
  {
    unint64_t v5 = v2 >> 1;
    if (v2 - (v2 >> 1) > 5) {
      unint64_t v5 = v2 - 5;
    }
    if (v5 <= v3) {
      unint64_t v6 = *(void *)(a1 + 40);
    }
    else {
      unint64_t v6 = v5;
    }
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 216) array];
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, v6);

    pthread_rwlock_unlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 224));
    v9 = [*(id *)(a1 + 32) domainCleaner];
    int v10 = ((uint64_t (**)(void, void *))v9)[2](v9, v8);

    if (v10)
    {
      pthread_rwlock_wrlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 224));
      [*(id *)(*(void *)(a1 + 32) + 216) removeObjectsInArray:v8];
      pthread_rwlock_unlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 224));
      uint64_t v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEFAULT, "Cleaned up removed domains: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else if (v5)
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 664);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_13;
    v11[3] = &unk_1E5548FE0;
    v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = v9;
    uint64_t v13 = v10;
    dispatch_async(v8, v11);
    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "Null providerDomainsByID from beginMonitoringProviderDomainChangesWithHandler.", buf, 2u);
    }
  }
}

- (void)updateRemovedDomains:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  p_activeDomainsLock = &self->_activeDomainsLock;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  activeDomains = self->_activeDomains;
  if (activeDomains && [(NSDictionary *)activeDomains count])
  {
    uint64_t v19 = &self->_activeDomainsLock;
    uint64_t v20 = self;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = self->_activeDomains;
    uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = objc_msgSend(v4, "objectForKey:", v13, v19, v20);

          if (!v14)
          {
            [v5 addObject:v13];
            uint64_t v15 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v13;
              _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_DEFAULT, "Found removed FP domain: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }

    p_activeDomainsLock = v19;
    self = v20;
  }
  pthread_rwlock_unlock(p_activeDomainsLock);
  pthread_rwlock_wrlock(&self->_removedDomainsLock);
  removedDomains = self->_removedDomains;
  if (!removedDomains)
  {
    uint64_t v17 = (NSMutableOrderedSet *)objc_opt_new();
    uint64_t v18 = self->_removedDomains;
    self->_removedDomains = v17;

    removedDomains = self->_removedDomains;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](removedDomains, "addObjectsFromArray:", v5, v19, v20);
  pthread_rwlock_unlock(&self->_removedDomainsLock);
}

- (BOOL)updateActiveProviders:(id)a3
{
  id v5 = a3;
  p_activeProvidersLock = &self->_activeProvidersLock;
  pthread_rwlock_wrlock(&self->_activeProvidersLock);
  if ([(NSDictionary *)self->_activeProvidersMap isEqual:v5])
  {
    BOOL v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_activeProvidersMap, a3);
    BOOL v7 = self->_providerMonitor != 0;
  }
  pthread_rwlock_unlock(p_activeProvidersLock);

  return v7;
}

- (void)updateActiveDomains:(id)a3
{
  id v4 = (NSDictionary *)a3;
  pthread_rwlock_wrlock(&self->_activeDomainsLock);
  activeDomains = self->_activeDomains;
  self->_activeDomains = v4;

  pthread_rwlock_unlock(&self->_activeDomainsLock);
}

- (void)saveAllDomains:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        activeDomains = self->_activeDomains;
        if (!activeDomains
          || (-[NSDictionary objectForKey:](activeDomains, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v9), (void)v17), uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
        {

          pthread_rwlock_unlock(&self->_activeDomainsLock);
          pthread_rwlock_rdlock(&self->_removedDomainsLock);
          int v12 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v13 = [(NSMutableOrderedSet *)self->_removedDomains array];
          id v14 = [v12 arrayWithArray:v13];

          pthread_rwlock_unlock(&self->_removedDomainsLock);
          uint64_t v15 = [v5 allKeys];
          [v14 addObjectsFromArray:v15];

          long long v16 = [(CSFileProviderDomainMonitor *)self fileProviderDomainURL];
          [v14 writeToURL:v16 error:0];

          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  pthread_rwlock_unlock(&self->_activeDomainsLock);
LABEL_12:
}

- (unint64_t)loadSavedDomains:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((loadSavedDomains__loaded & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = [(CSFileProviderDomainMonitor *)self fileProviderDomainURL];
    uint64_t v8 = [v6 arrayWithContentsOfURL:v7];

    loadSavedDomains__loaded = 1;
    if (v8)
    {
      p_removedDomainsLock = &self->_removedDomainsLock;
      pthread_rwlock_wrlock(&self->_removedDomainsLock);
      removedDomains = self->_removedDomains;
      if (!removedDomains)
      {
        uint64_t v10 = (NSMutableOrderedSet *)objc_opt_new();
        uint64_t v11 = self->_removedDomains;
        self->_removedDomains = v10;

        removedDomains = self->_removedDomains;
      }
      uint64_t v23 = [(NSMutableOrderedSet *)removedDomains count];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v25 = v8;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ((unint64_t)[v17 count] > 2)
            {
              long long v21 = [v4 objectForKey:v17];

              if (v21) {
                continue;
              }
              [(NSMutableOrderedSet *)self->_removedDomains addObject:v17];
              long long v18 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v17;
                long long v19 = v18;
                long long v20 = "Found removed FP domain in saved domains: %@";
                goto LABEL_17;
              }
            }
            else
            {
              long long v18 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v17;
                long long v19 = v18;
                long long v20 = "*warn* Skipping incomplete saved domain: %@";
LABEL_17:
                _os_log_impl(&dword_18D0E3000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v14);
      }

      unint64_t v5 = [(NSMutableOrderedSet *)self->_removedDomains count] - v23;
      pthread_rwlock_unlock(p_removedDomainsLock);
      uint64_t v8 = v25;
    }
    else
    {
      unint64_t v5 = 0;
    }

    goto LABEL_24;
  }
  unint64_t v5 = 0;
LABEL_24:

  return v5;
}

- (void)notifyActiveProviderChanged
{
  providerMonitorQueue = self->_providerMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSFileProviderDomainMonitor_notifyActiveProviderChanged__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_async(providerMonitorQueue, block);
}

void __58__CSFileProviderDomainMonitor_notifyActiveProviderChanged__block_invoke(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 432));
  unint64_t v2 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 632));
  unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 424) copy];
  pthread_rwlock_unlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 432));
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    unint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_DEFAULT, "List of active FileProviders has changed.", v6, 2u);
    }

    v2[2](v2, v3);
  }
}

- (void)setProviderMonitor:(id)a3
{
  p_activeProvidersLock = &self->_activeProvidersLock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_activeProvidersLock);
  uint64_t v6 = _Block_copy(v5);

  id providerMonitor = self->_providerMonitor;
  self->_id providerMonitor = v6;

  if (v5)
  {
    activeProvidersMap = self->_activeProvidersMap;
    pthread_rwlock_unlock(p_activeProvidersLock);
    if (activeProvidersMap)
    {
      [(CSFileProviderDomainMonitor *)self notifyActiveProviderChanged];
    }
  }
  else
  {
    pthread_rwlock_unlock(p_activeProvidersLock);
  }
}

- (id)providerMonitor
{
  p_activeProvidersLock = &self->_activeProvidersLock;
  pthread_rwlock_rdlock(&self->_activeProvidersLock);
  BOOL v4 = _Block_copy(self->_providerMonitor);
  pthread_rwlock_unlock(p_activeProvidersLock);
  id v5 = _Block_copy(v4);

  return v5;
}

- (NSURL)fileProviderDomainURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  unint64_t v3 = NSString;
  BOOL v4 = NSHomeDirectory();
  id v5 = [v3 stringWithFormat:@"%@/%@", v4, @"Library/Spotlight/FileProviderDomains.plist"];
  uint64_t v6 = (void *)[v2 initFileURLWithPath:v5];

  return (NSURL *)v6;
}

- (void)startMonitoring
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke;
  v5[3] = &unk_1E5549550;
  v5[4] = self;
  unint64_t v3 = [MEMORY[0x1E4F25D68] beginMonitoringProviderDomainChangesWithHandler:v5];
  id fileProviderDelegate = self->_fileProviderDelegate;
  self->_id fileProviderDelegate = v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSFileProviderDomainMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  id v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __45__CSFileProviderDomainMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CSFileProviderDomainMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSFileProviderDomainMonitor;
  id v2 = [(CSFileProviderDomainMonitor *)&v17 init];
  unint64_t v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_activeDomainsLock, 0);
    pthread_rwlock_init(&v3->_removedDomainsLock, 0);
    pthread_rwlock_init(&v3->_activeProvidersLock, 0);
    BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.domainUpdate", v5);
    domainUpdateQueue = v3->_domainUpdateQueue;
    v3->_domainUpdateQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.domainDelete", v9);
    domainDeleteQueue = v3->_domainDeleteQueue;
    v3->_domainDeleteQueue = (OS_dispatch_queue *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.providerMonitor", v13);
    providerMonitorQueue = v3->_providerMonitorQueue;
    v3->_providerMonitorQueue = (OS_dispatch_queue *)v14;

    [(CSFileProviderDomainMonitor *)v3 startMonitoring];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_fileProviderDelegate)
  {
    objc_msgSend(MEMORY[0x1E4F25D68], "endMonitoringProviderDomainChanges:");
    id fileProviderDelegate = self->_fileProviderDelegate;
    self->_id fileProviderDelegate = 0;
  }
  pthread_rwlock_destroy(&self->_activeDomainsLock);
  pthread_rwlock_destroy(&self->_removedDomainsLock);
  pthread_rwlock_destroy(&self->_activeProvidersLock);
  v4.receiver = self;
  v4.super_class = (Class)CSFileProviderDomainMonitor;
  [(CSFileProviderDomainMonitor *)&v4 dealloc];
}

- (void)setDomainCleaner:(id)a3
{
}

- (id)fileProviderDelegate
{
  return self->_fileProviderDelegate;
}

- (void)setFileProviderDelegate:(id)a3
{
}

- (OS_dispatch_queue)domainDeleteQueue
{
  return self->_domainDeleteQueue;
}

- (void)setDomainDeleteQueue:(id)a3
{
}

- (OS_dispatch_queue)domainUpdateQueue
{
  return self->_domainUpdateQueue;
}

- (void)setDomainUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)providerMonitorQueue
{
  return self->_providerMonitorQueue;
}

- (void)setProviderMonitorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMonitorQueue, 0);
  objc_storeStrong((id *)&self->_domainUpdateQueue, 0);
  objc_storeStrong((id *)&self->_domainDeleteQueue, 0);
  objc_storeStrong(&self->_fileProviderDelegate, 0);
  objc_storeStrong(&self->_domainCleaner, 0);
  objc_storeStrong(&self->_providerMonitor, 0);
  objc_storeStrong((id *)&self->_activeProvidersMap, 0);
  objc_storeStrong((id *)&self->_removedDomains, 0);

  objc_storeStrong((id *)&self->_activeDomains, 0);
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Error from beginMonitoringProviderDomainChangesWithHandler: %@", (uint8_t *)&v2, 0xCu);
}

@end