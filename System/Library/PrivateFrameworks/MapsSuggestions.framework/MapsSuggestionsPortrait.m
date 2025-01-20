@interface MapsSuggestionsPortrait
- (BOOL)currentTripsWithHandler:(id)a3;
- (BOOL)fetchConnectionEntriesWithHandler:(id)a3;
- (BOOL)fetchLocationEntriesForTray:(BOOL)a3 currentLocation:(id)a4 queue:(id)a5 handler:(id)a6;
- (BOOL)futureTripsWithHandler:(id)a3;
- (MapsSuggestionsPortrait)initWithPortraitConnector:(id)a3 networkRequester:(id)a4 contacts:(id)a5;
- (NSString)uniqueName;
- (id)fetchNamedEntitiesFromDate:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (void)_geoMapItemsFromMapsSuggestionsEntry:(void *)a3 handle:;
- (void)_populateFutureAndCurrentTrips;
- (void)sendFeedbackforClientID:(id)a3 storeType:(int64_t)a4 explicitlyEngagedStrings:(id)a5 explicitlyRejectedStrings:(id)a6 implicitlyEngagedStrings:(id)a7 implicitlyRejectedStrings:(id)a8;
@end

@implementation MapsSuggestionsPortrait

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    __int16 v18 = 1024;
    int v19 = 83;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_14:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_15;
  }
  v6 = [v4 onePortraitConnector];

  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    __int16 v18 = 1024;
    int v19 = 84;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot.onePortraitConnector)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One PortraitConnector!";
    goto LABEL_14;
  }
  v7 = [v5 oneNetworkRequester];

  if (!v7)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    __int16 v18 = 1024;
    int v19 = 85;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot.oneNetworkRequester)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!";
    goto LABEL_14;
  }
  v8 = [v5 oneContacts];

  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      __int16 v18 = 1024;
      int v19 = 86;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.oneContacts)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Contacts!";
      goto LABEL_14;
    }
LABEL_15:

    v12 = 0;
    goto LABEL_16;
  }
  v9 = [v5 onePortraitConnector];
  v10 = [v5 oneNetworkRequester];
  v11 = [v5 oneContacts];
  self = [(MapsSuggestionsPortrait *)self initWithPortraitConnector:v9 networkRequester:v10 contacts:v11];

  v12 = self;
LABEL_16:

  return v12;
}

- (MapsSuggestionsPortrait)initWithPortraitConnector:(id)a3 networkRequester:(id)a4 contacts:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      __int16 v31 = 1024;
      int v32 = 100;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsPortrait initWithPortraitConnector:networkRequester:contacts:]";
      __int16 v35 = 2082;
      v36 = "nil == (portraitConnector)";
      v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RoutineInterface";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x26u);
    }
LABEL_11:

    uint64_t v24 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      __int16 v31 = 1024;
      int v32 = 101;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsPortrait initWithPortraitConnector:networkRequester:contacts:]";
      __int16 v35 = 2082;
      v36 = "nil == (networkRequester)";
      v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsPortrait;
  v12 = [(MapsSuggestionsPortrait *)&v28 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("MapsSuggestionsPortraitQueue", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_connector, a3);
    objc_storeStrong((id *)&v12->_networkRequester, a4);
    id v16 = objc_alloc(MEMORY[0x1E4F89DB8]);
    v17 = [MEMORY[0x1E4F28B50] mainBundle];
    __int16 v18 = [v17 bundleIdentifier];
    uint64_t v19 = [v16 initWithLocationField:1 bundleIdentifier:v18];
    criteria = v12->_criteria;
    v12->_criteria = (PPConnectionsCriteria *)v19;

    cachedKey = v12->_cachedKey;
    v12->_cachedKey = 0;

    cachedMapItem = v12->_cachedMapItem;
    v12->_cachedMapItem = 0;

    cachedMapItemOrigin = v12->_cachedMapItemOrigin;
    v12->_cachedMapItemOrigin = 0;

    objc_storeStrong((id *)&v12->_contacts, a5);
  }
  self = v12;
  uint64_t v24 = self;
LABEL_12:

  return v24;
}

- (BOOL)futureTripsWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  v5 = self->_futureTrips;
  objc_sync_enter(v5);
  futureTrips = self->_futureTrips;
  if (futureTrips)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[MapsSuggestionsPortrait _populateFutureAndCurrentTrips](self);
    futureTrips = self->_futureTrips;
  }
  v8 = (void *)[(NSArray *)futureTrips copy];
  v4[2](v4, v8, v7);

  objc_sync_exit(v5);
  return 1;
}

- (void)_populateFutureAndCurrentTrips
{
  v1 = a1;
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = MapsSuggestionsNowWithOffset(-604800.0);
    [v2 setFromDate:v3];

    id v4 = MapsSuggestionsNowWithOffset(259200.0);
    [v2 setToDate:v4];

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    uint64_t v24 = __Block_byref_object_dispose__6;
    id v25 = (id)objc_opt_new();
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__6;
    __int16 v18 = __Block_byref_object_dispose__6;
    id v19 = (id)objc_opt_new();
    v5 = (void *)v1[1];
    v12[5] = &v14;
    id v13 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__MapsSuggestionsPortrait__populateFutureAndCurrentTrips__block_invoke;
    v12[3] = &unk_1E5CB9140;
    v12[4] = &v20;
    [v5 iterScoredEventsWithQuery:v2 error:&v13 block:v12];
    id v6 = v13;
    uint64_t v7 = [(id)v21[5] copy];
    v8 = (void *)v1[8];
    v1[8] = v7;

    uint64_t v9 = [(id)v15[5] copy];
    id v10 = (void *)v1[9];
    v1[9] = v9;

    v1 = v6;
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  return v1;
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_334(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(void *)v65 = 0;
    *(void *)&v65[8] = v65;
    *(void *)&v65[16] = 0x3032000000;
    *(void *)&v65[24] = __Block_byref_object_copy__6;
    v66 = __Block_byref_object_dispose__6;
    id v67 = 0;
    id v4 = MapsSuggestionsNow();
    v5 = (void *)WeakRetained[1];
    uint64_t v6 = WeakRetained[3];
    uint64_t Integer = GEOConfigGetInteger();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_338;
    v58[3] = &unk_1E5CB9188;
    v58[5] = v65;
    id v59 = 0;
    v58[4] = WeakRetained;
    char v8 = [v5 iterRecentLocationsForConsumer:2 criteria:v6 limit:Integer client:@"MapsSuggestions" error:&v59 block:v58];
    id v9 = v59;
    double v10 = MapsSuggestionsSecondsSince(v4);
    GEOConfigGetDouble();
    if (v10 > v11)
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_FAULT, "AppConnection SPI took too long to call back %.3f", buf, 0xCu);
      }
    }
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "BUGHUNT 1", buf, 2u);
    }

    if (v9) {
      char v14 = 0;
    }
    else {
      char v14 = v8;
    }
    if (v14)
    {
      v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "BUGHUNT 2", buf, 2u);
      }

      if (*(void *)(*(void *)&v65[8] + 40))
      {
        uint64_t v16 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "BUGHUNT 3", buf, 2u);
        }

        v17 = [*(id *)(*(void *)&v65[8] + 40) stringForKey:@"MapsSuggestionsAppConnectionOriginatingURLString"];
        __int16 v18 = v17;
        if (v17)
        {
          id v19 = v17;
        }
        else
        {
          id v19 = [*(id *)(*(void *)&v65[8] + 40) uniqueIdentifier];
        }
        uint64_t v24 = v19;

        if (WeakRetained[4] && WeakRetained[5]) {
          int v29 = -[NSObject isEqualToString:](v24, "isEqualToString:");
        }
        else {
          int v29 = 0;
        }
        v30 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "BUGHUNT 4", buf, 2u);
        }

        if (!v29)
        {
          v43 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v43, OS_LOG_TYPE_DEBUG, "BUGHUNT 5", buf, 2u);
          }

          v44 = *(void **)(*(void *)&v65[8] + 40);
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_344;
          v55[3] = &unk_1E5CB91B0;
          objc_copyWeak(&v57, v2);
          id v56 = *(id *)(a1 + 32);
          -[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:](WeakRetained, v44, v55);
          v45 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v45, OS_LOG_TYPE_DEBUG, "BUGHUNT 6", buf, 2u);
          }

          objc_destroyWeak(&v57);
          goto LABEL_77;
        }
        __int16 v31 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_DEBUG, "Using cached MapItem", buf, 2u);
        }

        [*(id *)(*(void *)&v65[8] + 40) setGeoMapItem:WeakRetained[5]];
        int v32 = [*(id *)(*(void *)&v65[8] + 40) stringForKey:@"MapsSuggestionsAppConnectionValueKey"];
        int v33 = [v32 isEqualToString:&stru_1EFC640F8];

        if (v33)
        {
          v34 = *(void **)(*(void *)&v65[8] + 40);
          __int16 v35 = [v34 geoMapItem];
          v36 = [v35 name];
          [v34 setString:v36 forKey:@"MapsSuggestionsAppConnectionValueKey"];
        }
        [*(id *)(*(void *)&v65[8] + 40) setNumber:WeakRetained[6] forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
        uint64_t v37 = *(void *)(a1 + 32);
        id v38 = *(id *)(*(void *)&v65[8] + 40);
        if (!v38) {
          goto LABEL_67;
        }
        v39 = v38;
        *(void *)buf = 0;
        if (MapsSuggestionsDistanceFromHereToEntry(v38, buf))
        {
          GEOConfigGetDouble();
          if (v40 >= *(double *)buf)
          {
            GEOConfigGetDouble();
            if (v48 <= *(double *)buf)
            {

              uint64_t v61 = *(void *)(*(void *)&v65[8] + 40);
              int v49 = 1;
              v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
              goto LABEL_68;
            }
            v41 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_66;
            }
            *(_WORD *)v60 = 0;
            v42 = "Entry is within AppConnectionMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_64;
          }
          v41 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v60 = 0;
            v42 = "Entry is not within AppConnectionMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_64:
            v46 = v41;
            os_log_type_t v47 = OS_LOG_TYPE_DEBUG;
            goto LABEL_65;
          }
        }
        else
        {
          v41 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v60 = 0;
            v42 = "Entry has no distance available";
            v46 = v41;
            os_log_type_t v47 = OS_LOG_TYPE_ERROR;
LABEL_65:
            _os_log_impl(&dword_1A70DF000, v46, v47, v42, v60, 2u);
          }
        }
