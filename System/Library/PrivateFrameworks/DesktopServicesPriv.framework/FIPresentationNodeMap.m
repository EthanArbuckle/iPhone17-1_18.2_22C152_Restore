@interface FIPresentationNodeMap
+ (id)presentationNodeForKeyNode:(id)a3;
+ (id)shared;
+ (void)finalize;
- (FIPresentationNodeMap)init;
- (id)presentationNodeForKeyNode:(id)a3;
- (void)registerPresentationNode:(id)a3 forNode:(id)a4;
- (void)registerPresentationNode:(id)a3 forNode:(id)a4 clearOlderKeyNodes:(BOOL)a5;
- (void)unregisterAllForPresentationNode:(id)a3;
- (void)unregisterKeyNode:(id)a3;
@end

@implementation FIPresentationNodeMap

+ (id)presentationNodeForKeyNode:(id)a3
{
  id v4 = a3;
  v5 = [a1 shared];
  v6 = [v5 presentationNodeForKeyNode:v4];

  return v6;
}

+ (id)shared
{
  std::mutex::lock(&PresentationNodeMapLock(void)::sMutex);
  v2 = (void *)gPresentationMap;
  if (!gPresentationMap)
  {
    v3 = objc_alloc_init(FIPresentationNodeMap);
    id v4 = (void *)gPresentationMap;
    gPresentationMap = (uint64_t)v3;

    v2 = (void *)gPresentationMap;
  }
  id v5 = v2;
  std::mutex::unlock(&PresentationNodeMapLock(void)::sMutex);
  return v5;
}

- (id)presentationNodeForKeyNode:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMapTable *)v5->_lookupTable objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (FIPresentationNodeMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)FIPresentationNodeMap;
  v2 = [(FIPresentationNodeMap *)&v6 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:20];
  lookupTable = v2->_lookupTable;
  v2->_lookupTable = (NSMapTable *)v3;

  return v2;
}

- (void)unregisterAllForPresentationNode:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v6 = v5->_lookupTable;
  id v7 = 0;
  uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [(NSMapTable *)v5->_lookupTable objectForKey:v11];
        if (v12 == v4)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v7 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        -[NSMapTable removeObjectForKey:](v5->_lookupTable, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v5);
  if (v13)
  {
    v17 = LogObj(5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v13 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_1D343E000, v17, OS_LOG_TYPE_DEBUG, "Removed %ld keys for presentation node %@", buf, 0x16u);
    }
  }
}

+ (void)finalize
{
  std::mutex::lock(&PresentationNodeMapLock(void)::sMutex);
  v2 = (void *)gPresentationMap;
  if (gPresentationMap)
  {
    uint64_t v3 = LogObj(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D343E000, v3, OS_LOG_TYPE_DEBUG, "Finalized presentation map", v4, 2u);
    }

    v2 = (void *)gPresentationMap;
  }
  gPresentationMap = 0;

  std::mutex::unlock(&PresentationNodeMapLock(void)::sMutex);
}

- (void)registerPresentationNode:(id)a3 forNode:(id)a4 clearOlderKeyNodes:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (v5) {
    [(FIPresentationNodeMap *)v9 unregisterAllForPresentationNode:v10];
  }
  [(FIPresentationNodeMap *)v9 registerPresentationNode:v10 forNode:v8];
  objc_sync_exit(v9);
}

- (void)registerPresentationNode:(id)a3 forNode:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    [(NSMapTable *)v9->_lookupTable setObject:v6 forKey:v8];
    id v10 = LogObj(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1D343E000, v10, OS_LOG_TYPE_DEBUG, "Adding to lookup table %{public}@ for %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_sync_exit(v9);
  }
  else
  {
    LogObj(5);
    uint64_t v9 = (FIPresentationNodeMap *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D343E000, &v9->super, OS_LOG_TYPE_ERROR, "Trying to register a nil node", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)unregisterKeyNode:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (IsDebugLogCategoryEnabled(5))
  {
    id v6 = [(NSMapTable *)v5->_lookupTable objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  [(NSMapTable *)v5->_lookupTable removeObjectForKey:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    id v7 = LogObj(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      int v11 = v6;
      _os_log_impl(&dword_1D343E000, v7, OS_LOG_TYPE_DEBUG, "Removed keyNode %@ for presentation node %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
}

@end