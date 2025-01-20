@interface MapsSuggestionsVirtualGarage
- (BOOL)entriesForUnpairedVehiclesWithHandler:(id)a3;
- (MapsSuggestionsVirtualGarage)initWithConnector:(id)a3;
- (id)_q_entryForUnpairedVehicles:(uint64_t)a1;
- (id)initFromResourceDepot:(id)a3;
- (void)closeConnection;
- (void)openConnection;
- (void)registerObserver:(id)a3;
- (void)stateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)virtualGarageDidUpdateUnpairedVehicles:(id)a3;
@end

@implementation MapsSuggestionsVirtualGarage

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      __int16 v14 = 1024;
      int v15 = 42;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsVirtualGarage initFromResourceDepot:]";
      __int16 v18 = 2082;
      v19 = "nil == (resourceDepot)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  v6 = [v4 oneVirtualGarageConnector];

  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      __int16 v14 = 1024;
      int v15 = 43;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsVirtualGarage initFromResourceDepot:]";
      __int16 v18 = 2082;
      v19 = "nil == (resourceDepot.oneVirtualGarageConnector)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires OneVirtualGarageConnector!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = [v5 oneVirtualGarageConnector];
  self = [(MapsSuggestionsVirtualGarage *)self initWithConnector:v7];

  v8 = self;
LABEL_10:

  return v8;
}

- (MapsSuggestionsVirtualGarage)initWithConnector:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MapsSuggestionsVirtualGarage;
    v6 = [(MapsSuggestionsVirtualGarage *)&v15 init];
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("MapsSuggestionsVirtualGarageQueue", v7);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      objc_storeStrong((id *)&v6->_connector, a3);
      [(MapsSuggestionsVirtualGarageConnector *)v6->_connector setDelegate:v6];
      v10 = [[MapsSuggestionsObservers alloc] initWithCallbackQueue:v6->_queue name:@"MapsSuggestionsVirtualGarageObservers"];
      observers = v6->_observers;
      v6->_observers = v10;
    }
    self = v6;
    int v12 = self;
  }
  else
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      __int16 v18 = 1024;
      int v19 = 70;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsVirtualGarage initWithConnector:]";
      __int16 v22 = 2082;
      v23 = "nil == (connector)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an virtualGarageConnector", buf, 0x26u);
    }

    int v12 = 0;
  }

  return v12;
}

- (id)_q_entryForUnpairedVehicles:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          int v12 = [v11 pairedAppIdentifier];
          uint64_t v13 = [v12 length];

          if (!v13)
          {
            v29 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v34 = [v11 displayName];
              *(_DWORD *)buf = 138412290;
              v42 = v34;
              _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "Vehicle %@ must have a pairedAppIdentifier", buf, 0xCu);
            }
            __int16 v22 = 0;
            goto LABEL_16;
          }
          __int16 v14 = [v11 identifier];
          [v5 addObject:v14];

          objc_super v15 = [v11 pairedAppIdentifier];
          [v4 addObject:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    GEOConfigGetDouble();
    uint64_t v17 = MapsSuggestionsNowWithOffset(v16);
    __int16 v18 = [v6 objectAtIndexedSubscript:0];
    int v19 = [v18 manufacturer];
    __int16 v20 = [v6 objectAtIndexedSubscript:0];
    v21 = [v20 model];
    GEOConfigGetDouble();
    v36 = (void *)v17;
    __int16 v22 = +[MapsSuggestionsEntry entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:](MapsSuggestionsEntry, "entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:", 20, v19, v21, v17, 0);

    objc_msgSend(v22, "setBoolean:forKey:", (unint64_t)objc_msgSend(v4, "count") > 1, @"MapsSuggestionsVehicleSetupWithGenericIconKey");
    id v23 = v5;
    uint64_t v24 = [v4 allObjects];
    v25 = [v24 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    v26 = [v23 allObjects];

    v27 = [v26 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    v28 = [v25 arrayByAddingObjectsFromArray:v27];
    v29 = [v28 componentsJoinedByString:@"_"];

    v30 = [v6 objectAtIndexedSubscript:0];
    v31 = [v30 pairedAppIdentifier];
    [v22 setString:v31 forKey:@"MapsSuggestionsOriginBundleIDKey"];

    [v22 setString:v29 forKey:@"MapsSuggestionsVirtualGaragePK"];
    [v22 setString:@"MapsSuggestionsVirtualGaragePK" forKey:@"MapsSuggestionsPrimaryKey"];
    [v22 setBoolean:1 forKey:@"MapsSuggestionsIsNotADestinationKey"];
    [v22 setBoolean:0 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
    [v22 setBoolean:0 forKey:@"MapsSuggestionsNeedsDistanceTrackingKey"];
    v32 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [v23 count];
      *(_DWORD *)buf = 138412546;
      v42 = v29;
      __int16 v43 = 2048;
      uint64_t v44 = v33;
      _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_DEBUG, "Adding VehicleSetup entry with uniqueID %@ and %lu unpaired vehicles", buf, 0x16u);
    }

    id v6 = v36;
LABEL_16:
  }
  else
  {
    __int16 v22 = 0;
  }

  return v22;
}

- (BOOL)entriesForUnpairedVehiclesWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, NSObject *))a3;
  if (!v4)
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)objc_super v15 = 136;
      *(_WORD *)&v15[4] = 2082;
      double v16 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler!", location, 0x26u);
    }
    goto LABEL_13;
  }
  int v5 = IsEVRoutingSupported();
  if (!v5 || !MapsFeature_IsEnabled_EVRouting() || (GEOConfigGetBOOL() & 1) == 0)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(void *)location = 67109888;
      *(_WORD *)&location[8] = 1024;
      *(_DWORD *)&location[10] = v5;
      *(_WORD *)objc_super v15 = 1024;
      *(_DWORD *)&v15[2] = MapsFeature_IsEnabled_EVRouting();
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = GEOConfigGetBOOL();
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "_isEVRoutingSupported is %d because: CountrySupportsEVRouting: %d, FeatureEnabled: %d, SourceEnabled: %d", location, 0x1Au);
    }

    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "EV routing is not supported", location, 2u);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No results. EV Routing is not supported"];
    v4[2](v4, MEMORY[0x1E4F1CBF0], v9);
LABEL_13:

    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke;
  v11[3] = &unk_1E5CB8A98;
  objc_copyWeak(&v13, (id *)location);
  int v12 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)location);
LABEL_14:

  return v4 != 0;
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = GEOFindOrCreateLog();
  int v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Asking VGConnector for unpaired vehicles", buf, 2u);
    }

    id v6 = (void *)WeakRetained[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_143;
    v8[3] = &unk_1E5CB8C98;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 32);
    [v6 fetchUnpairedVehiclesWithHandler:v8];

    objc_destroyWeak(&v10);
  }
  else
  {
    uint64_t v7 = v4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v12 = "MapsSuggestionsVirtualGarage.m";
      __int16 v13 = 1026;
      int v14 = 146;
      __int16 v15 = 2082;
      double v16 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_144;
    v12[3] = &unk_1E5CB8C70;
    __int16 v13 = v6;
    id v14 = v5;
    id v10 = *(id *)(a1 + 32);
    __int16 v15 = v8;
    id v16 = v10;
    dispatch_async(v9, v12);

    v11 = v13;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v18 = "MapsSuggestionsVirtualGarage.m";
      __int16 v19 = 1026;
      int v20 = 150;
      __int16 v21 = 2082;
      __int16 v22 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_144(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) && (id v9 = *(void **)(a1 + 40)) != 0 && [v9 count])
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Received vehicles: %@", buf, 0xCu);
    }

    uint64_t v12 = -[MapsSuggestionsVirtualGarage _q_entryForUnpairedVehicles:](*(void *)(a1 + 48), *(void **)(a1 + 40));
    id v6 = (void *)v12;
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v8, 0);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No results. Entry is nil"];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, MEMORY[0x1E4F1CBF0], v8);
    }
  }
  else
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "VG returned no vehicles", buf, 2u);
    }

    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = [*(id *)(a1 + 32) localizedDescription];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    else {
      uint64_t v7 = @"No results. Number of vehicles is zero or there is some other error";
    }
    uint64_t v8 = [v4 GEOErrorWithCode:-8 reason:v7];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, MEMORY[0x1E4F1CBF0], v8);
  }
}