LABEL_66:

LABEL_67:
        int v49 = 0;
        v50 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_68:
        (*(void (**)(uint64_t, void *, void))(v37 + 16))(v37, v50, 0);
        if (v49) {

        }
        v51 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v51, OS_LOG_TYPE_DEBUG, "BUGHUNT 4x", buf, 2u);
        }

        GEOFindOrCreateLog();
        v52 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          v53 = [WeakRetained uniqueName];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v53;
          __int16 v63 = 2080;
          v64 = "fetchConnectionEntriesWithHandler";
          _os_log_impl(&dword_1A70DF000, v52, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        v54 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A70DF000, v54, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", "", buf, 2u);
        }

        goto LABEL_77;
      }
      id v25 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "No entries to make out of AppConnection.", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      v26 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_DEBUG, "BUGHUNT 2x", buf, 2u);
      }

      GEOFindOrCreateLog();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_super v28 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v28;
        __int16 v63 = 2080;
        v64 = "fetchConnectionEntriesWithHandler";
        _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      uint64_t v24 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v24)) {
        goto LABEL_77;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      v21 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_ERROR, "Error receiving locations from AppConnection %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      GEOFindOrCreateLog();
      uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v63 = 2080;
        v64 = "fetchConnectionEntriesWithHandler";
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      uint64_t v24 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v24)) {
        goto LABEL_77;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", "", buf, 2u);
LABEL_77:

    _Block_object_dispose(v65, 8);
    goto LABEL_78;
  }
  GEOFindOrCreateLog();
  uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v65 = 136446722;
    *(void *)&v65[4] = "MapsSuggestionsPortrait.m";
    *(_WORD *)&v65[12] = 1026;
    *(_DWORD *)&v65[14] = 562;
    *(_WORD *)&v65[18] = 2082;
    *(void *)&v65[20] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v65, 0x1Cu);
  }

LABEL_78:
}

- (BOOL)fetchConnectionEntriesWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsPortrait *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v6;
    __int16 v25 = 2080;
    v26 = "fetchConnectionEntriesWithHandler";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", "", buf, 2u);
  }

  if (+[MapsSuggestionsSiri isEnabled])
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_334;
    v16[3] = &unk_1E5CB8A98;
    id v9 = &v18;
    objc_copyWeak(&v18, &location);
    double v10 = &v17;
    id v17 = v4;
    id v11 = v4;
    v12 = v16;
  }
  else
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke;
    block[3] = &unk_1E5CB8A98;
    id v9 = &v21;
    objc_copyWeak(&v21, &location);
    double v10 = &v20;
    id v20 = v4;
    id v14 = v4;
    v12 = block;
  }
  dispatch_async(queue, v12);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return 1;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)fetchLocationEntriesForTray:(BOOL)a3 currentLocation:(id)a4 queue:(id)a5 handler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  double v10 = a5;
  id v11 = a6;
  if (v11)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      GEOConfigGetDouble();
      id v13 = MapsSuggestionsNowWithOffset(-v12);
      if (v8) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
      v26 = [(MapsSuggestionsPortraitConnector *)self->_connector locationQuery:GEOConfigGetInteger() fromDate:v13 consumerType:v14];
      dispatch_group_t v15 = dispatch_group_create();
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)v43 = 0;
      *(void *)&v43[8] = v43;
      *(void *)&v43[16] = 0x2020000000;
      *(_DWORD *)&v43[24] = 0;
      id v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "Locations from Portrait:", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      connector = self->_connector;
      id v39 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_225;
      v32[3] = &unk_1E5CB90F0;
      v36 = v43;
      id v19 = v16;
      id v33 = v19;
      objc_copyWeak(&v37, &buf);
      id v20 = v15;
      v34 = v20;
      id v35 = v27;
      BOOL v38 = v8;
      [(MapsSuggestionsPortraitConnector *)connector iterRankedLocationsWithQuery:v26 error:&v39 block:v32];
      id v21 = v39;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_235;
      block[3] = &unk_1E5CB9118;
      id v30 = v21;
      id v31 = v11;
      id v29 = v19;
      id v22 = v21;
      id v23 = v19;
      dispatch_group_notify(v20, v10, block);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&buf);
      _Block_object_dispose(v43, 8);
    }
    else
    {
      uint64_t v24 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps", v43, 2u);
      }

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke;
      v41[3] = &unk_1E5CB8C48;
      v42 = v11;
      dispatch_async(v10, v41);
      id v13 = v42;
    }
  }
  else
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v43 = 136446978;
      *(void *)&v43[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 124;
      *(_WORD *)&v43[18] = 2082;
      *(void *)&v43[20] = "-[MapsSuggestionsPortrait fetchLocationEntriesForTray:currentLocation:queue:handler:]";
      __int16 v44 = 2082;
      v45 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil", v43, 0x26u);
    }
  }

  return v11 != 0;
}

uint64_t __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_225(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    int v6 = *(_DWORD *)(v5 + 24) + 1;
    *(_DWORD *)(v5 + 24) = v6;
    uint64_t v7 = [v3 location];
    BOOL v8 = [v7 placemark];
    id v9 = [v3 location];
    NSStringFromPPLocationCategory([v9 category]);
    double v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)id buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v8;
    __int16 v68 = 2112;
    v69 = v10;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "%d. %@, Category: %@", buf, 0x1Cu);
  }
  id v11 = v3;
  double v12 = [v11 location];
  id v13 = [v12 placemark];
  uint64_t v14 = [v13 location];
  if (!v14)
  {
    id v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v53 = [v13 name];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "%@ did not have placemark location. Dropping it.", buf, 0xCu);
    }
    goto LABEL_22;
  }
  dispatch_group_t v15 = [v13 name];

  if (!v15)
  {
    id v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Portrait entry did not have placemark name. Dropping it.", buf, 2u);
    }
