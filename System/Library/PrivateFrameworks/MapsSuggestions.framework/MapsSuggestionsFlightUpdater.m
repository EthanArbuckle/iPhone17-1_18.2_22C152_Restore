@interface MapsSuggestionsFlightUpdater
- (MapsSuggestionsFlightUpdater)initWithFlightRequester:(id)a3 networkRequester:(id)a4;
- (char)updateFlightsForEntry:(id)a3 handler:(id)a4;
- (id).cxx_construct;
- (id)initFromResourceDepot:(id)a3;
- (uint64_t)_getTerminalMapItemForFlightEntry:(void *)a3 handler:;
@end

@implementation MapsSuggestionsFlightUpdater

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v15 = 1024;
      int v16 = 60;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  v6 = [v4 oneFlightRequester];

  if (!v6)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v15 = 1024;
      int v16 = 61;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot.oneFlightRequester)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One FlightRequester!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  v7 = [v5 oneNetworkRequester];

  if (!v7)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v15 = 1024;
      int v16 = 62;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v13, 0x26u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  v8 = [v5 oneFlightRequester];
  v9 = [v5 oneNetworkRequester];
  self = [(MapsSuggestionsFlightUpdater *)self initWithFlightRequester:v8 networkRequester:v9];

  v10 = self;
LABEL_14:

  return v10;
}

- (MapsSuggestionsFlightUpdater)initWithFlightRequester:(id)a3 networkRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsFlightUpdater;
  v9 = [(MapsSuggestionsFlightUpdater *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flightRequester, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v17, @"MapsSuggestionsFlightQueue", v11);
    dispatch_queue_t v12 = v17;
    dispatch_queue_t v17 = 0;
    innerQueue = v10->_queue._innerQueue;
    v10->_queue._innerQueue = (OS_dispatch_queue *)v12;

    v14 = v18;
    v18 = 0;
    name = v10->_queue._name;
    v10->_queue._name = v14;
  }
  return v10;
}

- (uint64_t)_getTerminalMapItemForFlightEntry:(void *)a3 handler:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v12 = 0;
    goto LABEL_24;
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (!v6)
  {
    v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
    __int16 v23 = 1024;
    int v24 = 106;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
    __int16 v27 = 2082;
    v28 = "nil == (handler)";
    int v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
LABEL_18:
    v14 = v11;
    uint32_t v15 = 38;
LABEL_21:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_22;
  }
  if (!v5)
  {
    v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
    __int16 v23 = 1024;
    int v24 = 107;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
    __int16 v27 = 2082;
    v28 = "nil == (entry)";
    int v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
    goto LABEL_18;
  }
  if ([v5 containsKey:@"MapsSuggestionsFlightTerminalSearchKey"])
  {
    id v8 = [v5 stringForKey:@"MapsSuggestionsFlightTerminalSearchKey"];
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "terminalSearchString='%@'", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 16);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__MapsSuggestionsFlightUpdater__getTerminalMapItemForFlightEntry_handler___block_invoke;
    v17[3] = &unk_1E5CB8390;
    v11 = v8;
    v18 = v11;
    id v19 = v5;
    id v20 = v6;
    uint64_t v12 = MapsSuggestionsSearchTerminal(v11, v19, v10, v17);

    goto LABEL_23;
  }
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    int v13 = "Entry did not contain MapsSuggestionsFlightTerminalSearchKey. Cannot get Terminal mapItem";
    v14 = v11;
    uint32_t v15 = 2;
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v12 = 0;
LABEL_23:

LABEL_24:
  return v12;
}