- (void)openConnection
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MapsSuggestionsVirtualGarage_openConnection__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__MapsSuggestionsVirtualGarage_openConnection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 32))
    {
      [*((id *)WeakRetained + 1) openVGConnection];
      v2[32] = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsVirtualGarage.m";
      __int16 v6 = 1026;
      int v7 = 178;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsVirtualGarage openConnection]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)closeConnection
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__MapsSuggestionsVirtualGarage_closeConnection__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__MapsSuggestionsVirtualGarage_closeConnection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 32))
    {
      [*((id *)WeakRetained + 1) closeVGConnection];
      v2[32] = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsVirtualGarage.m";
      __int16 v6 = 1026;
      int v7 = 190;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsVirtualGarage closeConnection]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MapsSuggestionsVirtualGarage_registerObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers registerObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsVirtualGarage_registerObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[1] startObservingVG];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        __int16 v6 = "MapsSuggestionsVirtualGarage.m";
        __int16 v7 = 1026;
        int v8 = 203;
        __int16 v9 = 2082;
        uint64_t v10 = "-[MapsSuggestionsVirtualGarage registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MapsSuggestionsVirtualGarage_unregisterObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers unregisterObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsVirtualGarage_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[1] stopObservingVG];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        __int16 v6 = "MapsSuggestionsVirtualGarage.m";
        __int16 v7 = 1026;
        int v8 = 214;
        __int16 v9 = 2082;
        uint64_t v10 = "-[MapsSuggestionsVirtualGarage unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (void)virtualGarageDidUpdateUnpairedVehicles:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke;
  block[3] = &unk_1E5CB8CE8;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = IsEVRoutingSupported();
  if (v2 && MapsFeature_IsEnabled_EVRouting() && (GEOConfigGetBOOL() & 1) != 0)
  {
    if ([*(id *)(a1 + 32) count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      id v4 = WeakRetained;
      if (WeakRetained)
      {
        int v5 = -[MapsSuggestionsVirtualGarage _q_entryForUnpairedVehicles:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
        if (!v5)
        {
          __int16 v7 = 0;
          goto LABEL_25;
        }
        Class isa = v4[2].isa;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke_155;
        v12[3] = &unk_1E5CB8CC0;
        __int16 v7 = v5;
        uint64_t v13 = v7;
        [(objc_class *)isa callBlock:v12];
        id v8 = v13;
      }
      else
      {
        GEOFindOrCreateLog();
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)__int16 v15 = "MapsSuggestionsVirtualGarage.m";
          *(_WORD *)&v15[8] = 1026;
          *(_DWORD *)uint64_t v16 = 240;
          *(_WORD *)&v16[4] = 2082;
          uint64_t v17 = "-[MapsSuggestionsVirtualGarage virtualGarageDidUpdateUnpairedVehicles:]_block_invoke";
          _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
        }
        __int16 v7 = v8;
      }

LABEL_25:
LABEL_26:

      return;
    }
    char v10 = 1;
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)__int16 v15 = 0;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&unsigned char v15[6] = v2;
      *(_WORD *)uint64_t v16 = 1024;
      *(_DWORD *)&v16[2] = MapsFeature_IsEnabled_EVRouting();
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = GEOConfigGetBOOL();
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "_isEVRoutingSupported is %d because: CountrySupportsEVRouting: %d, FeatureEnabled: %d, SourceEnabled: %d", buf, 0x1Au);
    }

    char v10 = 0;
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (v10) {
      return;
    }
LABEL_17:
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "EV Routing was not supported after destinationd spun", buf, 2u);
    }
    goto LABEL_26;
  }
  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Received no unpaired vehicles from VirtualGarage", buf, 2u);
  }

  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
}

void __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke_155(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  int v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "unpairedVehiclesChangedInVirtualGarage:", v4, v5, v6);
}

- (void)stateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MapsSuggestionsVirtualGarage_stateOfChargeForVehicleWithIdentifier_handler___block_invoke;
  v11[3] = &unk_1E5CB8930;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __78__MapsSuggestionsVirtualGarage_stateOfChargeForVehicleWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] fetchStateOfChargeForVehicleWithIdentifier:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsVirtualGarage.m";
      __int16 v7 = 1026;
      int v8 = 257;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsVirtualGarage stateOfChargeForVehicleWithIdentifier:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end