LABEL_22:
    id v18 = 0;
    goto LABEL_26;
  }
  uint64_t v59 = a1;
  id v16 = [MapsSuggestionsEntry alloc];
  id v17 = [v13 name];
  id v18 = [(MapsSuggestionsEntry *)v16 initWithType:17 title:v17];

  id v19 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v20 = [v19 objectForKey:*MEMORY[0x1E4F1C438]];

  id v21 = objc_alloc(MEMORY[0x1E4F643C0]);
  id v22 = [v13 postalAddress];
  id v23 = [MEMORY[0x1E4F64500] sharedConfiguration];
  uint64_t v24 = [v23 countryCode];
  __int16 v25 = (void *)[v21 initWithCNPostalAddress:v22 language:v20 country:v24 phoneticLocale:v20];

  v58 = v25;
  uint64_t v26 = [v25 shortAddress];
  if (v26)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      id v27 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "Converted Address: %@", buf, 0xCu);
      }
    }
  }
  id v57 = (void *)v26;
  [(MapsSuggestionsEntry *)v18 setString:v26 forKey:@"MapsSuggestionsDestinationAddressKey"];
  objc_super v28 = [v13 name];
  [(MapsSuggestionsEntry *)v18 setString:v28 forKey:@"MapsSuggestionsSearchStringKey"];

  id v29 = [v13 _geoMapItem];

  if (v29)
  {
    id v30 = [v13 _geoMapItem];
    id v31 = MapsSuggestionsMapItemConvertIfNeeded(v30);
    [(MapsSuggestionsEntry *)v18 setGeoMapItem:v31];

    [(MapsSuggestionsEntry *)v18 setNumber:&unk_1EFC89840 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
  }
  id v32 = [NSString alloc];
  id v33 = [(MapsSuggestionsEntry *)v18 title];
  v34 = (void *)[v32 initWithFormat:@"Portrait %@", v33];
  [(MapsSuggestionsEntry *)v18 setString:v34 forKey:@"MapsSuggestionsPortraitPK"];

  [(MapsSuggestionsEntry *)v18 setString:@"MapsSuggestionsPortraitPK" forKey:@"MapsSuggestionsPrimaryKey"];
  GEOConfigGetDouble();
  v36 = MapsSuggestionsNowWithOffset(v35);
  [(MapsSuggestionsEntry *)v18 setExpires:v36];

  GEOConfigGetDouble();
  double v38 = v37;
  [v11 score];
  [(MapsSuggestionsEntry *)v18 setWeight:v38 * v39];
  if (MapsSuggestionsIsValidLocation(v14))
  {
    double v40 = NSNumber;
    [v14 coordinate];
    v41 = objc_msgSend(v40, "numberWithDouble:");
    [(MapsSuggestionsEntry *)v18 setNumber:v41 forKey:@"MapsSuggestionsLatitudeKey"];

    v42 = NSNumber;
    [v14 coordinate];
    __int16 v44 = [v42 numberWithDouble:v43];
    [(MapsSuggestionsEntry *)v18 setNumber:v44 forKey:@"MapsSuggestionsLongitudeKey"];
  }
  v45 = [v12 mostRelevantRecord];
  uint64_t v46 = [v45 source];
  os_log_type_t v47 = [v46 bundleId];

  if (v47)
  {
    [(MapsSuggestionsEntry *)v18 setString:v47 forKey:@"MapsSuggestionsOriginBundleIDKey"];
    double v48 = (objc_class *)MEMORY[0x1E4F223C8];
    id v49 = v47;
    id v50 = [v48 alloc];
    *(void *)id buf = 0;
    v51 = (void *)[v50 initWithBundleIdentifier:v49 allowPlaceholder:0 error:buf];

    v52 = [v51 localizedName];

    [(MapsSuggestionsEntry *)v18 setString:v52 forKey:@"MapsSuggestionsOriginatingAppName"];
  }
  else
  {
    v52 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A70DF000, v52, OS_LOG_TYPE_ERROR, "nil originatingBundleID", buf, 2u);
    }
  }

  a1 = v59;
LABEL_26:

  if (v18)
  {
    if ([(MapsSuggestionsEntry *)v18 containsKey:@"MapsSuggestionsGEOMapItemOriginKey"])
    {
      [*(id *)(a1 + 32) addObject:v18];
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      if (WeakRetained)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v55 = (void *)WeakRetained[2];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_226;
        v60[3] = &unk_1E5CB90C8;
        uint64_t v61 = *(id *)(a1 + 40);
        v62 = v18;
        id v63 = v11;
        id v64 = *(id *)(a1 + 48);
        char v66 = *(unsigned char *)(a1 + 72);
        id v65 = *(id *)(a1 + 32);
        if ((GEOMapItemsFromMapsSuggestionsEntry(v62, v55, 1, v60) & 1) == 0) {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }

        id v56 = v61;
      }
      else
      {
        GEOFindOrCreateLog();
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id buf = 136446722;
          *(void *)&uint8_t buf[4] = "MapsSuggestionsPortrait.m";
          *(_WORD *)&unsigned char buf[12] = 1026;
          *(_DWORD *)&buf[14] = 167;
          __int16 v68 = 2082;
          v69 = "-[MapsSuggestionsPortrait fetchLocationEntriesForTray:currentLocation:queue:handler:]_block_invoke";
          _os_log_impl(&dword_1A70DF000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
        }
      }
    }
  }
}

void __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      goto LABEL_77;
    }
    BOOL v8 = [v6 localizedDescription];
    *(_DWORD *)id buf = 138412290;
    v84 = v8;
    id v9 = "Error while creating mapItem from MSgEntry: %@";
    double v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_4:
    _os_log_impl(&dword_1A70DF000, v10, v11, v9, buf, 0xCu);

    goto LABEL_5;
  }
  uint64_t v61 = 0;
  uint64_t v62 = a1;
  double v12 = *(void **)(a1 + 48);
  id v13 = *(void **)(a1 + 56);
  id v63 = v5;
  id v14 = v5;
  id v64 = v12;
  id v15 = v13;
  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315138;
    v84 = "MapsSuggestionsMapItem *_relevantGEOMapItem(NSArray<MapsSuggestionsMapItem *> *__strong, PPScoredLocation *__s"
          "trong, CLLocation *__strong)";
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v17 = [v64 location];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v14;
  uint64_t v18 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
  if (!v18)
  {

    a1 = v62;
    id v6 = 0;
    goto LABEL_50;
  }
  uint64_t v19 = v18;
  id v20 = 0;
  uint64_t v68 = 0;
  id v21 = &qword_1EB6EFFF0[2];
  uint64_t v70 = *(void *)v72;
  id v65 = v15;
  while (2)
  {
    uint64_t v22 = 0;
    uint64_t v66 = v19;
    do
    {
      if (*(void *)v72 != v70) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v71 + 1) + 8 * v22);
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (*((unsigned char *)v21 + 120))
      {
        uint64_t v24 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __int16 v25 = [v23 name];
          *(_DWORD *)v75 = 138412290;
          v76 = v25;
          _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "Processing mapItem: %@", v75, 0xCu);
        }
      }
      if (v15)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v23 coordinate];
        double v28 = v27;
        [v23 coordinate];
        id v29 = objc_msgSend(v26, "initWithLatitude:longitude:", v28);
        GEOConfigGetDouble();
        double v31 = v30;
        [v15 distanceFromLocation:v29];
        if (v31 < v32)
        {
          id v33 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v34 = [v23 name];
            *(_DWORD *)v75 = 138412290;
            v76 = v34;
            double v35 = v33;
            v36 = "Retrieved GEOMapItem (%@) is not within PortraitMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_26:
            _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, v36, v75, 0xCu);

            goto LABEL_27;
          }
          goto LABEL_27;
        }
        GEOConfigGetDouble();
        double v38 = v37;
        [v15 distanceFromLocation:v29];
        if (v38 > v39)
        {
          id v33 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v34 = [v23 name];
            *(_DWORD *)v75 = 138412290;
            v76 = v34;
            double v35 = v33;
            v36 = "Retrieved GEOMapItem (%@) is within PortraitMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_26;
          }
