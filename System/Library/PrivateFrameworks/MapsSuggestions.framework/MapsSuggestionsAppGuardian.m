@interface MapsSuggestionsAppGuardian
+ (int64_t)protectionStatusForBundleID:(id)a3;
- (BOOL)isBundleIDLocked:(id)a3 forSource:(id)a4;
- (NSString)uniqueName;
- (id)initFromResourceDepot:(id)a3;
- (void)_add:(id)a3 source:(id)a4;
- (void)_remove:(id)a3 source:(id)a4;
- (void)_removeAllBundleIDsForSource:(id)a3;
- (void)appProtectionStatusChanged:(id)a3;
- (void)registerAppTracker:(id)a3;
- (void)registerBundleID:(id)a3 withSource:(id)a4;
- (void)unregisterAllBundleIDsForSource:(id)a3;
- (void)unregisterAppTracker:(id)a3;
- (void)unregisterBundleID:(id)a3 withSource:(id)a4;
@end

@implementation MapsSuggestionsAppGuardian

void __58__MapsSuggestionsAppGuardian_registerBundleID_withSource___block_invoke(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = GEOFindOrCreateLog();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(char **)(a1 + 32);
      v6 = [*(id *)(a1 + 40) uniqueName];
      int v8 = 138412546;
      v9 = v5;
      __int16 v10 = 2112;
      *(void *)v11 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Registering:%@ for %@", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained _add:*(void *)(a1 + 32) source:*(void *)(a1 + 40)];
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsAppGuardian.m";
      __int16 v10 = 1026;
      *(_DWORD *)v11 = 105;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsAppGuardian registerBundleID:withSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)_add:(id)a3 source:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(NSMapTable *)self->_sources objectForKey:v6];
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  [v7 addObject:v8];
  [(NSMapTable *)self->_sources setObject:v7 forKey:v6];
}

- (BOOL)isBundleIDLocked:(id)a3 forSource:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "AppGuardian is not enabled. Not checking for App Protection.", (uint8_t *)&v9, 2u);
    }
    goto LABEL_9;
  }
  v5 = appForBundleID(v4);
  if (([v5 isLocked] & 1) == 0 && ![v5 isHidden])
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = v4;
    __int16 v11 = 1024;
    int v12 = [v5 isLocked];
    __int16 v13 = 1024;
    int v14 = [v5 isHidden];
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "%@ is protected. Locked = %d, Hidden = %d", (uint8_t *)&v9, 0x18u);
  }

  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsAppGuardian;
  v5 = [(MapsSuggestionsAppGuardian *)&v14 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MapsSuggestionsAppGuardianQueue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sources = v5->_sources;
    v5->_sources = (NSMapTable *)v9;

    uint64_t v11 = [v4 oneAppProtectionConnector];
    connector = v5->_connector;
    v5->_connector = (MapsSuggestionsAppProtectionConnector *)v11;

    [(MapsSuggestionsAppProtectionConnector *)v5->_connector setDelegate:v5];
    [(MapsSuggestionsAppProtectionConnector *)v5->_connector addMonitor:v5];
  }

  return v5;
}

- (void)registerBundleID:(id)a3 withSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__MapsSuggestionsAppGuardian_registerBundleID_withSource___block_invoke;
  v11[3] = &unk_1E5CB8080;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)_remove:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMapTable *)self->_sources objectForKey:v7];
  id v9 = v8;
  if (v8)
  {
    [v8 removeObject:v6];
    if ([v9 count])
    {
      [(NSMapTable *)self->_sources setObject:v9 forKey:v7];
    }
    else
    {
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [v7 uniqueName];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "No more bundleIDs to monitor for %@", (uint8_t *)&v12, 0xCu);
      }
      [(NSMapTable *)self->_sources removeObjectForKey:v7];
    }
  }
}

