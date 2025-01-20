@interface CLKUIResourceManager
+ (id)sharedInstance;
- (BOOL)ensureMemoryAvailable:(unint64_t)a3;
- (BOOL)memoryIsAvailable:(unint64_t)a3;
- (CLKUIResourceManager)init;
- (id)_fetchOldestAtlas;
- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4 streaming:(BOOL)a5;
- (id)borrowTextureLoadingQueue;
- (id)delegateForUuid:(id)a3;
- (id)nullAtlas2D;
- (id)nullAtlasCube;
- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:(BOOL)a6 streaming:;
- (unint64_t)_computeMemoryAvailable;
- (unint64_t)_memoryLimit;
- (unint64_t)explicitMemoryLimit;
- (void)_purgeAllUnconditionally;
- (void)dealloc;
- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4;
- (void)purge:(id)a3;
- (void)purgeAllUnused;
- (void)returnTextureLoadingQueue:(id)a3;
- (void)setExplicitMemoryLimit:(unint64_t)a3;
- (void)updateTextureStreaming;
@end

@implementation CLKUIResourceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __38__CLKUIResourceManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (CLKUIResourceManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CLKUIResourceManager;
  v2 = [(CLKUIResourceManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    atlasesByUuid = v2->_atlasesByUuid;
    v2->_atlasesByUuid = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    providersByKey = v2->_providersByKey;
    v2->_providersByKey = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    recentProvidersForUuid = v2->_recentProvidersForUuid;
    v2->_recentProvidersForUuid = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    streamedAtlases = v2->_streamedAtlases;
    v2->_streamedAtlases = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    textureLoaderQueues = v2->_textureLoaderQueues;
    v2->_textureLoaderQueues = (NSMutableArray *)v11;

    int v13 = CLKRunningInProcess();
    uint64_t v14 = 36700160;
    if (!v13) {
      uint64_t v14 = -1;
    }
    v2->_memoryLimit = v14;
    v2->_explicitMemoryLimit = -1;
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__purgeAllUnconditionally name:*MEMORY[0x1E4F19628] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19628] object:0];

  v4.receiver = self;
  v4.super_class = (Class)CLKUIResourceManager;
  [(CLKUIResourceManager *)&v4 dealloc];
}

- (id)nullAtlas2D
{
  return 0;
}

- (id)nullAtlasCube
{
  return 0;
}

- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:(BOOL)a6 streaming:
{
  BOOL v7 = a6;
  long long v21 = v6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v12 resourceProviderKey];
  v15 = v14;
  v16 = 0;
  if (v11 && v14)
  {
    objc_super v17 = [v14 key];
    v18 = [(NSMutableDictionary *)self->_providersByKey objectForKey:v17];
    if (!v18)
    {
      v18 = (void *)[(id)objc_opt_new() initWithDelegate:v12 key:v17];
      [(NSMutableDictionary *)self->_providersByKey setObject:v18 forKeyedSubscript:v17];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v18, v11, v21);
    [v18 addUuidToHistory:v11];
    id v19 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:v11];
    if (!v19)
    {
      id v19 = [(CLKUIResourceManager *)self _newAtlasForUuid:v11 nullTexture:v13 streaming:v7];
      [(NSMutableDictionary *)self->_atlasesByUuid setObject:v19 forKeyedSubscript:v11];
      if (v7) {
        [(NSMutableArray *)self->_streamedAtlases addObject:v19];
      }
    }
    v16 = [[CLKUITexture alloc] initWithAtlas:v19 rect:v22];
  }
  return v16;
}

- (void)purge:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:a3];
  if ([v5 isPurgable])
  {
    objc_super v4 = objc_opt_new();
    [v4 addObject:v5];
    [(CLKUIResourceManager *)self _purgeAtlases:v4];
  }
}

- (unint64_t)_memoryLimit
{
  unint64_t result = self->_explicitMemoryLimit;
  if (result == -1) {
    return self->_memoryLimit;
  }
  return result;
}

- (unint64_t)_computeMemoryAvailable
{
  if (self->_explicitMemoryLimit == -1 && !CLKRunningInProcess()) {
    return -1;
  }
  unint64_t v2 = MEMORY[0x1D9431E80]();
  if (v2 >= 0x500000) {
    return v2 - 5242880;
  }
  else {
    return 0;
  }
}