LABEL_27:

          goto LABEL_44;
        }
      }
      if (GEOConfigGetBOOL())
      {
        id v50 = v21;
        id v54 = v20;
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        a1 = v62;
        id v5 = v63;
        id v6 = v61;
        if (*((unsigned char *)v50 + 120))
        {
          v51 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v75 = 0;
            _os_log_impl(&dword_1A70DF000, v51, OS_LOG_TYPE_DEBUG, "MapsSuggestionsDisableGEOMapItemCategoryChecker turned on. Skipping matching on geoMapItem.", v75, 2u);
          }
        }
        id v49 = v23;
        goto LABEL_71;
      }
      int v40 = [v23 _placeType];
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (*((unsigned char *)v21 + 120))
      {
        v41 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          [v17 placemark];
          v42 = id v67 = v20;
          double v43 = [v42 name];
          __int16 v44 = NSStringFromPPLocationCategory([v17 category]);
          v45 = off_1E5CB9260[v40];
          *(_DWORD *)v75 = 138413058;
          v76 = v43;
          __int16 v77 = 2112;
          v78 = v44;
          __int16 v79 = 1024;
          int v80 = v68;
          __int16 v81 = 2112;
          v82 = v45;
          _os_log_impl(&dword_1A70DF000, v41, OS_LOG_TYPE_DEBUG, "Name: %@; Portrait Category: %@; %d GEOMapItem Category: %@",
            v75,
            0x26u);

          id v20 = v67;
          id v21 = qword_1EB6EFFF0 + 16;
          uint64_t v19 = v66;

          id v15 = v65;
          LODWORD(v68) = v68 + 1;
        }
      }
      int v46 = objc_msgSend(v17, "category", v61, v62, v63);
      if ((v46 - 1) < 2)
      {
        if (v40 != 10) {
          goto LABEL_45;
        }
        if ((v68 & 0x100000000) != 0)
        {
          id v54 = v20;
          v55 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_68;
          }
          goto LABEL_69;
        }
      }
      else
      {
        if ((v46 - 3) >= 2)
        {
          id v54 = v20;
          if (!v46) {
            goto LABEL_70;
          }
          v52 = GEOFindOrCreateLog();
          a1 = v62;
          id v5 = v63;
          id v6 = v61;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            int v53 = [v17 category];
            *(_DWORD *)v75 = 67109120;
            LODWORD(v76) = v53;
            _os_log_impl(&dword_1A70DF000, v52, OS_LOG_TYPE_ERROR, "Location Category %d not in our switch!", v75, 8u);
          }

          id v49 = 0;
LABEL_71:

          os_log_type_t v47 = v54;
          goto LABEL_72;
        }
        if ((v40 & 0xFFFFFFFD) != 8) {
          goto LABEL_45;
        }
        if ((v68 & 0x100000000) != 0)
        {
          id v54 = v20;
          v55 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
LABEL_68:
            id v57 = [v17 placemark];
            v58 = [v57 name];
            *(_DWORD *)v75 = 138412290;
            v76 = v58;
            _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_DEBUG, "Dropping Portrait Entry %@. More than 1 matching GEOMapItem's found", v75, 0xCu);
          }
LABEL_69:

LABEL_70:
          id v49 = 0;
          a1 = v62;
          id v5 = v63;
          id v6 = v61;
          goto LABEL_71;
        }
      }
      id v29 = v20;
      BYTE4(v68) = 1;
      id v20 = v23;
LABEL_44:

LABEL_45:
      ++v22;
    }
    while (v19 != v22);
    uint64_t v19 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
    if (v19) {
      continue;
    }
    break;
  }
  os_log_type_t v47 = v20;

  a1 = v62;
  id v5 = v63;
  id v6 = v61;
  if (!v20)
  {
LABEL_50:
    double v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_DEBUG, "No matching category mapItem found", v75, 2u);
    }

    os_log_type_t v47 = 0;
  }
  id v49 = (id)objc_msgSend(v47, "copy", v61, v62, v63);
LABEL_72:

  [*(id *)(a1 + 40) setGeoMapItem:v49];
  uint64_t v59 = [*(id *)(a1 + 40) geoMapItem];

  if (!v59)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    BOOL v8 = [*(id *)(a1 + 40) title];
    *(_DWORD *)id buf = 138412290;
    v84 = v8;
    id v9 = "nil mapItem. Dropping entry %@";
    double v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_4;
  }
  if (*(unsigned char *)(a1 + 72)) {
    v60 = @"mapstray";
  }
  else {
    v60 = @"mapspoi";
  }
  objc_msgSend(*(id *)(a1 + 40), "setString:forKey:", v60, @"MapsSuggestionsPortraitClientIdentifier", v61, v62, v63);
  [*(id *)(a1 + 64) addObject:*(void *)(a1 + 40)];
LABEL_77:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_235(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)currentTripsWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v5 = self->_currentTrips;
  objc_sync_enter(v5);
  currentTrips = self->_currentTrips;
  if (currentTrips)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = -[MapsSuggestionsPortrait _populateFutureAndCurrentTrips](self);
    currentTrips = self->_currentTrips;
  }
  BOOL v8 = (void *)[(NSArray *)currentTrips copy];
  v4[2](v4, v8, v7);

  objc_sync_exit(v5);
  return 1;
}

void __57__MapsSuggestionsPortrait__populateFutureAndCurrentTrips__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)double v31 = 138412290;
    *(void *)&v31[4] = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_INFO, "Treating potential trip event: %@", v31, 0xCu);
  }

  id v5 = v3;
  uint64_t v6 = [v5 startDate];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v5 endDate],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    double v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      id v21 = 0;
      goto LABEL_17;
    }
    *(_DWORD *)double v31 = 138412290;
    *(void *)&v31[4] = v5;
    uint64_t v22 = "Trip event is missing both start and end date: %@";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_INFO, v22, v31, 0xCu);
    goto LABEL_12;
  }
  id v9 = [v5 tripParts];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    double v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)double v31 = 138412290;
    *(void *)&v31[4] = v5;
    uint64_t v22 = "Trip event %@ has no parts";
    goto LABEL_11;
  }
  os_log_type_t v11 = [v5 tripParts];
  double v12 = [v11 firstObject];

  uint64_t v13 = [v12 mainLocation];
  if (!v13) {
    goto LABEL_13;
  }
  id v14 = (void *)v13;
  id v15 = [v12 mainLocation];
  id v16 = [v15 location];

  if (v16)
  {
    id v17 = [MapsSuggestionsTrip alloc];
    uint64_t v18 = [v12 mainLocation];
    uint64_t v19 = [v5 startDate];
    id v20 = [v5 endDate];
    id v21 = [(MapsSuggestionsTrip *)v17 initWithPlacemark:v18 startDate:v19 endDate:v20];
  }
  else
  {
LABEL_13:
    uint64_t v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v31 = 138412290;
      *(void *)&v31[4] = v5;
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_INFO, "Trip event %@ does not have a valid location", v31, 0xCu);
    }
    id v21 = 0;
  }

LABEL_17:
  if (v21)
  {
    id v23 = [(MapsSuggestionsTrip *)v21 startDate];
    if (MapsSuggestionsIsInThePast(v23))
    {
      uint64_t v24 = [(MapsSuggestionsTrip *)v21 endDate];
      BOOL v25 = MapsSuggestionsIsInTheFuture(v24);

      if (v25)
      {
        id v26 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)double v31 = 138412290;
          *(void *)&v31[4] = v21;
          _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_INFO, "Trip event started before current time and ends after: %@", v31, 0xCu);
        }

        uint64_t v27 = *(void *)(a1 + 32);
LABEL_28:
        objc_msgSend(*(id *)(*(void *)(v27 + 8) + 40), "addObject:", v21, *(_OWORD *)v31);
        goto LABEL_29;
      }
    }
    else
    {
    }
    double v28 = [(MapsSuggestionsTrip *)v21 startDate];
    BOOL v29 = MapsSuggestionsIsInTheFuture(v28);

    if (v29)
    {
      double v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)double v31 = 138412290;
        *(void *)&v31[4] = v21;
        _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_INFO, "Trip event will start in future: %@", v31, 0xCu);
      }

      uint64_t v27 = *(void *)(a1 + 40);
      goto LABEL_28;
    }
  }
LABEL_29:
}