void __74__MapsSuggestionsFlightUpdater__getTerminalMapItemForFlightEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      v9 = [*(id *)(a1 + 40) geoMapItem];
      v10 = [v9 name];
      *(_DWORD *)buf = 138412802;
      v31 = v8;
      __int16 v32 = 2112;
      v33 = v10;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Couldn't get Terminal '%@' within the Venue '%@': %@", buf, 0x20u);
    }
    goto LABEL_4;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) geoMapItem];
      int v13 = [v12 name];
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Too many mapItems returned for Terminal '%@' within the Venue '%@'", buf, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  v14 = [v5 firstObject];
  uint32_t v15 = MapsSuggestionsMapItemConvertIfNeeded(v14);

  if (MapsSuggestionsMapItemIsTerminal(v15))
  {
    if (!MapsSuggestionsMapItemIsVenue(v15))
    {
      GEOFindOrCreateLog();
      int v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v17 = [v15 name];
        *(_DWORD *)buf = 138412290;
        v31 = v17;
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "Terminal '%@' is not a Venue", buf, 0xCu);
      }
    }
    id v18 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v15, 2);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    GEOFindOrCreateLog();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v28 = [*(id *)(a1 + 40) geoMapItem];
      uint64_t v29 = [v28 name];
      id v20 = [*(id *)(a1 + 40) geoMapItem];
      uint64_t v21 = [v20 _poiCategory];
      v22 = [*(id *)(a1 + 40) geoMapItem];
      __int16 v23 = [v22 _venueInfo];
      int v24 = [v23 venueIdentifier];
      uint64_t v25 = [v24 venueID];
      *(_DWORD *)buf = 138412802;
      v31 = v29;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2048;
      uint64_t v35 = v25;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Successfully got a Terminal '%@' as %@, venueID: %llu", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setBoolean:1 forKey:@"MapsSuggestionsFlightMapItemIsTerminalKey"];
    [*(id *)(a1 + 40) setBoolean:0 forKey:@"MapsSuggestionsFlightMapItemIsGateKey"];
  }
  else
  {
    GEOFindOrCreateLog();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [v15 name];
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_ERROR, "Terminal '%@' is not actually a Terminal", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_5:
}

void __70__MapsSuggestionsFlightUpdater__getGateMapItemForFlightEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      v9 = [*(id *)(a1 + 40) geoMapItem];
      v10 = [v9 name];
      *(_DWORD *)buf = 138412802;
      v31 = v8;
      __int16 v32 = 2112;
      v33 = v10;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Couldn't get Gate '%@' within the Venue '%@': %@", buf, 0x20u);
    }
    goto LABEL_4;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) geoMapItem];
      int v13 = [v12 name];
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Too many mapItems returned for Gate '%@' within the Venue '%@'", buf, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  v14 = [v5 firstObject];
  uint32_t v15 = MapsSuggestionsMapItemConvertIfNeeded(v14);

  if (MapsSuggestionsMapItemIsGate(v15))
  {
    if (!MapsSuggestionsMapItemIsVenue(v15))
    {
      GEOFindOrCreateLog();
      int v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v17 = [v15 name];
        *(_DWORD *)buf = 138412290;
        v31 = v17;
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "Gate '%@' is not a Venue", buf, 0xCu);
      }
    }
    id v18 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v15, 2);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    GEOFindOrCreateLog();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v28 = [*(id *)(a1 + 40) geoMapItem];
      uint64_t v29 = [v28 name];
      id v20 = [*(id *)(a1 + 40) geoMapItem];
      uint64_t v21 = [v20 _poiCategory];
      v22 = [*(id *)(a1 + 40) geoMapItem];
      __int16 v23 = [v22 _venueInfo];
      int v24 = [v23 venueIdentifier];
      uint64_t v25 = [v24 venueID];
      *(_DWORD *)buf = 138412802;
      v31 = v29;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2048;
      uint64_t v35 = v25;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Successfully got a Gate '%@' as %@, venueID: %llu", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setBoolean:1 forKey:@"MapsSuggestionsFlightMapItemIsGateKey"];
  }
  else
  {
    GEOFindOrCreateLog();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [v15 name];
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_ERROR, "Gate '%@' is not actually a Gate", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_5:
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v5;
    id v10 = v8;
    if ([v9 containsKey:@"MapsSuggestionsFlightDepartureGateKey"]
      && [v9 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__MapsSuggestionsFlightUpdater__updateGateIfNeededForEntry_handler___block_invoke;
      v28[3] = &unk_1E5CB83E0;
      id v27 = v10;
      id v29 = v27;
      id v11 = v9;
      uint64_t v12 = v28;
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        int v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v35 = "-[MapsSuggestionsFlightUpdater _getGateMapItemForFlightEntry:handler:]";
          _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }
      }
      if (v11)
      {
        v26 = [v11 stringForKey:@"MapsSuggestionsFlightDepartureGateKey"];
        v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v26;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "gateSearchString='%@'", buf, 0xCu);
        }

        uint32_t v15 = v11;
        int v16 = (void *)WeakRetained[2];
        *(void *)v30 = MEMORY[0x1E4F143A8];
        *(void *)&v30[8] = 3221225472;
        *(void *)&v30[16] = __70__MapsSuggestionsFlightUpdater__getGateMapItemForFlightEntry_handler___block_invoke;
        *(void *)&v30[24] = &unk_1E5CB8390;
        dispatch_queue_t v17 = v26;
        v31 = v17;
        id v18 = v15;
        id v32 = v18;
        id v19 = v12;
        id v33 = v19;
        LODWORD(v16) = MapsSuggestionsSearchGate(v17, v18, v16, v30);

        if (v16 == 1) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v25 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
          __int16 v36 = 1024;
          int v37 = 167;
          __int16 v38 = 2082;
          v39 = "-[MapsSuggestionsFlightUpdater _getGateMapItemForFlightEntry:handler:]";
          __int16 v40 = 2082;
          v41 = "nil == (entry)";
          _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
        }
      }
    }
    else
    {
    }
    id v20 = v9;
    if ([v20 containsKey:@"MapsSuggestionsFlightFullTargetAirportKey"])
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F646E8]);
      v22 = [v20 stringForKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
      [v21 setName:v22];

      __int16 v23 = [v20 geoMapItem];
      [v23 setUserValues:v21];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_22;
  }
  GEOFindOrCreateLog();
  int v24 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v30 = 136446722;
    *(void *)&v30[4] = "MapsSuggestionsFlight.mm";
    *(_WORD *)&v30[12] = 1026;
    *(_DWORD *)&v30[14] = 237;
    *(_WORD *)&v30[18] = 2082;
    *(void *)&v30[20] = "-[MapsSuggestionsFlightUpdater _updateFlightsForEntry:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v30, 0x1Cu);
  }