- (id)_fetchOldestAtlas
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = self->_atlasesByUuid;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if ([v10 isPurgable])
        {
          if (v6)
          {
            [v10 boundTime];
            if (v11 < v8)
            {
              double v12 = v11;
              id v13 = v10;

              double v8 = v12;
              id v6 = v13;
            }
          }
          else
          {
            id v6 = v10;
            [v6 boundTime];
            double v8 = v14;
          }
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)borrowTextureLoadingQueue
{
  if ([(NSMutableArray *)self->_textureLoaderQueues count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_textureLoaderQueues lastObject];
    [(NSMutableArray *)self->_textureLoaderQueues removeLastObject];
  }
  else
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    uint64_t v3 = dispatch_queue_create("CLKUIMetalTexture queue", v4);
  }
  return v3;
}

- (void)returnTextureLoadingQueue:(id)a3
{
}

- (BOOL)memoryIsAvailable:(unint64_t)a3
{
  unint64_t v5 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
  return self->_memoryUsed + a3 <= [(CLKUIResourceManager *)self _memoryLimit] && v5 >= a3;
}

- (BOOL)ensureMemoryAvailable:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
  unint64_t v6 = [(CLKUIResourceManager *)self _memoryLimit];
  if (self->_memoryUsed + a3 > v6 || v5 < a3)
  {
    unint64_t v8 = v6;
    uint64_t v9 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t memoryUsed = self->_memoryUsed;
      *(_DWORD *)buf = 134218752;
      unint64_t v30 = a3;
      __int16 v31 = 2048;
      unint64_t v32 = v5;
      __int16 v33 = 2048;
      unint64_t v34 = memoryUsed;
      __int16 v35 = 2048;
      unint64_t v36 = v8;
      _os_log_impl(&dword_1D3174000, v9, OS_LOG_TYPE_DEFAULT, "evications begin (needs %lu bytes, %lu available bytes, %lu memory used, %lu limit)", buf, 0x2Au);
    }

    [(CLKUIResourceManager *)self purgeAllUnused];
    unint64_t v11 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
    unint64_t v12 = v11;
    if (self->_memoryUsed + a3 > v8 || v11 < a3)
    {
      id v13 = objc_opt_new();
      uint64_t v16 = [(CLKUIResourceManager *)self _fetchOldestAtlas];
      if (!v16)
      {
LABEL_19:
        v23 = CLKLoggingObjectForDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v24 = self->_memoryUsed;
          *(_DWORD *)buf = 134218240;
          unint64_t v30 = v12;
          __int16 v31 = 2048;
          unint64_t v32 = v24;
          _os_log_impl(&dword_1D3174000, v23, OS_LOG_TYPE_DEFAULT, "evications end: failed (%lu available bytes, %lu memory used)", buf, 0x16u);
        }

        BOOL v15 = 0;
        goto LABEL_26;
      }
      long long v18 = (void *)v16;
      *(void *)&long long v17 = 138412290;
      long long v28 = v17;
      while (1)
      {
        long long v19 = CLKLoggingObjectForDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v18 uuid];
          *(_DWORD *)buf = v28;
          unint64_t v30 = (unint64_t)v20;
          _os_log_impl(&dword_1D3174000, v19, OS_LOG_TYPE_DEFAULT, "evict uuid %@", buf, 0xCu);
        }
        [v13 addObject:v18];
        [(CLKUIResourceManager *)self _purgeAtlases:v13];
        [v13 removeAllObjects];
        unint64_t v21 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
        unint64_t v12 = v21;
        if (self->_memoryUsed + a3 <= v8 && v21 >= a3) {
          break;
        }
        uint64_t v22 = [(CLKUIResourceManager *)self _fetchOldestAtlas];

        long long v18 = (void *)v22;
        if (!v22) {
          goto LABEL_19;
        }
      }
      v25 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = self->_memoryUsed;
        *(_DWORD *)buf = 134218240;
        unint64_t v30 = v12;
        __int16 v31 = 2048;
        unint64_t v32 = v26;
        _os_log_impl(&dword_1D3174000, v25, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
      }
    }
    else
    {
      id v13 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = self->_memoryUsed;
        *(_DWORD *)buf = 134218240;
        unint64_t v30 = v12;
        __int16 v31 = 2048;
        unint64_t v32 = v14;
        _os_log_impl(&dword_1D3174000, v13, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
      }
    }
    BOOL v15 = 1;