- (void)sendFeedbackforClientID:(id)a3 storeType:(int64_t)a4 explicitlyEngagedStrings:(id)a5 explicitlyRejectedStrings:(id)a6 implicitlyEngagedStrings:(id)a7 implicitlyRejectedStrings:(id)a8
{
  id v20 = a3;
  id v14 = (objc_class *)MEMORY[0x1E4F89E28];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  uint64_t v19 = (void *)[[v14 alloc] initWithExplicitlyEngagedStrings:v18 explicitlyRejectedStrings:v17 implicitlyEngagedStrings:v16 implicitlyRejectedStrings:v15];

  if (a4)
  {
    if (a4 == 2)
    {
      [(MapsSuggestionsPortraitConnector *)self->_connector connectionsStore_registerFeedback:v19 clientIdentifier:v20 completion:&__block_literal_global_242];
    }
    else if (a4 == 1)
    {
      [(MapsSuggestionsPortraitConnector *)self->_connector locationStore_registerFeedback:v19 clientIdentifier:v20 completion:&__block_literal_global_12];
    }
  }
  else
  {
    [(MapsSuggestionsPortraitConnector *)self->_connector namedEntityStore_registerFeedback:v19 clientIdentifier:v20 completion:&__block_literal_global_245];
  }
}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Location Store %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke_240(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Connections store %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke_243(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Named Entity store %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke(uint64_t a1)
{
  *(void *)&v10[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "BUGHUNT 0x", (uint8_t *)&v7, 2u);
    }

    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      *(void *)uint64_t v10 = "fetchConnectionEntriesWithHandler";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
    }
    int v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", "", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      uint64_t v8 = "MapsSuggestionsPortrait.m";
      __int16 v9 = 1026;
      *(_DWORD *)uint64_t v10 = 553;
      v10[2] = 2082;
      *(void *)&v10[3] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_338(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = [v5 name];
    uint64_t v8 = [v5 value];
    *(_DWORD *)id buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v193 = 2112;
    *(void *)v194 = v8;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Received a new Location from AppConnection: Name %@, Value:%@", buf, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v174 = v9;
  if (!v9)
  {
    uint64_t v39 = 0;
    goto LABEL_170;
  }
  os_log_type_t v11 = (void *)MEMORY[0x1AD0C8E80]();
  id v12 = v10;
  uint64_t v13 = [v12 name];
  v177 = v12;
  if (v13)
  {
    GEOConfigGetDouble();
    double v15 = v14;
    uint64_t v16 = [v12 createdAt];
    id v17 = [v12 lifetime];
    [v17 doubleValue];
    double v19 = v18;

    v175 = v13;
    if (v19 == 0.0)
    {
      GEOConfigGetDouble();
      double v19 = v20;
    }
    v167 = v16;
    uint64_t v163 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v16 sinceDate:v19];
    v178 = @"MapsSuggestionsOriginBundleIDKey";
    uint64_t v21 = [v12 originatingBundleID];
    v165 = (void *)v21;
    if (v21) {
      uint64_t v22 = (__CFString *)v21;
    }
    else {
      uint64_t v22 = &stru_1EFC640F8;
    }
    v185 = v22;
    v179 = @"MapsSuggestionsAppConnectionValueKey";
    uint64_t v23 = [v12 value];
    uint64_t v24 = (void *)v23;
    if (!v23)
    {
      v158 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v23 = [v158 UUIDString];
    }
    v169 = v11;
    v159 = (void *)v23;
    v186 = (__CFString *)v23;
    v180 = @"MapsSuggestionsDestinationAddressKey";
    uint64_t v25 = [v12 value];
    id v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = (__CFString *)v25;
    }
    else {
      uint64_t v27 = &stru_1EFC640F8;
    }
    v187 = v27;
    v188 = @"MapsSuggestionsAppConnectionValueKey";
    v181 = @"MapsSuggestionsPrimaryKey";
    v182 = @"MapsSuggestionsAppConnectionIdentifierKey";
    v161 = [v12 identifier];
    v189 = v161;
    v183 = @"MapsSuggestionsAppConnectionOriginatingWebsiteName";
    double v28 = [v12 originatingWebsiteURL];
    BOOL v29 = v28;
    uint64_t v170 = a1;
    v172 = a3;
    if (v28)
    {
      double v30 = [v28 host];
      double v31 = v30;
      if (v30)
      {
        uint64_t v32 = v30;
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        long long v200 = 0u;
        uint64_t v33 = [&unk_1EFC89EB8 countByEnumeratingWithState:&v197 objects:buf count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v198;
          while (2)
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v198 != v35) {
                objc_enumerationMutation(&unk_1EFC89EB8);
              }
              double v37 = *(void **)(*((void *)&v197 + 1) + 8 * i);
              if ([(__CFString *)v32 hasPrefix:v37])
              {
                uint64_t v40 = -[__CFString substringFromIndex:](v32, "substringFromIndex:", [v37 length]);

                uint64_t v32 = (__CFString *)v40;
                goto LABEL_32;
              }
            }
            uint64_t v34 = [&unk_1EFC89EB8 countByEnumeratingWithState:&v197 objects:buf count:16];
            if (v34) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        uint64_t v32 = 0;
      }
LABEL_32:
    }
    else
    {
      uint64_t v32 = 0;
    }

    if (v32) {
      v41 = v32;
    }
    else {
      v41 = &stru_1EFC640F8;
    }
    v190 = v41;
    v184 = @"MapsSuggestionsOriginatingAppName";
    v42 = [v177 originatingBundleID];
    if (v42)
    {
      id v43 = objc_alloc(MEMORY[0x1E4F223C8]);
      *(void *)id buf = 0;
      __int16 v44 = [v43 initWithBundleIdentifier:v42 allowPlaceholder:0 error:buf];
      id v45 = *(id *)buf;
      int v46 = [v44 localizedName];
    }
    else
    {
      __int16 v44 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
        __int16 v193 = 1024;
        *(_DWORD *)v194 = 972;
        *(_WORD *)&v194[4] = 2082;
        *(void *)&v194[6] = "NSString *_appName(NSString *__strong)";
        __int16 v195 = 2082;
        v196 = "nil == (appId)";
        _os_log_impl(&dword_1A70DF000, v44, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an appId", buf, 0x26u);
      }
      int v46 = 0;
    }

    if (v46) {
      os_log_type_t v47 = v46;
    }
    else {
      os_log_type_t v47 = &stru_1EFC640F8;
    }
    v191 = v47;
    double v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v178 count:7];
    id v49 = (void *)[v48 mutableCopy];

    if (!v24)
    {
    }
    id v50 = [v177 contactHandles];
    if ([v50 count])
    {
      v51 = *(void **)(v174 + 56);
      v52 = [v50 objectAtIndexedSubscript:0];
      int v53 = [v51 contactNameForIdentifier:v52];
    }
    else
    {
      int v53 = 0;
    }
    id v54 = [v177 originatingBundleID];
    if ([v54 isEqualToString:MapsSuggestionsMessagesAppBundleID])
    {
      if (!v53)
      {

LABEL_60:
        v60 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_1A70DF000, v60, OS_LOG_TYPE_ERROR, "Dropping entry because we did not get this AppConnection from a known contact", buf, 2u);
        }

        uint64_t v39 = 0;
        id v12 = v177;
        uint64_t v59 = (void *)v163;
LABEL_63:

        uint64_t v13 = v175;
        double v38 = v167;
        a3 = v172;
        os_log_type_t v11 = v169;
        a1 = v170;
        goto LABEL_64;
      }
      uint64_t v55 = [v53 length];

      if (!v55) {
        goto LABEL_60;
      }
    }
    else
    {
    }
    id v56 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_impl(&dword_1A70DF000, v56, OS_LOG_TYPE_DEBUG, "Received a message from %@", buf, 0xCu);
    }

    id v12 = v177;
    id v57 = [v177 mapItemURL];

    if (v57)
    {
      v58 = [v177 mapItemURL];
      [v49 setObject:v58 forKeyedSubscript:@"MapsSuggestionsAppConnectionMapItemURL"];
    }
    uint64_t v59 = (void *)v163;
    uint64_t v39 = +[MapsSuggestionsEntry entryWithType:12 title:v175 subtitle:0 weight:v163 expires:v49 sourceSpecificInfo:v15];
    goto LABEL_63;
  }
  double v38 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_DEBUG, "App Connection location has no title", buf, 2u);
  }
  uint64_t v39 = 0;