- (void)_removeAllBundleIDsForSource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(NSMapTable *)self->_sources objectForKey:v4];

  if (v5)
  {
    [(NSMapTable *)self->_sources removeObjectForKey:v4];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v4 uniqueName];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Removed all bundleIDs for %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)unregisterBundleID:(id)a3 withSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MapsSuggestionsAppGuardian_unregisterBundleID_withSource___block_invoke;
  v11[3] = &unk_1E5CB8080;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__MapsSuggestionsAppGuardian_unregisterBundleID_withSource___block_invoke(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(char **)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) uniqueName];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      *(void *)uint64_t v11 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Unregistering:%@ for %@", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained _remove:*(void *)(a1 + 32) source:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsAppGuardian.m";
      __int16 v10 = 1026;
      *(_DWORD *)uint64_t v11 = 116;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsAppGuardian unregisterBundleID:withSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)unregisterAllBundleIDsForSource:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsAppGuardian_unregisterAllBundleIDsForSource___block_invoke;
  block[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MapsSuggestionsAppGuardian_unregisterAllBundleIDsForSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = [*(id *)(a1 + 32) uniqueName];
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Unregistering all bundleIDs for %@", (uint8_t *)&v7, 0xCu);
    }
    [WeakRetained _removeAllBundleIDsForSource:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsAppGuardian.m";
      __int16 v9 = 1026;
      int v10 = 126;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsAppGuardian unregisterAllBundleIDsForSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)appProtectionStatusChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsAppGuardian_appProtectionStatusChanged___block_invoke;
  block[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__MapsSuggestionsAppGuardian_appProtectionStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v3 = *(id *)(a1 + 32);
    uint64_t v23 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v23)
    {
      uint64_t v4 = *(void *)v34;
      v24 = v3;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v4) {
            objc_enumerationMutation(v3);
          }
          id v6 = *(char **)(*((void *)&v33 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v7 = WeakRetained[3];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v30 != v10) {
                  objc_enumerationMutation(v7);
                }
                [*(id *)(*((void *)&v29 + 1) + 8 * j) didChangeProtectionStatusForBundleId:v6];
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
            }
            while (v9);
          }

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = [WeakRetained[2] keyEnumerator];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v26;
            while (2)
            {
              for (uint64_t k = 0; k != v14; ++k)
              {
                if (*(void *)v26 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(id *)(*((void *)&v25 + 1) + 8 * k);
                v18 = [WeakRetained[2] objectForKey:v17];
                if ([v17 conformsToProtocol:&unk_1EFC8C5B8]) {
                  BOOL v19 = v6 == 0;
                }
                else {
                  BOOL v19 = 1;
                }
                if (!v19 && [v18 containsObject:v6])
                {
                  v20 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    v21 = [v17 uniqueName];
                    *(_DWORD *)buf = 138412546;
                    v41 = v6;
                    __int16 v42 = 2112;
                    *(void *)v43 = v21;
                    _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Received App Protection change notification for %@. Refreshing %@", buf, 0x16u);
                  }
                  [v17 updateSuggestionEntriesWithHandler:0];

                  v3 = v24;
                  goto LABEL_35;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          v3 = v24;
          uint64_t v4 = v22;
        }
        uint64_t v23 = [v24 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v23);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "MapsSuggestionsAppGuardian.m";
      __int16 v42 = 1026;
      *(_DWORD *)v43 = 153;
      *(_WORD *)&v43[4] = 2082;
      *(void *)&v43[6] = "-[MapsSuggestionsAppGuardian appProtectionStatusChanged:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v3 = v12;
LABEL_35:
  }
}

- (void)registerAppTracker:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MapsSuggestionsAppGuardian_registerAppTracker___block_invoke;
  block[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsAppGuardian_registerAppTracker___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[3];
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      id v6 = (void *)v3[3];
      v3[3] = v5;

      id v4 = (void *)v3[3];
    }
    [v4 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsAppGuardian.m";
      __int16 v10 = 1026;
      int v11 = 179;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsAppGuardian registerAppTracker:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)unregisterAppTracker:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MapsSuggestionsAppGuardian_unregisterAppTracker___block_invoke;
  block[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsAppGuardian_unregisterAppTracker___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsAppGuardian.m";
      __int16 v7 = 1026;
      int v8 = 192;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsAppGuardian unregisterAppTracker:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

+ (int64_t)protectionStatusForBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (GEOConfigGetBOOL())
  {
    id v4 = appForBundleID(v3);
    if ([v4 isHidden])
    {
      int v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%@ is hidden", (uint8_t *)&v8, 0xCu);
      }
      int64_t v6 = 3;
    }
    else
    {
      if (![v4 isLocked])
      {
        int64_t v6 = 1;
        goto LABEL_14;
      }
      int v5 = GEOFindOrCreateLog();
      int64_t v6 = 2;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        id v9 = v3;
        int64_t v6 = 2;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%@ is locked", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "AppGuardian is not enabled. Not checking for App Protection.", (uint8_t *)&v8, 2u);
    }
    int64_t v6 = 0;
  }
LABEL_14:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->uniqueName, 0);
  objc_storeStrong((id *)&self->_appStatusTrackers, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end