LABEL_26:

    return v15;
  }
  return 1;
}

- (void)purgeAllUnused
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v3 = self->_providersByKey;
    uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      unint64_t v6 = 0;
      uint64_t v7 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v10 = [(NSMutableDictionary *)self->_providersByKey objectForKeyedSubscript:v9];
          unint64_t v11 = [v10 delegate];
          if (!v11)
          {
            if (!v6) {
              unint64_t v6 = objc_opt_new();
            }
            [v6 addObject:v9];
          }
        }
        uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v6 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v12 = self->_atlasesByUuid;
    uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      BOOL v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v12);
          }
          long long v19 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          if (![v19 instanceCount])
          {
            if ([v19 isPurgable])
            {
              if (!v16) {
                uint64_t v16 = objc_opt_new();
              }
              [v16 addObject:v19];
            }
            if (!v15) {
              BOOL v15 = objc_opt_new();
            }
            [v15 addObject:v19];
          }
        }
        uint64_t v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v14);

      if (v16) {
        [(CLKUIResourceManager *)self _purgeAtlases:v16];
      }
      if (!v6) {
        goto LABEL_37;
      }
    }
    else
    {

      uint64_t v16 = 0;
      BOOL v15 = 0;
      if (!v6) {
        goto LABEL_37;
      }
    }
    [(NSMutableDictionary *)self->_providersByKey removeObjectsForKeys:v6];
LABEL_37:
    if (v15)
    {
      long long v28 = v16;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v20 = v15;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v43 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t k = 0; k != v22; ++k)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v29 + 1) + 8 * k);
            unint64_t v26 = [v25 uuid];
            v27 = CLKLoggingObjectForDomain();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v26;
              _os_log_impl(&dword_1D3174000, v27, OS_LOG_TYPE_DEFAULT, "discard uuid %@", buf, 0xCu);
            }

            [(NSMutableDictionary *)self->_atlasesByUuid removeObjectForKey:v26];
            [(NSMutableDictionary *)self->_recentProvidersForUuid removeObjectForKey:v26];
            [(NSMutableArray *)self->_streamedAtlases removeObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v43 count:16];
        }
        while (v22);
      }

      uint64_t v16 = v28;
    }

    return;
  }
  [(CLKUIResourceManager *)self performSelectorOnMainThread:sel_purgeAllUnused withObject:0 waitUntilDone:0];
}

- (void)updateTextureStreaming
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_streamedAtlases;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CLKUIResourceManager _updateTextureStreamingForAtlas:](self, "_updateTextureStreamingForAtlas:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4
{
  self->_memoryUsed += a4;
  self->_memoryUsed -= [a3 memoryCost];
}

- (id)delegateForUuid:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_recentProvidersForUuid objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (!v5 || ([v5 delegate], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v8 = self->_providersByKey;
    uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v17 = v6;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [(NSMutableDictionary *)self->_providersByKey objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          uint64_t v7 = [v13 delegate];
          if (v7)
          {
            uint64_t v14 = [v13 uuidHistory];
            char v15 = [v14 containsObject:v4];

            if (v15)
            {
              [(NSMutableDictionary *)self->_recentProvidersForUuid setObject:v13 forKeyedSubscript:v4];

              goto LABEL_14;
            }
          }
        }
        uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      uint64_t v7 = 0;
LABEL_14:
      uint64_t v6 = v17;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (void)_purgeAllUnconditionally
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v3 = objc_opt_new();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = self->_atlasesByUuid;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
          if ([v9 isPurgable]) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(CLKUIResourceManager *)self _purgeAtlases:v3];
  }
  else
  {
    [(CLKUIResourceManager *)self performSelectorOnMainThread:sel__purgeAllUnconditionally withObject:0 waitUntilDone:0];
  }
}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4 streaming:(BOOL)a5
{
  return 0;
}

- (unint64_t)explicitMemoryLimit
{
  return self->_explicitMemoryLimit;
}

- (void)setExplicitMemoryLimit:(unint64_t)a3
{
  self->_explicitMemoryLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureLoaderQueues, 0);
  objc_storeStrong((id *)&self->_streamedAtlases, 0);
  objc_storeStrong((id *)&self->_providersByKey, 0);
  objc_storeStrong((id *)&self->_atlasesByUuid, 0);
  objc_storeStrong((id *)&self->_recentProvidersForUuid, 0);
}

@end