LABEL_64:

  if (!v39)
  {
    id v160 = v10;
    uint64_t v61 = [v12 mapItemURL];

    if (!v61)
    {
      uint64_t v62 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1A70DF000, v62, OS_LOG_TYPE_DEBUG, "Missing mapItemURL in PPConnectionsLocation, returning nil.", buf, 2u);
      }
      uint64_t v39 = 0;
      goto LABEL_168;
    }
    uint64_t v62 = [v12 mapItemURL];
    id v63 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      id v64 = [v62 absoluteString];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v64;
      _os_log_impl(&dword_1A70DF000, v63, OS_LOG_TYPE_DEBUG, "url = %@", buf, 0xCu);
    }
    id v65 = [v12 originatingBundleID];
    if ([v65 caseInsensitiveCompare:MapsSuggestionsMessagesAppBundleID])
    {
      uint64_t v66 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1A70DF000, v66, OS_LOG_TYPE_DEBUG, "App Connection URL's originating Bundle ID was NOT MobileSMS, so kicking it out", buf, 2u);
      }
      uint64_t v39 = 0;
      goto LABEL_167;
    }
    id v67 = [v12 originatingBundleID];
    uint64_t v66 = v67;
    v176 = v65;
    if (v67)
    {
      if ([v67 caseInsensitiveCompare:@"com.apple.Maps"])
      {

        uint64_t v66 = [objc_alloc(MEMORY[0x1E4F64728]) initWithURL:v62];
        [v66 parseIncludingCustomParameters:1];
        uint64_t v68 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v69 = [v66 transportType];
          if (v69 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v69);
            uint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v70 = off_1E5CB9308[(int)v69];
          }
          *(_DWORD *)id buf = 138412290;
          *(void *)&uint8_t buf[4] = v70;
          _os_log_impl(&dword_1A70DF000, v68, OS_LOG_TYPE_DEBUG, "urlParser.transportType:%@", buf, 0xCu);
        }
        uint64_t v171 = a1;
        v173 = a3;

        v178 = @"MapsSuggestionsPrimaryKey";
        v179 = @"MapsSuggestionsAppConnectionValueKey";
        v185 = @"MapsSuggestionsAppConnectionValueKey";
        v186 = &stru_1EFC640F8;
        v180 = @"MapsSuggestionsAppConnectionOriginatingURLString";
        v168 = [v62 absoluteString];
        v187 = v168;
        v181 = @"MapsSuggestionsOriginBundleIDKey";
        uint64_t v73 = [v12 originatingBundleID];
        v166 = (void *)v73;
        if (v73) {
          long long v74 = (__CFString *)v73;
        }
        else {
          long long v74 = &stru_1EFC640F8;
        }
        v188 = v74;
        v182 = @"MapsSuggestionsAppConnectionIdentifierKey";
        v164 = [v12 identifier];
        v189 = v164;
        v183 = @"MapsSuggestionsAppConnectionOriginatingWebsiteName";
        v75 = [v12 originatingWebsiteURL];
        v76 = v75;
        if (v75)
        {
          __int16 v77 = [v75 host];
          v78 = v77;
          if (v77)
          {
            __int16 v79 = v77;
            long long v197 = 0u;
            long long v198 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            uint64_t v80 = [&unk_1EFC89EB8 countByEnumeratingWithState:&v197 objects:buf count:16];
            if (v80)
            {
              uint64_t v81 = v80;
              v162 = v62;
              uint64_t v82 = *(void *)v198;
              while (2)
              {
                for (uint64_t j = 0; j != v81; ++j)
                {
                  if (*(void *)v198 != v82) {
                    objc_enumerationMutation(&unk_1EFC89EB8);
                  }
                  v84 = *(void **)(*((void *)&v197 + 1) + 8 * j);
                  if ([(__CFString *)v79 hasPrefix:v84])
                  {
                    uint64_t v85 = -[__CFString substringFromIndex:](v79, "substringFromIndex:", [v84 length]);

                    __int16 v79 = (__CFString *)v85;
                    goto LABEL_104;
                  }
                }
                uint64_t v81 = [&unk_1EFC89EB8 countByEnumeratingWithState:&v197 objects:buf count:16];
                if (v81) {
                  continue;
                }
                break;
              }
LABEL_104:
              uint64_t v62 = v162;
            }
          }
          else
          {
            __int16 v79 = 0;
          }
        }
        else
        {
          __int16 v79 = 0;
        }

        if (v79) {
          v86 = v79;
        }
        else {
          v86 = &stru_1EFC640F8;
        }
        v190 = v86;
        v184 = @"MapsSuggestionsOriginatingAppName";
        v87 = [v177 originatingBundleID];
        if (v87)
        {
          id v88 = objc_alloc(MEMORY[0x1E4F223C8]);
          *(void *)id buf = 0;
          v89 = [v88 initWithBundleIdentifier:v87 allowPlaceholder:0 error:buf];
          id v90 = *(id *)buf;
          v91 = [v89 localizedName];
        }
        else
        {
          v89 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
            __int16 v193 = 1024;
            *(_DWORD *)v194 = 972;
            *(_WORD *)&v194[4] = 2082;
            *(void *)&v194[6] = "NSString *_appName(NSString *__strong)";
            __int16 v195 = 2082;
            v196 = "nil == (appId)";
            _os_log_impl(&dword_1A70DF000, v89, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an appId", buf, 0x26u);
          }
          v91 = 0;
        }

        if (v91) {
          v92 = v91;
        }
        else {
          v92 = &stru_1EFC640F8;
        }
        v191 = v92;
        v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v178 count:7];
        v94 = (void *)[v93 mutableCopy];

        v95 = [v177 originatingBundleID];

        if (v95)
        {
          id v96 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          v97 = [v177 originatingBundleID];
          *(void *)&long long v197 = v97;
          v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
          v99 = (void *)[v96 initWithArray:v98];

          [0 setSet:v99 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];
        }
        v100 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject transportType](v66, "transportType"));
        [v94 setObject:v100 forKey:@"MapsSuggestionsTransportTypeKey"];

        v101 = [v66 addressString];
        BOOL v102 = v101 != 0;

        a3 = v173;
        if (v101)
        {
          v103 = [v66 addressString];
          [v94 setObject:v103 forKey:@"MapsSuggestionsDestinationAddressKey"];

          v104 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            v105 = [v66 addressString];
            *(_DWORD *)id buf = 138412290;
            *(void *)&uint8_t buf[4] = v105;
            _os_log_impl(&dword_1A70DF000, v104, OS_LOG_TYPE_DEBUG, "urlParser.addressString: %@", buf, 0xCu);
          }
        }
        v106 = [v66 directionsDestinationAddressString];

        if (v106)
        {
          v107 = [v66 directionsDestinationAddressString];
          [v94 setObject:v107 forKey:@"MapsSuggestionsDestinationAddressKey"];

          v108 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            v109 = [v66 directionsDestinationAddressString];
            *(_DWORD *)id buf = 138412290;
            *(void *)&uint8_t buf[4] = v109;
            _os_log_impl(&dword_1A70DF000, v108, OS_LOG_TYPE_DEBUG, "urlParser.directionsDestinationAddressString: %@", buf, 0xCu);
          }
          BOOL v102 = 1;
        }
        [v66 centerCoordinate];
        if (v111 >= -180.0 && v111 <= 180.0 && v110 >= -90.0 && v110 <= 90.0)
        {
          v112 = NSNumber;
          [v66 centerCoordinate];
          v113 = objc_msgSend(v112, "numberWithDouble:");
          [v94 setObject:v113 forKey:@"MapsSuggestionsLatitudeKey"];

          v114 = NSNumber;
          [v66 centerCoordinate];
          v116 = [v114 numberWithDouble:v115];
          [v94 setObject:v116 forKey:@"MapsSuggestionsLongitudeKey"];

          v117 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
          {
            [v66 centerCoordinate];
            uint64_t v119 = v118;
            [v66 centerCoordinate];
            *(_DWORD *)id buf = 134218240;
            *(void *)&uint8_t buf[4] = v119;
            __int16 v193 = 2048;
            *(void *)v194 = v120;
            _os_log_impl(&dword_1A70DF000, v117, OS_LOG_TYPE_DEBUG, "urlParser.coordinate: %f;%f", buf, 0x16u);
          }

          if (!v102)
          {
            [v94 setObject:MEMORY[0x1E4F1CC38] forKey:@"MapsSuggestionsAppConnectionIsCoordinateOnlyURL"];
            v121 = [v177 contactHandles];
            if ([v121 count] == 1)
            {
              v122 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)id buf = 138412290;
                *(void *)&uint8_t buf[4] = v121;
                _os_log_impl(&dword_1A70DF000, v122, OS_LOG_TYPE_DEBUG, "Sender Contact Handle is %@", buf, 0xCu);
              }

              v123 = *(void **)(v174 + 56);
              v124 = [v121 objectAtIndexedSubscript:0];
              v125 = [v123 contactNameForIdentifier:v124];

              v126 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)id buf = 138412290;
                *(void *)&uint8_t buf[4] = v125;
                _os_log_impl(&dword_1A70DF000, v126, OS_LOG_TYPE_DEBUG, "Sender Contact Name is %@", buf, 0xCu);
              }

              if (v125) {
                [v94 setObject:v125 forKey:@"MapsSuggestionsAppConnectionMessageSenderContactName"];
              }
            }
          }
          BOOL v102 = 1;
        }
        if ([v66 searchUID])
        {
          v127 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NSObject searchUID](v66, "searchUID"));
          [v94 setObject:v127 forKey:@"MapsSuggestionsMUIDKey"];

          v128 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v129 = [v66 searchUID];
            *(_DWORD *)id buf = 134217984;
            *(void *)&uint8_t buf[4] = v129;
            _os_log_impl(&dword_1A70DF000, v128, OS_LOG_TYPE_DEBUG, "urlParser.searchUID: %llu", buf, 0xCu);
          }

          v130 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject searchProviderID](v66, "searchProviderID"));
          [v94 setObject:v130 forKey:@"MapsSuggestionsProviderIDKey"];

          v131 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
          {
            int v132 = [v66 searchProviderID];
            *(_DWORD *)id buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v132;
            _os_log_impl(&dword_1A70DF000, v131, OS_LOG_TYPE_DEBUG, "UrlParser has searchProviderID: %d", buf, 8u);
          }

          v133 = [v66 searchQuery];

          v134 = v177;
          if (v133)
          {
            v135 = [v66 searchQuery];
            [v94 setObject:v135 forKey:@"MapsSuggestionsEntryTitleNameKey"];

            v136 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            {
              v137 = [v66 searchQuery];
              *(_DWORD *)id buf = 138412290;
              *(void *)&uint8_t buf[4] = v137;
              _os_log_impl(&dword_1A70DF000, v136, OS_LOG_TYPE_DEBUG, "urlParser.searchQuery: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v134 = v177;
          if (!v102)
          {
            v155 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id buf = 138412290;
              *(void *)&uint8_t buf[4] = v62;
              _os_log_impl(&dword_1A70DF000, v155, OS_LOG_TYPE_ERROR, "Could not process URL: %@", buf, 0xCu);
            }
            uint64_t v39 = 0;
            goto LABEL_166;
          }
        }
        v138 = [v134 createdAt];
        v139 = v138;
        if (v138)
        {
          id v140 = v138;
        }
        else
        {
          MapsSuggestionsNow();
          id v140 = (id)objc_claimAutoreleasedReturnValue();
        }
        v141 = v140;

        v142 = [v134 lifetime];
        [v142 doubleValue];
        double v144 = v143;

        if (v144 == 0.0)
        {
          GEOConfigGetDouble();
          double v144 = v145;
        }
        v146 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v141 sinceDate:v144];
        v147 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id buf = 138412290;
          *(void *)&uint8_t buf[4] = v146;
          _os_log_impl(&dword_1A70DF000, v147, OS_LOG_TYPE_DEBUG, "Expiry %@", buf, 0xCu);
        }

        GEOConfigGetDouble();
        double v149 = v148;
        v150 = [MapsSuggestionsEntry alloc];
        uint64_t v151 = [v66 searchQuery];
        v152 = (void *)v151;
        if (v151) {
          v153 = (__CFString *)v151;
        }
        else {
          v153 = &stru_1EFC640F8;
        }
        v154 = [(MapsSuggestionsEntry *)v150 initWithType:12 title:v153 subtitle:0 weight:v146 expires:0 geoMapItem:v94 sourceSpecificInfo:v149];

        v155 = v154;
        uint64_t v39 = (uint64_t)v155;