LABEL_22:
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_169(id *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_170;
    v9[3] = &unk_1E5CB8408;
    id v10 = v6;
    id v14 = a1[5];
    id v11 = a1[4];
    id v12 = v5;
    int v13 = WeakRetained;
    id v15 = a1[6];
    dispatch_async(WeakRetained[3], v9);

    id v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_queue_t v17 = "MapsSuggestionsFlight.mm";
      __int16 v18 = 1026;
      int v19 = 249;
      __int16 v20 = 2082;
      id v21 = "-[MapsSuggestionsFlightUpdater _updateFlightsForEntry:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_170(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "Error getting flights: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  if ([*(id *)(a1 + 48) count])
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) departingAirportCode];
    id v6 = MapsSuggestionsBestFlightLeg(v4, v5);

    if (!v6)
    {
      int v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = @"Received no eligible flight legs to work with!?";
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"Received no eligible flight legs to work with!?"];
      (*(void (**)(uint64_t, uint64_t, void *))(v14 + 16))(v14, v15, v16);

      goto LABEL_30;
    }
    MapsSuggestionsUpdateEntryFromFlightLeg(*(void **)(a1 + 40), v6);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    id v7 = *(id *)(a1 + 40);
    if ([v7 containsKey:@"MapsSuggestionsFlightAlwaysGetTerminalAndGateKey"])
    {
      char v8 = [v7 BOOLeanForKey:@"MapsSuggestionsFlightAlwaysGetTerminalAndGateKey"];

      if ((v8 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_21;
    }
    dispatch_queue_t v17 = [v7 geoMapItem];
    if (v17)
    {
      __int16 v18 = [MEMORY[0x1E4F64500] sharedConfiguration];
      int v19 = [v18 countryCode];
      int v20 = [v19 isEqualToString:@"CN"];

      if (v20)
      {

        goto LABEL_21;
      }
      id v21 = [v17 _venueInfo];
      uint64_t v22 = [v21 venueIdentifier];

      if (v22)
      {
LABEL_21:
        if ([*(id *)(a1 + 40) containsKey:@"MapsSuggestionsFlightDepartureTerminalKey"])
        {
          if (([*(id *)(a1 + 40) BOOLeanForKey:@"MapsSuggestionsFlightMapItemIsTerminalKey" is:1] & 1) == 0&& (objc_msgSend(*(id *)(a1 + 40), "BOOLeanForKey:is:", @"MapsSuggestionsFlightMapItemIsGateKey", 1) & 1) == 0)
          {
            uint64_t v23 = *(void *)(a1 + 56);
            int v24 = *(void **)(a1 + 40);
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_177;
            v27[3] = &unk_1E5CB83E0;
            id v28 = *(id *)(a1 + 72);
            LOBYTE(v23) = -[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:](v23, v24, v27) == 1;

            if (v23) {
              goto LABEL_30;
            }
          }
        }
        uint64_t v25 = a1 + 72;
LABEL_29:
        (*(void (**)(void))(*(void *)v25 + 16))();
LABEL_30:

        return;
      }
    }
    else
    {
    }
LABEL_26:
    v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_DEBUG, "We should not get Terminal & Gate for this Entry", buf, 2u);
    }

    uint64_t v25 = a1 + 64;
    goto LABEL_29;
  }
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = @"Received no flights to work with!?";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"Received no flights to work with!?"];
  (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v11, v12);
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  if ([v10 containsKey:@"MapsSuggestionsFlightFullTargetAirportKey"])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F646E8]);
    char v8 = [v10 stringForKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
    [v7 setName:v8];

    id v9 = [v10 geoMapItem];
    [v9 setUserValues:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__MapsSuggestionsFlightUpdater__updateGateIfNeededForEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  if ([v10 containsKey:@"MapsSuggestionsFlightFullTargetAirportKey"])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F646E8]);
    char v8 = [v10 stringForKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
    [v7 setName:v8];

    id v9 = [v10 geoMapItem];
    [v9 setUserValues:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (char)updateFlightsForEntry:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v17 = 1024;
      int v18 = 330;
      __int16 v19 = 2082;
      int v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      __int16 v21 = 2082;
      uint64_t v22 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v17 = 1024;
      int v18 = 331;
      __int16 v19 = 2082;
      int v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      __int16 v21 = 2082;
      uint64_t v22 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if ([v6 type] != 15)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v17 = 1024;
      int v18 = 332;
      __int16 v19 = 2082;
      int v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      __int16 v21 = 2082;
      uint64_t v22 = "MapsSuggestionsEntryTypeTravelFlight != entry.type";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a flight entry", buf, 0x26u);
    }
LABEL_13:

    char v9 = 0;
    goto LABEL_14;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsFlightUpdater_updateFlightsForEntry_handler___block_invoke;
  block[3] = &unk_1E5CB8458;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);

  char v9 = 1;
LABEL_14:

  return v9;
}

void __62__MapsSuggestionsFlightUpdater_updateFlightsForEntry_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
    id v5 = [v3 dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
    double v6 = MapsSuggestionsSecondsTo(v5);
    GEOConfigGetDouble();
    if (v6 <= v7)
    {
      char v9 = [v3 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
      objc_initWeak(&location, (id)v1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke;
      aBlock[3] = &unk_1E5CB83B8;
      objc_copyWeak(&v21, &location);
      id v10 = v4;
      id v20 = v10;
      uint64_t v11 = _Block_copy(aBlock);
      id v12 = *(void **)(v1 + 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_169;
      v14[3] = &unk_1E5CB8430;
      objc_copyWeak(v18, &location);
      id v16 = v10;
      id v15 = v3;
      id v17 = v11;
      id v13 = v11;
      [v12 requestFlightsWithFullFlightNumber:v9 departureDate:v5 handler:v14];

      objc_destroyWeak(v18);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      char v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Too early to do flight updates. Skipping update", (uint8_t *)v14, 2u);
      }

      (*((void (**)(id, id, void))v4 + 2))(v4, v3, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_flightRequester, 0);
}

@end