LABEL_166:
        id v65 = v176;

        a1 = v171;
        goto LABEL_167;
      }
      long long v71 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        long long v72 = "App Connection originating Bundle ID was Maps, so kicking it out";
        goto LABEL_84;
      }
    }
    else
    {
      long long v71 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        long long v72 = "App Connection originating bundle ID is nil, so kicking it out";
LABEL_84:
        _os_log_impl(&dword_1A70DF000, v71, OS_LOG_TYPE_DEBUG, v72, buf, 2u);
      }
    }

    uint64_t v39 = 0;
    id v65 = v176;
LABEL_167:

LABEL_168:
    id v10 = v160;
  }
LABEL_170:

  uint64_t v156 = *(void *)(*(void *)(a1 + 40) + 8);
  v157 = *(void **)(v156 + 40);
  *(void *)(v156 + 40) = v39;

  *a3 = 1;
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_344(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Error getting MapItem for Entry: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v5)
    {
      id v15 = v5;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, MEMORY[0x1E4F1CBF0], 0);
    }
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "BUGHUNT 5x", buf, 2u);
    }

    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double v14 = [WeakRetained uniqueName];
      *(_DWORD *)id buf = 138412546;
      id v17 = v14;
      __int16 v18 = 2080;
      *(void *)double v19 = "fetchConnectionEntriesWithHandler";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    os_log_type_t v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    os_log_type_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136446722;
      id v17 = "MapsSuggestionsPortrait.m";
      __int16 v18 = 1026;
      *(_DWORD *)double v19 = 632;
      v19[2] = 2082;
      *(void *)&v19[3] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfEnd went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_geoMapItemsFromMapsSuggestionsEntry:(void *)a3 handle:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = GEOFindOrCreateLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [a1 uniqueName];
      *(_DWORD *)id buf = 138412546;
      BOOL v29 = v9;
      __int16 v30 = 2080;
      *(void *)double v31 = "_geoMapItemsFromMapsSuggestionsEntry";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", "", buf, 2u);
    }

    objc_initWeak(&location, a1);
    os_log_type_t v11 = (void *)a1[2];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke;
    uint64_t v23 = &unk_1E5CB9200;
    objc_copyWeak(&v26, &location);
    id v24 = v5;
    id v12 = v6;
    id v25 = v12;
    if ((GEOMapItemsFromMapsSuggestionsEntry(v24, v11, 1, &v20) & 1) == 0)
    {
      uint64_t v13 = (void *)a1[5];
      a1[5] = 0;

      double v14 = (void *)a1[4];
      a1[4] = 0;

      id v15 = (void *)a1[6];
      a1[6] = 0;

      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "GEOErrorWithCode:reason:", -12, @"The input was wrong", v20, v21, v22, v23, v24);
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);

      GEOFindOrCreateLog();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __int16 v18 = [a1 uniqueName];
        *(_DWORD *)id buf = 138412546;
        BOOL v29 = v18;
        __int16 v30 = 2080;
        *(void *)double v31 = "_geoMapItemsFromMapsSuggestionsEntry";
        _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      double v19 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", "", buf, 2u);
      }
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136446978;
      BOOL v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      __int16 v30 = 1024;
      *(_DWORD *)double v31 = 791;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]";
      __int16 v32 = 2082;
      uint64_t v33 = "nil == (handle)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handle", buf, 0x26u);
    }
  }
}

void __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[10];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke_354;
    v11[3] = &unk_1E5CB91D8;
    objc_copyWeak(&v15, a1 + 6);
    id v12 = v6;
    id v13 = a1[4];
    id v14 = a1[5];
    dispatch_async(v9, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136446722;
      id v17 = "MapsSuggestionsPortrait.m";
      __int16 v18 = 1026;
      int v19 = 801;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke_354(uint64_t a1)
{
  *(void *)&v54[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 32))
    {
      uint64_t v8 = [*(id *)(a1 + 40) geoMapItem];

      if (v8)
      {
        uint64_t v9 = [*(id *)(a1 + 40) integerForKey:@"MapsSuggestionsGEOMapItemOriginKey"];
        int v7 = [*(id *)(a1 + 40) geoMapItem];
        uint64_t v10 = [v7 _muid];
        os_log_type_t v11 = [*(id *)(a1 + 40) stringForKey:@"MapsSuggestionsAppConnectionValueKey"];
        int v12 = [v11 isEqualToString:&stru_1EFC640F8];

        if (v12)
        {
          id v13 = *(void **)(a1 + 40);
          id v14 = [v7 name];
          [v13 setString:v14 forKey:@"MapsSuggestionsAppConnectionValueKey"];
        }
        id v15 = [v7 _firstRelatedPlaceListForType:2];
        uint64_t v16 = v15;
        if (v10) {
          goto LABEL_14;
        }
        __int16 v20 = [v15 mapIdentifiers];
        uint64_t v21 = [v20 count];

        if (v21 == 1)
        {
          uint64_t v22 = [v16 mapIdentifiers];
          uint64_t v23 = [v22 firstObject];
          uint64_t v10 = [v23 muid];

          if (v10)
          {
LABEL_14:
            if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              id v17 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)id buf = 0;
                _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "Trying second pass at getting a better MapItem", buf, 2u);
              }

              [*(id *)(a1 + 40) setInteger:0 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
              __int16 v18 = *(void **)(a1 + 40);
              int v19 = [NSNumber numberWithUnsignedLongLong:v10];
              [v18 setNumber:v19 forKey:@"MapsSuggestionsMUIDKey"];

              -[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:](WeakRetained, *(void *)(a1 + 40), *(void *)(a1 + 48));
LABEL_42:

              goto LABEL_43;
            }
          }
        }
        id v24 = [*(id *)(a1 + 40) stringForKey:@"MapsSuggestionsAppConnectionOriginatingURLString"];
        id v25 = v24;
        if (v24)
        {
          id v26 = v24;
        }
        else
        {
          id v26 = [*(id *)(a1 + 40) uniqueIdentifier];
        }
        uint64_t v27 = (void *)WeakRetained[4];
        WeakRetained[4] = v26;

        uint64_t v28 = [*(id *)(a1 + 40) geoMapItem];
        BOOL v29 = (void *)WeakRetained[5];
        WeakRetained[5] = v28;

        uint64_t v30 = [*(id *)(a1 + 40) numberForKey:@"MapsSuggestionsGEOMapItemOriginKey"];
        double v31 = (void *)WeakRetained[6];
        WeakRetained[6] = v30;

        id v32 = *(id *)(a1 + 40);
        if (!v32)
        {
LABEL_37:
          id v40 = [NSString alloc];
          v41 = MapsSuggestionsCurrentBestLocation();
          v42 = (void *)[v40 initWithFormat:@"The MapItem is not relevant for location %@", v41];

          uint64_t v43 = *(void *)(a1 + 48);
          __int16 v44 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:v42];
          (*(void (**)(uint64_t, void, void *))(v43 + 16))(v43, 0, v44);

          id v45 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            int v46 = [WeakRetained uniqueName];
            *(_DWORD *)id buf = 138412546;
            *(void *)&uint8_t buf[4] = v46;
            __int16 v53 = 2080;
            *(void *)id v54 = "_geoMapItemsFromMapsSuggestionsEntry";
            _os_log_impl(&dword_1A70DF000, v45, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
          }
          os_log_type_t v47 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)id buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", "", buf, 2u);
          }

          goto LABEL_42;
        }
        uint64_t v33 = v32;
        *(void *)id buf = 0;
        if (MapsSuggestionsDistanceFromHereToEntry(v32, buf))
        {
          GEOConfigGetDouble();
          if (v34 >= *(double *)buf)
          {
            GEOConfigGetDouble();
            if (v39 <= *(double *)buf)
            {

              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              double v48 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                id v49 = [WeakRetained uniqueName];
                *(_DWORD *)id buf = 138412546;
                *(void *)&uint8_t buf[4] = v49;
                __int16 v53 = 2080;
                *(void *)id v54 = "_geoMapItemsFromMapsSuggestionsEntry";
                _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
              }
              id v50 = GEOFindOrCreateLog();
              if (os_signpost_enabled(v50))
              {
                *(_WORD *)id buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A70DF000, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", "", buf, 2u);
              }

              goto LABEL_42;
            }
            uint64_t v35 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_36;
            }
            *(_WORD *)v51 = 0;
            v36 = "Entry is within AppConnectionMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_34;
          }
          uint64_t v35 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v51 = 0;
            v36 = "Entry is not within AppConnectionMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_34:
            double v37 = v35;
            os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
            goto LABEL_35;
          }
        }
        else
        {
          uint64_t v35 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v51 = 0;
            v36 = "Entry has no distance available";
            double v37 = v35;
            os_log_type_t v38 = OS_LOG_TYPE_ERROR;
LABEL_35:
            _os_log_impl(&dword_1A70DF000, v37, v38, v36, v51, 2u);
          }
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    id v3 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    id v4 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      *(_DWORD *)id buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v53 = 2080;
      *(void *)id v54 = "_geoMapItemsFromMapsSuggestionsEntry";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    int v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsPortrait.m";
      __int16 v53 = 1026;
      *(_DWORD *)id v54 = 803;
      v54[2] = 2082;
      *(void *)&v54[3] = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_43:
}

- (id)fetchNamedEntitiesFromDate:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = [(MapsSuggestionsPortraitConnector *)self->_connector namedEntityQuery:0x7FFFFFFFFFFFFFFFLL fromDate:a3 consumerType:3];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Calling Portrait SPI", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F647A0] sharedManager];
  int v7 = [v6 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_PortraitCall"];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"MSGPPTTest_Insights_ACRanking_PortraitCallBEGIN" object:0];
  }
  connector = self->_connector;
  id v48 = 0;
  uint64_t v10 = [(MapsSuggestionsPortraitConnector *)connector rankedNamedEntitiesWihQuery:v4 error:&v48];
  id v11 = v48;
  int v12 = [MEMORY[0x1E4F647A0] sharedManager];
  int v13 = [v12 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_PortraitCall"];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"MSGPPTTest_Insights_ACRanking_PortraitCallEND" object:0];
  }
  if (v11)
  {
    id v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v20 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_35;
    }
    *(_DWORD *)id buf = 138412290;
    id v50 = v11;
    uint64_t v16 = "Iterator over EntityRecords for Siri Portrait returned error:%@";
    id v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 12;
LABEL_10:
    _os_log_impl(&dword_1A70DF000, v17, v18, v16, buf, v19);
    goto LABEL_11;
  }
  if (![v10 count])
  {
    id v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_WORD *)id buf = 0;
    uint64_t v16 = "Portrait returned no entries";
    id v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 2;
    goto LABEL_10;
  }
  v42 = v4;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    uint64_t v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "Received portrait named entities are:", buf, 2u);
    }
  }
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v41 = v10;
  id obj = v10;
  uint64_t v22 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v44 + 1) + 8 * v25);
        uint64_t v27 = [v26 item];
        uint64_t v28 = [v27 mostRelevantRecord];
        BOOL v29 = [v28 source];
        uint64_t v30 = [v29 date];

        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          double v31 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            id v32 = [v26 item];
            uint64_t v33 = [v32 name];
            *(_DWORD *)id buf = 138412546;
            id v50 = v33;
            __int16 v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_DEBUG, "Name & Date: %@ %@", buf, 0x16u);
          }
        }
        double v34 = [MapsSuggestionsPortraitData alloc];
        uint64_t v35 = [v26 item];
        v36 = [v35 name];
        double v37 = [(MapsSuggestionsPortraitData *)v34 initWithName:v36 lastInteractionTime:v30];

        [v15 addObject:v37];
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v23);
  }

  os_log_type_t v38 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    int v39 = [v15 count];
    *(_DWORD *)id buf = 67109120;
    LODWORD(v50) = v39;
    _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_DEBUG, "We got %u items from Portrait", buf, 8u);
  }

  id v20 = [v15 copy];
  uint64_t v10 = v41;
  id v4 = v42;
  id v11 = 0;
LABEL_35:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_futureTrips, 0);
  objc_storeStrong((id *)&self->_currentTrips, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_cachedMapItemOrigin, 0);
  objc_storeStrong((id *)&self->_cachedMapItem, 0);
  objc_storeStrong((id *)&self->_cachedKey, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end